title=Tabletop RPG IT
date=2023-09-04
type=post
tags=gaming, python, scripting, information management
status=published
description=Leveraging programming tools to make my fun... more fun.
~~~~~~

With the enforced hiatus I've been on for the past 18 momths, I've had some opportunities to engage in a few projects that otherwise would've gone undone or unexeplored. One of these projects is actually indulging in a favorite pastime of mine: TableTop Role-Playing Games (or TTRPGs, for short), which I've enjoyed since 1978. As somebody who runs a TTRPG campaign for some of my friends, I find that wading through piles of books, some of which deprecate material found in another, to be really, really ancient and antiquated, and the IT professional in me says, "There's got to be a better way."

<!--more-->

Let me take a few moments to spin up the context: I've been an avid TTRPG (tabletop role-playing game, as in D&D or Pathfinder, sitting around a table with friends, as opposed to video gaming versions thereof) player since 1978, when I got the "blue box" edition of D&D. When the pandemic started, some college buddies thought it would be a good opportunity to do some online gaming, and I offered to GM.

For me, that meant an opportunity to exercise my creativity, as I've always preferred to run campaigns out of my own worlds, rather than using the prepackaged ones that come from the vendors. This would be no different, largely because I wanted to provide a world that was tailored (somewhat) to what my players would be interested in, but also allow me some room to deviate from the traditional and explore some new ideas. For example, I've come recently to realize that "players" and "monsters" aren't all that different from one another, aside from history, so I've come to embrace the idea of "monstrous player characters"; you want to run a minotaur barbarian? Go for it! Kobold sorcerer? Why not? Orcish cleric of healing? Makes total sense.

