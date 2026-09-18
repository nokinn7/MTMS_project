from fastapi import APIRouter, Request
from fastapi.templating import Jinja2Templates
from sqlalchemy import text

from app.database import get_connection

router = APIRouter()

templates = Jinja2Templates(directory="app/templates")


@router.get("/passengers")
def passengers(request: Request):

    with get_connection() as conn:
        result = conn.execute(text("""
            SELECT passengerId,
                   firstName,
                   lastName,
                   gender,
                   city
            FROM Passenger
            ORDER BY passengerId;
        """))

        passengers = result.fetchall()

    return templates.TemplateResponse(
        request=request,
        name="passengers.html",
        context={
            "passengers": passengers
        }
    )