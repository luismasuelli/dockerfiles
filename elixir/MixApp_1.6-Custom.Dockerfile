FROM elixir:1.6
# This command goes no more (let the user create the project):
#
# RUN mkdir /application && \
#     cd /application && \
#     mix new . --sup --app your_application --module Your
#
# These commands go now:
RUN mkdir /application
COPY . /application
# Now we force a dependencies installation for our project:
RUN cd /application && mix deps.get
# And we create the run script
RUN echo "\$(cd /application && mix run --no-halt)" > /start
RUN chmod +x /start
# This command goes no more (so the image has the actual code):
#
# VOLUME ["/application"]
#
# Finally we expose the ports of our interest
EXPOSE 4000
# And the default leading command will be the /start we created
CMD /start