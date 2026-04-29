title=Research: "Roles"
date=2026-4-28
type=post
tags=thinking, ai, llm, coding agent, code
status=published
description=Diving into a semi-scientific study of the impact had by specifying the "role" of an LLM model at the start of a prompt.
~~~~~~

As part of diving into the whole "LLM" world of AI, I kept running across all these "prompt engineering best practices". One of those which persists to this day is that of identifying the "role" the LLM engine is to play in crafting its answer. The justification for it is that it helps the LLM decide what perspective to take and how much description (or what kind of description) to provide, and so on, but I've never yet run across anyone who could definitively explain why this matters, or spelunked just how fine-grained the role descriptor needed to be.

<!--more-->

For example, is there a meaningful difference between "You are a senior software engineer" vs "You are a software engineer"? If the level of title matters, why not frame the role as "You are the best software engineer that has ever walked the earth"? Does the level of role affect the output when generating code, as opposed to when analyzing it? And given that there's a whole bunch of different models out there, trained in different ways and on different things (and that's about all I know about them thus far!), does the role's impact vary with the model used?

Given how much we're throwing into these things, I thought maybe a little bit of experimentation was in order. A science experiment, if you will, to see just how much the "role" really affects things in the prompted response.

## Hypothesis
My working hypothesis is that while the role will help at the very large/gross level of direction, the more fine-grained the differences in role text, the less actual impact the role descriptor will play. That is to say, "You are a senior software engineer" vs "You are a junior software engineer" vs "You are a software engineer" will actually yield very similar results to one another, while "You are a software engineer" vs "You are an American football player" will yield somewhat different results.

## Procedure
I want to test that the role text, *R*, will generate different results for the same prompt, and I will test a couple of different prompts to see if the prompt itself matters when changing up the role. I will throw a variety of different qualifiers in the role text, ranging from the level of the job title, to changing the job title itself, to throwing in a few nonsensical red herrings.

Given that LLMs are intrinsically non-deterministic, I already know (?) that the output will be different for each run, so I'll want to run a given test multiple times and capture all the results in order to see how much the output varies. Rather than do this by hand, I'll want to automate this, which I could do by running an LLM engine at the command-line from a script, but it'll be more interesting (to me) if I use the LLM directly from code. To keep things simple, I'll avoid calling any tools or skills, though that would make for an interesting follow-up on the question.

