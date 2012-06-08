---
---

## Configure `_config/site.yml`

Your `_config/site.yml` needs to include the property `flattr_username`
with your account identifier.

<table>
  <thead>
    <tr>
      <th>Property</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>flattr_username</td>
      <td>The Flattr username receiving flattrs</td>
    </tr>
  </tbody>
</table>

### Use `page.flattr_javascript`

This will emit the javascript necessary to provide Flattr button integration.
This should be used once and only once per page hosting a Flattr button.
Put it for example in the footer area.

    .content
      = page.content
    .footer
      = page.flattr_javascript 

### `page.flattr_large_counter`

This will emit a large Flattr button like this one.

<div>
  \#{page.flattr_large_counter}
</div>
  
This is okay to invoke it several times per page and ie put several Flattr buttons.
  
By default, the Flattr button will be associated with

* the page URL eg [http://awestruct.org/extensions/flattr](http://awestruct.org/extensions/flattr)
* the page title as Flattr title
* the Flattr text category

You can override these however passing respectively the `url`, `title` and 
`category` parameters. You can even associate a set of comma separated tags 
via the `tags` property.

    .sidebar
      = page.flattr_large_counter
    .content
      .externalresource
        .abstract
          = page.flattr_large_counter((
              :url=>"http://example.com/", 
              :title=>"Emmanuel Bernard", 
              :tags=>"goodstuff,photo,bacon")

### `page.flattr_compact_counter`

This will emit a compact Flattr button. Otherwise, everything is like 
`page.flattr_large_counter`.

<div>
  \#{page.flattr_compact_counter}
</div>

