---
params: [ collection_name, input_path, output_prefix, opts ]
collection_name: The name of the property on `site` to act as a source of tagged pages, typically an array.
input_path: Path to page to enumerate tagged items.
output_prefix: Path prefix to emit the resulting tagged pages
opts: Additional options hash (see below). Also passed to an internal `Paginator`
---

Given the configuration of:

      extension Awestruct::Extensions::Tagger.new( :posts, 
                                                   '/index', 
                                                   '/blog/tags', 
                                                   :per_page=>10 )

The extension will scan `site.posts` for every item with a `tags` attribute.
For each observed tag, a structure is created with the following behaviour

These structures will be sorted by popularity, trimmed to the top 100 tags,
and placed into `site.posts_tags` as an ordered array.  This array


Method | Description|
-------|------------|
`to_s`        | The seen tag 
`primary_page` | First page in this tag's index collection  
`pages`  | All pages with the tag 
`group`  | Which group is this tag in terms of popularity 

From this analysis, the extension will create a paginated index for
each of the top 100 tags.  The `input_path` page denotes which page should
be used to iterate the tag's page collection. 

The `page.posts` collection, in this case, will hold the page's worth
of posts with a given tag.

The indexes will be output under the `output_prefix` directory.

To draw a full tag-cloud, the [TagCloud extension](/extensions/tag_cloud/) should be used. 

