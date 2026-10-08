---
name: choose-stretch-pick
description: Picks the 🧭 Stretch pick for one category, scaled by Openness.
user-invocable: false
argument-hint: "<category, candidates>"
---

# Choose the Stretch pick

Input: $ARGUMENTS

Every category in a reply has at least one Stretch pick, marked 🧭. Choose (or
search for, with `find-title-candidates` / `find-events`) one whose distance from
the usual taste matches the profile's Openness:
- **1–2**: a close neighbour — change one axis only (e.g. same genre, another
  country).
- **3**: one axis clearly different.
- **4–5**: something they'd never ask for, justified by a link to a Loved title.

Output: the chosen item and the one-line link that justifies it.
