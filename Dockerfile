FROM jupyter/datascience-notebook:notebook-6.4.12

WORKDIR /home/jovyan/work/

# Copy local into docker
COPY . /home/jovyan/work/


RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash
RUN apt-get update
RUN apt-get install ca-certificates curl apt-transport-https lsb-release gnupg
RUN curl -sL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null
RUN AZ_REPO=$(lsb_release -cs)
RUN echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | tee /etc/apt/sources.list.d/azure-cli.list
RUN apt-get update
RUN apt-get install azure-cli


# Install dependencies
RUN pip3 install -r requirements.txt
