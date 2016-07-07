[![General Assembly Logo](https://camo.githubusercontent.com/1a91b05b8f4d44b5bbfb83abac2b0996d8e26c92/687474703a2f2f692e696d6775722e636f6d2f6b6538555354712e706e67)](https://generalassemb.ly/education/web-development-immersive)

# Flexible Cards

Create a set of Ruby Classes to represent playing cards that can be re-used
across a variety of different card games.

Adapted from [this CodeWars exercise](https://www.codewars.com/kata/5436fdf34e3d6cb156000350),
 created by user [animatedgif](https://www.codewars.com/users/animatedgif).

## Prerequisites

-   None

## Instructions

1.  Fork and clone this repository.
1.  Change into the new directory.
1.  Install dependencies.
1.  Create and checkout a new branch to work on.
1.  Fulfill the listed requirements.

Starter code is available in the [`lib`](lib) directory.
A pull request is not required,
but it is necessary if you want a code review.

You may wish to refer to [FAQs](https://github.com/ga-wdi-boston/meta/wiki/)
related to [forking,
cloning](https://github.com/ga-wdi-boston/meta/wiki/ForkAndClone).

## Requirements

You are going to create two classes, Deck and Card, which can be used by other
programs to play a variety of card- games. Go through the steps below, making a
commit after completing each step.

Please run the Rubocop linter (`rubocop lib`) frequently, since the linter will
make it easy to spot many common sources of errors.
Once `rubocop` confirms that your syntax is right, you can use `rspec` to run
the included tests, which will tell you whether or not your code
meets the requirements.

### Step 1: Create a Card class

A Card must have the following publicly readable properties.

-   `rank` : an integer from 1 to 13. ("ace" is 1, "king" is 13)
-   `suit` : a symbol representing the suit of the card (e.g. `:hearts`,
    `:clubs`, `:diamonds`, `:spades`)

It should be possible to set these properties when you instantiate a new Card.

Additionally, give this class an instance method called `face_card?`
which returns whether or not the card is a face card (i.e. J, Q, K).

### Step 2: Create a Deck class

A Deck must have a publicly readable `cards` property,
which is an array of all of the Cardvinstances in that Deck.
This array must be populated with 52 new Cards (4 suits, 13 values)
when you instantiate a new Deck.

Additionally, a `Deck` must have the following three methods:

-   `count` : return the number of cards left in the deck
-   `draw(n)` : remove the last `n` cards from the eck, and return them as an
    array of Cards.
-   `shuffle` : shuffle the array of cards

### Step 3: Overwrite the Card class's `.to_s` method

At the moment, your Card class's `.to_s` method returns "".
Let's change it so that when we call `.to_s` on a class, it instead returns
a string of the format "Ace of Spades", "King of Hearts", "2 of Clubs", etc.
To accomplish this, you will need to override the default meaning of `.to_s`
for the `Card` class by creating a new definition for that method.

See: [Overriding Ruby Methods](http://rubylearning.com/satishtalim/ruby_overriding_methods.html)

### Step 4: Make Cards comparable

Let's assume that in most games, we want an easy way way of sorting our cards.
In order to sort cards, you need to have a basis by which you sort them --
in other words, you need to be able to compare them (using `<`, `>`, etc.) to be
able to determine which one is 'lower'.

There exists a Ruby module called '[Comparable](http://ruby-doc.org/core-2.2.3/Comparable.html)',
which includes a whole bunch of methods necesary for comparisons.
In order for a class to have access to these methods, it must

1.  include the Comparable module as a [mixin](http://ruby-doc.com/docs/ProgrammingRuby/html/tut_modules.html#S2)
    , and
1.  have a method called `<=>` (affectionately called the 'spaceship') which
    takes one argument (a Card) and returns -1, +1, or 0 depending on whether
    the Card on whome the method is being called is (respectively) smaller,
    larger, or equal to the argument. Methods inside the Comparable module
    will expect to be able to use `<==>`, so not defining it for your class will
    mean that those methods do not work.

Add the Comparable module to your Card class, and make it so that Cards sort
_only by rank_, not by suit.

## [License](LICENSE)

Source code distributed under the MIT license. Text and other assets copyright
General Assembly, Inc., all rights reserved.
