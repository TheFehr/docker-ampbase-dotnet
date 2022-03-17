FROM cubecoders/ampbase

RUN wget https://packages.microsoft.com/config/ubuntu/21.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && \
        dpkg -i packages-microsoft-prod.deb && \
        rm packages-microsoft-prod.deb

RUN apt-get update && apt-get -y upgrade && \
        apt-get install -y dotnet-sdk-6.0 && \
        apt-get clean && \
        rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/ampstart.sh"]
CMD []