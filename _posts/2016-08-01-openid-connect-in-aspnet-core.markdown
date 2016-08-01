---
layout: post
comments: true
title:  "OpenID Connect in ASP.NET Core"
headline:  OpenID Connect in ASP.NET Core
date:   2016-08-01 00:00:00 -0600
categories: tutorials openid-connect aspnet-core
tags: [tutorials, openid-connect, aspnet-core]
---

In the age of the “personalized web experience”, authentication and user management is a given, and it’s easier than ever to tap into third-party authentication providers like Facebook, Twitter and Google. And it’s not just wild, wild web that needs it. Businesses need ways to secure their APIs, and identify users logged into their apps as well.

<!-- more -->

What is OpenID Connect?
==
OpenID Connect is a protocol for authenticating users, built with the latest in security technologies. It is a specification by the OpenID Foundation describing the best way for the authentication “handshake” to happen. It lays out what am Identity Provider needs to provide in order to be considered “OpenID Connect Certified” and that makes it easier than ever to consume authentication as a service.

Why Not Use The Built-In Providers?
==
The authentication providers built in to ASP.NET Core are outstanding, but there are some shortcomings. First, OAuth is NOT an authentication protocol. I know what you’re thinking: “What?!!?” But it’s not. It is an Authorization Specification, which many modern authentication protocols are built on. Second, while OAuth does a great job of providing the necessary information for consumers to make authorization decisions, it says nothing about how that information will be exchanged securely. This led to every authentication provider having their own way of exchanging the OAuth information, which has led to a few well-publicized hacks. OpenID Connect fixes these problems by providing an authentication protocol that describes exactly how the exchange of authorization information happens between a subscriber and their provider. 

Another advantage OpenID Connect has, is that it provides a framework for providers to abode by, so that consuming them is easier. They all have a document at [provider url]/.well-known/openid-configuration that describes their set up. What this means is, like ReST's Hypermedia, you (or your application's code) can discover how to subscribe to a specific provider!

So let’s see how this works.

Nothing Up My Sleeves
==
I started with a simple ASP.NET Core web application with no authentication built in. Once I set up a Identity Provider (I used Google), all I had to do was save my ClientId and my Client Secret.

Then, I just specify that I want to use OpenID Connect for authentication, and add my particulars for my client. Like so:

```c#
  app.UseOpenIdConnectAuthentication(new OpenIdConnectOptions()
  {
    AuthenticationScheme = "oidc",
    SignInScheme = "Cookies",
    Authority = "https://accounts.google.com",
    PostLogoutRedirectUri = "http://localhost:5000/",
    ClientId = "[Client Id]",
    ClientSecret = "[Client Secret]",
    ResponseType = "code id_token",
    GetClaimsFromUserInfoEndpoint = true,
    SaveTokens = true
  });
```

Wasn't That Easy?
==
It is a whole lot simpler than it looks, so we’ll go through it line by line.

The **AuthenticationScheme** gives out scheme a name, and will be used to build the default callback URL (~/sign-in/oidc).

The **SignInScheme** is used to set the sign-in middleware.

The **Authority** identifies the authorization endpoint for the Identity Provider. This is that ***magic*** part of the OpenID specification, and Google's is located at: https://accounts.google.com/.well-known/openid-configuration.

The **ResponseType** is also specified in that document under “response_types_supported”. This tells the application I am expecting a coded token back from the provider.

The **ClientId**, and **ClientSecret** are pretty self-explanatory. I got them from Google when I created an API client.

The **GetClaimsFromUserInfoEndpoint** setting tells the provider that if we’re successful authenticating, go ahead and make a call to the userinfo_endpoint (specified in the configuration document at the same URL where we got the authorization_endpoint and the response_types_supported).

Finally, we tell the application to save the token **SaveTokens** once it comes back from the provider.

Ready To Go Try It?
==
By now you should be chomping at the bit to implement OpenID Connect in ***your*** ASP.NET Core application. For more information on OpenID Connect watch [this video](https://vimeo.com/113604459) from [Dominick Baier](https://leastprivilege.com/). Then look at his repo for the example on [OIDC](https://github.com/leastprivilege/AspNetCoreSecuritySamples/tree/master/OIDC). Dominick's video and examples helped me a lot. 

Happy Auth'ing!
