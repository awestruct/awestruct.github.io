---
params: [ data_dir ]
data_dir:  Directory containing data directories, defaults to `_data/` 
---

The `DataDir` extension loads each directory of renderable files
under `_data/` as a map attached to the `site` object.

For instance, the following layout:

    _data/
      team/
        bob.md
        jim.md

would result in a map at `site.team` with the value of

    {  :bob=><page for bob.md>,
       :jim=><page for jim.md> }

The `bob.md` page may look like

    ---
    name: Bob McWhirter
    blog_url: http://bob.mcwhirter.org/
    ---

    Bob started Project:odd (as [Odd Thesis](http://oddthesis.org/)) in September 2008. He currently contributes to 
    [Deltacloud.org](http://deltacloud.org).  He's also the lead on [TorqueBox](http://torquebox.org/).

The rendered page content (without layout) and the page
data may be access from any other page.

    \#{site.team[:bob].name}
    \#{site.team[:bob].blog_url}
    \#{site.team[:bob].content}

