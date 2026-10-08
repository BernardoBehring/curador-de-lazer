---
name: compute-hit-rate
description: Summarises how the Curador's suggestions fared since the last check-in.
user-invocable: false
---

# Compute the hit rate

Consider only rows with Origin Curador whose state changed since the
`Last check-in` date. Output one line in the user's Language, e.g.:
"Since DD/MM: N of M suggestions became Loved · X Declined · Y Dropped."

If there's a clear pattern of misses (e.g. every horror pick Declined) or of
hits, add it in one sentence. If there isn't enough data, output nothing.
