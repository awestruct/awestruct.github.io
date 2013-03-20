---
---

### Configure `_config/site.yml`

Your `_config/site.yml` needs to include the property `intense_debate_acct`
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
      <td>intense_debate_acct</td>
      <td>The identifier for your IntenseDebate account</td>
    </tr>
  </tbody>
</table>

### Use `page.intense_debate_comments`

This will emit the javascript necessary to provide IntenseDebate comment
integration for the comments for the target page.  Typically this
should only be used once per page.

    .content
      = page.content
    .comments
      = page.intense_debate_comments 

### Use `page.intense_debate_comments_link`

This will emit the javascript necessary to provide simple IntenseDebate
comment links for the target page.  This is okay to invoke several
times on a master aggregator (or index) page.


    - for post in site.posts
      .post
        .abstract
          = post.abstract
        .comments
          = post.intense_debate_comments_link
