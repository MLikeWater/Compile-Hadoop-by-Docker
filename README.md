# Compile-Hadoop-by-Docker
1. 通过Docker容器编译Hadoop

    第一种方法：从Docker Hub下载镜像

    sudo docker pull jiangshouzhuang/compile-hadoop-by-docker
    
    第二种方法：自己构建镜像

    sudo docker build -t jiangshouzhuang/compile-hadoop-by-docker .

2. 下载源代码(http://archive.apache.org/dist/hadoop/core/)

    export VERSION=2.7.3
    
    wget http://archive.apache.org/dist/hadoop/core/hadoop-$VERSION/hadoop-$VERSION-src.tar.gz
    
    tar -xzvf hadoop-$VERSION-src.tar.gz

3. 运行容器，编译Hadoop

    sudo docker run -v $(pwd)/hadoop-$VERSION-src:/hadoop-$VERSION-src jiangshouzhuang/compile-hadoop-by-docker /root/compile.sh $VERSION

4. 编译好的Hadoop包路径

    hadoop-2.7.3-src/hadoop-dist/target/hadoop-2.7.3.tar.gz

注：根据自己的需求，选择合适的Hadoop版本进行编译；另外，Dockerfile中的JDK版本和路径根据自己的实际情况配置。
