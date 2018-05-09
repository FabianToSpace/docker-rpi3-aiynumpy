FROM uptospace/rpi3-aiyvoice:3.5.5

# Set our working directory
WORKDIR /usr/app

# Copy requirements.txt first for better cache on later pushes
COPY ./requirements.txt /requirements.txt

# This will copy all files in our root to the working  directory in the container
COPY . ./

# switch on systemd init system in container
ENV INITSYSTEM on

RUN apt update && apt install libatlas-base-dev python3-pip

# pip install python deps from requirements.txt on the resin.io build server
RUN pip3 install -r /requirements.txt -i https://www.piwheels.org/simple --no-cache-dir

CMD ["echo","'No CMD command was set in Dockerfile! Details about CMD command could be found in Dockerfile Guide section in our Docs. Here's the link: http://docs.resin.io/deployment/dockerfile"]