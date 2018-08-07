====================================================================
Sphinx doc with Basic Authentication with Heroku on Docker container
====================================================================

How to use?
===========

1. put your documentation in /doc.

2. testing::

      docker build -t webapp .
      docker run --rm -e BASIC_AUTH=heroku:docker -e PORT=8080-p 8080:8080 webapp
      curl http://localhost:8080/

3. deploy onto heroku::

      heroku login
      heroku container:login
      heroku create
      heroku container:push web
      heroku container:release web
      heroku open


refs: https://devcenter.heroku.com/articles/container-registry-and-runtime

