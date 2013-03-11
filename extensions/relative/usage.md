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
