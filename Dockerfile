FROM eclipse-temurin:8-jre

RUN mkdir -p /AJ-Report

WORKDIR /AJ-Report

COPY ./build/aj-report-1.1.0.RELEASE /AJ-Report

CMD /AJ-Report/bin/start.sh && tail -f /AJ-Report/logs/aj-report.log
