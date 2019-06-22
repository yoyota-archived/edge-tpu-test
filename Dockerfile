FROM python:3.6-slim-stretch

RUN apt-get update -y && apt install -y \
    openssh-server rsync tmux \
    wget libopencv-dev python-opencv

RUN wget https://dl.google.com/coral/edgetpu_api/edgetpu_api_latest.tar.gz \
    -O edgetpu_api.tar.gz --trust-server-names && \
    tar xzf edgetpu_api.tar.gz && \
    cd edgetpu_api && \
    bash ./install.sh

RUN pip install opencv-python pillow 

CMD ["/bin/bash", "-c" , "mkdir -p /var/run/sshd && /usr/sbin/sshd -D"]