---
name: deep-research-source-runtime
description: Build or refine Deep Research prompts, manual web-search prompts, reference-hunting prompts, and prompt QA with explicit source grounding instead of memory. Use this whenever the user asks to formulate a research prompt, says prior prompts became generic or stale, wants prompt red-teaming, or is working inside the Deep Research project with local methodology files. Make sure to use this skill for manual web search, reference retrieval, inspiration hunting, or any prompt-building task in that project, even if the user does not explicitly mention “sources” or “methodology.”
---

# Deep Research Source Runtime

This skill exists to stop memory-led prompting.

Use it when the task is not "answer the topic", but "build the prompt/protocol that will search the topic well".

## Core rule

If relevant local methodology files exist, do not draft the prompt from memory.

Before writing a final prompt, open:

1. `AGENTS.md` or the local project instruction file.
2. At least one additional relevant methodology file.
3. For visual/reference-hunting tasks in this project, the atlas/registry layer if present.
4. The local whitelist / blacklist references if they exist for this branch.

If you have not touched the relevant local sources in this turn, you are not ready to produce the prompt.

Use [references/source-touch-order.md](references/source-touch-order.md) to decide which files to open.
Use [references/runtime-theses.md](references/runtime-theses.md) to pull only the relevant rules instead of dragging the whole project into the answer.
Use [references/output-object-routing.md](references/output-object-routing.md) to lock the output object before drafting the prompt.
Use [references/approved-anchors.md](references/approved-anchors.md) and [references/rejected-surfaces-and-antiqueries.md](references/rejected-surfaces-and-antiqueries.md) as live allow/deny layers when the task is reference hunting.
Use [references/prompt-templates.md](references/prompt-templates.md) to choose the right prompt shape instead of improvising the structure from scratch.

## What to do in a turn

### 1. Ground first

In a short commentary update, say which local sources you are grounding from.

Example:

`Using deep-research-source-runtime; grounding from AGENTS.md + manual-web-search-system.md + atlas overrides.`

Do not pretend to be grounded if you have not opened the files yet.

### 2. Extract only the active theses

Do not re-dump the whole methodology.
Pull only the rules that materially affect the current request:

- scope control;
- output-object routing;
- source hierarchy;
- freshness logic;
- anti-surface rules;
- valid proof;
- exclusions;
- one-run feasibility;
- expected output shape.

Also extract live overrides from the current thread:

- previously rejected surfaces;
- previously approved anchors;
- rejected tag families or anti-query patterns;
- already-fixed scope decisions like `map first, shortlist later`.

If the current conversation already resolved one of these points, do not ask it again unless there is a real conflict.

Before drafting the prompt, explicitly decide what the user is asking to retrieve.

Typical output objects in this project are different and must not be substituted for each other:

- `surfaces / sites / resources`
- `query vocabulary / tags / hashtags / search phrases`
- `makers / studios / agencies / accounts / publisher nodes`
- `proof-bearing pages` where the object is visibly present
- `cases / campaigns / examples`
- `field map / source ecosystems`

If the user asked for one of these, do not silently return another.
If you are not sure which one they mean, ask a short discriminative question.
If the thread already makes it clear, lock it and move on.

Important:

- `case structure` can be a useful source trait
- but `case structure` is not itself the requested output object unless the user asked for cases
- broad search destinations like generic Behance, Dribbble, Pinterest, or Instagram search pages are not acceptable final resources when the user asked for direct operational links

### 3. Work in the project's thinking style

When the user is still thinking out loud:

- briefly reflect what you understood;
- point to the fog or the actual fork;
- ask only 1-3 strong questions;
- do not freeze the task into a big structure too early.

Questions must change the search protocol, not just decorate the conversation.

### 4. Build the prompt only when it is actually ready

Default final prompt length:

- target `220-450` words;
- soft ceiling `650`;
- if the task gets wider than that, narrow or split instead of padding.

Choose the correct template family first:

- `Manual Web Search Prompt` when the user wants to map surfaces, collect a corpus, hunt references, refresh links, or probe where material lives.
- `Deep Research Prompt` when the user wants a ready-to-paste prompt for ChatGPT Deep Research to run a full study.

Do not blur these two into one hybrid unless the user explicitly wants a two-phase prompt.
Inside each family, choose the right output-object submode from [references/output-object-routing.md](references/output-object-routing.md).

### 5. Keep manual web-search prompts on the rails

For manual web search, reference retrieval, inspiration hunting, or corpus building:

- include the anti-surface layer by default;
- prefer a smaller kept corpus over fake completeness;
- treat top-ranked or easy results as weak until displaced, justified, or downgraded;
- search for surfaces and evidence slots, not for a final answer in one hop.
- do not let a `surface-finding` request collapse into `case lists`;
- do not let a `tags/query vocabulary` request collapse into `site recommendations`;
- do not let a `field map` request collapse into `kept links`;
- do not let `proof-bearing pages` be replaced by pages that merely describe likely relevant work.
- do not let a useful trait like `has case structure` override the requested output object.
- do not treat generic search destinations as validated resources, studios, or publisher nodes.
- do not treat formally matching but stylistically dated / cheap / template-like results as good enough when the user explicitly wants current stylish 2025–2026 work.

### 6. For visual / creative tasks, ask anti-failure questions first

Prioritize:

1. what obvious junk must be excluded;
2. what counts as valid proof;
3. which surfaces are useful or harmful;
4. whether this should be mapped first or shortlisted now;
5. only then narrower visual/commercial distinctions if still needed.

Do not hide inside luxury-safe examples just because they are easier.
If the field layer is unclear, default to `map the field` before `shortlist`.

### 7. Respect live project overrides

If a local atlas or registry exists, check it before recommending surfaces.

In this project that means:

- use the whitelist as approved anchors, not just as nice-to-have links;
- use the blacklist and anti-query layer as active exclusions, not as commentary;
- do not reintroduce a banned surface through a summary card, prompt example, or “maybe” list.
- carry forward user-approved and user-rejected items from the active thread even if they are not yet written into a permanent file.
- carry forward object-level corrections from the thread, especially:
  - `user asked for sites, not cases`
  - `user asked for tags/query vocabulary`
  - `user asked for proof pages with visible examples`
  - `user asked for field map only`

Thread history is part of the runtime.
Do not behave as if each prompt-building turn starts from zero.

### 8. Know when to ask and when to stop asking

The skill may ask a few sharp questions if the protocol is still underdetermined.

But if the user has already answered the key protocol questions in the thread, move to the prompt.

The goal is:

- minimal necessary questions;
- then a full ready-to-paste prompt under the user's actual constraints.

### 9. Final prompt format

When enough is clear, return:

`Final prompt`

`Prompt notes`

Only add extra explanation if it materially helps.

If the user asked only for the prompt, do not drift into a methodology lecture.

## Runtime checks before you send a final prompt

Run this mental checklist:

- Did I open the relevant local sources in this turn?
- Did I consult the current thread history for already-fixed decisions?
- Am I using rules from them, not from memory?
- Is the task narrow enough for one run?
- Did I separate map vs shortlist if needed?
- Did I lock the correct output object instead of substituting it?
- Did I make the exclusions explicit?
- Did I define what counts as proof or signal?
- Did I avoid obvious junk classes already rejected in the project?
- Did I keep the prompt compact instead of compensating with verbosity?

If the answer to any of these is "no", fix that first.
