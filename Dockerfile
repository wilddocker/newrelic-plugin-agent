FROM debian:wheezy

MAINTAINER Ivan Kuznetsov "kuzma.wm@gmail.com"

RUN apt-get update \
 && apt-get install -y python-pip \
 && pip install newrelic-plugin-agent \
 && pip install requests --upgrade \
 && rm -rf /var/lib/apt/lists/*

RUN mkdir /var/log/newrelic && mkdir /var/run/newrelic

COPY newrelic-plugin-agent.cfg /newrelic-plugin-agent.cfg

COPY entry-point.sh /entry-point.sh

ENTRYPOINT ["/entry-point.sh", "newrelic-plugin-agent"]
CMD ["-c", "/newrelic-plugin-agent.cfg", "-f"]
