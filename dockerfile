FROM ghcr.io/extremscorner/libogc2:latest

# Python deps
RUN curl -sS https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python3 get-pip.py --break-system-packages && \
    python3 -m pip install pyelftools --break-system-packages && \
    rm get-pip.py

# Go
RUN apt update && apt install -y golang && rm -rf /var/lib/apt/lists/*

# Optional: put Go tools on PATH
ENV PATH="/root/go/bin:/usr/local/go/bin:${PATH}"
