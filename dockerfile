FROM eclipse-temurin:17-jre
WORKDIR /app
COPY target/springboot-k8s-demo.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","app.jar"]

