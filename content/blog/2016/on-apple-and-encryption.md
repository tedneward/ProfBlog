title=On Apple and encryption
date=2016-02-17
type=post
tags=security, industry, cloud, psychology, philosophy, ios, android
status=published
description=In which I examine my professional thoughts around the authorities' attempts to coerce Apple into cracking the encryption on an iPhone in an attempt to investigate the San Bernadino shooters.
~~~~~~

**tl;dr** By now, everybody has heard that the FBI has issued a request (which is now being backed by a court order to comply) to Apple to provide software to unlock the iPhone 5c of one of the San Bernardino shooters. This is a massive request, with huge implications for everybody (Apple, Americans, foreigners, I really mean everybody). And most of those implications, I believe, are bad.

<!--more-->

First of all, let's get some basic facts in place:

* The [San Bernardino shooters](https://en.wikipedia.org/wiki/2015_San_Bernardino_attack) killed 14 people and seriously injured 22. However, "They were not directed by [foreign terrorist] groups and were not part of any terrorist cell or network."
* The FBI obtained an iPhone belonging to one of the shooters. Because it was locked (like so many of us do), the FBI issued a request for technical assistance to unlock the phone.
* Apple has refused, and [issued a statement why](http://www.apple.com/customer-letter/).
* A federal court judge has [issued a court order](https://assets.documentcloud.org/documents/2714001/SB-Shooter-Order-Compelling-Apple-Asst-iPhone.pdf) demanding Apple's compliance with the FBI's request.

Whether Apple will comply with the court order remains to be seen. (**UPDATE 2021:** From all available evidence, they did not.)

I find myself a whole mess of different thoughts and reactions, and I'm just going to lay all this out in no particular order. Naturally, the disclaimer "I am not a lwyer" applies to all of this, and I'd *love* for those with training in the law and having passed the bar exam to weigh in with their expert opinion.

## Legal issues
Let's start with the legal stuff.

#### Why does the FBI need this?
I'm confused. If the FBI issued a statement saying that they do not believe these people were part of an established foreign terror group or network, then what does the phone give them? In fact, what does the phone give them, period? Certainly there's the possibility that there's some kind of Twitter history (their favorites) or Facebook saved pages, but in both of those cases, they could go to the respective social media companies and get the information there. Even a history of SMS messages and phone log could be pulled from Verizon (the shooter's carrier).

I simply don't understand what information the FBI expects to remove from the phone that they couldn't get elsewhere. There's only two scenarios I can imagine that require this step:

1. there is something stored locally to the device that isn't stored in the cloud, or 
2. if there is information stored to the cloud that they cannot access, probably because the cloud provider in question is not subject to US legal injunction/demands.

Suddenly, the whole ["Safe Harbor"](https://en.wikipedia.org/wiki/International_Safe_Harbor_Privacy_Principles) argument of a few months ago takes on a wholly new light. For those who weren't following the crisis/discussion then, the US government's willingness to demand companies surrender consumer information, in violation of EU Data Protection Directives, caused the EU to declare that the US was no longer a "safe harbor" for its data, and therefore not a safe place to store EU consumer data.

This is a perfect case where this can come into play---if the shooters' phone was using a system that stores its data in data centers on European soil, the US government has no jurisdiction over those servers, and therefore cannot strong-arm the company into complying with an order to surrender that data. *This is exactly why the EU was concerned.* And, apparenty, with good reason.

You can argue that in this case, the US should have the right to be able to demand that data. After all, this is not only a criminal investigation, but an investigation that could potentially have international implications. This is not unusual, nor new. Which leads me to my next thought....

#### Why isn't a warrant sufficient?
Normally, when the police want to obtain data about an individual (living or dead) held by a third party, they must obtain a warrant from a judge, ensuring that the request is a legal one and within the boundaries of jurisprudence. We see this all the time in legal discussions and on TV shows (for crying out loud). But there's no discussion of any warrant being issued in this particular case, nor of Apple being given an opportunity to challenge the legality of the warrant, which leads me to wonder, was no warrant issued, and if so, why not?

#### The device was actually owned by the county
This story takes on a slightly different twist because the device apparently wasn't owned by the shooters themselves, but by the county (for whom they worked, apparently?). Thus, the legal steps necessary to obtain the right legal framework by which to obtain the data was easily navigated---the FBI asked, the county granted.

This raises some interesting lessons for IT departments around the use of mobile devices, as well as for those who use mobile devices as part of their work day:

***Never mix personal and professional on one device.***

Look, I know it's really nice to be able to get your email on your phone, but there's all kinds of weird legal gray areas that come into play when you do so. Does the company have the right to wipe your phone remotely in the event that you lose it? Will the company pay you to replace the phone if some software they have you install on it somehow bricks the device? Will you be liable for violations of company privacy if your phone is lost with company email on it? (And the answer to that last one is a resounding yes, by the way.)

But if you're an IT department, you have to worry about all of these things and more, because now, technically, if you allow a BYOD ("Bring Your Own Device") policy, and you can't get on the device (such as is the case here), you're in for a world of PR nightmares at a minimum, and outright legal problems in the more common case. IT departments are, by definition, responsible for the data that resides on their systems, and if systems include the hardware on which the software resides, if it's not something the company owns or has access to, you are basically walking a very ugly line.

If you're a CTO or VP of IT, you need to be rethinking and re-examining your mobile policy, *right now*. If you want employees to be able to use mobile devices as part of their job, provide them (and have a very straightforward and strict policy regarding what software can be installed and what networks can be accessed in place). If you have employees using personal mobile devices as part of their day job, make sure you have a memo of understanding in place that lists the specific conditions you (the company) demand their agreement on in order to do so. If you don't have that memo of understanding, sock away a little extra from the profit line into a savings account marked "Legal Fund", because you'll need it someday, I guarantee it.

#### Apple's customer note covers more than just this one case
Apple notes (correctly) that

> [Your] information needs to be protected from hackers and criminals who want to access it, steal it, and use it without our knowledge or permission.

This is, I think, without argument. 

What they are not saying, and should, is that the government needs to be included in that collection of parties from which our information is protected. This is a fundamental right of any US citizen, and arguably anyone in the world. "Innocent until proven guilty" and all that.

> Compromising the security of our personal information can ultimately put our personal safety at risk.

This is also absolutely true, for some more directly than others. Ask any of the battered women whose husbands are under court orders, ask anyone in Witness Protection, but more importantly, ask any woman who has ever had a stalker. But it doesn't even have to be that exotic---look at your browser history, the bank application on your phone, your email, your Facebook message history, and so on. There's so much information on these devices that losing one is not just a hassle, in some cases, it's downright life-paralyzing.

The same spirit that keeps the US government off of our phone lines (without a warrant), out of our personal mail (without a warrant) and out of our homes (without a warrant) needs to keep them out of our phones (without a warrant).

#### European and other visitors could have their privacy waived
Let's be clear: If the US wins this case, it means that any foreign national traveling in the US would be subject to the same kind of intrusion, regardless of what their government thinks and regardless of where their data is stored. And the various governments that govern those citizens would be really, really pissed off about that. This feels like an escalation of the Safe Harbor incident from last year, and I imagine that other governments would feel much the same---but this is so new that I doubt they've had time to formulate a response. Expect to see those statements and responses come in the months to come if this goes through.

#### Apple complying with this one case sets precedent
Suppose that, in the face of everything, Apple agrees to do this for this one case. Can you possibly imagine how many requests they will receive from every police department all over the country seeking their technical assistance in doing so for iPhones removed from arrested suspects for everything ranging from burglary to financial malfeasance? It would be a huge nightmare for them.

On top of that, you can well imagine that Google, Microsoft, Samsung and other manufacturers are watching this whole thing with very keen interest, because if the government can compel Apple to do this, it opens the doors to demanding it of any hardware manufacturer within the US. And none of them want any part of this any more than Apple does.

#### Apple complying with this one case hurts them
"Hi, I'm a Mac. (And I'm a PC.) Hey, PC, can you secure your data against government intrusion? (Yup.) Oh."

Android devices, particularly those manufactured overseas, would suddenly become a really hot commodity. Apple simply cannot be seen to back down on this, or they will get crucified in the extremely hot shooting war of words that they have with their competitors, Samsung in particular. This could cost them millions, if not billions, in sales. While the various "patriots" will claim that this is somehow just the price of freedom, I don't see the US government stepping up to provide adequate compensation in the event that this is the case.

## Technical feasibility
Here's where we get technical. Bear in mind, I write iOS apps, and I teach writing iOS apps to a variety of people, but I've never worked for Apple, have no access to any insider information or source code, and have never actually tried to hack an iOS device, so I may be missing some details here.

As noted [here](http://blog.trailofbits.com/2016/02/17/apple-can-comply-with-the-fbi-court-order/), there's three things that stand in the way of the FBI (or any other attacker) bypassing the lock screen on an iPhone to obtain access:

1. iOS may completely wipe the user’s data after too many incorrect PINs entries
2. PINs must be entered by hand on the physical device, one at a time
3. iOS introduces a delay after every incorrect PIN entry

(By the way, the relevant [iOS security documentation](https://www.apple.com/business/docs/iOS_Security_Guide.pdf) describes all of this in much greater detail. I will periodically refer back to this document as we go.)

Thus, according to the court order, the FBI requested Apple to:

1. ... bypass or disable the auto-erase function whether or not it has been enabled;
2. ... enable the FBI to submit passcodes to the SUBJECT DEVICE for testing electronically via the physical device port, Bluetooth, Wi-Fi, or other protocol available on the SUBJECT DEVICE; and
3. ... ensure that when the FBI submits passcodes to the SUBJECT DEVICE, software running on the device will not purposefully introduce any additional delay between passcode attempts beyond what is incurred by Apple hardware.

Let's take these one at a time.

Bypassing the auto-erase function may or may not be feasible, depending on how it's implemented. If it's an API call that Apple invokes under certain conditions, then whatever this "bypass" is either has to prevent that condition ("*n* failed login attempts") from ever being triggered, or it has to somehow replace the code that does the erasing with something more benign. Depending on where and how the device OS code is stored, this can either be trivial or require a custom set of ROMs be plugged in to the device.

Tapping the PINs on the device screen is the pain, and the FBI sought a way around that by asking that the device accept passcodes via "device port, Bluetooth, Wi-Fi, or other protocol available". In other words, by any means supported by the device for input. Doing so through the device port requires the device be in the hands of the attacker/FBI, but Bluetooth and Wi-Fi are both wireless protocols---this could be done remotely from a distance.

"Not purposefully introduce any additional delay between passcode attempts" refers to the delay that iOS deliberately puts in, as described in the Security Guide (p12):

> "To further discourage brute-force passcode attacks, there are escalating time delays after the entry of an invalid passcode at the Lock screen.

That same paragraph is where Apple describes the setting to wipe the phone in the event of too many failed login attempts:

> If Settings > Touch ID & Passcode > Erase Data is turned on, the device will automatically wipe after 10 consecutive incorrect attempts to enter the passcode."

So again, this basically says that the cracking tool would have to somehow either prevent the conditions (tracking the number of failed logins) or replace the code that wipes the device.

Could this be done? Potentially, if the device were "flashed" with a new, hacked, operating system:

> [Provide] the FBI with a signed iPhone Software file, recovery bundle, or other Software Image File (“SIF”) that can be loaded onto the SUBJECT DEVICE. The SIF will load and run from Random Access Memory (“RAM”) and will not modify the iOS on the actual phone, the user data partition or system partition on the device’s flash memory. 

This is not rocket science. A SIF is what gets loaded onto your phone every time you do an update of the phone.

Now, if this were the end of the paragraph, Apple's concerns about this somehow becoming a "master key" for all iOS devices becomes a huge issue:

> They have asked us to build a backdoor to the iPhone. ...

> Specifically, the FBI wants us to make a new version of the iPhone operating system, circumventing several important security features, and install it on an iPhone recovered during the investigation. In the wrong hands, this software — which does not exist today — would have the potential to unlock any iPhone in someone’s physical possession.

> The FBI may use different words to describe this tool, but make no mistake: Building a version of iOS that bypasses security in this way would undeniably create a backdoor. And while the government may argue that its use would be limited to this case, there is no way to guarantee such control.

The court order does try, at least on the surface, to make sure this doesn't become the "master key" for all devices that Apple warns against:

> The SIF will be coded by Apple with a unique identifier of the phone so that the SIF would only load and execute on the SUBJECT DEVICE.

But Apple points out:

> Some would argue that building a backdoor for just one iPhone is a simple, clean-cut solution. But it ignores both the basics of digital security and the significance of what the government is demanding in this case.

> In today’s digital world, the “key” to an encrypted system is a piece of information that unlocks the data, and it is only as secure as the protections around it. Once the information is known, or a way to bypass the code is revealed, the encryption can be defeated by anyone with that knowledge.

> The government suggests this tool could only be used once, on one phone. But that’s simply not true. Once created, the technique could be used over and over again, on any number of devices. In the physical world, it would be the equivalent of a master key, capable of opening hundreds of millions of locks — from restaurants and banks to stores and homes. No reasonable person would find that acceptable.

Here's what is under discussion, again from the Security Guide. First of all, as described on p6/7, each device has a "unique device ID" (ECID) and, in a particular chip on the device called the Secure Enclave, a "unique ID" (UID). These are then used as part of the encryption process to secure various things on the device, including files (which we'll talk about later). More importantly, these aren't values that can be picked up from casual use of the device (p10, my emphasis):

> Every iOS device has a dedicated AES 256 crypto engine built into the DMA path between the flash storage and main system memory, making file encryption highly efficient.

> The device’s unique ID (UID) and a device group ID (GID) are AES 256-bit keys fused (UID) or compiled (GID) into the application processor and Secure Enclave during manufacturing. ***No software or firmware can read them directly***; they can see only the results of encryption or decryption operations performed by dedicated AES engines implemented in silicon using the UID or GID as a key. Additionally, the Secure Enclave’s UID and GID can only be used by the AES engine dedicated to the Secure Enclave. The UIDs are unique to each device and are not recorded by Apple or any of its suppliers. The GIDs are common to all processors in a class of devices (for example, all devices using the Apple A8 processor), and are used for non security-critical tasks such as when delivering system software during installation and restore. ***Integrating these keys into the silicon helps prevent them from being tampered with or bypassed, or accessed outside the AES engine.*** The UIDs and GIDs are also not available via JTAG or other debugging interfaces. 

> ***The UID allows data to be cryptographically tied to a particular device.*** For example, the key hierarchy protecting the file system includes the UID, so if the memory chips are physically moved from one device to another, the files are inaccessible. The UID is not related to any other identifier on the device.

In other words, the UID being used as keys into AES means that we are now talking about the strength of encryption algorithms somehow being broken without having the key. (For those of you who aren't crypto-savvy, this is basically the whole point of a crypto algorithm: to prevent enciphered text being reversed to plaintext without the use of the key used to encipher it.)

Note that the Security Guide points out that these keys are used as part of file encryption (p11):

> In addition to the hardware encryption features built into iOS devices, Apple uses a technology called Data Protection to further protect data stored in flash memory on the device. Data Protection allows the device to respond to common events such as incoming phone calls, but also enables a high level of encryption for user data. Key system apps, such as Messages, Mail, Calendar, Contacts, Photos, and Health data values use Data Protection by default, and third-party apps installed on iOS 7 or later receive this protection automatically. Data Protection is implemented by constructing and managing a hierarchy of keys, and builds on the hardware encryption technologies built into each iOS device. Data Protection is controlled on a per-file basis by assigning each file to a class; accessibility is determined by whether the class keys have been unlocked.

And goes on (p12):

> Every time a file on the data partition is created, Data Protection creates a new 256-bit key (the “per-file” key) and gives it to the hardware AES engine, which uses the key to encrypt the file as it is written to flash memory using AES CBC mode. 

> ... The per-file key is wrapped with one of several class keys, depending on the circumstances under which the file should be accessible. Like all other wrappings, this is performed using NIST AES key wrapping, per RFC 3394. The wrapped per-file key is stored in the file’s metadata.

> When a file is opened, its metadata is decrypted with the file system key, revealing the wrapped per-file key and a notation on which class protects it. The per-file key is unwrapped with the class key, then supplied to the hardware AES engine, which decrypts the file as it is read from flash memory. All wrapped file key handling occurs in the Secure Enclave; the file key is never directly exposed to the application processor.
 
> ... The content of a file is encrypted with a per-file key, which is wrapped with a class key and stored in a file’s metadata, which is in turn encrypted with the file system key. The class key is protected with the hardware UID and, for some classes, the user’s passcode. 

In other words:

* You have to have the per-file key in order to read the file. This is stored in metadata.
* You have to have the file system key in order to read the metadata.
* The file system key is derived from the UID and the user's passcode.

What this means, then, is that Apple, in order to comply with the FBI's order, must figure out a way to defeat all this key-based encryption. Since it lacks the keys in question, it would be discovering a way to bypass or defeat AES encryption. Doing that would essentially invaldiate AES for use across all applications, and considering that banks and other high-security folks use AES largely because it hasn't been broken, doing so (if it's even technically feasible, and right now most cryptanalysts don't believe it is, or we wouldn't be using it) would send a shock wave of enormous proportions across the entirety of the online world.

And no, that couldn't be limited to just one device.

## Summary
Frankly, the idea that Apple could somehow be compelled to do this is a disturbing one to me. It raises all kinds of bad precedents for other companies, it weakens consumer privacy protection, and frankly it's not clear to me why the FBI wants or needs this information in the first place.

This story is not done. Not for a single moment. I will be watching this with some interest, and no small amount of concern.
