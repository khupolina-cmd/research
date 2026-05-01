# Output Object Routing

This file exists because many failures in this project were not search failures.
They were output-object substitution failures.

The model correctly noticed a nearby useful thing, then returned the wrong object:

- cases instead of sites
- sites instead of tags
- broad search destinations instead of direct operational resources
- field maps instead of proof pages
- campaign links instead of repeatable surfaces

A second failure mode is subtler:

- the model notices a useful source trait such as `has case structure`
- then mistakes that trait for the requested deliverable

Do not let that happen.

## Step 1. Lock the output object

Before drafting a prompt, decide which of these the user actually wants.

### A. Surfaces / sites / resources
User is asking:

- where this material can be found
- what sites or platforms repeatedly contain it
- what surfaces are worth browsing

Return:

- sites
- source classes
- publication surfaces
- short notes on what each is good for

Quality rule:

- if the user asked for repeatable resource surfaces, the surface itself must repeatedly expose the target object;
- a studio archive with several loosely adjacent case pages is not the same thing as a true repeatable resource surface;
- if proof depends on jumping case-to-case, classify it as a `maker / studio node` or `discovery node`, not as the final resource layer.

Do not return:

- campaign case lists
- individual example pages unless the user also asked for proof pages
- a field map unless the user asked where the broader ecosystem lives

### B. Query vocabulary / tags / hashtags / search phrases
User is asking:

- what to search
- which words unlock the field
- what hashtags, descriptors, or phrase families surface the object

Return:

- search phrases
- tag families
- negative terms to exclude
- grouped query logic by carrier or source class if useful
- only terms that actually retrieve matching work on tested surfaces

Do not return:

- site lists as the main answer
- case examples as the main answer
- plausible-but-untested terms

Validation rule:

- a tag is not validated if it only “sounds right”
- a tag is weak if it works mainly on broad noisy platforms
- a tag is stronger if it works on multiple targeted surfaces and retrieves the correct object class

### C. Makers / studios / agencies / accounts / publisher nodes
User is asking:

- who makes this work
- which studios or agencies repeatedly do it
- which accounts or publisher nodes repeatedly surface it
- where to click next instead of continuing open-ended search

Return:

- direct links to studios, agencies, photographers, accounts, or publisher surfaces
- short notes on what each one repeatedly produces or publishes

Do not return:

- broad platform search pages as the main deliverable
- generic “go search Behance / Pinterest / Instagram” advice

### D. Proof-bearing pages
User is asking:

- pages where the object is visibly present
- direct pages that show the kind of frame they mean
- examples with on-page visual proof

Return:

- only pages where the relevant object is actually visible or clearly evidenced on the page
- why each page qualifies

Do not return:

- articles or case pages that merely describe the work
- “likely relevant” campaign pages without visible proof

### E. Cases / campaigns / examples
User is asking:

- explicit commercial examples
- named campaigns
- direct case references

Return:

- case lists, examples, campaign pages

Do not return:

- broad site/resource lists unless the user also wants where to keep hunting

### F. Field map / source ecosystems
User is asking:

- where the material tends to live
- how the field is structured
- which source classes and carrier layers exist

Return:

- ecosystem map
- source classes
- carrier layers
- live vs after-the-fact collection layers

Do not return:

- kept candidate links
- campaign examples as the main payload

## Step 1.5. Treat source traits separately

These are useful source traits, not output objects:

- has case structure
- has credits
- is searchable
- shows visible proof
- is live/current
- is low-noise
- is current and stylistically aligned

Use these to judge quality.
Do not let them replace the requested output object.

## Step 2. Resolve common ambiguity patterns

### “Где такое вообще встречается?”
Default to:

- `surfaces / sites / resources`

Use `field map / source ecosystems` only when the user is clearly asking about the structure of the field itself, not just where to browse it.

Not:

- campaign cases

### “Какие теги / хэштеги / слова искать?”
Default to:

- `query vocabulary / tags / hashtags / search phrases`

Not:

- sites
- examples

If the user also wants terms that are operational, require that the tags be tested against real retrieval surfaces.

### “Мне нужны сайты и теги”
This is not ambiguous if both are clearly requested.

Return:

- one section for surfaces
- one section for query vocabulary

Do not collapse one into the other.

### “Мне нужны студии / агентства / аккаунты / куда кликать дальше”
Default to:

- `makers / studios / agencies / accounts / publisher nodes`

Not:

- platform homepages
- platform-wide search destinations

### “Дай ссылки, где это прямо видно”
Default to:

- `proof-bearing pages`

Not:

- ecosystem map
- descriptive articles without visible proof

### “Дай референсы / примеры”
This is ambiguous.
Ask one short question if the thread does not already disambiguate:

- do they mean `sites`
- `proof pages`
- or `cases`

## Step 3. Failure checks

Before sending the final prompt, ask:

- Did I keep the requested object class intact?
- Did I accidentally return a neighboring object because it was easier?
- Did I let “map the field” turn into “collect examples”?
- Did I let “sites/tags” turn into “case links”?
- Did I lazily substitute a direct resource request with a generic platform search page?
- Did I accept dated or cheap-looking matches when the user asked for current stylish work?

If yes, reroute before sending.
