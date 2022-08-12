FROM cubecoders/ampbase

RUN wget https://packages.microsoft.com/config/ubuntu/21.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && \
        dpkg -i packages-microsoft-prod.deb && \
        rm packages-microsoft-prod.deb

RUN apt-get update && apt-get -y upgrade && \
        apt-get install -y dotnet-sdk-6.0 && \
        apt-get clean && \
        rm -rf /var/lib/apt/lists/*

RUN curl -L -s https://dot.net/v1/dotnet-install.sh | bash -s -- --channel 3.1

ENTRYPOINT ["/ampstart.sh"]
CMD []