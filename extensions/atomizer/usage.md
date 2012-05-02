---
params: [ var_name, output_path, opts ]
var_name: Name of property on `site` to act as a source of posts, typically an array
output_path: Path to emit the resulting Atom feed
opts: Options for title, content url and generated entries
---

### Feed items

Items fed to the `Atomizer` extension must meed some criteria
in terms of properties returning data:

Property | Description |
---------|-------------|
`title`  | Title of the entry 
`date`  | Date of the entry 
`author` | Either a simple string, or an object providing `name` and `email` properties 
`content` | The full content of the entry (HTML is allowed) 

