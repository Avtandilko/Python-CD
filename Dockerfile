FROM alpine:latest
RUN apk update
RUN mkdir /etc/python-listener
RUN apk add python
ADD ./src/default.conf /etc/python-listener/
ADD ./src/python-listener.py /etc/python-listener/
CMD ["python", "/etc/python-listener/python-listener.py"]
EXPOSE 8080
