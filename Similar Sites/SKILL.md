---
name: similar-sites-by-content
description: Find websites that are similar to a given URL — strictly matching on both topic and content quality level. Use this skill when the user provides any URL and wants discovery of comparable sites at the same depth, audience level, and editorial quality. Do not use for link finding, SEO competitor analysis, or generic "related sites" lookups.
---

# Similar Sites by Content

This skill finds websites that match a given URL **on two axes at once**: topic closeness and content quality parity.

Topic match alone is not enough. A low-quality space blog is not a valid result for a high-quality space magazine. Quality parity is a hard filter, not a nice-to-have.

## What the skill does

1. Scrapes the input URL and extracts its content profile.
2. Scores the source site: topic, content type, quality, audience level, search keywords.
3. Builds targeted search queries and collects site candidates.
4. Scores each candidate using the same analysis schema.
5. Filters candidates by `|quality_score_diff| <= 2` AND matching `audience_level`.
6. Ranks survivors by semantic content similarity.
7. Returns the top 5 matching sites with explanations.

## When to use

- "Find me sites like X."
- "What other sites cover this topic at the same level?"
- "I like this site — show me similar ones."
- "Are there other portfolio sites as polished as this one?"

## When NOT to use

- SEO backlink or competitor discovery — use a dedicated SEO tool.
- Finding all sites on a topic regardless of quality — this skill filters by quality.
- Social media account discovery — this skill is for websites.

## Inputs

| Field | Type | Required | Notes |
|---|---|---|---|
| `url` | string | yes | Any publicly accessible URL |
| `tolerance` | int | no | Quality score tolerance, default `2` |
| `top_n` | int | no | Number of results to return, default `5` |

## Output

A structured `Similar Sites Report` containing:

- source site profile (topic, content type, quality score, audience level);
- top `N` matching sites, each with URL, quality score, topic match description, and similarity reasoning;
- search methodology notes.

See `similar-sites-output-template.md` for the exact output format.

## Quality matching rule

```python
def quality_matches(source, candidate, tolerance=2):
    score_match = abs(source.quality_score - candidate.quality_score) <= tolerance
    level_match = source.audience_level == candidate.audience_level
    return score_match and level_match
```

Both conditions must pass. A site that is close in score but targets a different audience level is rejected.

## Visual matching rule (portfolio sites only)

When `content_type == "portfolio"`, an additional filter applies after quality matching:

```python
GENRE_FAMILIES = [
    {"fashion", "editorial"},
    {"documentary", "street"},
    {"architectural", "product"},
    {"portrait", "fine-art"},
    {"commercial", "advertising"},
]

def genre_matches(source_genre, candidate_genre):
    if source_genre == candidate_genre:
        return True
    for family in GENRE_FAMILIES:
        if source_genre in family and candidate_genre in family:
            return True
    return False

def visual_matches(source, candidate):
    return genre_matches(source.visual_profile.photography_genre,
                         candidate.visual_profile.photography_genre)
```

A portfolio candidate that passes quality matching but fails `visual_matches` is rejected.

After filtering, portfolio candidates are ranked by style proximity:
1. `style_tags` overlap (count of shared tags);
2. matching `mood`;
3. matching `color_treatment`;
4. prefer `aesthetic_currency: current (2022+)` over `recent` or `dated`.

## Site analysis schema

```json
{
  "topic": "3-5 words describing the main subject",
  "content_type": "articles | portfolio | catalog | blog | news | docs | ...",
  "quality_score": "1-10",
  "quality_markers": ["deep explanations", "expert tone", "original research", "..."],
  "audience_level": "beginner | intermediate | expert",
  "search_keywords": ["keyword1", "keyword2", "keyword3"]
}
```

For `content_type: portfolio`, also populate a `visual_profile` block:

```json
"visual_profile": {
  "photography_genre": "fashion | editorial | commercial | portrait | documentary | architectural | product | street | fine-art | wedding | ...",
  "mood": "moody/dark | bright/airy | clean/minimalist | dramatic | cinematic | raw | ...",
  "color_treatment": "warm | cool | neutral | desaturated | high-contrast | film-emulation | ...",
  "aesthetic_currency": "current (2022+) | recent (2018–2021) | dated (pre-2018)",
  "style_tags": ["tag1", "tag2", "tag3"]
}
```

## Tooling required

| Task | Recommended tool |
|---|---|
| Scraping | `playwright` (JS-heavy sites) or `requests + BeautifulSoup` |
| Content analysis | GPT-4o / Claude — structured JSON output |
| Candidate search | Bing Search API, Google Custom Search, or SerpAPI |
| Semantic ranking | OpenAI `text-embedding-3-small` + cosine similarity |

## Related files

- `similar-sites-prompt.md` — system prompt for the LLM agent
- `similar-sites-agent.md` — agent behaviour rules
- `similar-sites-output-template.md` — output format template
- `examples/` — worked examples
