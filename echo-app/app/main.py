import os
import time
import logging
import requests
from fastapi import FastAPI
from pydantic import BaseModel

logger = logging.getLogger(__name__)

delay_startup = int(os.environ.get("DELAY_START", 0))
time.sleep(delay_startup)

app = FastAPI()

@app.get("/")
def read_root():
    return {"status": "healthy ❤️"}

@app.get("/info")
def info():
    return {"name": os.environ.get("APPNAME", "No Name")}

@app.get('/{echo}')
def echo(echo: str):
    return {"msg": echo}

class Proxy(BaseModel):
    url: str

@app.post('/proxy')
def proxy(data: Proxy):
    results = requests.get(data.url)
    try:
        return results.json()
    except Exception:
        return results.text

