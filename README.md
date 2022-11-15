# PROCESS-1


1) Build the solution locally using STS and upload it to EC2 instance.
2) CMD to upload from local PC to EC2 server machine

move the war file to pem key location and use the below commands

```
chmod 400 $pemkey.pem
````

```
scp -i $pemkey.pem $.war ubuntu@$server_ip:
````

3) Create a folder in server machine and move .war files to the machine.
4) Create Dockerfile in the directory with below configuration.

```
sudo nano Dockerfile
````
```
FROM tomcat:8-jre11

COPY *.war /usr/local/tomcat/webapps/

EXPOSE 8080
CMD ["catalina.sh", "run"]
````
5) save te Dockerfile and build to image.
```
docker build -t testproject .
````
6) check the image details with cmd ```docker images```
7) run the docker image with deploy as container.
```
docker run -d -p 8080:8080 $image_ID
````
8) Check dokcer container with cmd ```dokcer ps -a```
9) Open the ip address in chrome to verify.


