FROM mcr.microsoft.com/vscode/devcontainers/universal:linux

COPY scripts/* /tmp/scripts/

# Install CUDA libraries and cuDNN
RUN sudo bash /tmp/scripts/nvidia-debian.sh --cuda-libraries --cudnn
