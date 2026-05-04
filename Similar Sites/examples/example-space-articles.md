# Example: Space Science Articles Site

**Input URL:** `https://science.nasa.gov`

This example shows how the agent analyzes a high-quality science communication site, builds targeted search queries, and filters out low-quality results before returning matches.

---

## Step 1-2 — Source analysis

The agent scrapes `https://science.nasa.gov` and produces the following profile:

```json
{
  "topic": "space science and exploration",
  "content_type": "articles",
  "quality_score": 9,
  "quality_markers": [
    "primary source organization (NASA)",
    "peer-reviewed backing for claims",
    "expert authors with institutional affiliations",
    "structured long-form articles",
    "original imagery and data visualizations",
    "clear separation of news and in-depth features"
  ],
  "audience_level": "intermediate",
  "search_keywords": ["space science", "astrophysics articles", "planetary science", "NASA research", "astronomy features"]
}
```

**Agent note before proceeding:**
> Source profile confirmed. Quality score 9 / intermediate audience. Looking for science journalism and editorial sites covering space at a comparable editorial standard — peer-grounded, structured, not click-bait. Proceeding to search.

---

## Step 3 — Search queries

```
1. "space science articles magazine intermediate audience"
2. "astrophysics planetary science editorial site"
3. "astronomy long-form articles expert writing"
4. "space research journalism site NOT reddit NOT wikipedia"
5. "ESA OR SpaceX OR telescope science features"
```

---

## Step 4-5 — Candidate scoring (selected examples)

| Candidate | quality_score | audience_level | passes filter |
|---|---|---|---|
| `skyandtelescope.org` | 8 | intermediate | ✅ yes |
| `esa.int/Science_and_Exploration` | 9 | intermediate | ✅ yes |
| `astronomy.com` | 7 | intermediate | ✅ yes |
| `universetoday.com` | 7 | intermediate | ✅ yes |
| `spaceplace.nasa.gov` | 6 | beginner | ❌ no — audience mismatch |
| `space-facts.com` | 3 | beginner | ❌ no — score gap 6 AND audience mismatch |
| `spacenews.com` | 7 | intermediate | ✅ yes |
| `popularmechanics.com/space` | 5 | beginner | ❌ no — score gap 4 AND audience mismatch |
| `thecoolspace.blog` | 2 | beginner | ❌ no — score gap 7, shallow content |

**Quality filter:** `|source_score - candidate_score| <= 2` AND `audience_level == intermediate`

---

## Step 6-8 — Final output

# Similar Sites Report

## Source Site

- **URL:** https://science.nasa.gov
- **Topic:** space science and exploration
- **Content Type:** articles
- **Quality Score:** 9/10
- **Audience Level:** intermediate
- **Quality Markers:** primary source institution, peer-reviewed backing, expert authors, original data and imagery

---

## Similar Sites Found

### 1. Sky & Telescope

- **URL:** https://skyandtelescope.org
- **Why similar:** Publishes long-form feature articles and news on astrophysics, planetary science, and observational astronomy. Editorial standards are high: articles are reviewed by astronomers, include sourced data, and separate news briefs from in-depth features. Closely mirrors NASA Science in depth and factual rigor.
- **Quality Score:** 8/10
- **Topic match:** astrophysics, observational astronomy, planetary science
- **Audience Level:** intermediate

---

### 2. ESA Science & Exploration

- **URL:** https://www.esa.int/Science_and_Exploration
- **Why similar:** European Space Agency's editorial science layer. Primary source organization, original mission data, expert authors. Identical in institutional authority and editorial depth to NASA Science. Covers complementary missions and topics.
- **Quality Score:** 9/10
- **Topic match:** space missions, planetary science, astrophysics
- **Audience Level:** intermediate

---

### 3. Astronomy Magazine (astronomy.com)

- **URL:** https://astronomy.com
- **Why similar:** Long-running print-and-digital publication with structured feature writing, expert contributors, and strong sourcing. Slightly more accessible in tone but retains substantive depth and accurate reporting. Covers space science broadly at the same intermediate level.
- **Quality Score:** 7/10
- **Topic match:** astronomy, space science, sky observation
- **Audience Level:** intermediate

---

### 4. Universe Today

- **URL:** https://universetoday.com
- **Why similar:** High-output science journalism site covering planetary science, astrophysics, and space exploration. Writers are specialists; articles cite peer-reviewed papers and mission updates directly. Volume is higher than NASA Science but editorial quality is consistent at this tier.
- **Quality Score:** 7/10
- **Topic match:** space exploration, astrophysics, planetary science, mission updates
- **Audience Level:** intermediate

---

### 5. Space News (spacenews.com)

- **URL:** https://spacenews.com
- **Why similar:** Industry-facing coverage of space science, policy, and exploration. More business-facing than NASA Science but scientific accuracy is maintained at the same standard. Useful for readers who want both science and institutional context.
- **Quality Score:** 7/10
- **Topic match:** space industry, science policy, launch and exploration coverage
- **Audience Level:** intermediate

---

## Search Methodology

**Queries used:**

1. `"space science articles magazine intermediate audience"`
2. `"astrophysics planetary science editorial site"`
3. `"astronomy long-form articles expert writing"`
4. `"space research journalism site NOT reddit NOT wikipedia"`
5. `"ESA OR SpaceX OR telescope science features"`

**Candidate pool:** 21 sites collected across 5 queries.

**Quality filter results:** 5 passed, 16 rejected.

**Notable rejects:**

- `spaceplace.nasa.gov` — rejected: quality score 6 vs source 9 (gap = 3) AND beginner audience vs intermediate
- `popularmechanics.com/space` — rejected: quality score 5 vs 9 (gap = 4), beginner framing
- `space-facts.com` — rejected: quality score 3, shallow listicle content, beginner audience
- `thecoolspace.blog` — rejected: quality score 2, SEO-pattern writing, no sourcing

**Tolerance used:** 2 (default)
