FROM openjdk:17-jdk-alpine
WORKDIR /app
# 修改为实际生成的JAR文件名
COPY target/BookManagerApi-*.jar app.jar
EXPOSE 8092
ENTRYPOINT ["java", "-jar", "app.jar"]