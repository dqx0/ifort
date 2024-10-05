# 基本イメージ
FROM ubuntu:24.04

# 必要なパッケージをインストール
RUN apt update && apt install -y \
    wget \
    gpg \
    git

# Intel oneAPI 環境を設定
RUN wget -O- https://apt.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB | gpg --dearmor | tee /usr/share/keyrings/oneapi-archive-keyring.gpg > /dev/null && \
    echo "deb [signed-by=/usr/share/keyrings/oneapi-archive-keyring.gpg] https://apt.repos.intel.com/oneapi all main" | tee /etc/apt/sources.list.d/oneAPI.list && \
    apt update && \
    apt install -y intel-basekit intel-hpckit

# .bashrcにsetvars.shを追加
RUN echo "source /opt/intel/oneapi/setvars.sh && unset PYTHONPATH" >> ~/.bashrc
