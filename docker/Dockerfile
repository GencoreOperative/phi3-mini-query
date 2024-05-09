FROM debian:latest

RUN apt-get update \
    && apt-get install -y \
        git-lfs \
        python3 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN pip install huggingface-hub[cli]
RUN huggingface-cli download microsoft/Phi-3-mini-128k-instruct-onnx --include cpu_and_mobile/cpu-int4-rtn-block-32-acc-level-4/* --local-dir .

RUN pip install numpy
RUN pip install --pre onnxruntime-genai

ADD script.py /
ADD token-count.py /
ADD entrypoint.sh /
ENTRYPOINT [ "/bin/bash", "/entrypoint.sh"]