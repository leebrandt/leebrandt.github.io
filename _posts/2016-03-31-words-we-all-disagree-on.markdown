---
layout: post
comments: true
title:  "Words We All Disagree On"
date:   2016-03-30 06:22:46 -0600
categories: vocabulary software
---

The Problem
===
Every so often (more often in IT, it seems) someone comes up with a new idea or technology that needs a name to describe it. We, as technology professionals, kind of suck at this. They say, the three biggest problems in IT are naming and off-by-one errors.

There are some technologies (some that have been around for awhile) that seem to cause the most disagreement in the IT space, and beyond. These are a few of them, and what I think they are.

<!-- more -->

Big Data
===
CIOs read articles in magazines about why their company should be interested in Big Data and they tell their managers that they should be looking at ways for the company to take advantage of it. The fact is, they probably shouldn’t be worried about it.

Big Data is all about getting huge amounts of data from disparate sources, where the schemas may be different and have different levels data cleanliness, and being able to get information from that data. That’s pretty much it.

For instance, if you get data from doctors all over the world, who use different software to track their patients, diagnoses, treatments and outcomes, and you want to be able to munge that data together and try and figure out which treatments work best for which diseases within certain age/ethnic/gender groups; that’s a Big Data problem. If you’ve got a bajillion customer records and you want to see who’s buying your late hot product, that’s not. That is just a query on your customer records, maybe a report. If you want lots of different kinds of information about your customers, that’s still not a Big Data issue, it’s probably a data warehouse problem.

Therein lies the problem, I think. People mistake Data Warehousing and Business Intelligence with Big Data. I say if you’re not fighting against getting data from a bunch of different sources, in a bunch of different formats and trying to get intelligence out of that data, you probably don’t have a Big Data problem.

The Cloud
===
The movie, Sex Tape said it best, “Nobody understands ‘The Cloud’”. People use The Cloud all the time, with Gmail, iCloud, OneDrive, DropBox, iTunes, and a myriad of other consumer services without even knowing that they’re “in The Cloud”, and that’s okay. But IT Managers, CIOs and others who may be purchasing “Cloud Services” should understand. The Cloud is not a virtual machine.

The way I see it, The Cloud is just delegating the storage and operations of your IT resources to a third party, for them to worry about security, back-up and maintenance of those devices. It’s generally storing your stuff on someone else’s servers, so you don’t have to maintain them. I also believe, it’s generally a good idea.

The reason IT folks resist, is it means letting go of some of the control. In return, however, are the massive benefits of having maintenance of servers, bandwidth and network guys (they take a lot of care and feeding). I generally tell my clients that if it is not going to get you any new customers (hosting your own stuff) don’t do it. Hand it off to someone else, and let them handle it. Someone who does that professionally. That’s a basic ‘build vs. buy’ decision criteria.

ReST
===
Everyone knows that ReST stands for Representational State Transfer, but few understand what that means. Ultimately, it came out of the doctoral thesis of Roy Fielding (who help Sir Tim Berners Lee build the internet, so he knows a few things), and is becoming a standard way for user interfaces to get data from an API.

All it really means is that the server doesn’t store the state of each application it is giving data to. The application manages it’s state and tells the server what it needs. The server will tell the application what data it can access and where (URL) to get it from, but it doesn’t know who they are or where they’re at in the flow of things.

Ultimately, I think it is hard for people to understand because the original description of ReST is a 180-page doctoral thesis. This makes it very descriptive, but more useful for defending a thesis or helping engineers fall asleep. It is technical, and it basically spends the first four chapters explaining what problems it’s going to try and solve. I had to read chapter five several times with a notebook on my lap to go find out about things in the dissertation I didn’t understand. Fielding also discusses the shortcomings of the specification and ways you can overcome (or minimize) their effects.

Most people can get the fact that the things they want to interact with are resources (like People, Cars, Widgets, etc.) and that the web already has the actions you might want to take on those resources in the form of HTTP Verbs. Where most people fall down is when we get to Hypermedia. These are really just the way the server tells the client how/where to get information (or the application’s next state) from. For instance, if you go to Amazon.com, you don’t need to know that refrigerators are at the URL amazon.com/home/appliances/refrigerators (the real URL is much messier), you just go to amazon.com look for a link called ‘Home, Garden & Tools’, click it and look for the ‘Appliances’ link and click it, and finally click the ‘Refrigerators’ link. The server sends the URLs for each of those steps using HTML as the transport document. It’s beautiful and it’s what we’ve come to expect.

Hypermedia (while we’re at it)
So why not build APIs this way, too? Because it’s hard. It’s not hard to consume initially. But the application must keep track of where it’s at in order to figure out what the next step is, or (God forbid) survive a refresh. It’s wayharder than you might think to be able to send someone a link to a page in your application if I have to trace the steps from the home page to the appliances page to the refrigerators page to get all the data I need. So most people give up on Hypermedia and just stick with ‘Level Two ReST’, which is just fine. It still has lots of benefits over other methods of designing network-based software. But, I think, once we make hypermedia easier to consume, we’ll reap a whole other level of benefits.

Others?
===
What terms do YOU see being misused, misunderstood or maybe just need to go away? What do you think of my interpretations of these technologies? Spot on? Am I way off? Leave your comments below.

Thanks for reading…

