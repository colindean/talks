---
header:
footer: Colin Dean's Codemash 2020 Review
---

# Codemash 2020

![bg right contain](https://pbs.twimg.com/media/EN4H3rmWAAY8RZi?format=jpg&name=small)

---

<!-- paginate: true -->
<!-- header: Configuration UX -->

## Configuration UX

Eemeli Aro from Finland

Tour of configuration formats with strengths and weaknesses

---

| Old standards      | New to me   |
|--------------------|-------------|
| .properties        | Dhall       |
| TOML               | Jsonnet     |
| SDLang             | CUE         |
| JSON               | Fluent      |
| JSON with comments |             |
| JSON5              |             |
| HJSON              |             |
| HOCON              |             |
| YAML               |             |
| Strict YAML        |             |
| Javascript         |             |
| Python             |             |

---

- Dhall - define vars and use nearly Turing-complete lang with functions, great for repetitive config
- Jsonnet - like Dhall, but comes with a standard library and can output to several other formats
- CUE - validation langauge with types with a solver
- Fluent - mostly for i18n but can be used for config, too

---

## Text is a UX

"Most of my job is UX - it's just text files, though."

---

## Limit assumptions

### Norway problem

YAML 1.1 (2004): `no` is falsey

YAML 1.2 (2009): fixed

- Default mode is 1.1 for many parsers.
- "Why are you using a YAML parser that's 15 years out of date?"

---

## Validate

Use CUE?

Use JSON Schema?

…but validate somehow.

---

## Speed 

- YAML is least worst when used with syntax checking tools
- "You shouldn't be caring about speed of reading and parsing, you should do that once per execution!"

---
<!-- header: Taking a byte out of Java bytecode -->
# Taking a byte out of Java bytecode

Magnus Stahre

- Synalize It! Pro: fantastic hex editor with built-ins for debugging Java bytecode
- A modern Java compiler inserts a TON of code in bytecode
- Java bytecode is actually relatively simple and unchanging
- `git crawl` for demos?

---
<!-- header: Antifragile Teams -->
# Antifragile Teams

Charlie Sweet

- _Antifragile_ by N.N. Taleb
- Eustress - good stress or post-traumatic growth
- Stressor must be the right amount and acute
- Fragile is is illusion of stability

> We have a human tendency to place controls that result in fragility. We have to allow some variability.

---

## "Tell him about the dream"

- MLK reference - MLK was an introvert planner
- What happens when your plans… "Go off script"?
- Kanye West is volatility - he pushes the envelope but never goes too far

---

## Chaos

- Chaos Engineering with Chaos Monkey and the Simian Army
- **One-size-fits-all denies volatility**
- Procrustean bed problem: cut off legs or stretch body to fit bed
- Naive interventionalism
	- "do something"
	- Best way to kill someone legally years ago was to get them an attending physician - 50/50 chance of death for tonsils

---

|Working Group|Both|Team|
|--------------|----|-----|
|Strong, clearly focused leader. Individual accountability. Individual products.|Teamwork. Happy hours. Conflict.|Shared Roles. Individual or mutual accountability. Collaborative work product.|

---

## Psychological Safety

> Belief that you won't be punished for making a mistake

Project Aristotle @ Google

- More obvious factors on teams were not clear indicators of its success:
	- Communication styles
	- Friends outside of work
	- Similar interests
	- Management style

---

## Engagement

_Flow_ by Mikhaly Csikszentmihaly

Need sufficiently challenging work

- Not too hard - no progress, continued frustration detracts attention
- Not too easy - not using enough of your attention

---

## What can we stop doing?

- Premature or over-standardization
- Metrics for Managers
- Support teams
	- Eng is support
	- Few people _want_ to be on the JV team
	- Feedback loops: fixing bugs is a great stressor that results in improvements to eliminate stress points
- Long-lived teams
	- Insularity: inability to accept new team members or ideas from outside the team

---

## Temperature Reading

1. Appreciations - PDAs without kissing, lol
2. New Info
3. Puzzles
4. Complaints with Recommendations - constructive criticism only
	- "Ventilations and Vexations"
5. Hopes and Wishes

---

## Safety Assessment

1. When someone makes a mistake in this team, it is often held
against him or her.
2. In this team, it is easy to discuss difficult issues and problems.
3. In this team, people are sometimes rejected for being different.
4. It is completely safe to take a risk on this team.
5. It is difficult to ask other members of this team for help.
6. Members of this team value and respect each others' contributions.

The desirable answer is obvious and if the group is not unanimous, there is a problem.

---

## Change Mindset

- Embrace Volatility
- Make it Safe
- Power to the Edges
- Don't add too much value
- Ensure appropriate amount of Stressors

---

<!-- header: Conducting Humane Code Reviews -->

# Conducting Humane Code Reviews

Adrienne Tacke

Top 3 Code Review complaints:

1. Subjectivity
2. Tone of Voice
3. Process Loopholes

Consensus: If everyone is on the same page, it's easier to communicate.

---

## Must-haves 

- Team working agreement
- Automation
- Objectivity

---

## Rules of Engagement

- Suggest with facts
- Reject with courtesy
- Clarify with an open mind

> Don't throw digital tomatoes!

---

<!-- header: How to Steal an Election with Data Science -->

# How to Steal an Election with Data Science

Gary Short

> Black hat data scientists will break into your country and steal your democracy

Objective: To (illegally/immorally) influence a result contrary to the current mood of the electorate

---

## Amplificiation vs Influence

Examples:

- Trump amplifies - consumption and regurgitation
- Musk influences - production

---

## Main ideas

- Identify minimal number of people to influence 
	- < 2000 ppl could have changed 2017 UK general election outcome
- Behavioral psychology
	- Broken Window effect - "break it just a little more for me"
	- Pygmalion effect - reinforcement of biases - "you become what I say you are"
	- Pressure to conform
	- Obedience to Authority
	- System Justification Theory - justify actions to maintain status quo

---

# Main ideas, continued

> We live in a post-factual society in which people make inadequate effort to validate information presented as fact.

- Simple ideas deemed true - Halo effect: beautiful is valuable
- Media, gov't, and "Bob from the pub via Facebook" - who to trust?
- Media isn't biased - they don't care - they sell to a segment and focus there
- Cancel culture - neutralize support for the other by threatening boycotts
- Create your own news and prevent outside influence on your readers

---

> Very few people understand probability, including data scientists.

---

_[down the rabbit hole]_

---

<!-- header: Inclusion in the Workplace -->

# Inclusion in the Workplace: You are more than an Awesome Coder

Alejandro Velez-Calderón

- Inclusion != Culture
	- Do I have biases toward someone who can relate to me?
- Hacker culture of the '70s starting putting barriers to entry in social cliques
- PCs were marketed to boys in the '80s
- Hollywood portrayed geeks as men in '80s and '90s movies as a result
- "We live in a machine that taught us to keep our personal lives separate from work."
- _Radical Candor_ by Kim Scott

---

<!-- header: Learning R through Sports -->

# Learning R through Sports

_[demos only]_

---

<!-- header: Definitive Guide to Building Community -->

# Definitive Guide to Building Community

Jennifer Wadella, founder of Kansas City WiT

- Market programs to girls in any way indicates to parents that it's for girls
	- "Coding for Kids" - parental predisposition for boys because of 80s and 90s marketing
	- "Code and Cupcakes" - sounds girly even though it's not
	- Parents can't tell otherwise and kids can't tell the difference
---
## Main ideas

1. Practice self-care
2. Become an expert communicator
3. Manage expectations
4. Don't neglect volunteers
5. Plan 6 months in advance
6. Beware of the dark sides

_I wrote a lot more for personal use…_

---

<!-- header: Dealing with Disagreement -->

# Dealing with Disagreement

Tommy Graves @ Root Insurance

1. We value diversity but diversity creates unproductive disagreements.
2. We hire people because we value their ideas yet we devalue their ideas in disagreements.

---

## Why do people disagree?

## Tractable disagreements

- Fundamental disagreement based on knowledge
- Incomplete knowledge of the situation
- Different values
- Different interpretations of the same data

## Intractable disagreements

- Difference evidence, authorities, level of expertise, intutition

---

## Why do we get things wrong?

- Conjunction Fallacy
- Bias Blind Spots
- Backfire Effects
- Framing Effects
- Dunning-Kruger Effect
- IKEA Effect (i.e. I build it, so it's the best or NIH syndrome)

---

You must consider the other side of a disagreement.

We are often not in a good enough position to independently determine who is correct.
 
Upon realization that you are in a disagreement, you _should_ become _less_ confident in your belief.

---

## Disagree and Commit?

\- Jeff Bezos in 2016 Amazon shareholder letter

…and reflect! Agree to disagree, set a short term goal with retrospective scheduled.

**Foster a culture of disagreement and trust.**

---
<!-- header: Hiring and Inspiring an Exceptional Team -->
# Hiring and Inspiring an Exceptional Team

Seth Petry-Johnson

1. Team Players
2. Design the Alliance
3. Build relationships
4. Motivate and Communicate using DiSC

---

## Team Player Assessment

- Hunger
- Humility
- People Smarts

Get out from behind the desk: meal, walk, ping pong

Scare with Sincerity: tell them that you're _fanatatically_ devoted to a value and let them self-select.

---

## Design the Alliance

"How best can I manage you?" exposition

- Shared 1:1 notes, reviewed before each 1:1 mtg
- Preferred interaction styles
- Deadline commitments miss preference: late or incomplete?

---

### Build Relationships

**1:1s** are the best way to do this. No project updates, just personal.

Focus on career development and building personal rapport.

Take digital notes - it's a conversation, not a drive-by.

Effective feedback: declare expected behavior, be repetitive.

---

### DiSC communication

- Dominance
- Conscientious
- Influence
- Steadiness

http://www.discprofile.com

---

<!-- header: A Developer's Introduction to Electronics -->

# A Developer's Introduction to Electronics

Guy Royse

_[demo]_

Resistors turn electricity into heat in order to reduce voltage.

---

<!-- header: Avoiding Burnout -->
# Avoiding Burnout

Santosh Hari

> If a good day at work is "Nothing Bad Happened", then something is _wrong_.

---

## Phases of burnout

1. Dialed-in
2. Tolerating Work
3. Stretched to the Limit
4. Barely Getting By
5. Burned Out

---

## Factors and feelings

1. Workload
2. Control
3. Compensation
4. Community
5. Fairness
6. Values

---

## How to reduce burnout as an employee?

1. Understand role
2. Reduce multitasking
3. Learn to say No
4. Reduce social media and other distracting notifications
5. Get a life outside of work
6. Get exercise and sleep

---

## How to mitigate burnout as the employer?

1. Sustainable workload
2. Autonomy
3. Recognition and rewards
4. Work community
5. Fairness, respect, and social justice
6. Clear values and meaningful work

---

<!-- header: Podcasting how-to -->

# Podcasting How-To

Leo Dion

- Stay organized with notes, topics of discussion, biography of interviewee
- Essay format should flow when read
- Record episodes ahead of time to have the appearance of consistent releasing
- Software: whatever works for you, Podcast Edition, Audacity, Audition, Logic Pro
- Transcriptions can be cheap when AI assisted and great for SEO
- Publish to an aggregator like Apple Podcasts, Libsyn, etc.
- Nearly always, **you get what you pay for**

---
<!-- header: "Beach of Lake Erie, early morning January 9, 2020" -->
![bg](codemash2020_beach.jpg)


