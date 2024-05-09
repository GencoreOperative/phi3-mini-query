FROM debian:latest

# TODO - optimise and cleanup
RUN apt-get update
RUN apt-get install -y git-lfs
RUN apt-get install -y python pip

RUN pip install huggingface-hub[cli]

# TODO - control folder - 2.72GB download @ 3MB/s = 15 minutes
RUN huggingface-cli download microsoft/Phi-3-mini-128k-instruct-onnx --include cpu_and_mobile/cpu-int4-rtn-block-32-acc-level-4/* --local-dir .

RUN pip install numpy
RUN pip install --pre onnxruntime-genai

RUN apt-get install -y curl
RUN curl https://raw.githubusercontent.com/microsoft/onnxruntime-genai/main/examples/python/phi3-qa.py -o phi3-qa.py

RUN apt-get install -y python3
ADD script.py /
ADD token-count.py /
ADD entrypoint.sh /
ENTRYPOINT [ "/bin/bash", "/entrypoint.sh"]