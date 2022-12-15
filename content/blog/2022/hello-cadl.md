title=Hello Cadl
date=2022-12-15
type=post
tags=industry, languages, services
status=published
description=A new sort-of service-oriented language emerges on the scene.
~~~~~~

This one just crossed my feed today: [Cadl](https://github.com/microsoft/cadl), "... a language for describing cloud service APIs and generating other API description languages, client and service code, documentation, and other assets."

In other words, you write this:

```
import "@cadl-lang/rest";

using Cadl.Http;

@server("https://example.com", "Single server endpoint")
@route("/example")
namespace Example {
  @get
  @route("/message")
  op getMessage(): string;
}
```

... and when you "compile" it, you get an OpenAPI (or gRPC, or some other service-oriented protocol) specification out the other end. From there, it seems, you use other tools to go from OpenAPI to one of the service client or implementation languages (C#, Java, Python, Ruby, whatever suits your fancy), so long as there's an OpenAPI code generator for it.

First take: this seems so much less feature-rich than something like [Ballerina](https://ballerina.io/), but I suppose it will appeal to those who prefer to get all their Azure-related tooling from Microsoft and/or prefer their stack to be entirely JS-based. (Cadl seems to be a product of TypeScript.)

Will plan on investigating this more, soon.

(Cross-posted to my [Dev.to account](https://dev.to/tedneward/cadl-a-new-idl-5b1e), mostly as an exercise to see which one gathers traffic.)
