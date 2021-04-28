# Introduction to containerizing a task

Intro this lab will walk you through creating a simple web application in python. It will then show you how to wrap up that application and all the dependencies into a docker container

Step 1 - Install python on your computer

Windows - [Installation steps](https://docs.python.org/3/using/windows.html#windows-store)

Mac OS X - `brew install python@3.9`

Step 2 - Install requirements for the flask application

`python3 -m pip install -r requirements.txt`

```
ubuntu#python3 -m pip install -r requirements.txt
Collecting flask
  Downloading Flask-1.1.2-py2.py3-none-any.whl (94 kB)
     |████████████████████████████████| 94 kB 646 kB/s
Collecting Jinja2>=2.10.1
  Downloading Jinja2-2.11.3-py2.py3-none-any.whl (125 kB)
     |████████████████████████████████| 125 kB 677 kB/s
Collecting click>=5.1
  Using cached click-7.1.2-py2.py3-none-any.whl (82 kB)
Collecting itsdangerous>=0.24
  Downloading itsdangerous-1.1.0-py2.py3-none-any.whl (16 kB)
Collecting Werkzeug>=0.15
  Downloading Werkzeug-1.0.1-py2.py3-none-any.whl (298 kB)
     |████████████████████████████████| 298 kB 1.7 MB/s
Collecting MarkupSafe>=0.23
  Using cached MarkupSafe-1.1.1.tar.gz (19 kB)
Using legacy 'setup.py install' for MarkupSafe, since package 'wheel' is not installed.
Installing collected packages: MarkupSafe, Jinja2, click, itsdangerous, Werkzeug, flask
    Running setup.py install for MarkupSafe ... done
Successfully installed Jinja2-2.11.3 MarkupSafe-1.1.1 Werkzeug-1.0.1 click-7.1.2 flask-1.1.2 itsdangerous-1.1.0
WARNING: You are using pip version 20.2.3; however, version 21.1 is available.
You should consider upgrading via the '/Users/jyoungta/.pyenv/versions/flask/bin/python3 -m pip install --upgrade pip' command.
```

Step 3 - run the web application
`FLASK_APP=main python3 -m flask run`

```
(flask) ➜  containerizeAnApplication git:(main) ✗ FLASK_APP=main python3 -m flask run
 * Serving Flask app "main"
 * Environment: production
   WARNING: This is a development server. Do not use it in a production deployment.
   Use a production WSGI server instead.
 * Debug mode: off
 * Running on http://127.0.0.1:5000/ (Press CTRL+C to quit)
127.0.0.1 - - [28/Apr/2021 11:37:31] "GET / HTTP/1.1" 200 -
```

Step 4 - open a webbrowser and go to http://127.0.0.1:5000

You should see the webpage load with some information about the webpage.

Congrats. You have a very basic web server/application running on your local machine. Now we will wrap it up within a container

Step 5 - Install docker desktop on your computer

Windows - [Install step](https://docs.docker.com/docker-for-windows/install/)

Mac OS X - [Install steps](https://docs.docker.com/docker-for-mac/install/)

Step 6 - Run the hello world basic container

```
ubuntu#docker container run hello-world

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/

ubuntu#
```

Step 7 - Build the docker image locally

This step will use the `Dockerfile` to instruct docker on how to copy the files inside the docker container and install the relevant dependencies.

`docker image build -t local:myfirst .`

```
ubuntu:~/docker/containerizeAnApplication$ docker image build -t local:myfirst .
Sending build context to Docker daemon  69.63kB
Step 1/7 : FROM python:3.9.4
3.9.4: Pulling from library/python
bd8f6a7501cc: Pull complete
44718e6d535d: Pull complete
efe9738af0cb: Pull complete
f37aabde37b8: Pull complete
3923d444ed05: Pull complete
1ecef690e281: Pull complete
0649c5bd9851: Pull complete
d7a9fa72f192: Pull complete
9de7a5c126e6: Pull complete
Digest: sha256:8af3ff730fd99d67b9bc1237c6ac0fd2761a4646b6ea0e0f99ec12d27ba650d9
Status: Downloaded newer image for python:3.9.4
 ---> a57971b4d22c
Step 2/7 : ENV FLASK_APP main
 ---> Running in 7c9c838fbd28
Removing intermediate container 7c9c838fbd28
 ---> ddfad6a81279
Step 3/7 : COPY requirements.txt .
 ---> b83c2df05a29
Step 4/7 : RUN python3 -m pip install -r requirements.txt
 ---> Running in a9dc7bf07361
WARNING: Value for scheme.headers does not match. Please report this to <https://github.com/pypa/pip/issues/9617>
distutils: /usr/local/include/python3.9/UNKNOWN
sysconfig: /usr/local/include/python3.9
WARNING: Additional context:
user = False
home = None
root = None
prefix = None
Collecting flask
  Downloading Flask-1.1.2-py2.py3-none-any.whl (94 kB)
Collecting click>=5.1
  Downloading click-7.1.2-py2.py3-none-any.whl (82 kB)
Collecting itsdangerous>=0.24
  Downloading itsdangerous-1.1.0-py2.py3-none-any.whl (16 kB)
Collecting Jinja2>=2.10.1
  Downloading Jinja2-2.11.3-py2.py3-none-any.whl (125 kB)
Collecting Werkzeug>=0.15
  Downloading Werkzeug-1.0.1-py2.py3-none-any.whl (298 kB)
Collecting MarkupSafe>=0.23
  Downloading MarkupSafe-1.1.1-cp39-cp39-manylinux2010_x86_64.whl (32 kB)
Installing collected packages: MarkupSafe, Werkzeug, Jinja2, itsdangerous, click, flask
WARNING: Value for scheme.headers does not match. Please report this to <https://github.com/pypa/pip/issues/9617>
distutils: /usr/local/include/python3.9/UNKNOWN
sysconfig: /usr/local/include/python3.9
WARNING: Additional context:
user = False
home = None
root = None
prefix = None
Successfully installed Jinja2-2.11.3 MarkupSafe-1.1.1 Werkzeug-1.0.1 click-7.1.2 flask-1.1.2 itsdangerous-1.1.0
WARNING: Running pip as root will break packages and permissions. You should install packages reliably by using venv: https://pip.pypa.io/warnings/venv
Removing intermediate container a9dc7bf07361
 ---> ec7d0f53e924
Step 5/7 : COPY main.py .
 ---> 7bd441e6bc23
Step 6/7 : EXPOSE 5000
 ---> Running in 6ef1702dd3ca
Removing intermediate container 6ef1702dd3ca
 ---> d2ae9ce2f04c
Step 7/7 : CMD ["python3", "-m", "flask", "run", "--host=0.0.0.0"]
 ---> Running in a07f29ff6d9f
Removing intermediate container a07f29ff6d9f
 ---> ec777f9a125c
Successfully built ec777f9a125c
Successfully tagged local:myfirst
```

Step 8 - Run the container and then with your browser go to http://localhost:5000

Start the container and allow the port to be fowarded
`docker run -it -p 5000:5000 local:myfirst`

```
ubuntu@ubuntu:~/docker/containerizeAnApplication$ docker run -it -p 5000:5000 local:flask
 * Serving Flask app "main"
 * Environment: production
   WARNING: This is a development server. Do not use it in a production deployment.
   Use a production WSGI server instead.
 * Debug mode: off
 * Running on http://0.0.0.0:5000/ (Press CTRL+C to quit)
10.117.148.21 - - [28/Apr/2021 19:07:47] "GET / HTTP/1.1" 200 -
10.117.148.21 - - [28/Apr/2021 19:07:47] "GET /favicon.ico HTTP/1.1" 404 -
10.117.148.21 - - [28/Apr/2021 19:07:51] "GET / HTTP/1.1" 200 -
10.117.148.21 - - [28/Apr/2021 19:07:54] "GET / HTTP/1.1" 200 -
```
