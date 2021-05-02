FROM python:3.9-slim

# Allow statements and log messages to immediately appear in the Knative logs
ENV PYTHONUNBUFFERED True

ENV APP_HOME /app
WORKDIR $APP_HOME
COPY . ./
RUN pwd
RUN ls -lah
RUN ls -lah tests
RUN pip install -r requirements.txt
RUN python3 tests/unittests_utils/unittest_runner.py
ENTRYPOINT ['python3']
CMD ['app.py']
