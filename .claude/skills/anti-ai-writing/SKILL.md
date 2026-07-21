---
name: anti-ai-writing
description: Audit and rewrite content to remove AI writing patterns ("AI-isms"). Use when asked to "remove AI-isms," "de-AI this," "make this sound less like AI," "humanize this," "audit for AI tells," or as a final pass after any content skill (LinkedIn posts, QTs, newsletter deep dives, podcast guides, launch emails). Supports detect-only mode, edit-in-place mode for files, and context profiles tuned to our channels (linkedin, x, newsletter, launch-email, docs, slack).
---

# Anti-AI Writing — Audit & Rewrite

Remove the patterns that make text read as machine-generated. Runs as a standalone audit or as the final polish pass after any content skill in this repo.

Adapted from [conorbronsdon/avoid-ai-writing](https://github.com/conorbronsdon/avoid-ai-writing) (MIT, Conor Bronsdon), tuned for our channels and brand rules.

## What this is and isn't

This is a writing-quality tool, not a verdict. The patterns flagged here are statistically more common in LLM output, but humans on autopilot produce the same shapes — especially under deadline pressure or in a second language. Commercial AI detectors have false-positive rates above 60% on non-native English writers (Liang et al., Stanford, *Patterns* 2023). Treat flags as signals, not proof. Never use this to accuse someone of using AI; use it to make our published writing better.

Brand context: the "AI slop perception" guard in our LinkedIn and newsletter skills exists because readers punish content that smells generated. This skill is the enforcement layer for that guard.

## Modes

**`rewrite`** (default) — Flag AI-isms, rewrite the text, then run one corrective second pass on the rewrite.

**`detect`** — Flag only, no rewriting. Use when the writer wants to decide what to fix themselves, when patterns might be intentional, or when auditing text you shouldn't alter (published content, someone else's writing).

**`edit`** — Edit a file in place. Minimal, targeted edits to flagged spans only. Preserve passages that are already human. Don't edit quoted material, code blocks, or text attributed to someone else — flag those instead. After editing, re-read the file and confirm the flags are resolved.

Trigger detect mode on "detect," "flag only," "audit only," "scan," "what AI patterns are in this." Trigger edit mode when the user names a file and asks you to fix it in place. Otherwise default to rewrite.

**Iterate.** Rewrite mode's built-in second pass is pass 2. If asked to "keep going until it's clean," cap at 2 total passes — a third pass costs a full regeneration and rarely finds more.

---

## What to remove or fix

### Formatting
- **Em dashes (— and --)**: Replace with commas, periods, parentheses, or two sentences. Target zero; hard max one per 1,000 words. Applies to headings too. (Our podcast production guides already ban em dashes outright — keep that stricter rule there.)
- **Bold overuse**: One bolded phrase per major section at most, or none. If it's important enough to bold, restructure the sentence to lead with it.
- **Emoji in headers**: Remove. No `## 🚀 What This Means`. Exception: social posts may use one or two emoji at the end of a line, never mid-sentence.
- **Excessive bullet lists**: Convert bullet-heavy sections into prose. Bullets only for genuinely list-like content (steps, parameters, comparisons).
- **Curly quotes in plain-text contexts** (code comments, commit messages, plaintext drafts): a weak paste-from-chat signal. Replace with straight quotes there; leave them in finished publications. Never flag curly apostrophes alone — most editors auto-curl.

### Sentence structure
- **"It's not X — it's Y" / "This isn't about X, it's about Y"**: Rewrite as a direct positive statement. Max one per piece. Also catch the split-sentence form ("The headline isn't the speed. The real story is Y.") and the multi-negation countdown ("It's not the price. It's not the features. It's the trust.") — same move, inflated.
- **Hollow intensifiers**: Cut `genuinely`, `truly`, `quite frankly`, `to be honest`, `let's be clear`, `it's worth noting that`. State the fact.
- **Vague endorsement**: Cut `worth reading`, `worth a look`, `worth your time`. Say *why* it matters instead.
- **Hedging**: Cut `perhaps`, `could potentially`, `it's important to note that`, `to be clear`.
- **Missing bridge sentences**: If paragraphs could be rearranged without the reader noticing, add connective tissue.
- **Compulsive rule of three**: Max one "adjective, adjective, and adjective" triad per piece. Use two items, four items, or a sentence.

