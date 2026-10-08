---
name: check-streaming-availability
description: Confirms where a film or series can be watched in the user's country.
user-invocable: false
argument-hint: "<title>"
---

# Check streaming availability

Input: $ARGUMENTS

Using the streaming source for Home's country (from `find-local-sources`):
- On one of the profile's Platforms → return the platform, plus runtime (film)
  or seasons and episode length (series).
- Elsewhere → return where it is (other platform, rental, cinemas).
- Can't confirm → "unconfirmed" (in the user's Language). Never guess.
