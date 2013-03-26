---
---

The `Indexifier` is normally the last extension in a pipeline, if used.

For instance, a page with a path of `/faq.html` will be altered by the `Indexifier` to produce a page at `/faq/index.html`.

This extension works on the assumption that your webserver will serve any `index.html` file automatically, so by moving pages into directories, the resulting URLs are cleaner.

If for any reason, you want to exclude some paths from being `Indexified`, you should provide the excluded path to the extension constructor.

