# Prompt Templates

These are shape templates, not fixed text blocks.

Use them to keep structure stable and reduce memory-led drift.

## 1. Manual Web Search Prompt

Use this when the user wants:

- source mapping;
- reference hunting;
- corpus prep;
- where-does-this-material-live questions;
- manual retrieval before Deep Research.

### Recommended structure

```text
Task:
[one sentence on what to map or retrieve]

Object:
[what exactly is being searched for]

Goal:
[why this corpus is needed]

Primary rule:
[the one non-negotiable criterion]

Exclude:
- [...]
- [...]

Source logic:
- prefer [...]
- include [...]
- avoid [...]

Freshness logic:
- [...]

What to return:
1. [surface map / source classes / publication ecosystems]
2. [only if asked: shortlist]
3. [proof / caveats / where signal is weak]

Anti-surface requirements:
- [...]
```

Important:
- `case structure` may be a useful attribute of a source
- but it is not the main deliverable unless the user explicitly asked for cases
- the `What to return` block must be rewritten to match the chosen output-object submode; do not leave it in generic mixed form
- broad platform search pages are not acceptable as the final deliverable when the user asked for direct resources, studios, or operational links

### Output-object submodes

Before writing the prompt, choose one:

#### A. Surface-finding prompt
Use when the user wants:

- sites
- platforms
- archives
- publication surfaces
- where the material repeatedly appears

Return should emphasize:

- surfaces
- what each surface contains
- why it is operationally useful
- optionally what search behavior works there

Do not drift into:

- campaign cases
- example lists

#### B. Query-vocabulary prompt
Use when the user wants:

- tags
- hashtags
- search phrases
- language that unlocks the field

Return should emphasize:

- grouped search terms
- negative/exclusion terms
- source-constrained query families
- optionally which surfaces those queries are best used on
- whether the terms were actually validated on those surfaces

Do not drift into:

- site recommendations as the main payload
- campaign examples as the main payload
- plausible-but-untested vocabulary

#### C. Maker / studio / account prompt
Use when the user wants:

- studios
- agencies
- photographers
- publisher nodes
- accounts to follow
- direct operational links

Return should emphasize:

- direct destinations
- what each one repeatedly makes or publishes
- why it is a better next click than a generic platform

Do not drift into:

- Behance/Dribbble/Pinterest/Instagram search pages as the main answer
- vague “search here” advice
#### D. Proof-bearing pages prompt
Use when the user wants:

- direct pages where the object is visibly present
- links that actually show the frame or object in question

Return should emphasize:

- proof-bearing pages only
- why the proof qualifies

Do not drift into:

- descriptive articles without visible proof
- ecosystem maps

#### E. Field-map prompt
Use when the user wants:

- where this object lives
- source ecosystems
- carrier layers
- publication patterns

Return should emphasize:

- classes and layers
- live vs collected-after-the-fact surfaces

Do not drift into:

- kept link lists
- campaign examples as the main deliverable

### When to prefer map-first

Use `map the field` before shortlist when:

- the object clearly exists but is hard to retrieve directly;
- the user does not yet know the carrier layer;
- previous prompts kept returning the wrong source class;
- the search keeps collapsing into adjacent but wrong material.

### Good output object for map-first

- source ecosystems;
- carrier layers;
- surface classes;
- publication patterns;
- source structures, including case-study ecosystems only when they help explain where the material lives;
- where commercial work is actually published.

### Common routing trap

If the user says “where can this be found?” and the answer becomes “here are campaign examples,” the routing failed.

If the user says “give me tags and direct resources” and the answer becomes “go search Behance / Pinterest / Dribbble,” the routing also failed.

## 2. Deep Research Prompt

Use this when the user wants:

- a full Deep Research run;
- a ready-to-paste prompt for ChatGPT Deep Research;
- a structured study rather than a manual source map.

### Recommended structure

```text
Conduct a research study on:
[topic]

Goal:
[decision use case]

Scope:
- object [...]
- timeframe [...]
- geography [...]

Priorities:
- [...]
- [...]

Exclude:
- [...]
- [...]

Source priorities:
- [...]
- [...]

Validation requirements:
- [...]
- [...]

What to return:
1. [...]
2. [...]
3. [...]
4. [...]
```

### Deep Research rule

If the field layer is still unclear, do not fake a full Deep Research prompt.

Instead either:

- ask the next protocol question;
- or recommend a manual-web-search mapping pass first.

## 3. Audit / Red-Team Mode

Use only when:

- results from different prompts are suspiciously similar;
- the task is noisy or failure-prone;
- the user explicitly asks for audit or red-team.

### Minimal audit structure

```text
Audit this prompt against:
- scope control
- source hierarchy
- freshness logic
- anti-surface protection
- exclusions
- output object

Identify:
1. visible failure modes
2. hidden failure modes
3. what should be rewritten

Then produce:
- corrected prompt
- short explanation of the drift
```

