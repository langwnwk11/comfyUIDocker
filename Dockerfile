FROM python:3.12.5-alpine3.19
ENV comfyuiGit=https://github.com/comfyanonymous/ComfyUI.git
ENV comfyManagerGit=https://github.com/ltdrdata/ComfyUI-Manager.git
WORKDIR /home
RUN apk add --no-cache git
RUN git clone $comfyuiGit
WORKDIR /home/ComfyUI/custom_nodes/
RUN git clone $comfyManagerGit 
WORKDIR /home
RUN python -m venv venv && source venv/bin/activate 
RUN pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu121
RUN pip install -r requirements.txt


