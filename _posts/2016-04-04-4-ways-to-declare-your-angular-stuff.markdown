---
layout: post
comments: true
title:  "4 Ways To Declare Your Angular Stuff"
date:   2016-04-04 06:22:46 -0600
categories: software angular javascript
tags: [javascript,angular]
---

I’ve been writing AngularJS websites for a couple of years now and have worked in several different shops with their own styles and on my own projects, where my style has changed slowly as I have read other people’s code and picked up things I liked.

One of the things that I have seen is just the myriad of ways people declare the bits of Angular (e.g. controllers, modules, factories, etc.) So I thought I would show off 4 of the main ways that I have seen the pieces of AngularJS apps declared. These are by no means the only ways, and I am not declaring one to be better than any of the others (except that minification-safe is the way to go if you’re going to use minification, which you should).

<!-- more -->

The Textbook Way
===
When you first get started, the tutorials and textbook examples will show you the simplest way to declare your angular pieces. It’s very straightforward and not a bad place to start, because at least you can see what Angular is doing.

```js
angular.module('MyApp', [])
 .controller('AppCtrl', function($scope){
   $scope.message = "Here I come to save the day!";
 });
```
The code above declares an Angular Module called ‘MyApp’ and adds a controller to it called ‘AppCtrl’. It passes the Angular $scope parameter in and sets a message property on the $scope parameter with a value. Very straight forward and pretty easy to follow. This is definitely the way to begin… until you want to minimize your Javascript files.

The Minification-Safe Way
===
Once you are ready to start minifying your javascript files, you should switch to the magnification-safe way of declaring your Angular bits.

```js
angular.module('MyApp', [])
 .controller('AppCtrl', ['$scope', function($scope){
   $scope.message = "Here I come to save the day!";
 }]);
```
This may look identical at first, but the function portion of the controller declaration is now in an array. Any parameters needed by the function are listed in the array as strings with the actual controller function being last. This makes the declaration minification-safe, because, even though the minifier will now turn the $scope param in the function into the letter ‘a’, the ‘$scope’ in the front part of the array is a string and is unchanged by the minifier.

Basically Angular just needs some way for the injector to get a list of which items need to be injected into the AppCtrl function. By default, it looks at the names of the params. Once the minifier moves through, the parameter names all get changed to short names like: ‘a’, ‘b’, ‘c’, etc. This can really hose the injector. So the second style helps by making the parameters need by the function strings in an array, with the function being the last argument. Then it just injects them into the function in order. So the $scope in the function could be ANYTHING: $scope, scope, a, whatever.

The JavaScript Way
===
One of the things the previous declaration syntax misses, is the ‘use strict’ statement. The ‘use strict’ statement helps make sure you’re using JavaScript that is stable and works as expected, so it is pretty important. It also doesn’t look much like JavaScript in the way we’ve come to know it. It’s fine when starting out, but I have seen another way and it looks more familiar to JavaScript folks like me.

```js
(function(){
 'use strict';

  var appController = function($scope){
    $scope.message = 'Here I come to save the day!';
  };

  angular.module('MyApp', [])
   .controller('AppCtrl', ['$scope', appController]);

}());
```
Now this may look strange to people just starting with Angular, and I highly recommend starting with the “Textbook” or “Minification Safe” way of declaration and moving to this once you’re comfortable with Angular and if you are looking for a “JavaScript-y” way to declare your angular bits.

This code creates an “Immediately Invoked Function Expression (IIFE)” wrapper around the code used before. It allows us to declare ‘use strict’ at the top, but still in the function scope. See my ‘use strict’ post for why it’s important to keep it out of the global scope. it then declares the controller function as a variable and then uses the minification-safe way of declaring the bits using a pointer to the appController function.

The John Papa Way
===
John Papa is a brilliant JavaScript coder and someone that I find myself searching for his code samples when I am struggling with things. I noticed in his latest Angular code he uses a slightly different method for declaring his Angular bits and, for full disclosure, I thought I would add them here.

```js
$injector(function(){
  'use strict';

  angular.module('MyApp', [])
    .controller('AppCtrl', appController);

  appController.$inject= [$scope];

  function appController($scope){
    $scope.message = 'Here I come to save the day!';
  };

})();
```
The only real difference here is the call to Angular’s $inject property. This is just declaring the injected dependencies like we did before, but in a separate statement. I like this technique, but I haven’t moved to it yet, because it still feels foreign to me. I am not quite as smart as John is, so I will leave this to him for now.