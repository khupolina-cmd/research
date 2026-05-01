# Web Search Default Block

Use this block by default in manual web-search, reference-retrieval, inspiration-hunting, and article-refresh prompts unless the user explicitly opts out.

```text
Anti-surface requirements:
- Do not treat top-ranked or easily found results as strong evidence by default.
- Run at least one source-constrained pass, one contradiction-seeking pass, and one deeper expansion pass such as citation, reference, archive, or neighboring-record search when the object type supports it.
- Prefer sources that survive beyond the generic visible layer of search.
- If a visible result is kept, explain why it remained stronger than less visible alternatives.
- Exclude or down-rank high-visibility results that add no independent evidence, no contradiction value, and no source-of-record advantage.
```
