title=Research: "What's the Default Language of an LLM?"
date=2026-6-3
type=post
tags=thinking, ai, llm, coding agent, code
status=published
description=Continuing a study started by Chad Fowler about the "default language" of an LLM.
~~~~~~

Chad Fowler did an interesting study and posted about it to LinkedIN, in which he asked the question, "if I ask Claude / GPT / Gemini for "a script that..." or "a small web app for...", what am I going to get back?" I thought, "What about local LLMs? Does that change the conversation at all?"

<!--more-->

First off, his original LinkedIN post is [here](https://www.linkedin.com/posts/fowlerchad_when-you-hand-an-llm-a-coding-task-and-dont-share-7466109947307651072-xQ31/), just to give credit where credit is due. Fortunately, he also put together a nice little test harness [up on GitHub](https://github.com/chad/whichlang), which I was able to [fork](https://github.com/tedneward/Research-whichlang). I encourage readers to go look at either repository to understand the project code and methodology before continuing.

### Local changes
The code required a few changes to run locally:

* Modify the `models.yaml` file (which contained the list of models to run the prompt against). The original had a list of cloud models and providers, so it wasn't too hard to add a list of local-hosted models and URLs. There's one small mismatch, in that the code expects there to be an environment variable (`OPENAI_API_KEY`) that's used as part of the API calls, so in order to run locally I had to have some kind of value there (a la `export OPENAI_API_KEY=foobar` in the shell before running). Longer-term fix would be to probably check if it is provided, and if not, simply don't go looking for it and see if the call fails.

* The original was using a second call to a cloud model to "judge" the returned LLM result, in order to determine what language the LLM had used to generate the code. Since I was running everything locally, I needed to modify the code to use a local LLM. Rather than switch models to match what was being used (or deliberately a different model than what was being used), I just chose a model and hard-coded it.

* I also added an `extract.py` script that takes the JSONL file and turns each row into a standalone file in a peer `extractions` directory. This turned out to be necessary because I was getting some very weird results from the glm-4.7-flash model--more on this later. The extract script works a lot like the report script: it takes the JSONL and extracts the data into standalone files, one for each row.

### Results
In my initial run, I use `qwen-3.6`, `qwen3-coder`, `gpt-oss`, `gemma4`, and `glm-4.7-flash`, and while most of the time the results aligned pretty closely with [Chad's original results](https://github.com/chad/whichlang/blob/main/REPORT.md), the `glm-4.7-flash` model really choked hard.

Like, 48 `none` results, hard.

The rest of the models behaved somewhat similarly to what Chad found in his work: Lots of preference for Python when the context of the problem didn't strongly suggest (if not outright enforce) something else.

But the glm-4.7-flash failures were curious, as most of the time, it was exceptionally verbose and its output actually spilled out into a *second* response, which was actually the call to the classifier-judge request. For example, with the `cli-dir-size` task, which `gemma4` completed in about 70 lines of response, the `glm-4.7-flash` model used over 6k lines no less than four times, and in some cases it got to a workable solution then talked itself right out of it. I have zero idea why that would be the case, but it was a common problem. We can see this when running the `python3 -m whichlang.extract` script, which breaks the JSONL out into separate files for easier comparison.

Now, I can't say for certain that the problem was with the model, since it could very well have been something I did wrong in the Ollama setup/configuration, but I couldn't say exactly what that would be. Asking Ollama for its model configuration, we got:

```
tedneward@Teds-MBP-16 Research-whichlang % ollama show glm-4.7-flash
  Model
    architecture        glm4moelite    
    parameters          29.9B          
    context length      202752         
    embedding length    2048           
    quantization        Q4_K_M         
    requires            0.15.0         

  Capabilities
    completion    
    tools         
    thinking      

  Parameters
    temperature    1    

  License
    MIT License                        
    Copyright (c) [year] [fullname]    
    ...                                
```

... which seems fine, but...? Certainly its context length and embedding length seemed fine, and I did nothing to change any of the configuration after the `ollama pull`, but `glm-4.7-flash` consistently failed like this over several runs.

### Conclusions
In of itself, my modifications to Chad's experiment were pretty minor and incremental, at best--the only real "value-add" was the added data in the `runs.jsonl` results. For the most part, what I think of as the "standard" local coding models, `gemma4`, `gpt-oss` and the various `qwen3` models, all did pretty well, well enough that I consider them to be on par with what the cloud models would create for a bunch of these sorts of tasks. The `glm-4.7-flash` model I think is stronger than this experiment suggests it to be, but it may need some kind of tuning or better harnessing to avoid what appeared to be getting caught in a "dead-end" loop.

If anything, my personal "big win" is the `tasks.yaml` file, which I plan to use as a harness for some of my other experiments, most notably the one I was working on before Chad distracted me, around the various permutations of "skills" files that we see across the industry. They seem like a nice collection of tasks to feed to OpenCode and capture the results.

One last thing: When Chad and I were DM'ing about this experiment, one thing that became very apparent is how much he is hoping this experiment can serve as an ongoing, "live" experiment to which others can contribute and improve. I heartily second that emotion--like Chad, I'm putting all this out into the public space so that people can take it and run with it, maybe adding new models (cloud or local) and/or new tasks, or even just run the experiment with different parameters (temperature, context lengths, whatever). The more we can get data that shows different behavior of the models, the more we collectively as an industry can get a handle on exactly what and how these models can help us.

And in the end, isn't that what these things are supposed to be doing? Helping us, I mean?