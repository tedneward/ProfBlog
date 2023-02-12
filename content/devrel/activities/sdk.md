title=SDK
date=2023-02-28
type=page
tags=devrel, patterns
status=published
description=The SDK DevRel activity pattern.
~~~~~~
*Code*

Library of code intended to be used "as-is" as either the sole means or a helpful abstraction (layer on top of HTTP APIs) when using the company's software.

***Also Known As***:

***Problem***: Your product/service is an API, using HTTP as its primary form of communication with customer code, but like all HTTP APIs, it is loosely-typed and can accept a wide range of values for each HTTP request, many of which will yield errors or incorrect results. Getting the requests correct is often an exercise in frustration and time as developers struggle to ensure they are passing the right data in the right places.

***Context***: Developers, particularly those working with statically-typed languages (Java, C#, Kotlin, Swift, and so on), are accustomed to using tools that generate errors at compile-time, rather than waiting until runtime to discover that things aren't working. Additionally, it takes time and multiple lines of code to marshal the parameters into something HTTP can transport, and then to unmarshal the response back into the native data types of the language, including handling any errors indicated by the return value. If the API is called frequently throughout the customer's code, this all representa additional code that customers must debug and maintain for the length of the project.

Additionally, when exploring a new product/service, developers experimenting with the product/service want (dare say need) the quickest way to get started with the product/service, in order to be able to ascertain if it is of use or how to use it.

Because of its loosely-coupled nature, working with HTTP from code requires more attention to detail than using native constructs (classes, functions, modules, whatever the language uses as first-class citizens), adding to the learning overhead.

***Solution***: Even though the API (HTTP-based or otherwise) technically is accessible from any language that speaks HTTP (which is to say, all of them), provide an SDK that encapsulates the details of making those HTTP calls into something that is language- or platform-friendly.

***Consequences***: This SDK can be open-sourced, adding to the company's open-source profile, which for some companies will also be a gentle introduction to doing more open-source work in general. This also provides the company an opportunity to explore how to use open-source development practices more fully without taking undue risk with the code or processes around the product/service.

***Variants***:
