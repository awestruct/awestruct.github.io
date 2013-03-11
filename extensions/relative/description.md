---
name: Relative
classname: Awestruct::Extensions::Relative
---

Avoids absolute URL's. This extension has a method `relative()` to translates an absolute URL into a relative URL.
Very handy in the navigation menu of layouts.
Absolute URL's, such as `/foo/bar.html` are trouble.
they don't work in a local static website (`file:///foo/bar.html`)
and they don't work online if the awestruct website isn't on the root of the domain (for example it's completely under `http//www.foo.org/bar/`).
