---
params: [ var_name, input_template, opts ]
var_name: The name of the variable to pagination from `site` into each `page`.
input_template: Simple path (without extension) to the template to use for each page.
opts: Opts for pagination and linking
---

### Data Slicing

The data to paginate is retrieved from the `site` object, using the `var_name`
provided in the configuration.  

The first parameter to the extension is the name of a property from the
`site` object.  If you've used the [Posts extension](/extensions/posts) 
to place the posts into `site.posts`, then you would specify `:posts`
as the name to paginate.

The extension slices the data from the `site` object based upon `opts[:per_page]`,
and assigns the resulting slices to `page` object under the same name.

![Slicing](/images/paginator.png)

### Page association

The second parameter, specifying the simple name of the template to use,
is then injected into the site, once for each slice produced by the 
behavior described above.

The first page injected into the site will match the name of the input
template, with the appropriate output extension.  Subsequent pages, 
if necessary, will be named `page1.html`, `page2.html` etc.

![Slicing](/images/pagination_template.png){:.centered}

### Pagination Templates

Since the `Paginator` extension adds additional properties to the `page`
object, templates may take advantage of this fact to render more robust
pages.

While the slice of objects assigned to the `page` is primary an array,
it has additional properties to aid in rendering of the page.

Property | Type | Description |
---------|-----:|-------------|
`next_page` | *Page* | Reference to the next page in the pagination sequence, or `nil` 
`previous_page` | *Page* | Reference to the previous page in the pagination sequence, or `nil` 
`current_page` | *Page* | Reference to the current page (should be equal to `page`) 
`current_page_index` | integer | 0-based index of the current page in the pagination sequence 
`pages` | Array of *Page* | The full sequence of pagination pages 

It also provides a single extra method to draw pagination links for navigating
through the sequence of pages.

Method | Result | Description |
-------|--------|-------------|
`links` | String of HTML | An HTML string including page navigation links 










