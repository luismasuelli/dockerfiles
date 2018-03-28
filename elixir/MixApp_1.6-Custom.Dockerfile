FROM elixir:1.6
RUN mkdir /application && \
    cd /application && \
    mix new . --sup --app your_application --module Your
RUN echo "\$(cd /application && mix run --no-halt)" > /start
RUN chmod +x /start
VOLUME ["/application"]
EXPOSE 4000
CMD /start