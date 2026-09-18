from datetime import date
from sqlalchemy import Date, String
from sqlalchemy.orm import Mapped, mapped_column
from app.models.base import Base

class Passenger(Base):
    __tablename__ = "Passenger"
    passengerId: Mapped[int] = mapped_column(
        primary_key=True,
        autoincrement=True
    )
    firstName: Mapped[str] = mapped_column(
        String(50),
        nullable=False
    )
    middleName: Mapped[str | None] = mapped_column(
        String(50),
        nullable=True
    )
    lastName: Mapped[str] = mapped_column(
        String(50),
        nullable=False
    )
    gender: Mapped[str | None] = mapped_column(
        String(10),
        nullable=True
    )
    dateOfBirth: Mapped[date | None] = mapped_column(
        Date,
        nullable=True
    )
    email: Mapped[str | None] = mapped_column(
        String(100),
        nullable=True,
        unique=True
    )
    phoneNumber: Mapped[str | None] = mapped_column(
        String(15),
        nullable=True,
        unique=True
    )
    houseNo: Mapped[str | None] = mapped_column(
        String(20),
        nullable=True
    )
    street: Mapped[str | None] = mapped_column(
        String(100),
        nullable=True
    )
    city: Mapped[str | None] = mapped_column(
        String(50),
        nullable=True
    )
    state: Mapped[str | None] = mapped_column(
        String(50),
        nullable=True
    )
    pincode: Mapped[str | None] = mapped_column(
        String(10),
        nullable=True
    )