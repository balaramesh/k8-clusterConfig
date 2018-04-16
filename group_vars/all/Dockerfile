FROM python:2.7.13
RUN python -m pip install --upgrade pip setuptools wheel
ADD gist6.py gist6.py
RUN pip install gdata
CMD ["python", "gist6.py"]
