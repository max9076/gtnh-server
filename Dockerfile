FROM ubuntu/jre:17-22.04_edge

ARG modpackurl=http://downloads.gtnewhorizons.com/ServerPacks/GT_New_Horizons_2.4.0_Server_Java_17-20.zip

RUN wget ${modpackurl}

RUN unzip $(basename ${modpackurl}) -d /data

WORKDIR /data
RUN chmod +x startserver-java9.sh
RUN sed -i 's;false;${EULA};' eula.txt

EXPOSE 25565/tcp

CMD ["java", "-Xms6G", "-Xmx6G", "-Dfml.readTimeout=180", "@java9args.txt", "nogui"]
