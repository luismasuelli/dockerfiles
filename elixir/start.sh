#!/bin/bash
if [ "$ENVIRONMENT" == "development" || "$ENVIRONMENT" == "test" ]
then
  mix deps.get
end
mix run --no-halt