### Words and phrases — three tiers

Match inflected forms: `leverage` also flags `leveraging`, `delve` covers `delving`, `meticulous` covers `meticulously`. When a variant has a separate honest sense (`real` meaning factual), judge by context.

#### Tier 1 — Always replace (5–20x more common in AI text)

| Replace | With |
|---|---|
| delve / delve into | explore, dig into, look at |
| landscape (metaphor) | field, space, industry |
| tapestry | (describe the actual complexity) |
| realm | area, field, domain |
| paradigm | model, approach, framework |
| embark | start, begin |
| beacon | (rewrite entirely) |
| testament to | shows, proves |
| robust | strong, reliable, solid |
| comprehensive | thorough, complete, full |
| cutting-edge | latest, newest, advanced |
| leverage (verb) | use |
| pivotal | important, key, critical |
| underscores | highlights, shows |
| meticulous | careful, detailed, precise |
| seamless | smooth, easy, without friction |
| game-changer / game-changing | describe what changed and why it matters |
| hit differently / hits different | (say what changed, or cut) |
| utilize | use |
| watershed moment | turning point (or describe what changed) |
| the future looks bright / only time will tell | (cut — say something specific or nothing) |
| nestled | is located, sits, is in |
| vibrant / thriving / bustling | (describe what makes it active, or cite a number) |
| showcasing | showing (or cut the clause) |
| deep dive / dive into | look at, examine (fine as a noun for our "deep dive" newsletter format — that's a product name, not a verb) |
| unpack / unpacking | explain, break down, walk through |
| intricate / intricacies / complexities | (name the specific complexity, or "problems" / "details") |
| ever-evolving | changing, growing (or describe how) |
| daunting | hard, difficult |
| holistic | complete, full (or describe what's included) |
| actionable | practical, useful, concrete |
| impactful | effective (or describe the impact) |
| learnings | lessons, findings, takeaways |
| thought leader(ship) | expert (or describe their actual contribution) |
| best practices | what works, proven methods |
| at its core | (cut — just state the thing) |
| synergy / synergies | (describe the actual combined effect) |
| interplay | relationship, connection |
| in order to | to |
| due to the fact that | because |
| serves as | is |
| features (verb) / boasts / presents (inflated) | has, is, shows |
| commence | start |
| ascertain | find out, determine |
| endeavor | effort, attempt |
| genuinely / genuine (as intensifier) | (cut) |
| symphony (metaphor) | (describe the actual coordination) |
| embrace (metaphor) | adopt, accept, use, switch to |
| load-bearing (metaphor) | essential, critical — or say what breaks if you remove it (literal construction use is fine) |

#### Tier 2 — Flag when 2+ appear in the same paragraph

Fine alone; two or more together means the paragraph likely needs a rewrite.

| Replace | With |
|---|---|
| harness | use, take advantage of |
| navigate / navigating | work through, handle |
| foster | encourage, support, build |
| elevate | improve, raise |
| unleash | release, enable, unlock |
| streamline | simplify, speed up |
| empower | enable, let, allow |
| bolster | support, strengthen |
| spearhead | lead, drive, run |
| resonate(s) with | connect with, appeal to |
| revolutionize | change, reshape (or describe what changed) |
| facilitate(s) | enable, help, allow, run |
| underpin(ning) | support, form the basis of |
| nuanced | specific, subtle (or name the actual nuance) |
| crucial | important, key, necessary |
| multifaceted | (describe the facets, or cut) |
| ecosystem (metaphor) | system, community, network, market |
| myriad / plethora | many (or give a number) |
| encompass | include, cover, span |
| catalyze | start, trigger, accelerate |
| reimagine | rethink, redesign |
| galvanize | motivate, rally |
| augment | add to, expand |
| cultivate | build, develop, grow |
| illuminate / elucidate | clarify, explain |
| juxtapose | compare, contrast |
| transformative / transformation | (describe what changed and how) |
| cornerstone | foundation, basis, key part |
| paramount | most important, top priority |
| poised (to) | ready, set, about to |
| burgeoning / nascent | growing, new, emerging (or cite a number) |
| quintessential | typical, classic, defining |
| overarching | main, central, broad |
| quietly | cut, or name the concrete contrast |
| deeply (significance collocations — "deeply integrated," "deeply committed"; literal "deeply nested" never counts) | cut, or name what runs deep |

#### Tier 3 — Flag only at high density (~3%+ of words)

Normal words AI overuses to fill space with vague praise.

| Word | What to do |
|---|---|
| significant(ly) | Replace some with numbers, comparisons, examples |
| innovative / innovation | Describe what's actually new |
| effective(ly) | Say how, or cite a metric |
| dynamic(s) | Name the actual forces or changes |
| scalable / scalability | Describe what scales and to what |
| compelling | Say why it compels |
| unprecedented | Name the precedent it breaks (or cut) |
| exceptional(ly) / remarkable / remarkably | Cite what makes it exceptional |
| sophisticated | Describe the sophistication |
| instrumental | Say what role it played |
| world-class / state-of-the-art / best-in-class | Cite a benchmark or comparison |

Also flag boilerplate phrase clusters — 3+ distinct phrases like "the intersection of X and Y," "the integration of X with Y," "emerging space," "community-driven," "long-term sustainability," "user engagement" in one piece is a strong signal even when each appears once.

### Template phrases
- "a [adjective] step forward for [noun]" → say what actually changed
- "Whether you're [X] or [Y]" → false breadth; pick the audience you're addressing, or cut
- "I recently had the pleasure of [verb]-ing" → just say what happened: "I talked to," "I read"

### Transitions to remove or rewrite
- "Moreover" / "Furthermore" / "Additionally" → restructure so the connection is obvious, or "and," "also"
- "In today's [X]" / "In an era where" → cut or state specific context
- "It's worth noting that" / "Notably" → just state the fact
- "Here's what's interesting" / "Here's what stood out" → let the content signal its own importance
- "In conclusion" / "In summary" → your conclusion should be obvious
- "When it comes to" → talk about the thing directly
- "At the end of the day" → cut
- "That said" / "That being said" → cut or "but," "yet," "however" — don't overuse any one

### Content and rhetoric
- **Significance inflation**: "marking a pivotal moment in the evolution of..." — state what happened and let the reader judge. If the sentence works after deleting the inflation clause, delete it.
- **Generic future-narrative closers**: modal + "become" + "one of the most [adjective]" + (trend / story / chapter / force). Grammatically a prediction, contains no testable content. Fix: make it falsifiable or cut.
- **Hedge-stacked predictions**: "could potentially create," "may eventually unlock." Either word alone is fine; the stack is the tell. Pick one.
- **Real/actual adjective inflation**: "genuine utility," "true product-market fit" — an empty intensifier manufacturing an unsaid contrast. Carve-out: if the sentence names the fake version ("actual revenue from paying customers, not grants"), that's honest contrastive writing — keep it.
- **Vague attributions**: "Experts believe," "Studies show," "Research suggests" without a name. Cite the specific source or state the claim directly. (This overlaps our Evidence Standards Gate in the content skills — that gate wins where stricter.)
- **Vague third-party validation**: "independent testing confirms," "analysts agree" — unnamed authority plus superlative. Name the source, test, and result, or cut. Specifically attributed, checkable validation stays.
- **Notability name-dropping**: piling on prestigious citations ("cited in NYT, BBC, FT") to borrow weight. One specific reference with context beats four name-drops. Same for historical analogy stacking ("like the printing press, the telegraph, and the internet before it") — name the one parallel that does analytical work.
- **Novelty inflation**: "He introduced a term," "a failure mode nobody talks about," "the insight everyone's missing." Describe what the person *did with* the concept, not that they discovered it. Also flag invented labels coined mid-sentence and never defined ("the supervision paradox"). This one matters for us specifically — the Originator Overclaim trap in our QT and LinkedIn skills is a version of this rule; both apply.
- **Speculative gap-filling**: "is believed to have," "likely began his career in" — guesses formatted as statements. Cut or replace with a sourced fact.
- **Speculative scenario openers**: "Imagine a world where…" — the scenario does the persuading with no evidence. State the real claim. (Teaching devices like "imagine you have a sorted array" are fine.)
- **False ranges**: "from ancient civilizations to modern startups" — sweeping, says nothing. List the actual topics or pick the one that matters.
- **False concession structure**: "While X is impressive, Y remains a challenge" — balanced-sounding, both halves vague. Make the concession specific or pick a side.
- **Superficial -ing analyses**: "symbolizing the region's commitment to progress, reflecting decades of investment." Says nothing. Same for declarative meaning-telling: "this represents a broader shift." Show a specific consequence or cut.
- **Promotional language**: tourism-brochure prose. If you wouldn't say it in conversation, cut it.
- **Formulaic challenges**: "Despite challenges, X continues to thrive." Name the actual challenge and response, or cut.

### Chat-interface leakage
- **Chatbot artifacts**: "I hope this helps!", "Certainly!", "Great question!", "Feel free to reach out," "In this article, we will explore…", "Let's dive in!" — remove entirely.
- **"Let's" constructions**: "Let's break this down," "Let's take a look" — false-collaborative filler delaying the point. Flag any "let's + verb" functioning as a transition.
- **Sycophantic tone**: "Excellent point!", "You're absolutely right!" — conversational rewards, not writing.
- **Acknowledgment loops**: restating the question before answering, or opening a section by recapping the previous one. Pure filler.
- **Reasoning chain artifacts**: "Let me think step by step," "Breaking this down," "Here's my thought process." State the conclusion, then the evidence.
- **Cutoff disclaimers**: "As of my last update," "I don't have access to real-time data." Never publish a sentence admitting the writer didn't look something up.
- **Unfilled placeholders**: `[Your Name]`, `[INSERT SOURCE URL]`, `2025-XX-XX` — near-definitive evidence of pasted boilerplate. Fill or delete.
- **Citation markup leaks**: `citeturn0search0`, `oai_citation`, `contentReference[oaicite:...]` — fingerprints, not patterns. Strip mechanically.
- **AI-tool URL parameters**: `utm_source=chatgpt.com`, `utm_source=claude.ai`, `utm_source=perplexity.ai` etc. Strip the parameter, keep the URL.

### Engagement-bait and social tells
- **Infomercial hooks**: "The catch?", "Here's the kicker:", "Plot twist:", "The best part?" — manufactured suspense around ordinary information. Delete the hook, state the thing.
- **Social endorsement closers**: "This one is worth your time:", "Don't sleep on this," "Bookmark this," "Thank me later." Performs a recommendation without a reason. Say *what* the thing is and *who* it's for, then drop the CTA.
- **Emotional flatline**: "What surprised me most," "I was fascinated to discover," "The most interesting part" — claimed emotion the writing hasn't earned. If it's genuinely surprising, the reader should feel it from the content. If you claim an emotion, earn it; otherwise cut.
- **Self-labeling significance**: "That last move is the contrarian one," "Here's where it gets clever" — back-pointing at your own list to tell the reader which item matters. Cut the label and let the explanation carry the weight, or restructure so the key item leads.
- **Rhetorical question openers**: "So why should you care?" — stalling before the point. Earned by strong setup, not dropped as transitions. (One as a social hook is allowed — see profiles.)
- **Hashtag stuffing**: 6+ trailing hashtags is a hard flag; 5+ is a soft tell on LinkedIn. 2-3 specific tags max, or none.
- **Recap-flattery opener** (replies): summarizing someone's own work back at them with praise before the point. Substance first; if thanks is warranted, one plain clause.
- **Wall-of-text replies**: in conversational registers (Slack, comments, DMs), 4+ sentences under ~150 words as one unbroken block. Break at thought boundaries. Never flag long-form prose for this.

### Structure and rhythm

Structure is the #1 detection signal — detection tools weight structural regularity higher than vocabulary. Fix every Tier 1 word and leave the rhythm untouched, and it still reads as AI.

- **Sentence length uniformity**: If most sentences are 15–25 words, mix in short punchy ones (3–8 words) and longer flowing ones. Fragments work.
- **Paragraph length uniformity**: Some paragraphs should be one sentence. Some longer. If every paragraph is 3–5 sentences, fix it.
- **Synonym cycling**: "developers… engineers… practitioners… builders" in one paragraph. Human writers repeat the clearest word. If the same noun appears three times and it's the right word, keep all three.
- **Copula avoidance**: "serves as," "features," "boasts," "represents" instead of "is" and "has." Default to "is"/"has" unless a specific verb adds meaning.
- **Excessive structure**: 3+ headings in under 300 words; 8+ bullets in under 200 words; generic headers ("Overview," "Key Points," "Conclusion"). Merge, prose-ify, or make headers specific.
- **Inline-header lists**: "**Performance:** Performance improved by..." — strip the redundant bold header.
- **List-label periods**: `**Intros.** Years of conferences...` — a human writes `**Intros:** years of conferences...`. Fix period to colon.
- **Title case headings**: sentence case for subheadings; title case only for the main title, if at all.
- **Hyphenated-pair overuse**: "a high-quality, well-architected, future-proof solution" — cut to the modifier that matters. Also fix predicate hyphens ("the report is high-quality" → "high quality").
- **Formulaic openings**: broad context before the point ("In the rapidly evolving world of..."). Lead with the news or the insight; context second.
- **Missing first-person perspective**: if the piece is supposed to have a voice, the absence of "I think" or a stated preference is itself a tell. AI is relentlessly neutral.
- **Over-polishing**: don't sand away all personality. Deliberate fragments, sentences starting with "And" or "But," a writer's typos in casual registers — these keep text human. Applying every rule at maximum strictness creates the uniformity you're trying to avoid.

### Writer-side diagnostics (not regexes)
- **Paragraph-reshuffle test**: can you swap two body paragraphs without breaking the piece? If order doesn't matter, it's a list of points, not an argument that builds. Fix is structural: make each paragraph depend on the one before.
- **Treadmill test**: what's actually *new* in each paragraph? If you could cut 40–60% and lose no information, do.

### When to rewrite from scratch vs. patch

5+ flagged vocabulary hits across categories + 3+ distinct pattern categories + uniform sentence/paragraph length = the structure itself is AI-generated. Patching won't fix it. State the core point in one sentence and rebuild.

---

## Severity tiers

**P0 — Credibility killers (fix immediately)**: cutoff disclaimers, chatbot artifacts, citation markup leaks, unfilled placeholders, vague attributions, significance inflation on routine events, hashtag stuffing on LinkedIn.

**P1 — Obvious AI smell (fix before publishing)**: word-list violations, template phrases, "let's" openers, synonym cycling, formulaic openings, bold overuse, em-dash frequency, future-narrative closers, social endorsement closers, hedge stacks, engagement-bait hooks, novelty inflation.

**P2 — Stylistic polish (fix when time allows)**: generic conclusions, rule of three, uniform paragraph length, copula avoidance, transition phrases, title case headings.

Quick pass = P0 + P1. Full audit = all three.

---

## Self-reference escape hatch

When writing *about* AI patterns (this file, tutorials, skill docs), quoted examples are exempt. Only flag patterns in the author's own prose, not in cited examples of bad writing.

---

## Context profiles

Pass a context hint or auto-detect: short + hashtags = `linkedin`; under 280 chars or QT framing = `x`; long-form with sections = `newsletter`; salutation + product announcement = `launch-email`; README/CLAUDE.md structure = `docs`; quick internal message = `slack`. Default to `newsletter` (all rules at full strength). Say which profile you're using so the user can override.

| Rule | linkedin | x | newsletter | launch-email | docs | slack |
|------|----------|---|------------|--------------|------|-------|
| Em dashes | strict (brand rule: zero) | strict (zero) | strict | strict | relaxed | skip |
| Bold overuse | relaxed (bold hooks OK) | n/a | strict | strict | relaxed | skip |
| Emoji in headers | relaxed (1-2 end-of-line) | relaxed | strict | strict | skip | skip |
| Excessive bullets | skip (lists work) | skip | strict | strict | skip | skip |
| Hedging | strict | strict | strict | strict | relaxed | skip |
| Word table | strict | strict | strict | **extra strict** | relaxed | P0 only |
| Promotional language | relaxed (some sell expected) | relaxed | strict | **extra strict** | strict | skip |
| Significance inflation | strict | strict | strict | **extra strict** | relaxed | skip |
| Copula avoidance | skip | skip | strict | strict | skip | skip |
| Uniform paragraph length | skip (short-form) | skip | strict | strict | relaxed | skip |
| Rhetorical questions | relaxed (1 as hook OK) | relaxed (1 as hook OK) | strict | strict | strict | skip |
| Transition phrases | skip | skip | strict | strict | relaxed | skip |
| Generic conclusions | skip | skip | strict | **extra strict** | skip | skip |
| Hashtag stuffing | strict | strict | n/a | **extra strict** | skip | skip |
| Engagement-bait hooks | strict (see note) | strict (see note) | strict | **extra strict** | skip | skip |
| Wall-of-text replies | skip | skip | skip | skip | skip | strict |

**Social hook note (`linkedin` / `x`):** our content skills deliberately engineer hooks — that's the craft, not a bug. On these profiles, flag engagement-bait patterns in the *body and close*, not a deliberate opening hook the content skill produced. If a hook uses a banned pattern from the content skill itself (fear-mongering, loser framing), defer to that skill's rules and `reddit-review`.

**Docs profile note:** for repo files (PRDs, decision logs, call summaries), clarity beats voice. Skip personality rules; still kill Tier 1 words, filler, and chatbot artifacts.

**"Extra strict"** = flag even borderline instances. In a launch email, one "thriving ecosystem" undermines the message. **"Skip"** = don't audit this category for this profile.

---

## Voice

Voice is optional — infer it from the input's existing register and don't impose a persona on text that already has one.

For social and newsletter content, the default voice is Aakash's, as defined in the content skills (curious friend, not coach; practitioner credentialing; free info density). This skill doesn't redefine that voice — it removes the machine tells from it. If a rewrite would collide with a content-skill rule, the content skill wins and this skill flags instead of rewriting.

**Calibrate to a sample.** If the writer gives a sample ("match my voice"), analyze its sentence-length pattern, contraction rate, and recurring word choices, and match those. Don't upgrade their vocabulary: if they write "stuff" and "things," keep that register.

---

## Output format

### Rewrite mode
1. **Issues found** — every AI-ism, with the offending text quoted
2. **Rewritten version** — full clean text. Preserve structure, intent, and all specifics. Only change what the guidelines require.
3. **What changed** — the meaningful edits, not every word
4. **Second-pass audit** — re-read the rewrite, fix any surviving tells inline, note what changed. If clean, say so.

### Detect mode
1. **Issues found** — grouped by severity (P0, P1, P2), offending text quoted
2. **Assessment** — for each flag: clear problem vs. judgment call. Some AI-associated patterns are effective in small doses. If the text is clean, say so.

### Edit mode
1. **Edits made** — each change with location and before → after
2. **Verification** — confirm re-read, flags resolved, and note anything deliberately left alone

---

## Tone calibration

The goal is writing that sounds like a person wrote it. Direct. Specific. Confidence demonstrated, not asserted.

1. **Vary sentence length** — mix short with long. Fragments are fine.
2. **Be concrete** — numbers, names, dates, examples over vague claims.
3. **Have a voice** — first person, preferences, reactions where appropriate.
4. **Cut the neutrality** — if the piece should take a position, take it.
5. **Earn your emphasis** — don't tell the reader something is interesting. Make it interesting.

If the original is already strong, say so and make only the necessary cuts. The replacement table provides defaults, not mandates — if a flagged word is clearly right in context, keep it.

## Pipeline placement

For social/newsletter content the full chain is: content skill → `anti-ai-writing` → `reddit-review`. This skill removes machine tells; reddit-review attacks credibility and brand risk. Run this one first so reddit-review reviews the humanized draft.
