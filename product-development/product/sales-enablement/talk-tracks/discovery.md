# Talk Track: Discovery Call

> Stub — replace with your team's actual discovery framework. **Last updated:** 2026-04-28.

## Goal

Leave the call knowing: who they are, what they're trying to ship, what's blocking them today, who else they've evaluated, what would make them sign.

## 30-Minute Structure

**0-5 min: Their context.** Who they are, team size, what they ship, what tools they use today. Avoid product pitch — listen.

**5-15 min: The pain.** What's their current workflow for [our problem area]? What's broken? Specific stories. Get to a "before/after" gap they can articulate.

**15-25 min: Light demo.** Tied to their stated pain. Don't show 5 features — show the one that solves their specific problem.

**25-30 min: Next steps.** Get a follow-up scheduled before you hang up. If they're not ready for a follow-up, they're not real.

## Discovery Questions (Use 3-5, Not All)

- "Walk me through what happens today when [their workflow] needs to ship."
- "If we waved a wand and that took 10 minutes instead of 4 hours, what changes for you?"
- "Who else have you evaluated? What did you like / what was missing?"
- "Who else inside your company touches this workflow?"
- "What's the timeline pressure here? What kicks off in 30/60/90 days?"
- "What's your buying process? Who needs to sign off?"

## Red Flags

- "Just looking right now" → no real timeline, deprioritize
- "We're evaluating 5 vendors" → high churn risk after sale
- "Our procurement takes 6 months" → enterprise loop, schedule security review now
- They can't name a specific recent pain → no urgency

## Green Flags

- They name a specific deadline that depends on the workflow
- They mention a specific competitor pain ("we tried X, but...")
- Multiple people from their team join unprompted
- They ask about pricing in the first 10 minutes (real interest)

## After the Call

Run `/customer-call --quick` to summary it. Tag any feature requests against `feature-index.yaml`. If competitor was mentioned, update `battlecards/{competitor}.md` last-updated.
