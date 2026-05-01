# Manual Web Search System

## Purpose

This system defines a manual-first web search layer that sits before Deep Research and before downstream analysis.

It exists to solve five recurring jobs:

1. Find strong references for writing.
2. Find fresh articles, studies, books, reports, and source materials across mixed topics.
3. Refresh older articles claim by claim instead of re-searching the whole topic blindly.
4. Collect a corpus manually, then hand it off for later screening, synthesis, contradiction analysis, and stale audit.
5. Preserve enough traceability that parts of the workflow can later be automated safely.

This system does not try to replace Deep Research.
It prepares a stronger input layer for it.

## Role In The Larger Stack

The full research stack now looks like this:

1. Framing: define the decision use case, boundaries, freshness logic, and evidence needs.
2. Manual web search layer: run search passes, collect candidates, verify surfaces, and build a kept corpus.
3. Screening and validation: source hierarchy, lateral reading, contradiction checks, stale checks, version checks.
4. Synthesis: matrix, memo, article, brief, or shortlist.
5. Refresh and monitoring: alerts, saved searches, page-change tracking, orchestration, and recurring updates.

This document focuses only on layer 2, while explicitly borrowing rules from layers 1 and 3.

## What The System Already Assumes

These pieces are already established in the project and are treated as upstream assumptions:

- scope and decision-use-case thinking;
- freshness-first logic;
- source hierarchy;
- source matrix before prose;
- contradiction-aware synthesis;
- monitoring as a separate layer, not part of one-shot retrieval.

This system should use those ideas, not re-derive them every time.

## Core Principles

1. Search for a corpus, not for a final answer.
2. Move from topic to evidence slots before opening many tabs.
3. Use multiple search surfaces; do not trust one surface to be complete.
4. Treat freshness as typed: publication, update, activity, evidence signal, or market signal.
5. Build a candidate-source set before writing prose.
6. Ask what each source is doing in the corpus, not whether it "looks good".
7. Search for contradiction and version change before synthesis, not after.
8. Keep a search ledger by default so the path to each item is reproducible.
9. Use adaptive failure rules instead of one fixed definition of junk.
10. Prefer a smaller kept corpus over padded completeness.
11. Do not mistake visible results for strong results; top-ranked and easily found material must be displaced, justified, or downgraded.

## Supported Operating Modes

### 1. Reference Hunt For Writing

Use when the goal is to find strong references for a future article, essay, note, deck, or report.

Primary output:

- kept corpus with role-labeled sources;
- a small source ledger;
- notes on which source supports which part of the text.

### 2. Mixed-Material Discovery

Use when the topic mixes articles, studies, books, reports, official documents, and web sources.

Primary output:

- cross-surface candidate set;
- surface map by object type;
- first-pass kept corpus.

### 3. Article Refresh

Use when an existing article is old and may contain stale facts, outdated examples, superseded claims, or dead links.

Primary output:

- claim register;
- keep / reinforce / replace / drop decisions for each claim;
- replacement-source set.

### 4. Corpus Prep For Downstream Analysis

Use when the manual searcher collects material and passes it to a later analysis stage.

Primary output:

- search ledger;
- kept corpus with metadata;
- notes on freshness, provenance, and contradiction checks still needed.

### 5. Contradiction And Credibility Pass

Use when a topic looks too smooth, too consensus-shaped, or too dependent on visible web ranking.

Primary output:

- contradiction leads;
- version checks;
- credibility flags;
- missing-signal notes.

## System Inputs

Every run should start with a compact framing block.

Required inputs:

- research object or topic;
- decision use case;
- geography if relevant;
- timeframe if relevant;
- primary freshness type;
- output object needed at the end;
- known exclusions;
- stopping condition.

Optional but useful inputs:

- seed links;
- seed entities;
- names of likely source-of-record organizations;
- existing article to refresh;
- already known weak points or likely failure modes.

## Evidence Slots

Before searching, define the evidence slots the corpus must fill.

Typical slot types:

- primary fact source;
- current status source;
- strong secondary overview;
- version or update source;
- contradiction or critique source;
- historical foundation;
- book or edition record;
- archive record;
- missing-angle or weak-signal source.

This turns "searching a topic" into "filling a structured evidence need".

## Operating Workflow

### Step 1. Framing

Translate the task into:

- what needs to be established;
- what counts as a strong enough kept corpus;
- what counts as stale or weak for this run;
- which evidence slots are mandatory.

Output:

- short scope note;
- evidence-slot list;
- stopping rule.

