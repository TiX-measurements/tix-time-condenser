FROM openjdk:8u342-oraclelinux8 AS build

WORKDIR /root/

COPY . .
RUN ./gradlew bootRepackage

# ----- final image ------

FROM amazoncorretto:8u342-alpine3.15-jre

WORKDIR /root/tix-time-condenser

COPY --from=build /root/build/libs/tix-time-condenser-*.jar ./tix-time-condenser.jar

CMD ["java", "-jar", "tix-time-condenser.jar"]
