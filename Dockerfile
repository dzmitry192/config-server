FROM gradle:jdk17 as gradleimage
COPY . /home/gradle/source
WORKDIR /home/gradle/source
RUN gradle build

FROM openjdk:17
WORKDIR /app
COPY --from=gradleimage /home/gradle/source/build/libs/config-server-0.0.1-SNAPSHOT.jar /app/
ENTRYPOINT ["java","-jar","config-server-0.0.1-SNAPSHOT.jar"]