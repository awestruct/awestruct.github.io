---
layout: news
author: Dan Allen
title: Awestruct 0.2.5 On the Prowl
---

[Disqus]: /extensions/disqus
[Posts]: /extensions/posts
[FSSM]: https://github.com/ttilley/fssm
[Compass]: http://compass-style.org
[Aslak]: http://github.com/aslakknutsen
[Dan]: http://github.com/mojavelinux
[chatter]: http://twitter.com/#!/search/awestruct
[v0.2.5]: https://rubygems.org/gems/awestruct/versions/0.2.5

Development on Awestruct is picking up now that the Arquillian team has started
hacking on it for their new site. They've contributed some improvements to
Awestruct and have some other extensions waiting in the wings for a future
release. There's also been a lot of [chatter] about Awestruct recently on
twitter.

[Aslak] has improved the [Posts] extension to read page.date as a alternative to
the post filename, part of the preparation for a feature that enables
automatic generation of blog entries for project releases (like this one!).

Aslak also integrated [FSSM] to monitor files more efficiently in development
mode and fixed a nasty divide by 0 bug in the tagger extension. Additionally,
he added support for extensions to define their own transformers.

At [Dan]'s request, Awestruct has been upgraded to [Compass] 0.11.5 to take
advantage of all the new CSS3 mixins and so that the documentation Compass
provides is actually useful to developers using Awestruct. If you've been using
a lot of the CSS3 mixins already, you may need to do some migration. Holler if
it breaks your stylesheet.

Dan also documented the [Disqus] extension, which snuck into a previous release
without much ado. Disqus is an alternative JavaScript-based comment system for
Awestruct [Posts] which offers a very elegant interface for both users and
administrators.

Anyhow, check out [v0.2.5].

    gem install awestruct

If I missed something, feel free to mention it in the comments.
