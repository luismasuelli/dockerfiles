FROM elixir:1.6
# We create a directory for our application to be contained
RUN mkdir /application
# Also we create a default script to run
RUN echo "\$(mix run --no-halt)" > /application/start
RUN chmod +x /application/start
# Then we copy all the code
COPY . /application
# Now we force a dependencies installation for our project
RUN cd /application && mix deps.get
# Finally we tell how to execute the start script
WORKDIR /application
CMD start
###
# Considerations for non-production environments.
#
# You could do the following for container in this image:
# * bind-mount to /application to override the code in real-time.
# * in such code, provide a different content to the start script.
#   e.g. it including a mix deps.get call before mix run --no-halt.
###