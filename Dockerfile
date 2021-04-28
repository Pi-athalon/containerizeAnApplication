FROM python:3.9.4
ENV FLASK_APP main
COPY requirements.txt .
RUN python3 -m pip install -r requirements.txt
COPY main.py .
EXPOSE 5000
CMD ["python3", "-m", "flask", "run", "--host=0.0.0.0"]