FROM python:3.12.5-slim
ENV comfyuiGit=https://github.com/comfyanonymous/ComfyUI.git
ENV comfyManagerGit=https://github.com/ltdrdata/ComfyUI-Manager.git
ENV PATH /home/venv/bin:$PATH
WORKDIR /home
RUN python -m venv venv \
    && apt update \
    && apt install git -y \
    && git clone $comfyuiGit
WORKDIR /home/ComfyUI/custom_nodes/
RUN git clone $comfyManagerGit 
WORKDIR /home
RUN pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu121
RUN pip install -r ComfyUI/requirements.txt


