FROM anapsix/alpine-java:8_server-jre_unlimited

RUN mkdir -p /AJ-Report

WORKDIR /AJ-Report

COPY ./build/aj-report-1.1.0.RELEASE /AJ-Report

CMD /AJ-Report/bin/start.sh && tail -f /AJ-Report/logs/aj-report.log
