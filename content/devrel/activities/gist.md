title=Gist
date=2023-02-28
type=page
tags=devrel, patterns
status=published
description=The Gist DevRel activity pattern.
~~~~~~
*Code*

Smaller than a sample/example, designed to demonstrate a very specific snippet of code, such as a single method, part of a class, or short REPL session. Often entirely in conjunction with other artifacts.

***Also Known As***:

***Problem***: Somebody has asked you or your team a question about your product/service, perhaps in a [Forum](forums.html) or on [Social Media](social-media.html), and the answer requires a degree of detail that casual spoken/written language cannot adequately capture. However, you want to answer the question quickly, and with a minimum of overhead.

***Context***: Writing a full [Sample/Example](sample-example.html) is overkill, because the answer can be captured in just a few (less than four) lines of code in a very standalone manner. It would take longer to re-frame the question (in a [Blog Post](blog-post.html), for example) than to just post the answer. However, many [Forums](forums.html) and [Social Media](social-media.html) systems do not respect "code" formatting well, and posting code directly into the answer can turn into an unformatted, jumbled mess.

Additionally, sometimes the question appears multiple times from different posters at different times, and it would be convenient to have the answer in a form that is easily shared across answers.

***Solution***: Post the code as a standalone snippet as a [GitHub Gist](https://gist.github.com/) attached to the company's or team's GitHub organization. Link the URL from the [Forum](forums.html) or [Social Media](social-media.html). The URL can be reused for additional answers, and as a collection of gists are built up, they can be browsed by others, either because they are seeing additional answers through similar answers, or by viewing the collection of gists on GitHub. Gists can also be subscribed to, like projects on GitHub can.

Note that several tools (like Visual Studio Code or the JetBrains suite of tools) have extensions or plugins that know how to work directly with the Gist API, making it easier to create and share them.

***Consequences***: Gists are full GitHub repos, and can "grow" from single files to whole collections of files organized in particular ways (projects, solutions, etc). Linking to the gist may lose its efficacy if following the link doesn't make clear what is being referenced; once a gist grows large enough, it may serve better as a more formal [Sample/Example](sample-example.html). Large collections of gists might be better off collecting under [a "Kitchen Sink" reference application or gallery](sample-example.html), for easier consistent configuration and/or display, and then referenced individually as files on GitHub.

Because gists don't have descriptive names, hyperlinks will be somewhat obscure, and therefore harder to spot accidental typos and/or accidental mis-linking (linking to the wrong gist).

Gists may not be top-of-mind when new updates and releases to your product/service come out, so set a reminder periodically to update a gist or mark it is obsolete. Be reluctant to delete the gist entirely unless you are able to find all the places where the gist is referenced on the Internet (unlikely), as "link rot" could lead customers or prospective customers to conclude that your support system or community is less strong than it actually is. (One broken link won't turn anyone away, but if numerous gist-links are 404s, people will start to wonder.)

***Variants***:
