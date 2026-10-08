---
name: update-companion
description: Creates or updates one Companion in the profile.
user-invocable: false
argument-hint: "<name, relationship?, no's?, shared tastes?>"
---

# Update a Companion

Input: $ARGUMENTS (e.g. "Ana hates horror")

- Companion exists → merge the new information (add "no"s; remove old ones only
  if the user says so).
- New → create it with what's known; leave unknown fields as "…".

Write the change with `write-profile` (Companions section only). Never run an
interview for this.
