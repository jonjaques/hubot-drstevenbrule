# Hubot: Dr. Steven Brule

Access your GitHub Enterprise instance through Hubot.

## Installation

In your hubot project repo, run:

`npm install hubot-ghe --save`

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
user1>> hubot ghe license
hubot>> GHE has 20 seats, and 7 are used. License expires at 2015-07-01T00:00:00-07:00

user1>> hubot ghe stats users
hubot>> 11 users, 2 admins and 4 suspended.
```