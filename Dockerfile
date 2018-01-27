FROM alpine:latest
RUN mkdir /etc/python-listener
RUN apk update
RUN apk add python
ADD ./src/default.conf /etc/python-listener/
ADD ./src/python-listener.py /etc/python-listener/
CMD ["python"sd, "/etc/python-listener/python-listener.py"]
EXPOSE 8080
