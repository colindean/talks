# Job Hunt Organization Tooling

Premise: Simple methodology for organizing applications during an active job hunt

Audience: Everyone, but especially recent graduates of bootcamp, undergraduate, and graduate programs who did not already accept an offer via an internship, apprenticeship, etc.

## Application Progression Diagram

```mermaid
stateDiagram-v2
    direction TB

    accTitle: Job Application Status Workflow
    accDescr: Use this to track how applications resolve.

    classDef gettingSerious fill:teal,color:white,font-weight:bold,stroke-width:2px,stroke:seagreen
    classDef endedBadly fill:darkred,color:white,font-weight:bold,stroke-width:2px,stroke:firebrick
    classDef endedMeh fill:darkgoldenrod,color:white,font-weight:bold,stroke-width:2px,stroke:yellow
    classDef endedGreat fill:green,color:white,font-weight:bold,stroke-width:2px,stroke:lightgreen
    
    [*] --> WantToApply
    WantToApply --> AwaitingResponse : applied
    AwaitingResponse --> TimedOut : never responded
    AwaitingResponse --> Rejected : responded, not interested
    AwaitingResponse --> TalkingTo : responded, interested
    TalkingTo --> InterviewScheduled : anything scheduled
    InterviewScheduled --> TalkingTo : interview done
    TalkingTo --> Rejected : rejected after interview
    InterviewScheduled --> AwaitingOffer : interview, no further interviews expected
    AwaitingOffer --> Rejected : positive interview, but nope
    AwaitingOffer --> Ghosted : how rude
    AwaitingOffer --> Offered : getting serious
    Offered --> Negotating : ALWAYS NEGOTIATE
    Negotating --> TurnedDown : nope
    Negotating --> Accepted : job!

    Accepted --> [*]
    TurnedDown --> [*]
    Ghosted --> [*]
    TimedOut --> [*]
    Rejected --> [*]

    class Ghosted, Rejected endedBadly
    class TurnedDown, TimedOut endedMeh
    class Accepted endedGreat

    class AwaitingOffer, Offered, Negotating gettingSerious
```
