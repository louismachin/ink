# &#127807;&#xFE0E;

### .leaf plain-text format
```
---
key: my_new_note
title: My New Note
tags: meta diary
key: value
foo: bar
---
Dear Diary,
Today I'm writing a note to display the simple .leaf format!
```

### API

To get a list of related leaves (matching all tags).

```
GET /api/list?tags=[]
e.g.
GET /api/list?tags=meta,diary
```

```json
{
  "success": true,
  "tags": [
    "meta",
    "diary"
  ],
  "uris": [
    "/api/data/examples/my_new_note.leaf"
  ]
}
```

To get a leaf in a JSON format.

```
GET /api/../[note_key].leaf
e.g.
GET /api/examples/my_new_note.leaf
```

```json
{
  "success": true,
  "attributes": {
    "key": "my_new_note",
    "title": "My New Note",
    "tags": [
      "meta",
      "diary"
    ]
  },
  "body": [
    "Dear Diary,",
    "Today I'm writing a note to display the simple .leaf format!"
  ]
}
```