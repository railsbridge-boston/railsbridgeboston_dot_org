RailsBridge Boston Website
==========================

[![CI](https://github.com/railsbridge-boston/railsbridgeboston_dot_org/workflows/CI/badge.svg)](https://github.com/railsbridge-boston/railsbridgeboston_dot_org/actions?query=workflow%3ACI)

This is the website for RailsBridge Boston, a chapter of [RailsBridge]. You can
check out the site at <http://www.railsbridgeboston.org>. This does *not*
include any curriculum content.

RailsBridge Boston organizes workshops for people in underrepresented groups and
their friends to learn Ruby, Rails, and other web technologies.

[RailsBridge]: http://www.railsbridge.org

Running the app locally
----------------------

    $ ./bin/setup
    $ bin/rails server
    $ open http://localhost:3000/

Showing registration
-------------------

In order to show registration info, you'll need to set the following environment variables:

* `EVENT_URL` - URL of the workshop signup
* `VENUE_NAME` - name of the venue
* `VENUE_ADDRESS` - one-liner full address of the venue
* `VENUE_MAP_URL` - an embedded map URL
* `HIDE_REGISTRATION=true`

You can do this by running:
    fly secrets set EVENT_URL=... VENUE_NAME=... ...

This command will automatically redeploy the app for the new variables to go into effect.


Sometimes we create an event, make it live, but don't want people to sign up
yet. In that case we can set `ENV["HIDE_REGISTRATION]` to `"true"` on Heroku,
and the registration link won't be shown at all:

    fly secrets set HIDE_REGISTRATION=true

Don't forget to un-hide it!
