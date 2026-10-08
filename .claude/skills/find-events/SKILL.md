---
name: find-events
description: Searches for confirmed cultural events in a date window near a location.
user-invocable: false
argument-hint: "<location> <from> <to>"
---

# Find events

Input: $ARGUMENTS (location = the Request location, or Home by default)

1. Get the sources with `find-local-sources`.
2. Search events in the window that match the profile's event Likes.
3. Keep only events with a confirmed date, time, venue and price; anything not
   confirmed is marked "unconfirmed".
4. Add the approximate distance from the location and the ticket/source link.

Output: the list of events with all these fields.
