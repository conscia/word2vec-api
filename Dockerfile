FROM python:2.7

ENV WORD2VEC_HOME=/app \
    WORD2VEC_PYTHON_PACKAGES=/usr/local/lib/python2.7/dist-packages


VOLUME ["${WORD2VEC_PYTHON_PACKAGES}"]

# Run updates, install basics and cleanup
# - build-essential: Compile specific dependencies
RUN apt-get update -qq && apt-get install -y --no-install-recommends \
  build-essential \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR ${WORD2VEC_HOME}

COPY ./requirements.txt requirements.txt

RUN pip2 install -r requirements.txt

COPY . ${WORD2VEC_HOME}

RUN ls /app

EXPOSE 5000

ENTRYPOINT ["./entrypoint.sh"]
CMD ["help"]
