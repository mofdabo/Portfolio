FROM ubuntu:20.04

WORKDIR /root/modabo/termproject

COPY /app .

RUN apt update && apt install -y python3
RUN apt update && apt install -y python3-tk
RUN apt update && apt install -y firefox

CMD ["python3", "main.py" ]