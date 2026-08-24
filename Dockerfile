FROM ubuntu:latest

RUN apt-get update && apt-get install -y iputils-ping 

COPY health_check.sh /health_check.sh

RUN chmod +x /health_check.sh

ENTRYPOINT ["./health_check.sh"]

CMD ["/tmp", "80"]
