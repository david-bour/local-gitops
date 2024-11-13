from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root():
    return {"status": "healthy"}

@app.get('/{echo}')
def echo(echo: str):
    return {"msg": echo}

