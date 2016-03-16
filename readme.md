# Hubot: Dr. Steven Brule

## Installation

In your hubot project repo, run:

`npm install hubot-drstevenbrule --save`

Then add **hubot-drstevenbrule** to your `external-scripts.json`:

```json
[
  "hubot-drstevenbrule"
]
```

## Configuration

By default, the bot will break up messages in an effort to create some comedic timing.

See below to turn this 'feature' off.

```
export BRULE_STAGGERED_REPLY=false
```

## Sample Interaction

```
user1>> I need a pritza!
hubot>> Jackprot!

user1>> brules rules
hubot>> Does your milk taste sour when you take a sip of it? 
hubot>> Just check the expiration date dummy.
```
