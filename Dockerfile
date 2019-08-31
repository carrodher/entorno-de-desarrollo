FROM bitnami/minideb:buster
LABEL maintainer 'Carlos Rodriguez Hernandez <carrodher1179@gmail.com>'

RUN install_packages procps git vim zsh wget unzip build-essential python3-pip default-jdk ruby-full nodejs
COPY rootfs /

# Execute build scripts
RUN for script in /buildScripts/*.sh; do \
        printf '[build] Running %s\n' "$script"; \
        "$script"; \
    done

ENV JAVA_HOME='/usr/lib/jvm/java-8-openjdk-amd64' \
    USER_EMAIL='' \
    USER_NAME=''

WORKDIR /root
ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "/bin/zsh" ]