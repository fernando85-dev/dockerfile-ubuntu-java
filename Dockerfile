FROM ubuntu:20.04 as base

RUN apt update -y && apt upgrade && apt install default-jdk -y && apt install ca-certificates 

COPY cert/cert_CertTrusted-WebSSL-FW-UnimedPOA.crt /usr/local/share/ca-certificates/
RUN cat /usr/local/share/ca-certificates/cert_CertTrusted-WebSSL-FW-UnimedPOA.crt >> /etc/ssl/certs/ca-certificates.crt && update-ca-certificates

#ENV PATH "../.."

COPY . /var/www/java  
WORKDIR /var/www/java  
RUN javac PrimeiraClasse.java  
CMD ["java", "PrimeiraClasse"] 

#EXPOSE 80:8091