### Step 2. Scoping Pass

Run a short exploratory pass to learn the field language.

Look for:

- aliases and synonyms;
- recurring organizations, authors, publishers, and repositories;
- document types;
- version markers;
- recurring dates or release cycles;
- object identifiers like DOI, ISBN, policy number, report code, or docket number.

Output:

- working vocabulary;
- seed entities;
- likely search surfaces;
- possible source-of-record layer.

### Step 3. Surface Selection

Choose surfaces by object type instead of staying inside one ranking layer.

Common surfaces:

- general web search;
- news search and coverage pages;
- official sites and registries;
- scholarly search and metadata layers;
- book search and library catalogs;
- grey-literature and institutional repositories;
- web archive;
- reputation-check surfaces about the source itself.

Output:

- surface plan matched to evidence slots.

### Step 4. Query Architecture

Run families of searches, not a single query.

Core query families:

- anchor bibliographic queries;
- neutral conceptual queries;
- operator and source-constrained queries;
- freshness and update queries;
- contradiction and rebuttal queries;
- citation and neighbor queries;
- missing-signal and weak-signal queries.

Output:

- query bank;
- search notes per family;
- early surface quality judgment.

### Step 5. Candidate-Source Set

Do not write the narrative yet.

Collect candidate items with:

- source identity;
- source type;
- why the item matters;
- freshness marker;
- version status;
- evidence slot covered;
- keep / maybe / drop status.

Output:

- candidate-source set;
- first-pass kept corpus.

### Step 6. Validation Pass

Check important items outside themselves.

Validation moves:

- lateral reading;
- source reputation check;
- version and update check;
- archive comparison if needed;
- contradiction seeking;
- independent confirmation for important claims;
- citation or reference chasing from strong seed items.

Output:

- validated kept corpus;
- contradiction leads;
- stale or superseded flags.

### Step 7. Handoff

End the manual search with a search ledger, not a pile of links.

The manual layer is complete when:

- the evidence slots are filled well enough;
- later search passes mostly produce duplicates or weak additions;
- the kept corpus is traceable;
- a downstream analyst can understand why each item survived.

Output:

- search ledger;
- kept corpus package;
- unresolved questions.

## Query Families

### Anchor Bibliographic Queries

Use for known-item recovery.

Examples:

- exact title in quotes;
- author + title;
- DOI;
- ISBN;
- quote fragment;
- title + publisher;
- title + year.

Best for:

- finding the exact source;
- checking whether a source really exists;
- recovering the canonical record.

### Neutral Conceptual Queries

Use for early orientation and vocabulary discovery.

Characteristics:

- neutral wording;
- no hidden thesis;
- multiple phrasing variants.

Best for:

- learning the field language;
- spotting dominant entities and surfaces;
- avoiding premature hypothesis lock-in.

### Operator And Source-Constrained Queries

Use to escape generic surface ranking.

Examples:

- `site:example.org "term"`;
- `filetype:pdf "term"`;
- exact phrase plus domain;
- title plus author or organization;
- query plus date window;
- query plus document type like `report`, `protocol`, `appendix`, `dataset`, or `hearing`.

Best for:

- finding source-of-record documents;
- moving from commentary to primary materials;
- surfacing grey literature and institutional files.

### Freshness And Update Queries

Use typed freshness, not flat recency.

Freshness angles:

- recent publication;
- recent update;
- recent activity;
- recent evidence signal;
- recent market or operational signal.

Typical query add-ons:

- `update`;
- `latest`;
- `revised`;
- `version`;
- `release notes`;
- `policy update`;
- `new edition`;
- `correction`.

Best for:

- current-state questions;
- tracking new versions or newer editions;
- checking whether a source has been overtaken.

### Contradiction And Rebuttal Queries

Use before synthesis, not after it.

Typical query add-ons:

- `criticism`;
- `limitations`;
- `retraction`;
- `expression of concern`;
- `rebuttal`;
- `replication failure`;
- `controversy`;
- `what others say about`;
- `-site:source-domain`.

Best for:

- avoiding false consensus;
- checking source reputation;
- surfacing opposing evidence early.

### Citation And Neighbor Queries

Use after finding a strong seed item.

Moves:

- inspect the reference list;
- inspect who cites the item;
- inspect similar items suggested by the surface;
- inspect DOI-linked metadata;
- inspect adjacent versions or related records.

Best for:

- moving from a visible source to a central source;
- expanding from a strong seed without random drift.

### Missing-Signal And Weak-Signal Queries