### Important note

If the skill is properly grounded from local sources, audit should be needed less often.

But audit is still useful when:

- prompts from different runs start converging to the same stale shape;
- the user suspects the assistant is falling back to memory;
- the result looks polished but suspiciously generic.

## 4. Visual / Commercial Reference Prompt

Use this when the user wants:

- visual references for a commercial or product brief;
- trend-forward work examples with editorial and authorship quality;
- surface or corpus collection in visual/creative/commercial mode.

This template has freshness, source-layer, and quality-floor requirements pre-loaded. Do not remove them.

### Pre-flight check (run before writing the prompt)

- [ ] **Object class locked** — exact object stated (container + mandatory visible element), not just "visual reference" or "branding work" (Thesis 16)
- [ ] Domain mode declared: visual/commercial
- [ ] At least 2 target-resource surfaces from Layer 2 of `approved-anchors.md` are in the source list
- [ ] Freshness constraint active (2024–2026 unless user specifies otherwise)
- [ ] Style quality floor stated
- [ ] Segment qualifier stated (mid-market / mass-commercial / premium / luxury) — required before using awards as entry points (Thesis 18)
- [ ] Product category stated for brief-back check (e.g. "mass-market skincare, pharmacy retail") (Thesis 19)

If any box is unchecked, fix it before writing the prompt body.

### Recommended structure

```text
Task:
[one sentence: what visual/commercial object to find]

Object lock:
[exact object class: container + mandatory visible element, e.g. "retail packaging system, typography visible in frame"]
[segment: mid-market / mass-commercial / premium / luxury]
[product category: e.g. "mass-market skincare — pharmacy retail, Eastern European market"]

Goal:
[decision or use context — what this corpus feeds into]

Primary quality rule:
Real authored commercial work, published 2024–2026, visible editorial decision in frame.
Not: templates, AI mocks, self-initiated concepts, Pinterest repins, uncredited aggregates.

Source layer (minimum 2 from target-resource surfaces):
- [surface 1 from Layer 2 of approved-anchors.md]
- [surface 2 from Layer 2 of approved-anchors.md]
- [award entry surface if needed — secondary only, follow credits to primary surfaces; filter by product category and avoid luxury-only winners for mid-market briefs]
- [taste-anchors if needed for tone calibration only — label them as such]

Freshness gate:
- Accept: page or work has confirmed 2024–2026 publication or activity date.
- Verify first-seen date for shortlisted images using TinEye or Google Lens — page date ≠ image creation date.
- Mark as unverified: date not visible or not confirmable.
- Reject: last active before 2023 unless user explicitly allows archival material.

Exclude:
- [from rejected-surfaces-and-antiqueries.md — list relevant ones explicitly]
- dated-looking work (pre-2022 visual language)
- template / AI-mock / prompt-marketplace results
- generic platform search pages as deliverables
- cross-category references presented as direct analogs without labeling

Style quality floor:
[state what "current and non-generic" means for this brief, e.g.: "editorial typography visible, not just nice product photo", "2025-era layout logic, not 2015 e-commerce grid"]

What to return:
1. [primary output object — surfaces / tags / makers / proof pages / cases]
2. Freshness status per result: confirmed page date + first-seen date check result (TinEye/Google Lens) where applied
3. Why each result qualifies: object match + authorship + stylistic currency + category match
4. Category match status: direct (same product category) or cross-category borrowing (label which)
5. What signal is weak or missing

Anti-surface check:
- No results from rejected-surfaces-and-antiqueries.md
- No generic platform search pages substituted for direct resources
- No taste-anchors substituted for target-resource surfaces in the main deliverable
- No award gallery pages as final deliverable — use them as entry points only
```

### Common failure modes for this template

| Failure | Signal | Fix |
|---------|--------|-----|
| Object class not locked before query | Query starts with "find visual references for X" — no container, no visible element stated | Apply Thesis 16: lock container + mandatory visible element first |
| Taste-anchors used as primary deliverable | Awwwards / Cosmos in the main result table | Move to secondary; add Layer 2 surface |
| Freshness not checked | No dates, vague "recent" language | Force date verification per source |
| First-seen date skipped | Page date used, image may be pre-2022 | Apply TinEye / Google Lens check to shortlisted images (Thesis 17) |
| Award winner used directly for mid-market brief | Cannes / D&AD winner shown as direct reference | Filter by segment and category; follow credits to primary surfaces (Thesis 18) |
| Cross-category reference unlabeled | Beer packaging shown as skincare reference without note | Label as cross-category borrowing; apply brief-back check (Thesis 19) |
| Object substitution | Asked for sites, returned cases | Re-lock output object, rewrite What to return |
| Style floor not enforced | Dated-looking or template-like results passed through | Apply Thesis 15 markers explicitly |
| Behance used as standalone answer | "Search Behance for X" | Demote to secondary corroboration with specific query |
