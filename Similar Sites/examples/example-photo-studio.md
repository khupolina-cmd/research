# Example: Commercial Photography Studio Portfolio

**Input URL:** `https://[example-photo-studio].com` (a commercial photography studio with a polished portfolio site)

This example shows how the agent handles a visual / portfolio-type site, identifies quality markers that are different from editorial content, and filters out amateur or template-based portfolios.

---

## Step 1-2 — Source analysis

The agent scrapes the input portfolio site and produces the following profile:

```json
{
  "topic": "commercial photography portfolio",
  "content_type": "portfolio",
  "quality_score": 8,
  "quality_markers": [
    "custom site design (not a template)",
    "high-resolution editorial and commercial photography",
    "clear case structure: client, brief, result",
    "named clients in recognizable brand categories",
    "visible credits and production team",
    "consistent visual identity across projects"
  ],
  "audience_level": "intermediate",
  "search_keywords": ["commercial photography portfolio", "editorial photography studio", "brand photography", "advertising photography"]
}
```

**Agent note before proceeding:**
> Source profile confirmed. Portfolio site, quality score 8 / intermediate audience (industry peers and prospective clients). Looking for studios with comparable production level, similar case-structure presentation, and professional client work — not hobbyist galleries or stock platforms. Proceeding to search.

---

## Step 3 — Search queries

```
1. "commercial photography studio portfolio site"
2. "editorial photography agency portfolio case studies"
3. "advertising photography studio professional portfolio"
4. "brand photography studio named clients work"
5. "commercial photographer portfolio NOT stock NOT unsplash"
```

---

## Step 4-5 — Candidate scoring (selected examples)

| Candidate | quality_score | audience_level | passes filter |
|---|---|---|---|
| `studioXYZ.com` (professional commercial studio) | 8 | intermediate | ✅ yes |
| `agencyphoto.co` (mid-size editorial agency) | 7 | intermediate | ✅ yes |
| `visualstories.studio` (brand photography studio) | 8 | intermediate | ✅ yes |
| `photographybyjohn.wordpress.com` | 3 | beginner | ❌ no — score gap 5 AND audience mismatch |
| `500px.com` | 5 | beginner | ❌ no — score gap 3, stock/hobbyist platform |
| `pexels.com` | 4 | beginner | ❌ no — stock platform, not a studio portfolio |
| `modernphotographer.net` | 6 | intermediate | ✅ yes |
| `freelancephoto.io` | 4 | beginner | ❌ no — score gap 4, personal freelance blog |
| `creativeagencyphoto.com` | 9 | intermediate | ✅ yes |

**Quality filter:** `|source_score - candidate_score| <= 2` AND `audience_level == intermediate`

**Key distinction for portfolio sites:**
Quality markers here are visual and structural — not textual depth. The agent uses case structure clarity, client tier, production values, and site design as quality signals instead of article depth or citation quality.

---

## Step 6-8 — Final output

# Similar Sites Report

## Source Site

- **URL:** https://[example-photo-studio].com
- **Topic:** commercial photography portfolio
- **Content Type:** portfolio
- **Quality Score:** 8/10
- **Audience Level:** intermediate
- **Quality Markers:** custom design, high-resolution commercial work, case structure with client context, consistent visual identity

---

## Similar Sites Found

### 1. Creative Agency Photo

- **URL:** https://creativeagencyphoto.com
- **Why similar:** Full-service commercial photography studio with a structured portfolio showing advertising and brand campaigns. Each project includes client name, brief context, and production stills. Design is custom and high-production. Matches the source in visual standard, case presentation, and professional client tier.
- **Quality Score:** 9/10
- **Topic match:** advertising and brand photography, campaign portfolio
- **Audience Level:** intermediate

---

### 2. Studio XYZ (commercial studio)

- **URL:** https://studioXYZ.com
- **Why similar:** Commercial studio portfolio with clean case layouts, named clients from retail and lifestyle sectors, and consistent editorial photography work. Site design and photography quality are at the same professional tier as the source.
- **Quality Score:** 8/10
- **Topic match:** commercial and editorial photography portfolio
- **Audience Level:** intermediate

---

### 3. Visual Stories Studio

- **URL:** https://visualstories.studio
- **Why similar:** Brand photography studio portfolio with a tight editorial aesthetic. Projects are presented with creative context and client briefs. Production values and site execution match the source's standard. Scope is slightly narrower (brand/product focus) but quality parity is high.
- **Quality Score:** 8/10
- **Topic match:** brand and product photography portfolio
- **Audience Level:** intermediate

---

### 4. Agency Photo Co

- **URL:** https://agencyphoto.co
- **Why similar:** Mid-size editorial agency with a range of commercial work across fashion, lifestyle, and advertising. Portfolio is well-structured, with visible case context and strong production quality. One step below the source in visual polish but within the quality tolerance.
- **Quality Score:** 7/10
- **Topic match:** editorial and advertising photography portfolio
- **Audience Level:** intermediate

---

### 5. Modern Photographer Network

- **URL:** https://modernphotographer.net
- **Why similar:** Portfolio platform curated for professional commercial photographers. Featured portfolios are reviewed for production quality. Works as a discovery layer for studios at this tier. Content type is slightly different (curated directory vs single studio), but quality standard is consistent.
- **Quality Score:** 6/10
- **Topic match:** commercial photography portfolio discovery
- **Audience Level:** intermediate

---

## Search Methodology

**Queries used:**

1. `"commercial photography studio portfolio site"`
2. `"editorial photography agency portfolio case studies"`
3. `"advertising photography studio professional portfolio"`
4. `"brand photography studio named clients work"`
5. `"commercial photographer portfolio NOT stock NOT unsplash"`

**Candidate pool:** 19 sites collected across 5 queries.

**Quality filter results:** 5 passed, 14 rejected.

**Notable rejects:**

- `photographybyjohn.wordpress.com` — rejected: quality score 3, amateur personal blog, no case structure, beginner audience
- `500px.com` — rejected: quality score 5, hobbyist/stock platform, beginner audience framing
- `pexels.com` — rejected: quality score 4, stock photography platform, not a studio portfolio
- `freelancephoto.io` — rejected: quality score 4, personal freelance site with minimal case structure

**Tolerance used:** 2 (default)

**Note on portfolio quality assessment:**
For portfolio sites, quality markers differ from editorial content sites. The agent evaluates: custom vs template design, case structure (client + brief + result vs just gallery), production consistency, visible client tier, and site execution. Depth of written content is secondary to visual and structural quality signals.
