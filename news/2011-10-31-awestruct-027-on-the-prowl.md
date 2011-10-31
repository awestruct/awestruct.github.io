---
layout: news
author: Dan Allen
title: Awestruct 0.2.7 On the Prowl
---

[Arquillian]: http://arquillian.org
[Disqus]: /extensions/disqus
[Posts]: /extensions/posts
[FSSM]: https://github.com/ttilley/fssm
[Compass]: http://compass-style.org
[Aslak]: http://github.com/aslakknutsen
[Dan]: http://github.com/mojavelinux
[Tom]: http://github.com/tombentley
[chatter]: http://twitter.com/#!/search/awestruct
[gem]: https://rubygems.org/gems/awestruct/versions/0.2.7

_Uh, we skipped a few release announcements, but it's because..._

Development on Awestruct is picking up now that the [Arquillian] team has
started hacking on it for their new project site. They've contributed some
improvements to Awestruct and have some other extensions waiting in the wings
for a future release. There's also been a lot of [chatter] about Awestruct
recently on twitter.

Here's a taste of the treats in store for you.

<img src="/images/news/ontheprowl.jpg" alt="Cat on the prowl"/>

[Aslak] improved the [Posts] extension to read page.date as a alternative to
the post filename, part of the preparation for a feature that enables
automatic generation of blog entries for project releases (like this one!).

Aslak also integrated [FSSM] to monitor files more efficiently in development
mode. Your CPU will thank you! He also committed a fix for a divide by 0 bug
in the tagger extension that would strike when you least expected it.
Additionally, he added support for extensions to define their own
transformers.

At [Dan]'s request, Awestruct has been upgraded to [Compass] 0.11.5 to take
advantage of all the latest CSS3 mixins and so the online Compass
documentation is actually relevant for developers using Awestruct. If you've
been using a lot of the CSS3 mixins already, you may need to do a little
migration. Compass spits out deprecation warnings to the console. Holler if
the upgrade breaks your stylesheet and you aren't sure how to fix it.

Dan and Aslak figured out how to hack RedCloth to provide custom inline and
block markup. The hooks are now in place. We'll be documenting how to make use
of them soon. You can see an example
[here](https://github.com/arquillian/arquillian.github.com/blob/develop/_ext/textile_plus.rb).

Dan documented the [Disqus] extension, an extension which snuck into a
previous release without much ado. He also added an option to have the
extension generate the Disqus identifier automatically from the date and slug
of the post. Disqus is an alternative JavaScript-based comment system for
Awestruct [Posts] which offers a very elegant interface for both users and
administrators.

Finally, [Tom]'s gsub transformer finally got merged in, so you can slice and
dice the pages as they exit the pipeline.

Anyhow, check out [gem].

    gem install awestruct

If I missed something, feel free to mention it in the comments.

_Photo Credit: [ralph and jenny](http://www.flickr.com/photos/ralphandjenny/5118409269/in/photostream/)_
