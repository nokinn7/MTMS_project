from fastapi import FastAPI

from app.routes import passenger_api


app = FastAPI(
    title="MTMS - Smart Public Transport & Metro Management System",
    description="Backend API for the Smart Public Transport & Metro Management System",
    version="1.0.0"
)


# Register API routes
app.include_router(passenger_api.router)


@app.get("/")
def home():
    return {
        "message": "MTMS Backend is running successfully!",
        "project": "Smart Public Transport & Metro Management System",
        "version": "1.0.0"
    }