Use when the visible corpus feels thin, recycled, or over-smoothed.

Look for:

- appendices;
- working papers;
- protocols;
- theses;
- comments;
- consultation responses;
- testimony;
- datasets;
- technical notes;
- institutional attachments.

Best for:

- filling hidden evidence slots;
- escaping copy-paste commentary layers;
- catching early signals before they are heavily summarized.

## Anti-Surface Quality Gate

This system assumes that a user comes here not for material that can be collected casually from the first visible layer of the web, but for material that survives a stronger retrieval standard.

The anti-surface rule is simple:

- if an item can be found easily on the first visible pages of generic search, that does not make it bad;
- but it cannot be treated as high-value by default just because it is easy to find;
- it must either be displaced by a stronger source, or explicitly justified as the best surviving item of its class.

In practice, a source should not enter the kept corpus as a strong item unless at least one of the following is true:

- it is a source-of-record or other primary artifact;
- it was found through a non-generic surface like scholarly, archival, institutional, bibliographic, or citation-linked search;
- it adds independent contradiction, correction, rebuttal, or version evidence;
- it fills a missing evidence slot that the visible layer was not covering;
- it survives comparison against more visible but weaker summary pages.

Practical anti-surface checks:

- run at least one source-constrained pass;
- run at least one contradiction-seeking pass;
- run at least one citation, reference, archive, or neighboring-record pass when the object type supports it;
- treat top-ranked listicles, generic explainers, and repeated rewrites as candidates, not anchors;
- if the corpus is dominated by obvious high-visibility results, keep searching until either a deeper layer appears or you can state honestly that the field itself is surface-heavy.

The point is not forced obscurity.
The point is to avoid mistaking convenience, ranking, and repetition for quality.

## Automatic Prompt Insertion

For this project, the anti-surface layer should be inserted automatically into manual web-search and reference-retrieval prompts unless the user explicitly disables it.

Default prompt block:

```text
Anti-surface requirements:
- Do not treat top-ranked or easily found results as strong evidence by default.
- Run at least one source-constrained pass, one contradiction-seeking pass, and one deeper expansion pass such as citation, reference, archive, or neighboring-record search when the object type supports it.
- Prefer sources that survive beyond the generic visible layer of search.
- If a visible result is kept, explain why it remained stronger than less visible alternatives.
- Exclude or down-rank high-visibility results that add no independent evidence, no contradiction value, and no source-of-record advantage.
```

This block is part of the default quality floor, not an optional flourish.

## Search Surfaces By Use Case

### General Web And Current Topics

Use for:

- initial scoping;
- entity discovery;
- current public web visibility;
- reaction and context.

Strength:

- fast field orientation.

Risk:

- visibility bias;
- SEO-shaped surface;
- personalization and location effects.

### News Surfaces

Use for:

- current developments;
- emerging stories;
- ongoing coverage;
- later corrections or follow-up reporting.

Strength:

- captures recent activity and later-stage updates.

Risk:

- early noise;
- repeated syndication;
- unstable first-day narratives.

### Official And Regulatory Surfaces

Use for:

- source-of-record materials;
- policy;
- filings;
- standards;
- official positions;
- current status records.

Strength:

- primary authority and traceability.

Risk:

- weak site search;
- slow discoverability via general search.

### Scholarly And Metadata Surfaces

Use for:

- papers;
- reviews;
- citation tracking;
- version checks;
- related literature discovery.

Strength:

- structured metadata and citation trails.

Risk:

- coverage differences;
- default relevance sorting that hides recency unless adjusted.

### Book And Library Surfaces

Use for:

- books;
- editions;
- ISBN validation;
- library presence;
- publication history.

Strength:

- edition-level clarity.

Risk:

- freshness for books behaves differently from web recency.

### Grey-Literature And Institutional Repositories

Use for:

- reports;
- theses;
- conference materials;
- white papers;
- policy documents;
- technical notes.

Strength:

- often contains load-bearing materials missing from commercial web visibility.

Risk:

- fragmented discovery;
- inconsistent metadata;
- weak site navigation.

### Archive Surfaces

Use for:

- historical page state;
- version comparison;
- dead-link recovery;
- claim refresh.

Strength:

- lets you see what a page said at a past date.

Risk:

- incomplete archival coverage.

### Reputation-Check Surfaces

Use for:

- author and organization reputation;
- external discussion of a source;
- independence and credibility checks.

Strength:

- supports lateral reading.

Risk:

- easy to skip when rushed, even though it is often decisive.

## Candidate-Source Set Rules