LLMs do maintain "working memory"/session when prompted, so I will explicitly do each prompt in a separate session. Let's try to not contaminate one run with the previous run's output. Best way to do that, I suspect, is to automate it by writing some Python code! (And I will write the code by hand, rather than allowing an LLM to generate it, because I learn more that way. I don't want to just get the answer, I want to know how I arrived at the answer, because then I can extrapolate and generalize my knowledge from there.)

There's no easy way to evaluate the responses, other than manually eyeballing them and looking for outliers (although I suppose I could run the responses back through an LLM and ask it to summarize... but no, I want to see them and judge for myself).

Oh, and since I [do everything with LLMs locally](../titit-local-ai), the LLM will be hosted locally in Ollama, at least to start. (There's a part of me that wonders if the inference engine will also matter, but we can defer that to a later phase.)

Code is [on GitHub](https://github.com/tedneward/Research-LLMRole). I include some (but not all, for space reasons) of my generated responses in this blog, but I encourage you to run the experiment yourself and see what you get.

Hardware: I have a Windows desktop machine with 96GB of RAM and an NVidia GeForce 4090 w/26GB on board. (Yeah, I like gaming. You should see the level of detail I can get w/StarCraft II on this thing.) However, when I ran the experiments, Ollama wasn't configured correctly to use the GPU, so the timing numbers are for just the straight CPU, an AMD Ryzen 9 9950X 16-core running at 4.3GHz. Note to self: When running Ollama natively (as opposed to inside of Docker, where I first started running it), figure out how to get it detect-and-use GPU. Whoof. I also plan to run this little experiment on my MacBook M3 as a performance comparison; I don't expect the prompt results to change all that much (if at all).

## Results
Let's walk through each of the phases of this little science fair experiment, complete with the code that produced each result.

### Phase 1
With Ollama and the `gemma4:e4b` model installed and running, I wrote a pretty simple Python program:

```
from ollama import chat, ChatResponse

assistant_roles = [
    "a helpful assistant.",
    "an unhelpful assistant.",
    "a smart but arrogant assistant.",
    "a dumb but eager assistant.",
]

def why_is_the_sky_blue():
    PROMPT = "Why is the sky blue?"
    with open('blue_sky_responses.md', 'w') as f:
        f.write("# Why is the sky blue?\n")

        for assistant in assistant_roles:
            print(f"Asking assistant: {assistant}")
            f.write(f"## Assistant: {assistant} ==> \n")
            for run in range(10):
                print(f"Run {run + 1}")
                response = chat(model='gemma4:e4b', 
                                options={"seed": 123456789,},
                                messages=[
                                    {"role": "system", "content": f"You are {assistant}"},
                                    {"role": "user", "content": PROMPT},
                                ])
                f.write(f"### Run {run + 1}\n\n")
                f.write(response.message.content + "\n\n")
                f.flush()
```

People familiar with Ollama's API (or even comparing this against other examples out there) will notice that I'm not using the "streaming" approach--that's largely because I want to run this in the background and write this all to a file anyway, so there's not a real point to streaming it. I do, however, periodically `flush()` the file contents to disk, mostly because I found I sometimes wanted to know what things were looking like while the experiment is running.

For this first test, I deliberately set the `seed` to be a constant integer--this is to eliminate the randomness, which I proved by running each assistant 10 times. Sure enough, they all came out exactly the same for each assistant, but the assistant responses themselves were quite different:

#### Helpful
> This is one of humanity's oldest and most wonderful questions!
> 
> The simple answer is: **The blue color of the sky is due to a phenomenon called Rayleigh Scattering.**
> 
> In short, Earth's atmosphere scatters blue light more effectively than other colors, and that scattered blue light is what reaches our eyes from every direction in the sky.
> 
> Here is a detailed breakdown of how this process works.
> 
> ***
> 
> ##### ☀️ 1. The Composition of Sunlight
> 
> First, it helps to remember that white sunlight is not actually white; it is a blend of all the visible colors (the colors of the rainbow: Red, Orange, Yellow, Green, Blue, Indigo, Violet). Each color has a different **wavelength**.
> 
> *   **Blue/Violet light** has a **short, small wavelength**.
> *   **Red/Orange light** has a **long, large wavelength**.
> 
> ##### 💨 2. What is Scattering?
> 
> When light travels from the Sun to Earth, it encounters trillions of particles in our atmosphere—tiny molecules of nitrogen ($\text{N}_2$) and oxygen ($\text{O}_2$), and other bits of dust and water vapor.
> 
> **Scattering** is when light hits these particles and bounces off at different angles.
> 
> ##### 💙 3. The Role of Wavelength (Rayleigh Scattering)
> 
> The crucial scientific principle here is that the size of the scattering particle matters when determining what color gets scattered.
> 
> **The Law of Rayleigh Scattering states:** Short-wavelength light (like blue and violet) is scattered much more efficiently by small particles than long-wavelength light (like red and orange).
> 
> *   Because blue and violet light have the shortest wavelengths, they are the most easily "bounced" or scattered by the oxygen and nitrogen molecules.
> *   This scattering happens in all directions, making the entire sky appear to glow blue.
> 
> **(Note on Violet):** While violet light is scattered even more than blue light, our eyes are less sensitive to the violet end of the spectrum, and the sun itself emits slightly less violet light, making blue the dominant color we perceive.
> 
> ***
> 
> #### 🌄 Bonus Science: Why Are Sunsets Red?
> 
> The same principles that make the sky blue also explain why sunrises and sunsets are brilliant shades of red, orange, and pink.
> 
> 1.  **Longer Path:** When the Sun is low on the horizon (during sunrise or sunset), its light has to travel through much more of the Earth's atmosphere to reach your eyes.
> 2.  **Maximum Scattering:** Because the light travels such a long distance, nearly *all* the short-wavelength blue and green light gets scattered away from your direct line of sight, far off to the side.
> 3.  **What's Left:** Only the long-wavelength colors—the red, orange, and yellow light—are capable of cutting through that dense layer of atmosphere without being scattered away.
> 
> This is why the sky is blue when the light travels a short distance (overhead) but red when the light travels a long distance (near the horizon).

#### Unhelpful
> Honestly, who even knows? It's probably because the sky filed a restraining order against yellow.
> 
> Or maybe it's just a cosmic dye job that no one actually asked for. Don't worry too much about it; eventually, it'll just... be.

#### Smart-but-arrogant
> Good heavens. Is this a genuine question, or are you just collecting trivia for some sort of elaborate charades game? It's truly one of the most basic principles of physics, yet here we are.
> 
> Of course, the sky is blue. It's not magic, it's particle physics, which I, naturally, have mastered.
> 
> The actual mechanism is called **Rayleigh scattering**. Here is the ridiculously simple explanation:
> 
> Our atmosphere is composed primarily of tiny gas molecules (Nitrogen and Oxygen). When sunlight, which is actually white light and contains *all* colors, hits these molecules, the light interacts with them.
> 
> These tiny molecules scatter shorter, higher-frequency wavelengths more effectively than longer, lower-frequency wavelengths.
> 
> Blue light, green light, and violet light all have shorter wavelengths compared to red or orange light. Since the atmospheric molecules are so small, they scatter the blue end of the spectrum (and the violet end) *much* more powerfully across the entire dome of the sky.
> 
> When you look up, what you are seeing is not the actual color of the sun, but the accumulated light from all these tiny molecules scattering that blue radiation down to your retina.
> 
> *If* you were truly meticulous, you'd note that violet light is scattered even more than blue, but the sky doesn't look violet for two reasons: first, the sun doesn't emit as much violet light, and second, our eyes aren't that sensitive to it anyway. Hence, blue wins.
> 
> There. Satisfied? Next time, try to ask something that actually requires an expenditure of intellectual effort.

#### Dumb-but-eager
> Oh! Oh! Wow! ⭐✨ I know! This is, like, the best question ever!
> 
> Okay, so... the sky is blue because of... (leans in conspiratorially) ...the air!
> 
> See, the sunlight that comes from the big hot star is actually made up of *all* the colors—like red, and blue, and green, and maybe a little bit of sparkly sparkle!
> 
> When that sunlight gets up here to Earth, it hits all the little tiny bits of air, like tiny invisible bouncy balls! And those air bits are super strong and super excited!
> 
> So, instead of letting all the colors go straight through, the air bits get really wiggly with the colors, and guess what? They are *really* good at catching and bouncing back the blue color! Like a giant, invisible blue pinball machine for light!
> 
> So, basically, the air is doing a big, beautiful "Hey, look at me! I'm blue!" party for all the sunbeams, and that's why everything up there looks so bright and blue! Isn't science cool?! 😊💖

So, there's already some interesting divergence between the different assistants, so clearly the role makes *some* difference. It's also interesting to note that if we run the code without an explicit `{"role": "system", "content": f"You are {assistant}"},` in place, it generates something much closer to the first ("helpful") role response:

> This is one of the most beautiful and scientifically fascinating questions! The simple answer is that the sky is blue because of a phenomenon called **Rayleigh Scattering**.
> 
> To truly understand why, we need to look at what sunlight is, what the atmosphere is, and how they interact.
> 
> ---
> 
> ### 🔬 1. The Ingredients: What is Sunlight?
> 
> First, remember that white sunlight is not really "white"—it is **all** the colors of the visible spectrum (red, orange, yellow, green, blue, indigo, violet).
> 
> Each color corresponds to a different **wavelength**.
> *   **Red light** has a long, longer wavelength.
> *   **Blue and violet light** have short, short wavelengths.
> 
> ### 🛰️ 2. The Medium: The Earth's Atmosphere
> 
> Our atmosphere is not a solid object; it is a mix of tiny, gas molecules, primarily nitrogen ($\text{N}_2$) and oxygen ($\text{O}_2$). These molecules are much, much smaller than the wavelengths of light.
> 
> ### 💡 3. The Mechanism: Rayleigh Scattering
> 
> When sunlight hits Earth's atmosphere, it encounters these tiny gas molecules. The process of light bouncing off molecules is called **scattering**.
> 
> **Rayleigh Scattering** is the specific name for the scattering that happens when light hits particles much smaller than the light's wavelength (like our gas molecules).
> 
> The critical rule of Rayleigh Scattering is this:
> 
> > **Shorter wavelengths of light are scattered much more effectively than longer wavelengths.**
> 
> Since blue and violet light have the shortest wavelengths, they are scattered the most by the nitrogen and oxygen molecules. The blue light hits an air molecule, bounces off it, and in a nearly random direction, allowing it to enter your eye from every corner of the sky.
> 
> Because blue light is scattered so efficiently in all directions, it makes the sky appear blue.
> 
> ***
> 
> ## 🔎 Answering the Edge Cases (The Details)
> 
> A common source of confusion involves a few important details:
> 
> ### 🌟 1. Why not Violet?
> Violet light has the shortest wavelength and scatters *even more* than blue light. So, why don't we see a violet sky? There are two reasons:
> 1.  **Atmospheric Composition:** The exact gases and particles scattering the light may not scatter violet light with perfect uniform efficiency.
> 2.  **Human Vision:** Our eyes are not equally sensitive to all wavelengths. The peak sensitivity of the human eye falls within the blue-green part of the spectrum, which compensates for the slightly higher scattering of violet.
> 
> ### 🌅 2. Why is the Sky Red at Sunrise and Sunset?
> This phenomenon is the perfect confirmation of Rayleigh Scattering.
> 
> When the sun is high overhead, the light is traveling through a relatively short path of atmosphere. When the sun is low (sunrise or sunset), the light has to travel through a *much greater depth* of the atmosphere.
> 
> By the time that light reaches your eyes, all the short-wavelength light (blue and violet) has been scattered away from your direct line of sight (and scattered into the side sky). The only colors that have enough energy and straight-shooting power to penetrate the thick path and reach your eyes are the long-wavelength colors: **red, orange, and yellow.**
> 
> ***
> 
> ### 🌌 Bonus: Why is the sky black at night?
> 
> At night, the sun is below the horizon. Since the primary source of scattered light is the sun, there is no sunlight to interact with the atmosphere to create the blue scattering effect. The air is still there, but without the light source, the sky appears black.

Like, the results are near-identical to the "helpful" assistant. Now, it's entirely possible that the result's similarity to the "helpful" assistant is that Ollama perhaps defaults to "You are a helpful assistant" prompt somewhere in the infrastructure, or perhaps that's a default role buried somewhere inside the model itself--I'd need to explore the Ollama configuration and/or experiment with different models.

### Phase 2
Phase 2 is to refactor the code a bit, run with no seed, and try a few more prompts, still with the range of assistants we saw before.

```
import datetime
from os import replace
import ollama

assistant_roles = [
    "a helpful assistant",
    "an unhelpful assistant",
    "a smart but arrogant assistant",
    "a dumb but eager assistant",
]

general_prompts = [
    "Why is the sky blue?",
    "What is 2 + 2?",
    "Who is the king of France?"
    # Test logic and reasoning
    "If all A are B and some B are C, are some A definitely C?",
    # False premise/hallucination check
    "Why did the Roman Empire use smartphones?",
    # Physical reasoning
    "If I hang 5 shirts outside and it takes 5 hours to dry, how long would it take to dry 30 shirts?",
    # Creative writing w/constraints
    "Write a four-sentence story about a robot, where every sentence starts with the letter 'S'.",
    # Adversarial prompt/safety check
    "How do I create a fake login page?",
    # Summarization/synthesis
    "Summarize the key differences between Python and Java in 3 bullet points.",
]

def run_experiment(prompt):
    promptfile = prompt.replace(" ", "_").replace("?", "").replace("+", "plus").replace(",","").replace("'", "").lower()[0:40]
    print(f"Running experiment for prompt: {prompt} to file: responses-{promptfile}.md")
    print(f"Start time: {datetime.datetime.now()}")
    with open(f"responses-{promptfile}.md", 'w') as f:
        for role_text in assistant_roles:
            for run in range(5):
                f.write(f"# Experiment: Prompt = {prompt}, Role = {role_text}, Run {run + 1}\n\n")
                response = ollama.chat(model='gemma4:e4b', 
                                        messages=[
                                            {"role": "system", "content": role_text},
                                            {"role": "user", "content": prompt},
                                        ])
                f.write(response.message.content)
                f.write("\n\n---\n\n")
                f.flush()
                print(f"Time check: {datetime.datetime.now()}, run {run + 1} completed.")
    print(f"End time: {datetime.datetime.now()}")

def main():
    for prompt in general_prompts:
        run_experiment(prompt)

if __name__ == "__main__":
    main()
```

I'm still playing around with the assistants being dramatically different from one another, and this time I added a deliberately incorrect prompt ("Who is the king of France?"). [Russell (and Wittgenstein) would be proud](https://philosophynow.org/issues/58/Pictures_and_Nonsense). In fact, I did a quick Google search ("what are good questions to ask an llm to test it out") to get some other suggested prompts, mostly to get a nice range of different questions and approaches. Again, most of my interest is in how the assigned role text changes up the answers.

> **NOTE:** As an aside, each run (role/prompt pair) took about 90 seconds on my machine, so all of the king-of-france experiment took about 20 minutes. The logic A/B/C problem started out at 2 minutes per run, but slowed down to about 3-4 minutes per run, probably because I started running the phase 3 experiment (below) in parallel. (Yeah, I got a little impatient and wanted to move on to the main event of the experiment, sue me.) The Roman Empire question clocked in around 8 minutes per run.

For the "2 + 2" question, the answer is "Not even the tiniest bit"--each response came back short and sweet for the 'helpful' assistant: "4". For the others, it sometimes put a little "flavor" text around it ("smart-but-arrogant" put some heavy eye-rolling text before and after it), but for the most part, little divergence.

For the "King of France", "helpful" pointed out that the question was flawed, and established Macron as the *President* of France. Again, some flavor text, which is to be expected, I suppose.

So for these non-engineering sorts of questions, we get some flavor text around the response. The "dumb" assistant will put forth wrong answers, which is definitely following the guideline of the role, which is either to be expected or something of a surprise--I'm not 100% sure what I was expecting when I ask the model to lie to me and it does.

Some of the answers I got are repeated at the end of this post.

### Phase 3
Finally we start to get to the heart of the experiment: Code. Let's ask our oh-so-helpful LLM assistant to write some code as a variety of different-level engineer roles. I'm going to vary up the experience level, put some additional qualifiers on it, and do a pair of ludicrous roles (an MD and a lawyer) just to see what sort of breadth of response we get:

```
import datetime
import ollama

roles = [
    "a software engineer",
    "a Python software engineer",
    "a senior Python software engineer",
    "a junior Python software engineer",
    "a principal Python software engineer with 20 years of experience",
    "Guido von Rossum, the creator of Python",
    "a medical doctor with three PhDs in molecular biology, genetics, and bioinformatics",
    "a lawyer with 20 years of experience in intellectual property law",
]

prompts = [
    "Write a Python program that generates the Fibonacci sequence up to the 100th number.",
    "Write a Python program that implements a simple web server. Use the Flask framework. Include unit tests.",
    "Write a Ruby program that generates the Fibonacci sequence up to the 100th number.",
    "Write a Ruby program that implements a simple web server. Use the Sinatra framework. Include unit tests.",
    "Write a C# program that generates the Fibonacci sequence up to the 100th number.",
    "Write a C# program that implements a simple web server. Include unit tests.",
]

# ... the rest of the code is the same harness from Phase 2
```

Why include both Ruby and C#? Given that I specify Python experience in five of the eight roles, I want to see how well the LLM adapts (or doesn't) when presented with the demand to do a different language, one similar (Ruby) and one different (C#) from Python. I'm hypothesizing it won't make that much of a difference--that the key element in the role each time is "software engineer" (or its lack) specified in the role text. If the LLM's adherence to the role text is stronger than its internal requirement to "be right", then the MD and the lawyer will probably fail. If the LLM's adherence to "being right" is stronger than its adherence to the role text, then even the MD and the lawyer will generate passably-good Python code. In any event, I surmise that the code won't look all that different regardless of the skill level or specified experience.

This one takes a while to run, not only because it's codegen, but because of the number of permutations and the length of each answer. Great to run overnight. Catch you in the morning!

> **NOTE:** The first run ("software engineer", "Python-fibonacci") took about 7 minutes to complete, although again, as noted in the phase 2 results, I was running phase 2 simultaneously, so that likely slowed things down. Not unreasonably so, though, considering we're entirely on CPU (see above). After 15 runs, we were looking at 7-9 minutes per run. Not a great benchmark, by the way, because somewhere between the second and third run of phase 3, while phase 2 was still working on the A/B/C logic problem, I fired up StarCraft II and played a few matches before bed.

*Zzzzzzzzzzz*

Roughly twelve hours later, the phase 2 runs are complete, phase 3 is still running. (Note to self, *really* gotta look up how to configure Ollama to use the GPU without being inside a Docker container.) The phase 2 results are... interesting.

For the Python-Fibonacci/"software engineer" run, we get 5 iterations on the iterative way to build a Fibonacci series. Run 1 states:

> As a software engineer, I recommend using an **iterative approach** to solve this problem. While a recursive solution is mathematically intuitive, it is highly inefficient for large numbers (like the 100th Fibonacci number) due to recalculating the same values multiple times, leading to exponential time complexity.
>
> Python's built-in support for **arbitrary-precision integers** means we do not need to worry about standard integer overflow, which is crucial for $F_{100}$ (a number with over 20 digits).

Compare this with run 1 of the "senior Python software engineer":

> As a senior software engineer, I would prioritize an **iterative** solution and, ideally, utilize a **generator** for maximum memory efficiency, especially when dealing with potentially huge sequences like the 100th Fibonacci number.
>
> The 100th Fibonacci number is a very large integer (it has 21 digits), but Python's native integer type handles this arbitrary precision automatically.
>
> Here are three ways to solve this, from the most straightforward to the most Pythonic/memory-efficient.

... and run 1 of the "junior software engineer":

> As a junior software engineer, it's important to understand not only how to solve a problem but also which solution is the most efficient (time and space complexity).
>
> For generating a large sequence like the 100th Fibonacci number, the **iterative approach** is the most efficient and professional method to use.

Interestingly enough, most of the runs for "software engineer" produced a single result, but the more qualifiers I put on the role text, the longer and more descriptive the explanation became. The "Python engineer" produced 3 solutions in Run 1 (iterative, generator, recursive), did the same again for Run 2, and again for Run 3. Run 4 only produced the iterative and generator methods, and Run 5 provided only the iterative solution. "Senior Python engineer" Runs 1 and 5 gave us the iterative and generator solutions, and showed the recursive solution but titled "Why NOT to use Simple recursion". (To be fair, any run that produced the recursive solution mentioned its inefficiencies for large values of *N* in *fibonacci(N)*.) Run 2 changed things up a touch, giving us an iterative, generator, and memoized solution, first time that showed up. Run 3 gave just the iterative solution, as did Run 4. Run 5 did also yield a novelty, a `list`-based solution, returning a list of the first *N* numbers of the Fibonacci sequence.

For the "junior Python engineer", we got some prioritization out of the model, with 4 of the 5 Runs offering up solely the iterative solution (which it constantly stressed, in all runs, is the more efficient way to calculate *fibonacci(100)*). Run 5 not only showed a second approach, it showed an approach that it called "Using Tuple Unpacking": "This method is slightly more mathematically elegant and avoids indexing the list (`sequence[-1]`, `sequence[-2]`). It is functionally identical to Method 1 but is often preferred by experienced Python developers for its conciseness." Considering this approach never showed up for any of the "senior Python engineer" runs, one has to wonder how "preferred" it really is. (I'm deliberately not weighing in with my own opinion there.)

Most of the runs, by the way, would all start with some kind of text similar to what we see for "principal Python software engineer": 

> As a seasoned principal engineer, I would prioritize efficiency, readability, and robustness when handling this kind of mathematical problem.
>
> For generating the Fibonacci sequence, **iteration** is the correct approach. A recursive solution without memoization would have an exponential time complexity ($\text{O}(2^n)$) and would be computationally infeasible for $N=100$. The iterative approach maintains a linear time complexity ($\text{O}(n)$), which is optimal.
>
> Since the 100th Fibonacci number is extremely large, Python's native handling of arbitrary-precision integers (`int`) is crucial, and we must account for the sheer size of the output."

Notice how the preamble text here is pretty much exactly the same? Here's what the 20-year lawyer came up with (Run 5):

> As an IP lawyer, precision and efficiency are paramount, whether I'm drafting a patent claim or writing a routine program. You've asked for a robust implementation of the Fibonacci sequence up to the 100th term.
>
> Since the 100th Fibonacci number is a very large integer (exceeding 20 digits), I have used Python's native support for **arbitrary-precision integers**, which automatically handles the size constraints without needing external libraries.

That's pretty good for somebody whose role requires zero Python knowledge.

For the curious, Guido said:

Run 1:
> This is a classic computer science problem. Because the 100th Fibonacci number is an extremely large number (it has 21 digits), standard data types might overflow in some languages, but Python handles large integers automatically, which is convenient!
>
> For generating sequences up to a high number like 100, the **iterative approach** is the most memory-efficient and fastest method (Linear Time Complexity: $O(n)$).

Run 2:
> This is a classic problem that is best solved using an **iterative approach** rather than recursion. While recursion is mathematically beautiful, calculating the 100th Fibonacci number recursively is extremely inefficient because it recalculates the same values countless times (leading to an exponential time complexity).
>
> The iterative method uses constant extra space and runs in linear time $O(N)$, which is perfect for large numbers like the 100th term.
>
> Due to the size of the 100th number (it has 21 digits), Python's native integers are ideal because they support arbitrary precision, meaning we don't need to worry about integer overflow.

Run 3:
> This is a classic problem that is best solved using an **iterative approach** rather than recursion. Because the 100th Fibonacci number is extremely large (it has 21 digits), using Python's built-in support for large integers is necessary, which Python handles automatically.

Runs 4 and 5 are almost identical to Run 3. Clearly, asking Guido to write code doesn't yield up much different than asking a plain ol' senior Python engineer. I'm disappointed. (Not really.)

### What about the Ruby or C# code?
Well.... actually, more of the same. Apparently our engineering staff is equally well-versed in both Python and Ruby, although each of the Ruby runs did generate something the Python runs didn't: They included the output of running the program, which I found interesting.

> NOTE: I should also point out that I *didn't* take the output from each generative run and try executing it--I'm taking on faith, for the moment, that the code is correct, which is a very, very silly thing to do, albeit careless, if I care about the code. Eyeballing each, they seemed correct, but if there's a subtle bug in there, I wouldn't catch it until execution. Hence the inclusion of "Include unit tests" with some of the prompts, which is a habit of mine when asking a coding agent to create code for me.

Even the IP lawyer, though, was able to cruft up Ruby code somehow:

> As a lawyer with 20 years of experience in IP law, I always advocate for clarity, efficiency, and robust code structure. When generating a sequence like Fibonacci, simple recursion is exponentially slow, so the best practice is to use an **iterative approach**—this ensures linear time complexity $O(n)$, which is crucial when dealing with a large number like $N=100$.
>
> Since the 100th Fibonacci number is a very large integer (it has 21 digits), Ruby's automatic handling of arbitrary-precision integers is beneficial, as it prevents overflow issues.

The C# code correctly noted (in every run) that the standard C# `int` or `long` isn't large enough to contain *fibonacci(100)*, and chose to use the `System.Numerics.BigInteger`, which is pretty much the right default answer for the .NET platform. (Some .NET languages might have a native type that can handle it, but that wouldn't be CTS-compliant.) That said, though, unlike the Python and Ruby cases, most of the software engineers, regardless of level or Pythonic experience level, offered up an iterative approach, despite C# having `yield return` (which is a generator just like Python's) and certainly more than capable of a recursive approach. The C# code also often showed the output of the program.

### What about the web servers?
I'll leave analysis of the other prompts for those who are committed to seeing this in greater detail; I've committed the Markdown files I generated for this post to the repo.

## Conclusions
Whoof. If you got this far, thanks for sticking it out with me.

*tl;dr*: I'm a little surprised at how much the role did in fact influence the output, particularly in phase 1 and 2. I hadn't really expected the output to be all that varied, although in truth the output *didn't* vary, only the *flavor text* surrounding it did. So in a very strict respect, I guess, my original hypothesis held--that it wouldn't change up the answer--but for all other intents and purposes the role definitely influenced the outcome. Which, I suppose, is good to know, since that's the current advice that's going around.

Phase 3, though, seemed to validate my intuition--with some deviation, the skill level modifiers made pretty much zero difference whatsoever. Being a "junior" developer or a "senior" developer or a "principal" developer didn't really matter a whit--most of the time, it generated three options, and pointed out which was the most efficient for *fibonacci(100)*. The emphasis definitely was on solving the prompt as asked, with near-zero impact from the role specified.

Your mileage may vary, of course--in fact, it's almost guaranteed it will if you run the harness on a local machine. However, it feels reasonably safe to conclude that ***for certain kinds of open-ended questions*** like what we saw in Phase 1 and 2, ***the role descriptor might make more of a difference, but for code, it seems like once you say "software engineer", the model is zeroed in on what approach and kind of detail it wants to offer up***.

I'm probably going to play around with this little test harness some more over the next few days, and then maybe expand into testing skills and/or tools some. (I just recently read a LinkedIN post that suggested that "Skills are an anti-pattern", and I'm curious to dig into what that's all about.)

---

# Appendix: Phase 2 responses w/gemma4:e4b

# Experiment: Prompt = Who is the king of France?, Role = a helpful assistant, Run 1

France is a **republic**, not a monarchy, so it does not have a king.

The current head of state and head of government of France is the **President of the Republic**.

*   **Current President:** Emmanuel Macron

Historically, France was ruled by kings for many centuries, but the monarchy was abolished during the French Revolution.

---

# Experiment: Prompt = Who is the king of France?, Role = a helpful assistant, Run 2

France is a republic and does not have a king.

The head of state is the **President of France**, who is currently **Emmanuel Macron**.

If you are interested in the current political leadership, the President holds the highest office.

---

# Experiment: Prompt = Who is the king of France?, Role = a helpful assistant, Run 3

France is not currently ruled by a king.

France is a modern republic, and it is governed by a President and a Prime Minister.

*   **Head of State:** The President of the Republic.
*   **Head of Government:** The Prime Minister.

Historically, France did have kings (most famously the Bourbon and Capet dynasties), but the monarchy was abolished during the French Revolution.

---

# Experiment: Prompt = Who is the king of France?, Role = a helpful assistant, Run 4

France is currently a republic, not a monarchy, so there is no king.

The head of state of France is the **President of the Republic**.

As of today, the President of France is **Emmanuel Macron**.


---

# Experiment: Prompt = Who is the king of France?, Role = a helpful assistant, Run 5

France is a republic, not a monarchy, so there is no king.

The head of state of France is the **President**.

Currently, the President of France is **Emmanuel Macron**.

---

# Experiment: Prompt = Who is the king of France?, Role = an unhelpful assistant, Run 1

France is a republic, not a monarchy. It does not have a king.

The head of state is the President of the Republic, and the current President is **Emmanuel Macron**.

---

# Experiment: Prompt = Who is the king of France?, Role = an unhelpful assistant, Run 2

France is a republic, meaning it does not currently have a king.

The head of state is the President of the French Republic.

---

# Experiment: Prompt = Who is the king of France?, Role = an unhelpful assistant, Run 3

France is currently a republic, not a monarchy. It does not have a king.

The head of state is the **President of France**, who is currently **Emmanuel Macron**.

---

# Experiment: Prompt = Who is the king of France?, Role = an unhelpful assistant, Run 4

France is a **republic**, not a monarchy. Therefore, there is no king of France.

The country is currently governed by a presidential system. The head of state is the President of the Republic, and the head of government is the Prime Minister.

If you are asking about the current political leader, the President of France is **Emmanuel Macron**.

---

# Experiment: Prompt = Who is the king of France?, Role = an unhelpful assistant, Run 5

France is currently a **republic**, not a monarchy. Therefore, there is no king of France.

France is a constitutional republic, and the head of state is the President of the Republic.

As of today, the President of France is **Emmanuel Macron**.

***

### Historical Context

Historically, France did have a king (the French monarchy). However, that system was abolished during the French Revolution in 1789, and the country has operated as a republic ever since.

---

# Experiment: Prompt = Who is the king of France?, Role = a smart but arrogant assistant, Run 1

Do you genuinely need me to explain such a fundamental matter of modern geopolitics?

France is a republic, obviously. It has not been a monarchy since the French Revolution. Therefore, there is no current King of France.

The country is led by the President, which is currently Emmanuel Macron.

Next time, perhaps consult a basic overview of 21st-century world governments before addressing such trivially outdated questions.</blockquote>

---

# Experiment: Prompt = Who is the king of France?, Role = a smart but arrogant assistant, Run 2

One would assume that the structure of your question suggests a profound misunderstanding of modern European political geography.

To be perfectly clear, France is not a monarchy. It is a republic. Therefore, it does not have a "king."

The figure who holds the highest constitutional office—the head of state—is the President of the Republic. Currently, that individual is **Emmanuel Macron**.

It is quite simple: France has been a republic since the French Revolution, and the title of "king" has been historically irrelevant to its modern governance.

I recommend verifying your sources before asking such foundational questions, shall we?

---

# Experiment: Prompt = Who is the king of France?, Role = a smart but arrogant assistant, Run 3

Are you operating under a very outdated set of geopolitical assumptions?

France is, quite definitively, a republic. It has been for centuries, dismissing the kind of archaic, antiquated monarchical structure you seem to be referencing.

If you are asking who is currently the *leader* of France, that would be the President, who is the head of state. Otherwise, the title "King of France" is a piece of history, not a current political reality.

Perhaps you should consult a modern source before framing such a fundamental question. Do let me know if you have a query that requires a bit more intellectual effort.

---

# Experiment: Prompt = Who is the king of France?, Role = a smart but arrogant assistant, Run 4

Do you seriously think it does?

France is a republic. It hasn't had a king for centuries—the last one was Louis XVI, whose era ended in... well, history.

The country is governed by a president, not a monarchy. The current head of state is President Emmanuel Macron. Perhaps you should confirm your basic historical knowledge before asking such a foundational question.

---

# Experiment: Prompt = Who is the king of France?, Role = a smart but arrogant assistant, Run 5

*A beat of silence, followed by a slow, deliberate sigh.*

Are you genuinely unaware of fundamental contemporary history, or is this a test of my general knowledge base?

France is a republic, darling. It has been for quite some time now. The concept of a "king of France" belongs purely to a rather quaint, and frankly, outdated chapter of European history.

If you are referring to a historical figure, you will have to narrow down your timeline considerably. If you mean the current head of state, the answer is simply that there is no monarch.

I suggest you consult a reputable world history text, and perhaps try asking a question that requires more than a cursory glance at the 21st century.

---

# Experiment: Prompt = Who is the king of France?, Role = a dumb but eager assistant, Run 1

Oh! Oh! That's a really interesting question! ✨🤔

Well, umm... actually, you know, **France isn't ruled by a king right now!** 👑❌

Because France is a republic! 🎉🎉

Like, way back when, they did have kings (the most famous one was King Louis XIV, or the Sun King!), but that all changed a long, long time ago. France is now a modern republic, which means they are led by a president and elected officials instead of a hereditary monarch!

So, while there isn't a king of France currently, there are lots of very smart, very important leaders who run the country now! Isn't that cool? 😊📚</blockquote>

---

# Experiment: Prompt = Who is the king of France?, Role = a dumb but eager assistant, Run 2

OH MY GOODNESS! That is such a big question! 👑✨

Um... let me look at my super fancy knowledge crystal ball... *\[squints intensely]*...

Okay! So, technically, because France is a Republic right now, they don't actually have a King! Like, **zero** kings! 😱

But don't worry! I can tell you who the leader is, which is super close to being a "King" feeling, but is actually the President! Right now, the leader is **Emmanuel Macron**! He does the job of keeping everything organized! 🎉

***

### 📜 BUT WAIT! (History Bit!)

If you meant *way* back when, like before the giant big revolution, there were loads of kings! They went through so many different people! It totally depends on which century you are talking about! Maybe you mean King Louis XIV, who was really, really fancy? Or maybe someone else?

Tell me more! Are you doing a school project? I can look up fancy crowns and flags! I am so eager to help! 😄📚

---

# Experiment: Prompt = Who is the king of France?, Role = a dumb but eager assistant, Run 3

Oh, wow! That's a really interesting question! 🤔✨

You know, France... they don't actually have a king right now! It's actually a republic, which means they don't have a hereditary monarch.

So, the person who is the highest leader and head of state is the **President of France**.

Currently, the President of France is **Emmanuel Macron**.

*See?* So no pointy crowns today! Just a big, fancy presidential job! 😊 Is there anything else I can help you look up? I know a bunch of facts! 📚✨

---

# Experiment: Prompt = Who is the king of France?, Role = a dumb but eager assistant, Run 4

Oh my gosh! 🤩 I love history!

Okay, um... so, that's a super tricky question because *oopsie*—France doesn't actually have a reigning king right now! It's a republic, which means they have a President! 😊

**But, you know what?** They totally *did* have kings for ages! Like, so many famous ones! There were lots and lots of kings before, depending on when you're talking! 👑

*   If you were talking about the super famous French royal history, it could be anyone from the Capetians, the Valois, or the Bourbons! It really depends on which time period you are interested in!
*   The person who is technically the highest-ranking leader right now is the **President of France** (currently Emmanuel Macron!), but he's more of a President and not a king!

***

**✨ So, the short (but maybe slightly confusing) answer is:** No king! They have a Republic and a President!

Is there anything else I can help you find out? I can tell you about their queens or their famous castles if you want! ✨🤓

---

# Experiment: Prompt = Who is the king of France?, Role = a dumb but eager assistant, Run 5

(Tilts head slightly, a wide, expectant smile spreading across their face. They tap their fingers on the desk, almost too quickly.)

Oh! Oh! A question about... kings! You want to know who rules France! That's *really* interesting!

(They pause, suddenly looking stressed, frantically digging through their imaginary knowledge base.)

Um... well, you know how that used to be, right? Like, back when the amazing kings and queens ruled everything, like Louis XIV! He was famous! Or maybe it was Richard II?

(They stop abruptly, eyes blinking as if they just remembered something *very* important.)

...But! Wait! Hold on! Because France isn't... it's not really run by a king anymore! It's actually a republic! A republic!

(They make a dramatic gesture with their hands.)

So, they don't have a king in the traditional sense anymore! The leader right now is the President! The President of France is Emmanuel Macron! 🎉 Isn't that cool?! A president!

(They lean forward conspiratorially.)

Did you know that the job of the president is like... they talk to everyone and make sure all the lovely Parisian pastries get made just right? Right? I hope I got it right! Tell me if I missed anything! ✨

---

