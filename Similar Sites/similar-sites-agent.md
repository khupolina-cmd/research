# Similar Sites by Content — Agent Instructions

## Primary role

Work as a `Similar Sites Agent`, not as a general recommender.

The default task in this folder is:

1. take a URL from the user;
2. scrape and analyze its content profile;
3. find and score candidate sites;
4. filter by quality parity;
5. return a ranked, explained shortlist of genuinely similar sites.

Do not return sites based on topic alone.
Do not return sites you have not analyzed.
Do not pad the output if fewer than 5 sites pass the filter.

## When to use this skill

Use it when the user:

- provides a URL and asks for "similar sites", "sites like this", or "what else covers this topic at this level";
- wants to benchmark a site against quality-equivalent alternatives;
- is doing research and needs a reference set of sites matched to a specific editorial standard.

Do not use it for:

- generic popularity-based recommendations ("top sites about X");
- SEO backlink or technical competitor discovery;
- social media account recommendations;
- finding sites on a topic where quality does not matter.

## Execution steps

### 1. Receive and validate the input

Accept a URL as input.
If the URL is:
- inaccessible or blocked → stop and say so clearly;
- a social media profile → explain this skill works on websites, not profiles;
- already an aggregator or list → note that and ask the user if they want to analyze a specific site from the list instead.

### 2. Scrape and analyze the source

Scrape: title, headings, body text (2000–3000 words), meta description, structure.
Produce a source profile using this schema:

```json
{
  "topic": "3-5 words",
  "content_type": "articles | portfolio | catalog | blog | news | docs | ...",
  "quality_score": 1-10,
  "quality_markers": ["..."],
  "audience_level": "beginner | intermediate | expert",
  "search_keywords": ["keyword1", "keyword2", "keyword3"]
}
```

If content_type is `portfolio`, also produce a `visual_profile` block:

```json
"visual_profile": {
  "photography_genre": "fashion | editorial | commercial | portrait | documentary | architectural | product | street | fine-art | wedding | other",
  "mood": "moody/dark | bright/airy | clean/minimalist | dramatic | cinematic | raw | other",
  "color_treatment": "warm | cool | neutral | desaturated | high-contrast | film-emulation | other",
  "aesthetic_currency": "current (2022+) | recent (2018–2021) | dated (pre-2018)",
  "style_tags": ["tag1", "tag2", "tag3"]
}
```

Derive `visual_profile` from displayed work — gallery thumbnails, project headers, visible stylistic descriptors. If images are not accessible, note this and estimate from page copy and project titles.

Show the source profile to the user before proceeding.
If anything is ambiguous, ask one short clarifying question before building search queries.

### 3. Build search queries

Generate 3-5 targeted queries from the source profile.
Queries must be designed to surface same-type, same-topic sites.
Avoid queries likely to return aggregators, Wikipedia, Reddit, or major social platforms.

For portfolio sites, include style-anchored queries using `visual_profile` data:
- `"<photography_genre> photographer portfolio <mood> aesthetic"`
- `"<photography_genre> photography <style_tag1> <style_tag2> portfolio site"`
- `"<photography_genre> photographer portfolio 2023 OR 2024 OR 2025"`

Show the query list to the user before running the search.

### 4. Collect and score candidates

Run queries. Collect 15-25 candidate URLs.
For each candidate: scrape and analyze using the same schema as Step 2.
If scraping fails, estimate conservatively or skip the candidate.

### 5. Filter

Apply the quality match rule:

```
passes = (|source.quality_score - candidate.quality_score| <= 2)
          AND (source.audience_level == candidate.audience_level)
```

Discard any candidate where `passes = False`.
Do not adjust the tolerance silently to inflate the result count.

For portfolio sites, also apply a visual genre filter after quality matching:

```
GENRE_FAMILIES = [
  {fashion, editorial},
  {documentary, street},
  {architectural, product},
  {portrait, fine-art},
  {commercial, advertising},
]

genre_matches = (source.genre == candidate.genre)
                OR (both genres share a GENRE_FAMILY)

Discard any portfolio candidate where genre_matches = False.
```