This also means I like to make use of other homebrewed content, such as what one might find on [DM's Guild]() or [RPGDriveThru](), but that raises an interesting problem: with all the different sources, it can be awkward to reconcile them all, meaning either I the GM have to have every sourcebook and homebrew document ever used anywhere, or I have to have some way of creating a "single source of truth" for the different content in my game. Spells, creatures, races, classes, all of it has to be in one place so I only have one place I need to consult to keep track of it all.

Enter GitHub.

### Source Control
Although it's most often used for source code management across versions, tools like Git and the like can be used to keep versions of anything (including binaries, though less effectively), and I've long used Git for holding copies of all of my professional writing. This blog, for example, is completely inside a Git repo--and, in fact, was at one point entirely CI/CD-driven. (It's not currently because I ran into some weird configuration issues with my Azure Website, and I haven't taken the time to fix it yet, instead choosing to use the uber-simplistic website-hosting provider [Site44](https://www.site44.com/), which turns a Dropbox folder into a website root, perfect for static-site-generated sites like this one.)

So, [the Github repository for my world](https://github.com/tedneward/Azgaarnoth) was born. I found a pretty nifty world map editor to create the world in, generated one with a nice mix of land and sea (I like having worlds with a good mix of both, because that opens up more varied adventuring possibilities), and lo! The world of Azgaarnoth was born. (The editor is called "Azgaar's World Editor", so I just borrowed the first part of the editor name--seemed like a reasonable homage to me.) All of the files are written in Markdown, and the built-in VSCode editor in every GitHub repo means that if I can access the page (and log in), I can edit it right there in the browser, or I can work with it offline on a laptop for more heavy-duty editing.

First steps were to lay out some basic history (8,000 years of it!) and geography, which meant taking some of what the map editor had generated for me, creating some points of conflict (this part of the world started as a single empire, then had a massive invasion by foreign entities, which stalemated) extracting some consequences across history (with no quick conquest or defeat of the invader, people got frustrated which led to civil breakaways from the empire), and laying out some rough guidelines.

But.... there's more I wanted to do. "Single source of truth" really means "single" in my mind, and that holds for some game-system information (such as races and classes) as well as the world-specific stuff. So I created some Markdown versions for races and classes, which wasn't all that hard. But I also wanted to have a complete reference for every spell and creature and magic item in the world.

### The GM's Spellbook
Spells are one particular point of fun, because while the core D&D 5th Edition rules has a pretty decent collection, there's always room for more, particularly if you want to bring some fun flavor that the players haven't seen before. (And my group, we've all been playing since a young age, so it's often quite the stretch to bring something they've never seen before.) This meant bringing all of the core spells into Markdown format, but also all of the homebrew and 3rd-party purchased content as well, most of which is distributed as a PDF. But I also want to be able to sort through it all without too much difficulty, too.

And here's where things get interesting. A given spell has a lot of interesting metadata on it beyond its name: its level, the "kind" of spell it is (illusion, divination, etc), the classes that can cast it, and so on. Any one of these could be used to organize the master list of spells, but the truth is they're all going to be useful at some point.

Sounds like a database to me!

But truthfully, I didn't want to build this on top of an existing database like Postgress or MySQL; for starters, the RDBMS doesn't really "fit" with storing what is essentially a text document with a few fields of metadata around it, and if I moved all the content into the RDBMS from GitHub, I lose the "quick editing" ability that GitHub provides, *plus* now anybody who wants to edit or add new spells to the list has to be SQL-trained to do it (or I have to build an editor). I kinda still want the source of truth to be GitHub, rather than a more formal RDBMS.

Actually, why not leave GitHub as the database? Each entry is a Markdown file with predetermined blocks in it for various data elements ("Duration", "Casting Time", etc), with each of those elements identified by being bolded in Markdown format. Since each spell needs to be uniquely named, that becomes the "primary key" for the spell, stored in a flat list (directory). Thus, a spell looks like the following:

```
#### Magic Missile
*1st-level evocation* (Sorcerer,Wizard)
___
- **Casting Time:** 1 action
- **Range:** 120 feet
- **Components:** V, S
- **Duration:** Instantaneous
---
You create three glowing darts of magical force. Each dart hits a creature of your choice that you can see within range. A dart deals 1d4 + 1 force damage to its target. The darts all strike simultaneously, and you can direct them to hit one creature or several.

***At Higher Levels.*** When you cast this spell using a spell slot of 2nd level or higher, the spell creates one more dart for each slot level above 1st.
```

... and is stored in `magic-missile.md`. So long as the formatting doesn't deviate from the above, I have some easy parsing markers to work from.

Now, I need some kind of tool that knows how to parse these into a form that can be manipulated and queried. Let's be honest--any language would've worked for this (the parsing here is not complicated, and each spell is essentially a flat record), so I decided to go with Python because why not?

Thus was born "SpellTool": a Python script that rips through a directory filled with these Markdown files, parses each into its own "Spell" object, and allows for some predetermined sorting (such as finding all the spells that can be cast by Sorcerers) and output. It's not a full-fledged database (I can't do ad-hoc queries on it--yet), but it's not that far off from it. Obviously it's not nearly as fast or storage-efficient as a B-tree-based system would be, but it's also directly editable by myself or other "domain experts", which is every bit as valuable, if not more so.

But the Python fun doesn't quite stop there.

### Enter Mkdocs
One thing I found from my players is that as much as *I* love the GitHub interface, they were a little less fond of it. Honestly, that's not unreasonable--GitHub was not designed for the casual individual. Plus, the URLs that GitHub was putting up for each of the spells was... clunky. And truthfully, the Markdown format is not the easiest thing in the world to read if you're not familiar with it. (It's not *hard* to read, mind you, just... awkward.) All of this goes away if I convert the Markdown to HTML and put it all on a simple website (such as the aforementioned Site44).

Fortunately, Python has a great tool, MkDocs, which was obviously intended as a documentation management tool for Python libraries, but it serves my purposes perfectly well, since it takes a collection of Markdown files, transforms each into HTML, but also recognizes relative links and honors them. Plus, any links that don't seem to line up with an actual file are flagged during the process (since they'll likely be a broken link after the translation is done), giving me some "compile-time warnings" along the way.

The results, by they way, are what's on [the website](http://azgaarnoth.tedneward.com) now. If you've ever spent any time looking at Python docs, you'll recognize the format instantly, and the "Next/Previous" links are pretty broken, but I can either live with it as-is, or figure out how to customize or turn those off later.

### Enter npctool
The most recent thing I've wanted to do (for years, actually) is create a tool that generates NPCs (non-player characters) for use during the campaign. After all, why should players be the only ones with all the goodies (in the form of special abilities, spells, and so on)? Some of my most successful campaigns have been because the PCs are standing against a villain who is sporting some of the same kinds of abilities as they are.

But as the players get higher in level, quickly putting together an NPC that's their peer (or superior) is tricky, because the game system is really expecting that you painstakingly craft each level of experience. Most GMs just "fake it" or hand-roll an NPC and use that singular NPC for a while. Me, I like having a fair number of them, partly because it's reasonable to expect that PCs will have more than just one nemesis across their careers, but also because it keeps things varied and interesting to have some different "feels" in the campaign. For example, in the current campaign, the first adventure was the party had to go up against a would-be lich who swiped the lair of a real lich. (Lots of undead.) The second adventure saw the PCs going out to a recent shipwreck to rescue an item before it was lost. (Lots of seaborn creatures.) Each had some different NPCs involved, but you can bet that as we move into the third adventure, the NPCs who weren't outright killed in each adventure are figuring out how to "get back at" the PCs.

In essence, what I needed was a tool that could quickly rip through each level of an NPC's career, answering whatever customization questions that arose, and when the NPC was "finished", calculate all the necessary "to hit" and damage and other level-variable calculations ahead of time. Thus was born the "NPCBuilder", another Python script that will generate NPCs either interactively or from a simple text script:

```
Decide which?
1: Ability Scores
2: Gender
3: Race
>>> 1
You chose Ability Scores
Method:
1: Standard (<function generatenpc.<locals>.selectabilities.<locals>.standard at 0x1074d8900>)
2: NPC (<function generatenpc.<locals>.selectabilities.<locals>.npcstandard at 0x1074d8860>)
3: Hand (<function generatenpc.<locals>.selectabilities.<locals>.handentry at 0x1074d8ae0>)
4: Randomgen (<function generatenpc.<locals>.selectabilities.<locals>.randomgen at 0x1074d8a40>)
5: Average (<function generatenpc.<locals>.selectabilities.<locals>.average at 0x1074d89a0>)
>>> 5
You chose ('Average', <function generatenpc.<locals>.selectabilities.<locals>.average at 0x1074d89a0>)
Decide which?
1: Gender
2: Race
>>> 1
You chose Gender
Choose gender: 
1: Female
2: Male
>>> 2
You chose Male
Decide which?
1: Race
>>> 1
You chose Race
Choose a race: 
1: Siren (<module 'Sirens'>)
2: Kobold (<module 'Kobolds'>)
3: Dwarf (<module 'Dwarves'>)
4: Reborn (<module 'Reborn'>)
5: Half-Ogre (<module 'Half-Ogres'>)
6: Elf (<module 'Elves'>)
7: Tabaxi (<module 'Tabaxi'>)
. . .
33: Sahuagin (<module 'Sahuagin'>)
34: Triton (<module 'Tritons'>)
35: Genasi (<module 'Genasi'>)
>>> 6
You chose ('Elf', <module 'Elves'>)
Subrace: 
1: Dark (<module 'Elf-Dark'>)
2: Bright (<module 'Elf-Bright'>)
3: Shadow (<module 'Elf-Shadow'>)
4: Wood (<module 'Elf-Wood'>)
5: Shadowmark (<module 'Elf-Shadowmark'>)
6: High (<module 'Elf-High'>)
7: Winged (<module 'Elf-Winged'>)
8: Fey (<module 'Elf-Fey'>)
9: Sea (<module 'Elf-Sea'>)
10: Wild (<module 'Elf-Wild'>)
>>> 
```

The scripted version is essentially a simple "pipe" of answers to the prompts that come up, so that generating an NPC along particular lines (say, an 8th-level Sahuagin Cleric of the Tempest Domain) can be generated by using the following script:

```
Ability Scores,Hand,13,11,12,12,13,9,Race,Sahuagin,Cleric,Medicine,Religion,Tempest,Yes
Cleric,Yes
Cleric,Yes
Cleric,WIS,CON,Yes
Cleric,Yes
Cleric,Yes
Cleric,Yes
Cleric,WIS,CON,No
```

... where each "Yes" at the end of the line is the answer to the prompt "Do you want to add another level?". The above script, then, produces the following output:

```
>### Name
*Medium humanoid (Sahuagin) Cleric (Tempest) 8, any alignment*
>___
>- **Armor Class** 10 (DEX (+0))
>- **Hit Points** 55 (8d8 + 8)
>- **Speed** 20 ft, swimming 40 ft
>___
>|**STR**|**DEX**|**CON**|**INT**|**WIS**|**CHA**|
>|:-:|:-:|:-:|:-:|:-:|:-:|
>|15 (+2)|11 (+0)|14 (+2)|12 (+1)|16 (+3)|9 (-1)|
>___
>- **Proficiency Bonus** +4
>- **Saving Throws** Wis +7,Cha +3
>- **Damage Vulnerabilities** 
>- **Damage Resistances** 
>- **Damage Immunities** 
>- **Condition Immunities** 
>- **Skills** Medicine +7, Religion +5
>- **Proficiencies** Light armor,Medium armor,Shields,Simple weapons,Martial weapons,Heavy armor
>- **Senses** darkvision 60 ft, blood 20 ft, passive Perception 13
>- **Languages** Common,Sahuagin,Aquan
>___
>***Blood Frenzy.*** You have advantage on melee attack rolls against any creature that doesn't have all its hit points.
>
>***Limited Amphibiousness.*** You can breathe air and water, but need to be submerged at least once every 8 hours to avoid dehydration. For each 8 hours period you do not submerge, you suffer one additional level of exhaustion.
>
>***Shark Telepathy.*** You can communicate simple ideas with sharks. They may understand you, but you have no way of understanding them.
>
>***Blood in the Water.*** Your specialized sense of smell can detect blood. You are aware of creatures within 20 feet that have hit points below their maximum, and can bleed. When in water, this range extends to 60 feet.
>
>***Channel Divinity: Destructive Wrath.*** When you roll lightning or thunder damage, you can use your Channel Divinity to deal maximum damage, instead of rolling.
>
>***Thunderous Strike.*** When you deal lightning damage to a Large or smaller creature, you can also push it up to 10 feet away from you.
>
>***Channel Divinity (2/Recharges on short or long rest).*** See below for the details of each use.
>
>***Divine Strike.*** Once on each of your turns when you hit a creature with a weapon attack, you can cause the attack to deal an extra 1d8 thunder damage to the target.
>
>#### Actions
>***Bite.*** Melee Weapon Attack: +6 to hit, reach 5 ft., one target. Hit: 1d4 + 2 piercing damage.
>
>***Channel Divinity: Turn Undead.***  You can use one of your uses of Channel Divinity to turn undead. Each undead that can see or hear you within 30 feet of you must make a Wisdom saving throw. If the creature fails its saving throw, if it is a CR of 1 or lower it is destroyed; otherwise it is turned for 1 minute or until it takes any damage.A turned creature must spend its turns trying to move as far away from you as it can, and it can't willingly move to a space within 30 feet of you. It also can't take reactions. For its action, it can use only the Dash action or try to escape from an effect that prevents it from moving. If there's nowhere to move, the creature can use the Dodge action.
>
>***Cleric Spellcasting (Wis, at level 8. Recharges on long rest).*** 4 cantrips known. 11 spells prepared. Spell save DC: 15, Spell attack bonus: +7
>
>Spells always prepared: [fog cloud](http://azgaarnoth.tedneward.com/magic/spells/fog-cloud/),[thunderwave](http://azgaarnoth.tedneward.com/magic/spells/thunderwave/),[gust of wind](http://azgaarnoth.tedneward.com/magic/spells/gust-of-wind/),[shatter](http://azgaarnoth.tedneward.com/magic/spells/shatter/),[call lightning](http://azgaarnoth.tedneward.com/magic/spells/call-lightning/),[sleet storm](http://azgaarnoth.tedneward.com/magic/spells/sleet-storm/),[control water](http://azgaarnoth.tedneward.com/magic/spells/control-water/),[ice storm](http://azgaarnoth.tedneward.com/magic/spells/ice-storm/)
>
>* *Cantrips:* 
>* *1st (4 slots):* 
>* *2nd (3 slots):* 
>* *3rd (3 slots):* 
>* *4th (2 slots):* 
>
>#### Reactions
>***Wrath of the Storm (3/Recharges on long rest).*** When a creature within 5 feet of you that you can see hits you with an attack, you can cause the creature to make a Dexterity saving throw (DC 15). The creature takes 2d8 lightning or thunder damage (your choice) on a failed saving throw, and half as much damage on a successful one.
>
>
>#### Bonus Actions
>***Sharks Frenzy (Recharges on short or long rest).*** You can make a special attack with your Bite. If the attack hits, it deals its normal damage, and you gain 2 temporary hit points. These temporary hit points disappear when you finish a long rest.
>
>***Channel Divinity: Harness Divine Power.*** You can expend a use of your Channel Divinity to regain one expended spell slot, the level of which can be no higher than 3.
>

#### Description
***Race: Sahuagin.*** A fish-like monstrous humanoid species that lives in oceans, seas, underground lakes, and underwater caves.

***Class: Cleric.*** Clerics are intermediaries between the mortal world and the distant planes of the gods. As varied as the gods they serve, clerics strive to embody the handiwork of their deities. No ordinary priest, a cleric is imbued with divine magic.

***Divine Domain: Tempest.*** 

***Magic Item: Uncommon Permanent.***

***Magic Item: Uncommon Permanent.***
```

The magic items at the bottom are entirely level-based, as described by the 5th-ed DMG. As the GM, of course, I reserve the right to amp up (or down) the NPC's inventory as feels right, always keeping in mind, of course, that players love to loot the bodies of their fallen opponents. Spells are something I always figure I'm going to want to decide post-creation, so I don't bother trying to assign (or prompt for) those ahead of time. The rest, though, that's all based on the various benefits of race (and subrace, if applicable) and class/subclass.

Gleaned from where, you ask? Why, from the Markdown describing each race and class itself, of course.

### Enter Literate Markdown
Before you start getting excited that I've somehow built a Large Language Model for parsing Markdown and understanding 5th-ed D&D rules, let me cool you off ahead of time: Nope. Instead, I decided that the quickest/easiest thing would be to write those "rules" in Python. However, after a first effort where I painstakingly flipped between Python script and Markdown files, I realized I really wanted the Python script rules to be much "closer" to the code and vice versa, ideally, right next to each other.

A number of years ago, Donald Knuth promoted a concept called "literate programming", in which documentation and executable code were intermingled ("woven") together into a single file. In most modern programming languages, we can have extensive documentation blocks that are essentially well-formatted comments (Javadocs, for example), but I wanted something of the opposite--documentation with well-formatted code blocks.

Well, as it turns out, Markdown supports that, so in theory, I could do my own "Literate Python" if I could somehow get a Python interpreter to skip past everything that wasn't in a Markdown triple-backtick code block, like what we see here:

    # [Orc](../Creatures/Orcs.md)

    ```
    name = 'Orc'
    description = "***Race: Orc.*** "
    type = 'humanoid'
    ```

    * **Ability Score Increase.** Your Strength score increases by 2, your Constitution score increases by 1, and your Intelligence score is reduced by 2.

    ```
    def level0(npc):
        npc.description.append("***Race: Orc.*** ")

        npc.STR += 2
        npc.CON += 1
        npc.INT -= 2
    ```

    * **Age.** Orcs reach adulthood at age 12 and live up to 50 years.

    * **Alignment.** Orcs are vicious raiders, who believe that the world should be theirs. They also respect strength above all else and believe the strong must bully the weak to ensure that weakness does not spread like a disease. They are usually chaotic evil.

    * **Size.** Orcs are usually over 6 feet tall and weigh between 230 and 280 pounds. Your size is Medium.

    ```
        npc.size = 'Medium'
    ```

    * **Speed.** Your base walking speed is 30 feet.

    ```
        npc.speed['walking'] = 30
    ```

    * **Darkvision.** You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. You can't discern color in darkness, only shades of gray.

    ```
        npc.senses['darkvision'] = 60
    ```

    * **Aggressive.** As a bonus action, you can move up to your speed toward an enemy of your choice that you can see or hear. You must end this move closer to the enemy than you started.

    ```
        npc.bonusactions.append("***Aggressive.*** You can move up to your speed toward an enemy of your choice that you can see or hear. You must end this move closer to the enemy than you started.")
    ```

    * **Menacing.** You are proficient in the Intimidation skill.

    ```
        npc.skills.append("Intimidation")
    ```

    * **Powerful Build.** You count as one size larger when determining your carrying capacity and the weight you can push, drag, or lift.

    ```
        npc.traits.append("***Powerful Build.*** You count as one size larger when determining your carrying capacity and the weight you can push, drag, or lift.")
    ```

    * **Languages.** You can speak, read, and write Common and Orc.

    ```
        npc.languages.append("Common")
        npc.languages.append("Orcish")
    ```

My answer to this lies in the fact that Python, as a source-executable language, knows how to take source and turn it into an executable module; if I can figure out how to tap into that, I can write my own skimmed-down "loader" that knows how to parse a Markdown file, skip everything that's not in a code block, and take the result and feed it to the standard Python module-loading mechanism:

```
def loadmodule(filename, modulename=None):
    def parsemd(mdfilename):
        pythoncode = ""
        with open(mdfilename) as mdfile:
            lines = mdfile.readlines()
            codeblock = False
            for line in lines:
                if line[0:3] == "```":
                    codeblock = not codeblock
                    continue

                if codeblock == True:
                    pythoncode += line

        if SAVEPY != None and SAVEPY in mdfilename:
            with open('./Python/' + os.path.basename(mdfilename) + '.py', 'w') as pyfile:
                pyfile.write(pythoncode)
        return pythoncode

    def builddict(module):
        global classes
        global races
        builtins = {
            "allclasses": classes,
            "allraces": races,
            "traits": traits,
            "spelllinkify": spelllinkify,
            "choose": choose,
            "replace": replace,
            "random": randomlist,
            "dieroll": dieroll,
            "min": min,
            "len": len,
            "print": print,
            "types": types
        }
        for (key, value) in builtins.items():
            module.__dict__[key] = value

    literatecode = parsemd(filename)
    if len(literatecode) > 0:
        if verbose: print(literatecode)
        if modulename == None:
            modulename = os.path.splitext(os.path.basename(filename))[0]
        module = types.ModuleType(modulename)
        builddict(module)
        exec(literatecode, module.__dict__)
        return module
    else:
        warn(f"{filename} has no literate code")
        return None
```

The heart of this `loadmodule` function is in the `exec` call five lines from the end--that's the Python3-preferred mechanism for transforming source into an executable module. Thus, this whole thing is broken up into three parts: the `parsemd` nested function rips through a Markdown file and keeps only those lines inside the triple-backtick blocks, the `builddict` function creates a dict (key-value pairs data structure) containing the "globals" that will be in scope when building this module, and the body of `loadmodule` itself calls `parsemd` to get the code, `builddict` to build the globals (with my own set of top-level functions for each module to be able to rely on), creates a `ModuleType` object into which to pour the executable code, and `exec`s it.

Voila. Literate Markdown.

From here, I can have each race, subrace, class, subclass, and even feats and/or backgrounds be its own Python module. If I then couple some conventions (every module has a top-level "name" and "description" field, for example, along with "level*N*" functions that define what that class or subclass does at level *N*) with this, I have an interesting set of modular... er, modules... that independently describe how they affect an NPC at each discrete level of experience.

And, if I add more classes (unlikely), races (distinctly possible), subclasses (very likely), or feats (also very likely), all I need to do is drop the literate Markdown into the appropriate directory, and my npcbuilder will pick them up automatically. (Note that if a given Markdown file has no code in it, I don't try to load it, and if there's a "SAVE_PY" environment variable set, I save the extracted Python in it for easier debugging.)

### Current state and TODOs
The one thing I dislike about this so far (aside from the fact that I really wish that LLM did exist, so I wouldn't have to write out the literate code by hand!) is that now the descriptions are clogged with code blocks that appear in all the HTML. I think this is pretty easily fixable--MkDocs has hooks for "plugins", which can customize the output, so I think I can write a plugin that discards all code blocks (since I don't need them, since this isn't a code project it's a D&D project).

There's a few other things that I find myself wishing I had, such as:

* a city-generator tool (in progress) that will use some seed info and randomization to create the outlined sketch of each of the several-hundred-or-so cities I have on the map, not to mention the unmentioned thousands of towns and villages that aren't mentioned anywhere on the map.
*  Each city, of course, has NPCs at various places within it, so of course I want to call out to my npctool to generate each of those. In fact, I kinda want to figure out how to tie all of these tools together more coherently into a well-oiled package, but I don't quite know (in my head) what that looks like or how they should work together.

But hey, I'm not hired anywhere yet, so there's more to keep me busy.
