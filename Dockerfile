FROM python:3.7

ENV BUILD_PATH=/build
ENV HTML_PATH=/build/html
ENV BASIC_AUTH=heroku:docker
ENV PORT=8080

ADD ./requirements.txt /app/requirements.txt
WORKDIR /app
RUN pip install -r requirements.txt

ADD . /app
RUN sphinx-build -M html /app/doc $BUILD_PATH

CMD gunicorn \
    --bind 0.0.0.0:$PORT \
    -e HTML_PATH=$HTML_PATH \
    -e BASIC_AUTH=$BASIC_AUTH \
    --capture-output \
    --access-logfile - \
    main:application

