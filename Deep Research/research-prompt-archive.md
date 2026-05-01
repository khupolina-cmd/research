# Research Prompt Archive

Use this file as a lightweight memory layer for prompts that were actually used or are worth reusing.

## Entry template

Copy this block for each new prompt:

```text
Date:
Topic:
Research mode:
Task type:
Goal / decision use case:
Timeframe:
Geography:
Freshness window:
Core source classes:
Trusted sites or source priorities:
Expansion mode:
Naive baseline prompt:
Baseline failure modes:
Final prompt:
What worked:
What failed:
Notes for next iteration:
```

## Reusable methods

```text
Date: 2026-04-29
Topic: Prompt quality control for Deep Research
Research mode: mixed
Task type: method / QA
Goal / decision use case: detect visible and hidden prompt failures before launching Deep Research
Timeframe: n/a
Geography: n/a
Freshness window: n/a
Core source classes: n/a
Trusted sites or source priorities: n/a
Expansion mode: n/a
Naive baseline prompt: ask ChatGPT or another assistant directly to generate a Deep Research prompt with little or no preparatory clarification
Baseline failure modes:
- aesthetic buzzwords used as fake criteria
- weak freshness language
- source lists without hierarchy
- too many tasks collapsed into one run
- hidden taste judgments
- padding pressure
- portfolio-first logic
Final prompt: build the prompt iteratively, then compare it against the naive baseline and tighten the weak parts
What worked: the baseline exposed both obvious errors and softer, better-hidden ones
What failed: trusting the baseline as if it were evidence or methodology
Notes for next iteration: use this as a red-team pass, not as a source of truth
```

```text
Date: 2026-04-29
Topic: Freshness-first Deep Research methodology
Research mode: mixed
Task type: method / protocol design
Goal / decision use case: build a reusable methodology for writing Deep Research prompts that produce the freshest relevant results rather than generic or stale synthesis
Timeframe: prioritize current practices and current source logic; allow older foundational methods only when still methodologically important
Geography: global
Freshness window: prioritize 2024-2026 / latest available, but separate foundational older sources from current operating practice
Core source classes: official Deep Research / prompting docs; evidence-synthesis methodology; search freshness / retrieval logic; fact-checking and lateral reading methods; source-evaluation and contradiction-handling methods
Trusted sites or source priorities: source-of-record and official guidance first; methodology institutions and primary papers next; high-quality practitioner material only as secondary support
Expansion mode: broader corpus, not tool list
Naive baseline prompt: research how to do better deep research and find the best methods, tools, and structure for fresh results
Baseline failure modes:
- collapses methodology, tools, domain specifics, and monitoring into one run
- says "fresh" without operational freshness rules
- drifts into tool catalogs
- lacks source hierarchy
- lacks exclusion logic for stale or SEO-shaped material
- mixes one-shot retrieval with continuous monitoring
Final prompt: see active working prompt in conversation
What worked: narrowing to methodology first keeps the run clean and makes later branches easier to separate
What failed: trying to cover domain-specific differences and refresh systems in the same run would likely blur the method
Notes for next iteration:
- run separate study on domain-specific differences
- run separate study on refresh pipeline / continuous monitoring
```

```text
Date: 2026-04-29
Topic: One-shot fresh retrieval methodology for Deep Research
Research mode: mixed
Task type: retrieval method / prompt protocol design
Goal / decision use case: design a universal one-shot Deep Research methodology that retrieves the freshest relevant corpus while avoiding stale results and generic SEO-visible material
Timeframe: current operating practice; separate current product behavior from older methodological foundations
Geography: global
Freshness window: no single flat recency window; define freshness by source role and evidence type
Core source classes: official product docs; search and retrieval methodology; evidence-synthesis methods; fact-checking and lateral reading methods; strong practitioner workflows and retrieval retrospectives
Trusted sites or source priorities: official/product-grounded sources first for mechanics; methodology and verification sources next; practitioner sources as tested operating layer; anecdotal/private signals only with cross-checking
Expansion mode: broader corpus, not domain-specific case study
Naive baseline prompt: research how to get the freshest results in one Deep Research run and explain the best prompt, sources, and techniques
Baseline failure modes:
- collapses prompt design and full monitoring logic
- uses freshness as a slogan rather than a retrieval rule
- does not separate source visibility from source relevance
- does not require candidate-source collection before synthesis
- leaves stale detection too implicit
- encourages long padded output instead of fewer stronger results
Final prompt: see active working prompt in conversation
What worked: fixing the scope on one-shot retrieval keeps the study practical and prevents drift into alerts, cadence, and tooling systems
What failed: flat recency language can still distort the method if freshness is not defined by evidence type
Notes for next iteration:
- keep domain-specific differences as a separate study
- keep refresh pipeline / continuous monitoring as a separate study
```

```text
Date: 2026-04-30
Topic: Domain-specific differences in one-shot fresh retrieval
Research mode: mixed
Task type: comparative retrieval method / domain adaptation
Goal / decision use case: determine how a universal one-shot fresh-retrieval methodology must change across visual/creative, academic/scientific, and fast-moving web/news topics
Timeframe: current operating practice; separate current domain signals from older but still valid methodological foundations
Geography: global
Freshness window: no flat recency rule; define freshness by domain, source role, and evidence type
Core source classes: official product docs; retrieval and evidence methodology; domain-specific source-of-record layers; practitioner retrieval writeups; domain-specific stale and verification signals
Trusted sites or source priorities: product and methodology anchors first; domain source-of-record sources next; practitioner layers as tested operational logic; weak-signal sources only with explicit caveats
Expansion mode: comparative domain study, not full refresh-system design
Naive baseline prompt: compare how to do fresh Deep Research across different kinds of topics and explain what changes
Baseline failure modes:
- treats all freshness as one recency filter
- compares domains at the level of vibes rather than retrieval mechanics
- forgets source hierarchy differences
- does not distinguish stale signals by domain
- collapses retrieval differences into generic reporting advice
- drifts into tool lists or continuous monitoring
Final prompt: see active working prompt in conversation
What worked: holding one-shot retrieval constant while varying domain logic creates a cleaner comparison
What failed: forcing a single universal freshness rule across domains would flatten the useful differences
Notes for next iteration:
- keep refresh pipeline / continuous monitoring as a separate study
```
