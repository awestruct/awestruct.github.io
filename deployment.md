---
title: deploy
layout: default
---

<div class="page-header">
<h1>Deploy</h1>
</div>

Awestruct makes deploying your site easy. There are three ways to deploy:
to [GitHub Pages](http://pages.github.com), to an arbitrary server
using `rsync` and `ssh`, or to [Amazon S3](http://aws.amazon.com/s3/).  You use [site profiles](/profiles/), to configure
your deployment. Once you're configured, deploying is just a single command.

    $ awestruct -P production --deploy

## GitHub Pages 

To deploy your site to GitHub pages, you will need to be using [GitHub](http://github.com) 
as a source repository for the site you want to pubish.

<span class="label label-info">Configuration</span>

Open `_config/site.yml` file and add a deployment profile. Set `host` to
`github_pages` and set the `base_url` to the github pages URL. This can be your
own domain if you set it up correctly in github. In this example, it's just the
default domain that github provides.

    profiles: 
      production: 
        base_url: http://awestruct.github.com/github_pages 
        deploy: 
          host: github_pages 

This will publish your site to the default `gh-pages` branch, used by GitHub
for site publication. To publish to the master branch, add `branch: master` 
to your deployment yaml.

    profiles: 
      production: 
        base_url: http://awestruct.github.com/github_pages 
        deploy: 
          host: github_pages 
          branch: master

## Amazon S3

If you host your site on Amazon S3, you can also deploy to different buckets for each of your profiles.

<span class="label label-info">Configuration</span>

Open `_config/site.yml` file and add a deployment profile. Set `type` to
`s3` and set the `bucket` to the S3 bucket URL (that starts with `s3://`).

    profiles:
      development:
      staging:
        deploy:
          type: s3
          bucket: s3://staging.awestruct.org/
      production:
        deploy:
          type: s3
          bucket: s3://awestruct.org/

<span class="label label-info">Info</span>

The deployment to Amazon S3 is using the ruby-s3cmd gem and the executed command looks like

    s3cmd sync _site/ \#{s3_bucket}


## Rsync and SSH

Rsync and SSH require a little more configuration than GitHub pages, but
in general, this is the more flexible option. Since this deployment method
depends on SSH, make sure you have your public and private keys setup on
your server and local system before deploying.

<span class="label label-info">Configuration</span>

In your `_config/site.yml`, you should define a `profiles` block,
and a profile for each deployment environment.  The names are
arbitrary.

Make sure `base_url` is set correctly for each profile.

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



<span class="label label-info">Wait, what command are you actually using?</span>

The `rsync` command executed looks like

    rsync -rv --delete _site/ \#{host}:\#{path}

<span class="label label-info">Help! Awestruct keeps complaining that I have uncommitted changes when deploying</span>

Awestruct deployments will fail if you have uncommitted changes in your git local history.
While this is fine for most there are occasions when you may wish to deploy to a stagging site to
inspect your changes without adding a commit. Simply add <code>uncommitted: true</code> to your deploy config

    profiles:
      staging:
        base_url: http://staging.awestruct.org/
        deploy:
          host: awestruct.org
          path: /var/www/domains/awestruct.org/staging/htdocs/
          uncommitted: true

