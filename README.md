# dockerfiles
Custom dockerfiles I'd eventually need

#### Environment considerations

If you read carefully these images, you'll notice there is a pattern on them:

- They should be built from the place you have your source code, most of the times.
- They COPY the source code inside the image.
- They install the corresponding dependencies.
- They **MAY** perform additional setup (e.g. compiling js/css or preprocessing additional assets).
  This last step varies among technologies and requirements.

This one is good for production deployments, since most of the times a production deployment is made once per week.

**HOWEVER** for development, testing or staging deployments having an update is quite more frequent.
So the following tips may be considered when creating the containers:

- **For non-production** add a volume for your source code: `-v /path/to/your/sourcecode:/path/to/container/sourcecode`.
  This will serve to update the code externally.
- **For production** modify the leading command to `tail -f /dev/null` if your container will be run as daemon.
  This will allow you to perform maintenance tasks (e.g. `rake` for Ruby/Rails, `python manage.py` for Python/Django,
  `mix` for Elixir/Mix projects... you get the point) while having your server down.
- **For non-production** your leading command could involve more stuff.
  An example is regarding web frameworks: In production you'll usually just migrate (database) and run your server.
  However in development you could also need to update deps and setup a database before migration/startup. Consider
  specifying appropriate scripts or customizing them with environment variables to run or not any of the steps. My idea
  is to build these run scripts with options to allow customizing these steps' executions (or not).