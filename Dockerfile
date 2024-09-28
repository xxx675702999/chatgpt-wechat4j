#设置镜像使用的基础镜像 这里使用的是oracle jdk8
FROM openjdk:17
#设置镜像暴露的端口 这里要与application.properties中的server.port保持一致
EXPOSE 8080
#设置容器的挂载卷
VOLUME /home
#编译镜像时将springboot生成的jar文件复制到镜像中
ADD chatgpt-wechat4j-0.0.1-SNAPSHOT.jar  /app.jar
ADD application.yml /home/application.yml
#编译镜像时运行脚本
RUN bash -c 'touch /app.jar'
#容器的入口程序，这里注意如果要指定外部配置文件需要使用-spring.config.location指定配置文件存放目录
ENTRYPOINT ["java","-jar","/app.jar","--spring.config.location=/home/application.yml"]
