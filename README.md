# Pre-work - TipSee

TipSee is a tip calculator application for iOS.

Submitted by: Kavita Gaitonde

Time spent: 3 hours spent in total

## User Stories

The following **required** functionality is complete:

* [ ] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [ ] Settings page to change the default tip percentage.

The following **additional** features are implemented:

- [ ] The total bill amount can be split up based on the number of people in the party. 

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src="http://i.imgur.com/bpPNyjh.gif" title="Video Walkthrough" width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Project Analysis

**Question 1**: "What are your reactions to the iOS app development platform so far? How would you describe outlets and actions to another developer? Bonus: any idea how they are being implemented under the hood? (It might give you some ideas if you right-click on the Storyboard and click Open As->Source Code")

**Answer:** iOS application development is far the most fun. The ability to code and test it quickly on simulator makes the dev cycle so fulfilling and fun. One can think of 'outlets' as pointers to UI widgets like a label or a view. Using these pointers, one can extract or change the values/attributes associated with these widgets at runtime. 'Actions' are methods that can be invoked when an event is triggered by a UI widget, for example pressing a button is an event that can trigger an action. Action methods contain code that is executed in response to the event that triggered the action. 

Question 2: "Swift uses [Automatic Reference Counting](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/AutomaticReferenceCounting.html#//apple_ref/doc/uid/TP40014097-CH20-ID49) (ARC), which is not a garbage collector, to manage memory. Can you explain how you can get a strong reference cycle for closures? (There's a section explaining this concept in the link, how would you summarize as simply as possible?)"

**Answer:** A strong reference cycle between 2 instances of objects happens when each instance refers to the other. As a result when one instance is set to nil, its memory is not deallocated since the other instance is still holding on to it via a strong reference. A strong reference cycle is also possible when a property of an object instance is assigned to a closure which in turn refers to the instance within body of the closure.


## License

    Copyright 2017 Kavita Gaitonde

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
