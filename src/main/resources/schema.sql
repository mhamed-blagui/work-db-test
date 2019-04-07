CREATE SCHEMA WORK;

CREATE SEQUENCE WORK.USER_SEQ;
CREATE SEQUENCE WORK.ORDER_SEQ;
CREATE SEQUENCE WORK.SERVICE_SEQ;
CREATE SEQUENCE WORK.SERVICE_HIST_SEQ;
CREATE SEQUENCE WORK.ORDER_HIST_SEQ;
CREATE SEQUENCE WORK.OPERATION_HIST_SEQ;
CREATE SEQUENCE WORK.BATCH_HIST_SEQ;

CREATE TABLE WORK.WORK_USER(
	ID NUMBER PRIMARY KEY,
	USERNAME VARCHAR,
	PASSWORD VARCHAR,
	FIRST_NAME VARCHAR,
	LAST_NAME VARCHAR,
	EMAIl VARCHAR,
	ACTIVATED BOOLEAN
);
CREATE TABLE WORK.WORK_AUTHORITY (
	NAME VARCHAR PRIMARY KEY
);
CREATE TABLE WORK.WORK_USER_AUTHORITY (
	USER_ID NUMBER,
	AUTHORITY_NAME VARCHAR
);
CREATE TABLE WORK.WORK_OPERATION_HISTORY (
	ID NUMBER PRIMARY KEY,
	NAME VARCHAR,
	STATUS VARCHAR,
	CREATION_DATE TIMESTAMP,
	DESCRIPTION VARCHAR
);
CREATE TABLE WORK.WORK_ORDER (
	ID NUMBER PRIMARY KEY,
	CURRENT_STATE VARCHAR,
	PAYED BOOLEAN,
	DELIVERED BOOLEAN,
	CUSTOMER NUMBER,
	PROVIDER NUMBER,
	DELIVER NUMBER,
	CREATION_DATE TIMESTAMP
);
CREATE TABLE WORK.WORK_ORDER_HISTORY (
	ID NUMBER PRIMARY KEY,
	ORDER_ID NUMBER,
	STATE VARCHAR,
	DESCRIPTION VARCHAR,
	CREATION_DATE TIMESTAMP
);
CREATE TABLE WORK.WORK_SERVICE (
	ID NUMBER PRIMARY KEY,
	STATUS VARCHAR,
	PROVIDER NUMBER,
	DESCRIPTION VARCHAR,
	PRICE DECIMAL
);
CREATE TABLE WORK.WORK_ORDER_SERVICE(
	ORDER_ID NUMBER,
	SERVICE_ID NUMBER
);
CREATE TABLE WORK.WORK_SERVICE_HISTORY (
	ID NUMBER PRIMARY KEY,
	NAME VARCHAR,
	STATUS VARCHAR,
	CREATION_DATE TIMESTAMP,
	DESCRIPTION VARCHAR
);
CREATE TABLE WORK.WORK_BATCH_HISTORY (
	ID NUMBER PRIMARY KEY,
	NAME VARCHAR,
	STATUS VARCHAR,
	CREATION_DATE TIMESTAMP,
	START_DATE TIMESTAMP,
	END_DATE TIMESTAMP,
	DESCRIPTION VARCHAR
);

CREATE USER WORK_APP IDENTIFIED BY WORK_APP;

GRANT SELECT,UPDATE,DELETE,INSERT ON WORK.WORK_USER TO WORK_APP;
GRANT SELECT,UPDATE,DELETE,INSERT ON WORK.WORK_AUTHORITY TO WORK_APP;
GRANT SELECT,UPDATE,DELETE,INSERT ON WORK.WORK_OPERATION_HISTORY TO WORK_APP;
GRANT SELECT,UPDATE,DELETE,INSERT ON WORK.WORK_ORDER TO WORK_APP;
GRANT SELECT,UPDATE,DELETE,INSERT ON WORK.WORK_ORDER_HISTORY TO WORK_APP;
GRANT SELECT,UPDATE,DELETE,INSERT ON WORK.WORK_SERVICE TO WORK_APP;
GRANT SELECT,UPDATE,DELETE,INSERT ON WORK.WORK_ORDER_SERVICE TO WORK_APP;
GRANT SELECT,UPDATE,DELETE,INSERT ON WORK.WORK_USER_AUTHORITY TO WORK_APP;
GRANT SELECT,UPDATE,DELETE,INSERT ON WORK.WORK_SERVICE_HISTORY TO WORK_APP;
GRANT SELECT,UPDATE,DELETE,INSERT ON WORK.WORK_BATCH_HISTORY TO WORK_APP;
