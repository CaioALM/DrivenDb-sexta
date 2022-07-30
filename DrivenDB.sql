CREATE DATABASE "DrivenDB";


CREATE TABLE "customers" (
	"id" SERIAL PRIMARY KEY,
	"fullName" TEXT,
	"cpf" VARCHAR(11) NOT NULL UNIQUE,
	"email" TEXT NOT NULL UNIQUE ,
	"password" TEXT NOT NULL

);

CREATE TABLE "bankAccount" (
	"id" SERIAL PRIMARY KEY,
	"customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
	"accountNumber" NUMBER NOT NULL UNIQUE,
	"agency" NUMBER NOT NULL,
	"openDate" TIMESTAMP NOT NULL DEFAULT now(),
	"closeDate" TIMESTAMP 

);

CREATE TABLE "transactions" (
	"id" SERIAL PRIMARY KEY,
	"bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"("id"),
	"amount" NUMBER NOT NULL ,
	"type" TEXT NOT NULL,
	"time" TIMESTAMP NOT NULL DEFAULT now()
);

CREATE TABLE "creditCards" (
	"id" SERIAL PRIMARY KEY,
	"bankAccount" INTEGER NOT NULL REFERENCES "bankAccount"("id"),
	"name" TEXT NOT NULL,
	"number" NUMBER NOT NULL UNIQUE,
	"securityCode" NUMBER NOT NULL,
	"expirationMonth" TIMESTAMP NOT NULL,
	"expirationYear" TIMESTAMP NOT NULL,
	"password" TEXT NOT NULL,
	"limit" NUMBER NOT NULL
);

CREATE TABLE "customerPhones" (
	"id" SERIAL PRIMARY KEY,
	"customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
	"number" VARCHAR(14) NOT NULL UNIQUE,
	"type" TEXT NOT NULL
);

CREATE TABLE "states" (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL ,

);

CREATE TABLE "cities" (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL ,
	"stateId" INTEGER NOT NULL REFERENCES "states"("id")
);

CREATE TABLE "customerAddresses" (
	"id" SERIAL PRIMARY KEY,
	"customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
	"street" TEXT NOT NULL UNIQUE,
	"number" NUMBER NOT NULL,
	"complement" TEXT,
	"postalCode" VARCHAR(8) NOT NULL,
	"cityId" INTEGER NOT NULL REFERENCES "cities"("id")
);


