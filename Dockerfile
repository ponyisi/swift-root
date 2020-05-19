FROM ponyisi/swift-jupyter

WORKDIR /root
ADD https://root.cern/download/root_v6.20.04.Linux-ubuntu18-x86_64-gcc7.5.tar.gz root.tar.gz
#COPY root_v6.20.04.Linux-ubuntu18-x86_64-gcc7.5.tar.gz root.tar.gz
RUN tar xzf root.tar.gz && rm root.tar.gz
COPY start.sh register.py ./

RUN python3 register.py --user --swift-toolchain /swift-tensorflow-toolchain --swift-python-version 2.7 --kernel-name "Swift-ROOT-Py2"

EXPOSE 8888
WORKDIR /notebooks
CMD ["/root/start.sh", "--allow-root", "--no-browser", "--ip=0.0.0.0", "--port=8888", "--NotebookApp.custom_display_url=http://127.0.0.1:8888"]
