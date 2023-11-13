#!/bin/bash

mkdir templates
mkdir static

cp -r templates/* MIDTERM/templates/.
cp -r static/* MIDTERM/static/.

echo "FROM python" >> MIDTERM/Dockerfile
echo "RUN pip install flask" >> MIDTERM/Dockerfile
echo "COPY  ./static /home/myapp/static/" >> MIDTERM/Dockerfile
echo "COPY  ./templates /home/myapp/templates/" >> MIDTERM/Dockerfile
echo "COPY  midterm_app.py /home/myapp/" >> MIDTERM/Dockerfile
echo "EXPOSE 5000" >> MIDTERM/Dockerfile
echo "CMD python3 /home/myapp/midterm_app.py" >> MIDTERM/Dockerfile

docker build -t midterm .
docker run -t -d -p 5000:5000 --name midterm midtermapp
docker ps -a 
