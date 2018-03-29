FROM elixir:1.6
# We create a directory for our application to be contained
RUN mkdir /application
# We copy a default script to run
COPY start.sh /application
RUN chmod +x /application/start.sh
# Then we copy all the code
COPY . /application
# Now we force a dependencies installation for our project
RUN cd /application && mix deps.get
# Finally we tell how to execute the start script
WORKDIR /application
CMD start.sh
###
# Considerations for non-production environments.
#
# You could do the following two steps for container in this image:
# * bind-mount to /application to override the code in real-time.
# * provide the environment variable ENVIRONMENT=development or
#   ENVIRONMENT=test.
###