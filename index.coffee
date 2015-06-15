# Description
#   Dr. Steven Brule Quotes
#
# Dependencies:
#   "<module name>": "<module version>"
#
# Configuration:
#   BRULE_STAGGERED_REPLY
#
# Commands:
#   pritza|sausage|hunk|dingus|doofus|mumbo|jumbo|bringo|jackpot - Random Brule Quote
#   (brule's )rules - Random Brule Rule
#
# Author:
#   jonjaques

BRULE_QUOTES = [
  'One of Paper = Four of Coin'
  "Sour as my Daddy’s lips."
  "It’s funny to imagine bears riding motorcycles."
  "Tastes like a cow bathroom."
  "Sounds like a buncha mumbo jumbo trash to me."
  "If I had the choice between kissing a beautiful girl on the mouth or the lips and a jetpack.. (PAUSE)I would choose jetpack. (PAUSE)Cause then you can get all the good girls if you had a jetpack. Fly to them. It's simple.. (PAUSE)If you had enough fuel."
  "Bill Grates invented Michaelsoft!"
  "Life's about having fun and eating candy (PAUSE)and not putting roaches in your hair."
  "Jackprot!"
  "Move like a dingus, sting like a hunk!"
  "She's my cousin. (PAUSE)Who cares?"
  "Wouldn't it be cool if I could remember my dingus password for my email?"
  "I was gonna invent the skrateboard but I already have 500 of em."
  "Pritza."
]

BRULE_TOPIC_CHANGES = [
  "Sounds like a buncha mumbo jumbo trash to me."
  "Good going there dingus!"
  "Jackprot!"
]

BRULE_RULES = [
  "Hey, ever had a big problem taking care of your eggs and keeping them from getting squashed or spoiled? Keep em outside, except if it's hot out, then you are out of luck pal."
  "Ever wonder why ice cubes taste so boring? It's because you're making them out of stupid water, you bimbo. (PAUSE)Put some fruit juice in there, and freeze it into ice cubes, and put THAT in your milk!"
  "What the heck are you gonna do if you're on a picnic and have an ice cream and then the ants crawl on the ice cream, what are you gonna do? You're gonna eat the ants because it's made out of protein."
  "Do you have smelly body parts? Smelly under your arms? In the armpits? Just put some vinegar on it. Why didn't you think of that?"
  "Does your milk taste sour when you take a sip of it? Just check the expiration date dummy."
  "If you're raking the leaves and it gets all over your driveway, just hose it off dummy."
  "Do you know what you're supposed to do if you catch on fire? Stop, drop and roll."
  "Life comes from eggs. (PAUSE)Not just for omelettes, ya dingus, you could make a baby boy or a baby girl too."
  "Wine was invented by the Romans… for orgies. (PAUSE)And orgies are not too much fun if no-one wants to do it with you."
  "Go to bed early you doofus, ‘cause when you’re sleeping there’s no lonely times, just dreams. (PAUSE)The second tip is go to bed early, you doofus!"
  "Can't find a date to the prom? Just bring your sister ya dingus!"
]

QUESTION_SYMBOL = '?'
PAUSE_SYMBOL = '(PAUSE)'

STAGGERED_REPLY = true
if typeof process.env.BRULE_STAGGERED_REPLY isnt 'undefined' and
  JSON.parse(process.env.BRULE_STAGGERED_REPLY) is false then STAGGERED_REPLY = false

staggeredReply = (res, msg, cb)->
  delay = (Math.random() * 1000) + 1200
  question = msg.indexOf(QUESTION_SYMBOL)
  pauseForEffect = msg.indexOf(PAUSE_SYMBOL)
  # There is surely a better way to logic this...
  if STAGGERED_REPLY and (question > -1 or pauseForEffect > -1)
    if question > -1 and question < pauseForEffect or pauseForEffect is -1
      insideQuote = msg[question+1] is '"' ? 1 : 0
      res.send msg.slice 0, (question + QUESTION_SYMBOL.length + insideQuote)
      setTimeout ->
        staggeredReply res, (msg.slice question + QUESTION_SYMBOL.length + insideQuote), cb
      , delay
    else
      res.send msg.slice 0, pauseForEffect
      setTimeout ->
        staggeredReply res, (msg.slice pauseForEffect + PAUSE_SYMBOL.length), cb
      , delay
  else
    unless STAGGERED_REPLY then msg = msg.replace /(PAUSE)/g, ''
    res.send msg
    cb() if cb
  return

module.exports = (robot)->
  robot.hear /(?:brule'?s? )?rules/i, (res)->
    staggeredReply res, res.random(BRULE_RULES), ->
      if (Math.random() > 0.6)
        setTimeout ->
          res.send 'For Your Health'
        , (Math.random() * 1000) + 1000

  robot.hear /pr?it?zz?a|hunks?|br?ingo|jackpr?ot|dingus|doofus|m?j?umbo|sa?o?usage/i, (res)->
    staggeredReply(res, res.random(BRULE_QUOTES))
