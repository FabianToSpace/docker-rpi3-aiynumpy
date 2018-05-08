FROM uptospace/rpi3-aiyvoice:1

# Set our working directory
WORKDIR /usr/app

# Copy requirements.txt first for better cache on later pushes
COPY ./requirements.txt /requirements.txt

# This will copy all files in our root to the working  directory in the container
COPY . ./

# switch on systemd init system in container
ENV INITSYSTEM on

# pip install python deps from requirements.txt on the resin.io build server
RUN pip install -r /requirements.txt

RUN apt-get install python3-scipy

CMD ["echo","'No CMD command was set in Dockerfile! Details about CMD command could be found in Dockerfile Guide section in our Docs. Here's the link: http://docs.resin.io/deployment/dockerfile"]