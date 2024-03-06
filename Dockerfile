FROM openjdk:17

WORKDIR /app

COPY build/libs/library-service-*.jar library-service.jar

CMD ["java", "-jar", "library-service.jar"]