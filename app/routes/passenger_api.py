from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session

from app.database import engine
from app.models.passenger import Passenger
from app.schemas.passenger import PassengerResponse

router = APIRouter(
    prefix="/api/passengers",
    tags=["Passengers"]
)


def get_db():
    with Session(engine) as session:
        yield session


@router.get("/", response_model=list[PassengerResponse])
def get_passengers(db: Session = Depends(get_db)):

    passengers = db.query(Passenger).all()

    return passengers