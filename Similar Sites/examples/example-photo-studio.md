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
  "search_keywords": ["commercial photography portfolio", "editorial photography studio", "brand photography", "advertising photography"],
  "visual_profile": {
    "photography_genre": "commercial",
    "mood": "clean/minimalist",
    "color_treatment": "neutral",
    "aesthetic_currency": "current (2022+)",
    "style_tags": ["high-production", "brand-driven", "campaign-focused", "clean-edit"]
  }
}
```

**Agent note before proceeding:**
> Source profile confirmed. Portfolio site, quality score 8 / intermediate audience (industry peers and prospective clients). Genre: commercial. Visual style: clean/minimalist, neutral color treatment, current aesthetic (2022+). Looking for studios with comparable production level, matching commercial or advertising genre, and similar visual language — not hobbyist galleries or stock platforms. Proceeding to search.

---

## Step 3 — Search queries

```
1. "commercial photography studio portfolio site"
2. "editorial photography agency portfolio case studies"
3. "advertising photography studio professional portfolio"
4. "brand photography studio named clients work"
5. "commercial photographer portfolio NOT stock NOT unsplash"
6. "commercial photographer portfolio clean minimalist aesthetic 2023 OR 2024 OR 2025"
7. "commercial photography brand-driven campaign portfolio site"
```

---

## Step 4-5 — Candidate scoring (selected examples)

| Candidate | quality_score | audience_level | genre | genre_matches | passes filter |
|---|---|---|---|---|---|
| `studioXYZ.com` (professional commercial studio) | 8 | intermediate | commercial | ✅ same | ✅ yes |
| `agencyphoto.co` (mid-size editorial agency) | 7 | intermediate | editorial | ✅ family match | ✅ yes |
| `visualstories.studio` (brand photography studio) | 8 | intermediate | commercial | ✅ same | ✅ yes |
| `photographybyjohn.wordpress.com` | 3 | beginner | portrait | ❌ score gap 5, audience mismatch, genre mismatch | ❌ no |
| `500px.com` | 5 | beginner | mixed | ❌ score gap 3, stock/hobbyist platform | ❌ no |
| `pexels.com` | 4 | beginner | mixed | ❌ stock platform | ❌ no |
| `modernphotographer.net` | 6 | intermediate | commercial | ✅ same | ✅ yes |
| `freelancephoto.io` | 4 | beginner | portrait | ❌ score gap 4, personal blog, genre mismatch | ❌ no |
| `creativeagencyphoto.com` | 9 | intermediate | commercial | ✅ same | ✅ yes |
| `fineartportrait.studio` | 8 | intermediate | portrait | ❌ genre mismatch (portrait vs commercial) | ❌ no |

**Quality filter:** `|source_score - candidate_score| <= 2` AND `audience_level == intermediate`
**Visual genre filter:** genre must match exactly or share a GENRE_FAMILY (commercial ↔ advertising; fashion ↔ editorial)

**Key distinction for portfolio sites:**
Quality markers are visual and structural — not textual depth. The agent uses case structure clarity, client tier, production values, and site design as quality signals. Genre match is a hard filter: a technically excellent portrait studio is not a valid result for a commercial photography reference.

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
- **Visual Profile:**
  - Genre: commercial
  - Mood: clean/minimalist
  - Color Treatment: neutral
  - Aesthetic Currency: current (2022+)
  - Style Tags: high-production, brand-driven, campaign-focused, clean-edit

---

## Similar Sites Found

### 1. Creative Agency Photo

- **URL:** https://creativeagencyphoto.com
- **Why similar:** Full-service commercial photography studio with a structured portfolio showing advertising and brand campaigns. Each project includes client name, brief context, and production stills. Design is custom and high-production, with a clean neutral palette consistent with the source. Aesthetic is current — most work visible is 2023–2024.
- **Quality Score:** 9/10
- **Topic match:** advertising and brand photography, campaign portfolio
- **Audience Level:** intermediate
- **Genre:** commercial
- **Visual Style:** clean/minimalist — neutral — current (2022+) — high-production, campaign-focused

---

### 2. Studio XYZ (commercial studio)

- **URL:** https://studioXYZ.com
- **Why similar:** Commercial studio portfolio with clean case layouts, named clients from retail and lifestyle sectors, and consistent editorial photography work. Site design and photography quality are at the same professional tier as the source. Visual language matches: minimal layout, neutral color treatment, contemporary production.
- **Quality Score:** 8/10
- **Topic match:** commercial and editorial photography portfolio
- **Audience Level:** intermediate
- **Genre:** commercial
- **Visual Style:** clean/minimalist — neutral — current (2022+) — brand-driven, clean-edit

---

### 3. Visual Stories Studio

- **URL:** https://visualstories.studio
- **Why similar:** Brand photography studio portfolio with a tight editorial aesthetic. Projects are presented with creative context and client briefs. Production values and site execution match the source's standard. Scope is slightly narrower (brand/product focus) but quality parity is high and visual language is aligned.
- **Quality Score:** 8/10
- **Topic match:** brand and product photography portfolio
- **Audience Level:** intermediate
- **Genre:** commercial
- **Visual Style:** clean/minimalist — cool — current (2022+) — brand-driven, product-focused

---

### 4. Agency Photo Co

- **URL:** https://agencyphoto.co
- **Why similar:** Mid-size editorial agency with a range of commercial work across fashion, lifestyle, and advertising. Portfolio is well-structured with visible case context and strong production quality. Genre is editorial (fashion/commercial family) — one step from the source genre but within the compatible family. One step below the source in visual polish but within quality tolerance.
- **Quality Score:** 7/10
- **Topic match:** editorial and advertising photography portfolio
- **Audience Level:** intermediate
- **Genre:** editorial (commercial/editorial family match)
- **Visual Style:** dramatic — warm — recent (2018–2021) — high-production, editorial-campaign

---

### 5. Modern Photographer Network

- **URL:** https://modernphotographer.net
- **Why similar:** Portfolio platform curated for professional commercial photographers. Featured portfolios are reviewed for production quality. Works as a discovery layer for studios at this tier. Content type is slightly different (curated directory vs single studio), but genre and quality standard are consistent with the source.
- **Quality Score:** 6/10
- **Topic match:** commercial photography portfolio discovery
- **Audience Level:** intermediate
- **Genre:** commercial
- **Visual Style:** clean/minimalist — neutral — current (2022+) — high-production

---

## Search Methodology

**Queries used:**

1. `"commercial photography studio portfolio site"`
2. `"editorial photography agency portfolio case studies"`
3. `"advertising photography studio professional portfolio"`
4. `"brand photography studio named clients work"`
5. `"commercial photographer portfolio NOT stock NOT unsplash"`
6. `"commercial photographer portfolio clean minimalist aesthetic 2023 OR 2024 OR 2025"`
7. `"commercial photography brand-driven campaign portfolio site"`

**Candidate pool:** 22 sites collected across 7 queries.

**Quality filter results:** 6 passed, 16 rejected.

**Visual genre filter results:** 5 passed genre match, 1 additionally rejected (`fineartportrait.studio` — portrait genre, not compatible with commercial).

**Notable rejects:**

- `photographybyjohn.wordpress.com` — rejected: quality score 3, amateur personal blog, no case structure, beginner audience
- `500px.com` — rejected: quality score 5, hobbyist/stock platform, beginner audience framing
- `pexels.com` — rejected: quality score 4, stock photography platform, not a studio portfolio
- `freelancephoto.io` — rejected: quality score 4, personal freelance site with minimal case structure
- `fineartportrait.studio` — rejected: quality score 8, passed quality filter, but portrait genre does not share a family with commercial genre

**Tolerance used:** 2 (default)

**Note on portfolio quality and style assessment:**
For portfolio sites, quality markers differ from editorial content sites. The agent evaluates: custom vs template design, case structure (client + brief + result vs just gallery), production consistency, visible client tier, and site execution. Visual style (genre, mood, color treatment, aesthetic currency) is assessed from displayed work. Depth of written content is secondary to visual and structural quality signals.
