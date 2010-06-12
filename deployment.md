---
title: deploy
layout: default
---

# Deploy

By using [site profiles](/profiles/), *Awestruct* can also deploy 
the resulting site using `rsync`.

## Profile configuration

In your `_config/site.yml`, you should define a `profiles` block,
and a profile for each deployment environment.  The names are
arbitrary.

Make sure `base_url` is set correctly for each profile.

    profiles:
      development:
      staging:
        base_url: http://staging.awestruct.org/
      production:
        base_url: http://awestruct.org/

To these profiles, add a `deploy` hash with `host` and `path` properties to specify
where the resulting site should be copied to using `rsync`.

    profiles:
      development:
      staging:
        base_url: http://staging.awestruct.org/
        deploy:
          host: awestruct.org
          path: /var/www/domains/awestruct.org/staging/htdocs/ 
      production:
        base_url: http://awestruct.org/
        deploy:
          host: awestruct.org
          path: /var/www/domains/awestruct.org/www/htdocs/ 


## Deployment

First, make sure that you've built the site for the correct profile.

    $ rm -Rf _site
    $ awestruct -P production

Then deploy

    $ awestruct -P production --deploy

The `rsync` command executed looks like

    rsync -rv --delete _site/ \#{host}:\#{path}


