---
layout: post
comments: true
title:  "The Beauty (And Beast) Of Code Generation"
date:   2016-04-06 06:22:46 -0600
categories: software tools
tags: [tools,software]
---


Lately, I’ve spent a lot of time using Yeoman for generating AngularJS and MEAN applications. I’ve had a love/hate relationship with code generators for a long time, but have never really been able to articulate exactly why, so I thought I’d take a minute to write it out.

<!-- more -->

The Benefits
The benefits are easy to explain. They are the reason we use generators in the first place. They save us time. They keep developers from having simple, monotonous, plumbing code.

The prospect of writing plumbing code is enough to make and respectable developers skin crawl. We’ve written it a couple of times, and we start thinking about why we’re doing it again. Not to mention the fact that we really want to get to the interesting business problems; the problems that make the project we’re currently working on interesting. The sooner we get the basic plumbing of the app written, the sooner we can get back to those interesting problems.

I also have been using Yeoman generators to learn more about how people are writing AngularJS and MEAN-stack applications. I generate the base application and then read the code. I look at how they configure the app, how they wire things together and how they accomplish things that feel difficult to me. This is another great use of generators and something I recommend to lots of folks I come across who want to learn more about building Angular or MEAN-stack applications.

The Drawbacks
The drawbacks come in two causes: ignorance and regeneration.

There are quite a few developers that generate code without any idea what the code does or whether the code does it well. This leaves behind code that may be inefficient, possibly poor performing and sometimes almost unmaintainable. Also, since the developer that generated the code doesn’t know how it works, it can be quite impossible for them to modify it for specific business rules.

The other problem is that some code generators generate code that is meant to be regenerated. These are usually ones based off of a database schema. When the schema changes, the developer is meant to regenerate the code for the new schema. This is okay, but once the schema gets large or complicated, regeneration can be tricky. If a certain set of expectations aren’t met (incorrectly assigned keys, relationships, etc.), regeneration can yield unexpected code. Code that doesn’t work or works in unexpected (and unintended) ways, leaving the developer to either dig through the generated code or dig through the generators documentation to figure out what she did wrong in the schema to make the generators generate this unexpected code.

The Conclusion
Generation is good, but only if you understand what’s being generator (or are generating so you CAN understand it). Regeneration is bad, or at least iffy.

I tend to stick to generators for one of two reasons: to generate code to read and learn, or to generate code as a “jumping off” point. I fully intend to start modifying the generated code for my specific use case as soon as I am done generating it. This also make regeneration an unattractive option as it would overwrite my changes.

Happy coding!