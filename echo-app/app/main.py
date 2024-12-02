import os
import time
import logging
from fastapi import FastAPI

logger = logging.getLogger(__name__)

delay_startup = int(os.environ.get("DELAY_START", 0))
time.sleep(delay_startup)

app = FastAPI()

@app.get("/")
def read_root():
    return {"status": "healthy!!"}

@app.get('/{echo}')
def echo(echo: str):
    return {"msg": echo}

