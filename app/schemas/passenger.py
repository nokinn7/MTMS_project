from datetime import date

from pydantic import BaseModel


class PassengerResponse(BaseModel):
    passengerId: int
    firstName: str
    middleName: str | None = None
    lastName: str
    gender: str | None = None
    dateOfBirth: date | None = None
    email: str | None = None
    phoneNumber: str | None = None
    houseNo: str | None = None
    street: str | None = None
    city: str | None = None
    state: str | None = None
    pincode: str | None = None

    class Config:
        from_attributes = True