FROM docker.io/python:3.10-slim-bullseye

# Install necessary packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    curl \
    wget \
    vim \
    sudo && \
    rm -rf /var/lib/apt/lists/*

# Install kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl && \
    rm kubectl

# Create a user named 'calrissian' with sudo privileges
RUN useradd -m calrissian && \
    echo "calrissian:password" | chpasswd && \
    adduser calrissian sudo && \
    echo "calrissian ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Add requirements.txt and install Python dependencies
ADD requirements.txt /tmp/requirements.txt

RUN pip install --no-cache-dir -r /tmp/requirements.txt && \
    rm -rf /tmp/requirements.txt

# Set the user to 'calrissian'
USER calrissian

# Add alias for ll="ls -l" to the bash profile of calrissian
RUN echo 'alias ll="ls -l"' >> /home/calrissian/.bashrc

WORKDIR /home/calrissian

