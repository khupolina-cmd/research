# Source Touch Order

Use this file to decide what to open before drafting a prompt.

## Universal minimum

Always open:

1. the local instruction file (`AGENTS.md` or equivalent);
2. one additional methodology file that matches the task.

Two touched sources is the minimum.

## If the task is Deep Research prompt building

Open:

1. `AGENTS.md`
2. `deep-research-prompt-agent.md` or `research-prompt-archive.md`

Use:

- `deep-research-prompt-agent.md` for output format and interaction shape;
- `research-prompt-archive.md` for known baseline failures and reuse logic.
- `prompt-templates.md` for choosing between Manual Web Search Prompt and Deep Research Prompt.

## If the task is manual web search / reference retrieval / corpus prep

Open:

1. `AGENTS.md`
2. `manual-web-search-system.md`
3. `prompt-templates.md`
4. `output-object-routing.md`

This is the default pair for:

- reference hunts;
- article refresh prompts;
- inspiration hunting;
- corpus collection;
- source mapping;
- contradiction-seeking web prompts.

## If the task is visual / creative / trend research in this project

Open:

1. `AGENTS.md`
2. `manual-web-search-system.md`
3. local atlas / registry if present
4. `output-object-routing.md`
5. `prompt-templates.md`

In this project, the atlas layer includes:

- approved anchors / whitelist — note the two-layer structure in `approved-anchors.md`: Layer 1 taste-anchors (tone only) and Layer 2 target-resource surfaces (visual/commercial retrieval). In visual/commercial mode, require at least 2 Layer 2 surfaces;
- blacklist;
- anti-query patterns;
- prompt blocks and prior failed branches.

If the atlas exists and you do not consult it, you are likely to reintroduce banned surfaces or forget live project overrides.
If extracted text references exist, prefer them over scraping logic back out of a large HTML atlas.

## If the user is complaining about prompt drift or memory-led work

Open:

1. `AGENTS.md`
2. `research-prompt-archive.md`
3. the most relevant live method file (`manual-web-search-system.md` for search work)
4. whitelist / blacklist references if the task is reference hunting
5. `output-object-routing.md` if the bad result may have returned the wrong object type

Your job is to anchor the next prompt in explicit prior failures, not to improvise.

## Practical rule

Do not open everything every turn.

Open the smallest set of local files that gives you:

- project behavior rules;
- task-specific method rules;
- output-object routing;
- live overrides for the current branch.
