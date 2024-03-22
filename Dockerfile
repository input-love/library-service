FROM gradle:8.6.0-focal AS build

WORKDIR /workspace

COPY src ./src
COPY build.gradle ./build.gradle
COPY settings.gradle ./settings.gradle

COPY config/checkstyle/checkstyle.xml ./config/checkstyle/checkstyle.xml

RUN gradle clean build --no-daemon --exclude-task test

FROM bellsoft/liberica-openjdk-alpine:17

RUN adduser --system spring-boot && addgroup --system spring-boot && adduser spring-boot spring-boot
USER spring-boot

WORKDIR /app

COPY --from=build /workspace/build/libs/library-service-*.jar ./library-service.jar

ENV JAVA_TOOL_OPTIONS="-Dcom.sun.management.jmxremote.port=1099 \
-Dcom.sun.management.jmxremote.rmi.port=1099 \
-Dcom.sun.management.jmxremote.ssl=false \
-Dcom.sun.management.jmxremote.authenticate=false \
-Djava.rmi.server.hostname=localhost"

CMD ["java", "-jar", "library-service.jar"]