FROM debian:stable-slim

# Sin prompts al ejecutar comandos, siempre respuestas por defecto
ENV DEBIAN_FRONTEND noninteractive

ENV server_download_link https://launcher.mojang.com/v1/objects/3dc3d84a581f14691199cf6831b71ed1296a9fdf/server.jar

# Directorio
RUN mkdir /opt/minecraft/
RUN mkdir /opt/minecraft/server
WORKDIR /opt/minecraft/server

# Instalar Java
RUN apt-get -y update
RUN apt-get -y install --no-install-recommends apt-utils
RUN mkdir -p /usr/share/man/man1
RUN apt-get -y install --no-install-recommends openjdk-11-jre-headless

# Descarga jar de servidor (1.14.4)
RUN apt-get -y install wget
RUN wget $server_download_link

# Aceptar eula (necesario para arrancar el servidor)
RUN echo "eula=true" > eula.txt

# Puerto por defecto (si no se especifica otro en server.properties)
EXPOSE 25565

# Arrancar servidor
CMD ["java","-Xmx1G","-Xms1G", "-jar", "server.jar", "nogui"]
