drop-off-bins
=============

Honolulu's [big, white, multi-material drop-off bins](http://www.opala.org/solid_waste/multi_material_recycling_center_locations.html)
are often full when I go try to drop off my recycling.
This web app will help recyclers find ones that are not full,
and help the management company schedule efficient pick-ups,
with a map for sharing status reports.

Technologies
------------

I'm trying out some that are new to me.

* Google Maps API v.3
* Grails 2.2.0 (because Heroku said it cannot handle 2.2.2)
* PostgreSQL 9.1, because
 * Heroku does not support MySQL (it supports just PostgreSQL 9.0, 9.1, and 9.2 at the moment), and
 * the PostgreSQL 9.2 driver in Maven Central [is said to not support Java 6](https://github.com/pgjdbc/pgjdbc/issues/46)
* Heroku Grails plugin
