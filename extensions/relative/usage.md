---
---

In for example `base.html.haml`, use:

    %a{:href => relative("/download/download.html")} Download
    ...
    %a{:href => relative("/learn/documentation.html")} Documentation

For `/index.html` this will result in:

    <a href="download/download.html">Download</a>
    ...
    <a href="learn/documentation.html">Documentation</a>

But for `/foo/bar.html` this will result in:

    <a href="../download/download.html">Download</a>
    ...
    <a href="../learn/documentation.html">Documentation</a>

And for `/one/two/three.html` this will result in:

    <a href="../../download/download.html">Download</a>
    ...
    <a href="../../learn/documentation.html">Documentation</a>

Of course, it works on all kinds of URL usages:

    %link{:rel => "shortcut icon", :href => relative("/favicon.ico")}

---

To make it work properly in partials, you need to pass along the outputPage to every partial and to the relative function:

The outputPage `blogAggregation.html.haml` passes itself:

    = partial('blogPostBody.html.haml', :outputPage => page, ...)

to the partial `blogPostBody.html.haml`, which passes that outputPage:

    = partial('userBadge.html.haml', :outputPage => page.outputPage, ...)

to the partial `userBadge.html.haml`, which passes it to the relative call:

    %img{:src => relative("/common/twitterLogo.png", page.outputPage)}
