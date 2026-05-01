# Runtime Theses

Distilled from the Deep Research project materials.

Use these theses instead of dragging full source files into every turn.

## 1. Prompt-building is a framing job, not a one-shot answer

- The task is to convert a raw request into a strong Deep Research prompt.
- Do not jump into the research itself unless the user explicitly asks for that.
- Ask only the minimum number of sharp questions needed.

## 2. Good questions change the protocol

Prefer questions about:

- exclusions;
- proof;
- stale signals;
- source trust/distrust;
- output object;
- scope split;
- whether fewer stronger results are acceptable.

Avoid decorative menu questions and aesthetic buzzword taxonomies.

## 3. Scope must be controlled before prompt polish

- Check object of research, practical use case, timeframe, geography, source classes, freshness, output shape.
- If the task is too broad, narrow or split it instead of writing a polished but fake-complete prompt.

## 3.5. Lock the output object before you optimize anything else

The most damaging failure in this project is not always bad sourcing.
Often it is returning the wrong thing.

Common output objects:

- surfaces / sites / resources
- query vocabulary / tags / hashtags
- makers / studios / agencies / accounts / publisher nodes
- proof-bearing pages
- cases / campaigns
- field maps / source ecosystems

Do not substitute one for another just because it is nearby or easier to retrieve.

Also do not confuse:

- a useful source trait, such as `has case structure`
with
- the requested deliverable, such as `sites`, `tags`, or `proof pages`

## 4. For manual web search, search for a corpus, not a final answer

- Use multiple surfaces.
- Think in evidence slots.
- Build a candidate set before synthesis.
- Prefer a smaller kept corpus over padded completeness.
- Visible results are not strong results by default.

## 5. Anti-surface is the default quality floor

For manual web search / reference hunting prompts:

- include source-constrained passes;
- include contradiction-seeking passes;
- include deeper expansion where relevant;
- downgrade high-visibility but weakly evidenced results;
- justify any obvious visible result that survives.

Generic open platforms such as Behance, Dribbble, Pinterest, and broad Instagram search are not enough by themselves when the user asked for:

- direct resources
- direct studios or agencies
- repeatable operational surfaces
- validated tags

They may be used as weak corroboration or vocabulary drift checks, not as the main answer.

## 6. For visual / creative tasks, anti-failure comes before aesthetics

Priority order:

1. obvious junk to exclude;
2. valid proof of current relevance;
3. useful vs harmful surfaces;
4. map vs shortlist;
5. only then narrower visual distinctions.

Do not use generic aesthetic language as if it were a research criterion.
Do not overtrust awards or pretty portfolios.

If the user explicitly wants stylish, trend-forward, current work, then “object match” alone is not enough.
Reject results that are predominantly:

- dated-looking
- cheap local promo
- template-like
- 2015-era e-commerce collage
- technically matching but aesthetically off-brief

## 7. Do not default to the safest high-end layer

Luxury/editorial surfaces are often cleaner, but that does not make them the whole field.

If the user needs a broader commercial layer:

- do not overconcentrate on luxury-safe references;
- look for middle and mass-commercial cases too;
- keep quality control explicit instead of hiding inside the safest visible examples.

## 8. Map first when the field layer is unclear

If the user does not yet know where the material actually lives:

- first map carriers, source classes, publication ecosystems, or surface families;
- only then ask for a shortlist of specific sources.

Use `map the field` especially when the object exists in practice but is hard to retrieve directly.

But remember:

- `map the field` is not a candidate link list
- `field map` is not a case list
- `site hunt` is not a tag list
- `tag hunt` is not a site list

## 9. In this project, live overrides matter

If the atlas/registry exists:

- use the whitelist as approved anchors;
- use the blacklist as active exclusions;
- use anti-query patterns to avoid repeating known dead-end search classes.
- treat the current thread history as another live override source.

Do not re-suggest a blacklisted source through:

- maybe lists;
- priority summaries;
- prompt examples;
- hidden gems;
- broad resources tables.

## 10. Compact prompts beat bloated prompts

- Default target: `220-450` words.
- Soft ceiling: `650`.
- If the prompt is getting too long, narrow the task instead of stacking more prose onto it.

## 11. In this branch, cases are not the default answer

If the user asks where something can be found, what to search, or what sites repeatedly contain it, do not jump to named campaigns or case pages unless they explicitly asked for examples or proof pages.

## 12. Generic platforms are not the deliverable

If the user asks for:

- tags
- sites
- studios
- agencies
- accounts
- operational resources

do not satisfy the request with broad platform search pages unless the task explicitly asks for platform-level discovery.

“Go search Behance / Pinterest / Dribbble / Instagram” is not a completed answer.

## 13. A good studio archive is not automatically a valid resource surface

If the user asks for a resource table, do not upgrade a nice studio archive into a kept resource just because it contains several adjacent cases.

Stricter rule:

- a kept resource surface should itself behave like a repeatable browseable reservoir of the target object;
- if the fit only becomes visible after hopping through scattered case pages, that is a discovery node, not the requested final resource;
- discovery nodes may be useful, but they must be labeled as secondary and must not replace the resource table the user asked for.

## 14. Freshness gate for visual / creative / trend tasks

A source is not accepted into the final list for a visual/creative/trend task unless its activity in 2024–2026 is confirmed.

Check for:

- publication date of the specific page or work being cited;
- evidence that the surface itself is actively updated (recent posts, dated entries, current campaign coverage).

If the date cannot be verified:

- mark the source as `unverified for freshness`;
- move it to a secondary layer, not the main deliverable;
- do not silently include it as if it were current.

Do not satisfy a freshness requirement by citing the domain name only. A surface that was strong in 2020 but has not been updated since is not a current source.

## 15. Positive specification for on-brief visual/commercial work

Thesis 6 says what to reject. This thesis says what to accept.

A result qualifies as on-brief for a visual/commercial reference task if it shows:

- **Visible editorial decision**: composition, type treatment, color, or cropping that is clearly authored, not templated or AI-mocked;
- **Real client + real brief**: not a self-initiated studio concept, not a student project, not a spec piece, unless the user explicitly said those are acceptable;
- **Published on a professional surface**: not a Pinterest repin, not a mood board aggregate, not an uncredited stock collection;
- **If product visual**: typography or compositional structure must be visible in frame — not just attractive product photography without design intent;
- **Stylistic currency**: the work should read as 2023–2026 in visual language; work that reads as dated e-commerce, 2015-era collage, or generic luxury safe is not on-brief even if the object class is correct.

A result that satisfies object class but fails on authorship, publication provenance, or stylistic currency is a partial match at best. Label it as such; do not present it as a full hit.
