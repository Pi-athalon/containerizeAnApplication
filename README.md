# containerizeAnApplication

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

Congrats. You have a very basic web server/application running on your local machine.

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

`docker image build -t local:my_first_container .`
