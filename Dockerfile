#下载基础镜像
FROM nvidia/cuda:11.4.2-cudnn8-runtime-ubuntu20.04
ENV LANG C.UTF-8
RUN echo "cuda镜像拉取完毕"
RUN echo "下面安装python"
RUN apt-get update && apt-get install -y python3-pip git && rm -rf /var/lib/apt/lists/*
RUN ln -s /usr/bin/python3.8 /usr/bin/python
RUN pip install gpt-2-simple -i https://pypi.tuna.tsinghua.edu.cn/simple
RUN pip install pymsql -i https://pypi.tuna.tsinghua.edu.cn/simple
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV HOME /root
ENV COMFORT /root/Comfort_all
WORKDIR $COMFORT
ENV http_proxy socks5://10.15.10.87:20170
ENV https_proxy socks5://10.15.10.87:20170
RUN git clone -b dockerfile https://github.com/lionche/Comfort_all.git $COMFORT
RUN tar -zxvf $COMFORT/data/JStestcases.tar.gz -C $COMFORT/data/
RUN rm -rf $COMFORT/data/JStestcases.tar.gz
ENV http_proxy ""
ENV https_proxy ""