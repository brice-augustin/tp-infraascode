FROM debian

# ceci est un commentaire
RUN apt-get update && apt-get -y install netcat
 
EXPOSE 4242
 
COPY app.sh /tmp
RUN chmod +x /tmp/app.sh
 
ENTRYPOINT ["/tmp/app.sh"]
