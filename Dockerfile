FROM ubuntu
ENV TZ=America/Mexico_City
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update
RUN apt install -y python
RUN echo 1.0 >> /etc/version && apt install -y git \
    && apt install -y iputils-ping

##WORKDIR##
RUN mkdir /datos
WORKDIR /datos
RUN touch f1.txt
WORKDIR /datos1
RUN touch f2.txt

##COPY##
COPY index.html .
COPY app.log /datos1

##ADD##
ADD docs docs
ADD f* /datos/
# ADD f.tar .

##ENV##
ENV dir=/data2 dir1=/data3
RUN mkdir $dir    && mkdir $dir1

##ARG##
# ARG dir2
# RUN mkdir $dir2
# ARG user
# ENV user_docker $user
# ADD add_user.sh /datos1
# RUN /datos1/add_user.sh

##EXPOSE##
RUN apt install -y apache2
EXPOSE 80
ADD entrypoint.sh /datos1

##VOLUME##
ADD paginas /var/www/html
VOLUME ["/var/www/html"]

##CMD##
CMD /datos1/entrypoint.sh

##ENTRYPOINT##
# ENTRYPOINT ["/bin/bash"]
