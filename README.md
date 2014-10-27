Description
===========

Installs and configures the latest version of (Mirage)[https://github.com/18f/mirage].

Requirements
============

Platform
--------

* Debian, Ubuntu

Recipes
--------

- `mirage::app`: Install the app with gunicorn and set up the nginx vhost.
- `mirage::database`: Setup a database to be used with Mirage.

Usage
=====

Add the recipe to your runlist where you want Mirage installed.
