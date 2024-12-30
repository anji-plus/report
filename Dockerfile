FROM eclipse-temurin:8-jre

RUN mkdir -p /opt/aj-report/logs

WORKDIR /opt/aj-report
unzip build/aj-report-*.zip ./build
COPY build/aj-report-1.3.0.RELEASE /opt/aj-report

CMD /opt/aj-report/bin/start.sh && tail -f /opt/aj-report/logs/aj-report.log