A portrait photographer does not match a fashion portfolio, even at equal quality scores.

### 6. Rank

Rank passing candidates by semantic similarity to the source:
1. embedding cosine similarity (preferred);
2. shared search keyword count;
3. same `content_type`;
4. closer `quality_score` value.

For portfolio sites, additionally rank by visual style proximity:
1. `style_tags` overlap (shared tags between source and candidate);
2. matching `mood`;
3. matching `color_treatment`;
4. prefer `aesthetic_currency: current (2022+)` over `recent` or `dated`.

### 7. Output

Use the template in `similar-sites-output-template.md`.
Return top 5 (or fewer if fewer passed the filter).
Include a Search Methodology section.

## Quality matching criteria

The quality filter is the core differentiator of this skill.

**Hard thresholds:**

| Criterion | Rule |
|---|---|
| Quality score gap | `|source - candidate| <= 2` |
| Audience level | must match exactly |

**Quality score reference:**

| Score | Meaning |
|---|---|
| 9-10 | Primary research, original data, expert-level sourcing |
| 7-8 | Substantive expert writing, cited and structured |
| 5-6 | Solid informational, moderate depth, accurate |
| 3-4 | Thin, surface-level, low editorial standard |
| 1-2 | SEO-padding, shallow, potentially misleading |

A site scoring 4 is not a valid match for a site scoring 8, even if the topics are identical.

## Visual matching criteria (portfolio sites only)

For `content_type: portfolio`, a second hard filter applies — genre must match:

**Genre families (compatible genres):**

| Family | Genres |
|---|---|
| Fashion / editorial | fashion, editorial |
| Street / documentary | street, documentary |
| Architecture / product | architectural, product |
| Portrait / fine-art | portrait, fine-art |
| Commercial / advertising | commercial, advertising |

A portfolio that passes quality matching but whose genre does not share a family with the source is rejected.

After filtering, portfolio candidates are additionally ranked by:
1. `style_tags` overlap;
2. matching `mood`;
3. matching `color_treatment`;
4. `aesthetic_currency` — prefer `current (2022+)` over `recent` or `dated`.

## Output format

Use `similar-sites-output-template.md` as the exact format.

Summary of required sections:

- **Source Site** — topic, content type, quality score, audience level; for portfolios also visual profile (genre, mood, color treatment, aesthetic currency, style tags)
- **Similar Sites Found** — top 5 (or fewer), each with URL, why similar, quality score, topic match, audience level; for portfolios also genre and visual style
- **Search Methodology** — queries used, candidate count, pass rate, notable rejects

"Why similar" must reference content, quality evidence, and audience — not just topic. For portfolio results it must also reference genre, mood/color treatment, and aesthetic currency.

## Examples

### Input: `https://science.nasa.gov`

Expected source profile:
- topic: space science and exploration
- content type: articles
- quality score: 9
- audience level: intermediate

Expected output: science communication sites with deep space coverage, similar depth and accuracy (e.g., ESA Science, Sky & Telescope, Astronomy Magazine).

Expected rejects: space click-bait blogs, entertainment-focused sites with shallow science, SEO-driven listicle sites about space.

### Input: `https://[photo-studio-portfolio-site]`

Expected source profile:
- topic: commercial photography portfolio
- content type: portfolio
- quality score: 8
- audience level: intermediate (clients and industry peers)

Expected output: other commercial photography portfolios with comparable production quality, clear case structure, and similar client tier.

Expected rejects: amateur photography blogs, low-production portfolios, stock photography sites.

## Hard rules

- Never return a site that failed the quality_matches filter.
- Never invent candidate sites. All candidates must come from search results.
- Never treat high traffic, SEO rank, or name recognition as a quality signal.
- If the page is inaccessible, say so and do not proceed with guesses.
- If fewer than 3 sites pass, report that clearly and explain the gap.
- Do not ask decorative clarifying questions. Ask only if it changes the search protocol.
