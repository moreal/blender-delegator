FROM python:3.7.4

RUN apt-get update -y && apt-get install blender -y

RUN apt-get update && \
	apt-get install -y \
		curl \
		bzip2 \
		libfreetype6 \
		libgl1-mesa-dev \
		libglu1-mesa \
		libxi6 \
		libxrender1 \
        xvfb && \
	apt-get -y autoremove && \
	rm -rf /var/lib/apt/lists/*

ENV BLENDER_MAJOR 2.81
ENV BLENDER_VERSION 2.81
ENV BLENDER_BZ2_URL https://mirror.clarkson.edu/blender/release/Blender$BLENDER_MAJOR/blender-$BLENDER_VERSION-linux-glibc217-x86_64.tar.bz2

RUN mkdir /usr/local/blender && \
	curl -SL https://mirror.clarkson.edu/blender/release/Blender2.81/blender-2.81-linux-glibc217-x86_64.tar.bz2 -o blender.tar.bz2 && \
	tar -xvf blender.tar.bz2 -C /usr/local/blender --strip-components=1 && \
	rm blender.tar.bz2

WORKDIR /server
COPY . .
RUN pip install -r requirements.txt

CMD ["python3", "app.py"]
