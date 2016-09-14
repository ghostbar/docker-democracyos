FROM node:argon
MAINTAINER Jose-Luis Rivas <me@ghostbar.co>

ENV NODE_PATH=.
ENV DEBUG=democracyos*
ENV DEMOCRACY_VERSION=1.4.0

WORKDIR /opt/app

RUN curl -SL https://github.com/DemocracyOS/democracyos/archive/${DEMOCRACY_VERSION}.tar.gz \
      -o /tmp/dos.tar.gz && \
      tar -xzf /tmp/dos.tar.gz -C /tmp && \
      mv /tmp/democracyos-"${DEMOCRACY_VERSION}"/* /opt/app && \
      rm -f /tmp/dos.tar.gz && \
      npm install --quiet && \
      make clean && make build

EXPOSE 3000

CMD ["make", "run"]