Before prose, every candidate should answer:

- what evidence slot it covers;
- what kind of source it is;
- what type of freshness it provides;
- whether it is current, updated, corrected, retracted, archived-only, or unknown;
- why it should survive;
- what its limitations are.

If the candidate cannot answer these questions, it is not ready for the kept corpus.

## Article Refresh Protocol

Article refresh is a special mode and should not be treated as a generic new search.

### Step A. Build A Claim Register

Break the old article into checkable claims.

Common claim types:

- statistic;
- status claim;
- historical fact;
- research finding;
- policy or rule;
- quote;
- visual claim;
- book or edition reference.

### Step B. Attach The Current Supporting Source

For each claim, record:

- original source;
- source type;
- claim date if known;
- why the source supported the claim at the time.

### Step C. Check Version And Validity

Ask:

- is this still the current version;
- is there a correction or update;
- is there a newer edition;
- was the source retracted or superseded;
- does the archived page show the same wording as today.

### Step D. Check Whether The Claim Itself Has Aged

Even a live source can support a stale claim.

Ask:

- is the topic dynamic;
- is newer primary evidence available;
- was the claim only true in an earlier state of the story;
- is the original wording still responsible now.

### Step E. Run A Contradiction Pass

Look for:

- later criticism;
- rebuttal;
- replication failure;
- fact checks;
- later coverage;
- independent disagreement.

### Step F. Decide

Allowed decisions:

- keep;
- reinforce;
- replace;
- drop.

These decisions should be made claim by claim, not article by article.

## Handoff Schema

The minimum handoff artifact is a search ledger.

Required fields:

```text
corpus_id
item_id
title
author_or_org
source_type
url_or_doi_or_isbn
publication_date
last_update_date
date_found
surface_found
exact_query_used
why_kept
evidence_slot
freshness_type
version_status
contradiction_check_status
notes_on_provenance
visibility_class
anti_surface_note
priority
```

Why these fields matter:

- stable identifier: so the item can be found again;
- retrieval trace: so the path can be reproduced;
- evidence slot: so the role of the source is explicit;
- freshness type: so dates are interpreted correctly;
- version status: so updates and corrections are visible;
- visibility class: so we can distinguish generic visible hits from deeper retrieval;
- anti-surface note: so we can explain why a visible result was still kept, or why a less visible result was preferred;
- why kept: so later screening and synthesis have context.

## Adaptive Failure Rules

Bad results should be modeled as task-dependent failure rules, not as a universal blacklist.

Down-rank or reject an item when:

- it fills no evidence slot;
- it is derivative and adds no independent check;
- author, date, version, or provenance are unclear when they matter;
- the item cannot be checked for update state in a risky topic;
- it only duplicates the dominant belief of the corpus;
- it adds no contradiction value;
- it is highly visible and easily found but offers no stronger evidentiary role than many similar pages;
- it cannot be traced properly in the handoff ledger.

This is not a definition of "trash in general".
It is a definition of "not strong enough for this kept corpus".

## Automation Boundary

Good later candidates for automation:

- query-set generation from task schema;
- logging of queries and surfaces;
- metadata extraction;
- DOI and ISBN resolution;
- deduplication;
- citation-graph expansion;
- update and retraction marker checks;
- preliminary clustering;
- pre-ranking of candidates.

Better left to humans:

- framing the task;
- deciding which freshness type matters most;
- choosing adaptive failure rules;
- adjudicating contradictions;
- judging source reputation and motive;
- deciding what the source really proves;
- final keep / replace / drop decisions.

## Outputs

The system can end in one of four core artifacts:

1. Search ledger.
2. Kept corpus.
3. Article refresh register.
4. Handoff package for downstream analysis.

## What The System Can Do Now

With the current project corpus, this system is already strong enough to support:

- manual reference hunting for writing;
- mixed-source corpus collection;
- claim-by-claim refresh of older articles;
- pre-Deep-Research corpus preparation;
- contradiction-aware manual source collection.

## What Still Needs To Be Built Later

The next practical additions should be:

- domain-specific playbooks by topic class;
- an adaptive bad-results registry by domain;
- reusable session templates for manual search runs;
- a small downstream analysis template for corpus screening and synthesis;
- the separate monitoring layer for recurring updates.

## Boundaries

This system does not cover:

- full continuous monitoring and alerts;
- orchestration and scheduled automation;
- full domain-specific search logic for every field;
- final synthesis writing;
- a complete research knowledge base.

It is intentionally the manual search layer only.
