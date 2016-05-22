CREATE TABLE  "CARRIER" 
   (    "CARRIERID" NUMBER NOT NULL ENABLE, 
    "CARRIER_NAME" VARCHAR2(100) NOT NULL ENABLE, 
    "CARRIER_ADDRESS1" VARCHAR2(100) NOT NULL ENABLE, 
    "CARRIER_ADDRESS2" VARCHAR2(100), 
    "CITY" VARCHAR2(100) NOT NULL ENABLE, 
    "STATE" VARCHAR2(100) NOT NULL ENABLE, 
    "ZIPCODE" NUMBER NOT NULL ENABLE, 
    "URL" VARCHAR2(100) NOT NULL ENABLE, 
    "CUSTOMERCARENUMBER" NUMBER NOT NULL ENABLE, 
     CONSTRAINT "CARRIER_PK" PRIMARY KEY ("CARRIERID") ENABLE
   ) ;CREATE TABLE  "EMPLOYER" 
   (    "EMPLRID" NUMBER NOT NULL ENABLE, 
    "REGNUMBER" VARCHAR2(20), 
    "NAME" VARCHAR2(50) NOT NULL ENABLE, 
    "PHONE" VARCHAR2(14) NOT NULL ENABLE, 
    "PHONEEXT" VARCHAR2(5), 
    "FAX" VARCHAR2(14), 
    "FAXEXT" VARCHAR2(5), 
    "EMAIL" VARCHAR2(50), 
    "STRADDR1" VARCHAR2(50) NOT NULL ENABLE, 
    "STRADDR2" VARCHAR2(50), 
    "CITY" VARCHAR2(30) NOT NULL ENABLE, 
    "STATE" VARCHAR2(2) NOT NULL ENABLE, 
    "ZIPCODE" VARCHAR2(10) NOT NULL ENABLE, 
    "ZIPPLS4" VARCHAR2(4), 
    "HRADM" VARCHAR2(50), 
    "HRPHONE" VARCHAR2(14), 
    "HRPHONEEXT" VARCHAR2(5), 
    "HRFAX" VARCHAR2(14), 
    "HRFAXEXT" VARCHAR2(5), 
    "HREMAIL" VARCHAR2(50), 
    "CUSTSVCNUM" VARCHAR2(14), 
    "EMPLECNT" NUMBER, 
    "OFCR" VARCHAR2(50), 
    "URL" VARCHAR2(50), 
     CONSTRAINT "PK_EMPLRID" PRIMARY KEY ("EMPLRID") ENABLE
   ) ;CREATE TABLE  "CASE" 
   (    "CSID" NUMBER NOT NULL ENABLE, 
    "EMPLRID" NUMBER NOT NULL ENABLE, 
    "CSNAME" VARCHAR2(50) NOT NULL ENABLE, 
    "STARTDATE" DATE NOT NULL ENABLE, 
    "ENDDATE" DATE NOT NULL ENABLE, 
    "PLANYEAR" NUMBER NOT NULL ENABLE, 
    "CURRPLNYR" VARCHAR2(1) NOT NULL ENABLE, 
    "ACTIVE" VARCHAR2(1) NOT NULL ENABLE, 
    "CASETYPE" VARCHAR2(100), 
    "DESCRIPTION" VARCHAR2(512), 
     CONSTRAINT "CASE_PK" PRIMARY KEY ("CSID") ENABLE
   ) ;CREATE TABLE  "PRODUCT" 
   (    "PRODID" NUMBER NOT NULL ENABLE, 
    "CARRIERID" NUMBER NOT NULL ENABLE, 
    "PRODTYPE" VARCHAR2(100) NOT NULL ENABLE, 
    "PLANNAME" VARCHAR2(50) NOT NULL ENABLE, 
    "DESCRIPTION" VARCHAR2(512), 
    "TMSTMP" DATE NOT NULL ENABLE, 
    "PREMIUM" NUMBER NOT NULL ENABLE, 
    "COVERAGE" NUMBER NOT NULL ENABLE, 
    "MINIMUMAGE" NUMBER, 
    "MAXIMUMAGE" NUMBER, 
     CONSTRAINT "PK_PRODID" PRIMARY KEY ("PRODID") ENABLE
   ) ;CREATE TABLE  "CASEPRODUCT" 
   (    "CSPRDID" NUMBER NOT NULL ENABLE, 
    "PRODID" NUMBER NOT NULL ENABLE, 
    "CSID" NUMBER NOT NULL ENABLE, 
    "PRODTYPE" VARCHAR2(100) NOT NULL ENABLE, 
    "TMSTMP" DATE NOT NULL ENABLE, 
     CONSTRAINT "PK_CSPRDID" PRIMARY KEY ("CSPRDID") ENABLE
   ) ;CREATE TABLE  "EMPLOYEE" 
   (    "EMPLEID" VARCHAR2(64) NOT NULL ENABLE, 
    "SEX" VARCHAR2(1) NOT NULL ENABLE, 
    "MARRIED" VARCHAR2(1) NOT NULL ENABLE, 
    "SPOUSE" VARCHAR2(1) NOT NULL ENABLE, 
    "CHILDREN" VARCHAR2(1) NOT NULL ENABLE, 
    "CHLDCOUNT" NUMBER, 
    "EMPLRID" NUMBER NOT NULL ENABLE, 
    "DESIGNATION" VARCHAR2(64), 
    "ANNUALSALARY" NUMBER, 
    "EMPLRURL" VARCHAR2(50), 
    "SSN" VARCHAR2(50), 
    "EMPFULLNAME" VARCHAR2(100), 
    "EMPFIRSTNAME" VARCHAR2(100) NOT NULL ENABLE, 
    "EMPMIDDLENAME" VARCHAR2(100), 
    "EMPLASTNAME" VARCHAR2(100) NOT NULL ENABLE, 
    "MOBILE" VARCHAR2(14) NOT NULL ENABLE, 
    "HOMEPHONE" VARCHAR2(14), 
    "PHONE" VARCHAR2(14), 
    "PHONEEXT" VARCHAR2(5), 
    "FAX" VARCHAR2(14), 
    "FAXEXT" VARCHAR2(5), 
    "PERSONALEMAIL" VARCHAR2(50), 
    "OFCEMAIL" VARCHAR2(50), 
    "STRADDR1" VARCHAR2(50) NOT NULL ENABLE, 
    "STRADDR2" VARCHAR2(50), 
    "CITY" VARCHAR2(30) NOT NULL ENABLE, 
    "STATE" VARCHAR2(30) NOT NULL ENABLE, 
    "ZIPCODE" VARCHAR2(10) NOT NULL ENABLE, 
    "BLOODGROUP" VARCHAR2(10) NOT NULL ENABLE, 
    "DOB" DATE NOT NULL ENABLE, 
    "PASSWORD" VARCHAR2(100) NOT NULL ENABLE, 
    "EMPLRNAME" VARCHAR2(100), 
     CONSTRAINT "PK_EMPLEID" PRIMARY KEY ("EMPLEID") ENABLE
   ) ;CREATE TABLE  "ENROLLMENT" 
   (    "ENRLMNTID" NUMBER NOT NULL ENABLE, 
    "CSPRDID" NUMBER NOT NULL ENABLE, 
    "EMPLEID" VARCHAR2(64) NOT NULL ENABLE, 
    "COMPLETED" VARCHAR2(1) NOT NULL ENABLE, 
    "PRODUCT_FOR_SPOUSE" VARCHAR2(3), 
    "PRODUCT_FOR_CHILDREN" VARCHAR2(3), 
     CONSTRAINT "PK_ENRLMNTID" PRIMARY KEY ("ENRLMNTID") ENABLE
   ) ;ALTER TABLE  "PRODUCT" ADD CONSTRAINT "CARRIER_FK" FOREIGN KEY ("CARRIERID")
      REFERENCES  "CARRIER" ("CARRIERID") ENABLE;ALTER TABLE  "CASE" ADD CONSTRAINT "EMPLRID_FK" FOREIGN KEY ("EMPLRID")
      REFERENCES  "EMPLOYER" ("EMPLRID") ENABLE;ALTER TABLE  "CASEPRODUCT" ADD CONSTRAINT "FK_CSID" FOREIGN KEY ("CSID")
      REFERENCES  "CASE" ("CSID") ENABLE;ALTER TABLE  "ENROLLMENT" ADD CONSTRAINT "FK_CSPRDID_ENR" FOREIGN KEY ("CSPRDID")
      REFERENCES  "CASEPRODUCT" ("CSPRDID") ENABLE;ALTER TABLE  "ENROLLMENT" ADD CONSTRAINT "FK_EMPLEID_ENR" FOREIGN KEY ("EMPLEID")
      REFERENCES  "EMPLOYEE" ("EMPLEID") ENABLE;ALTER TABLE  "EMPLOYEE" ADD CONSTRAINT "FK_EMP_EMPLRID" FOREIGN KEY ("EMPLRID")
      REFERENCES  "EMPLOYER" ("EMPLRID") ENABLE;ALTER TABLE  "CASEPRODUCT" ADD CONSTRAINT "FK_PRODID" FOREIGN KEY ("PRODID")
      REFERENCES  "PRODUCT" ("PRODID") ENABLE;CREATE OR REPLACE FUNCTION  "FN_USER_VALIDATION" (
 p_username IN VARCHAR2, --User_Name
 p_password IN VARCHAR2 -- Password
)
 RETURN BOOLEAN
AS
 lc_pwd_exit VARCHAR2 (1);
BEGIN
 -- Validate whether the user exits or not
 SELECT 'Y'
 INTO lc_pwd_exit
 FROM Employee
 WHERE upper(EMPLEID) = UPPER (p_username) AND password = p_password;
 
RETURN TRUE;
EXCEPTION
 WHEN NO_DATA_FOUND
 THEN
 RETURN FALSE;
END fn_user_validation;
/
/
CREATE UNIQUE INDEX  "CARRIER_PK" ON  "CARRIER" ("CARRIERID") 
  ;CREATE UNIQUE INDEX  "CASE_PK" ON  "CASE" ("CSID") 
  ;CREATE UNIQUE INDEX  "PK_CSPRDID" ON  "CASEPRODUCT" ("CSPRDID") 
  ;CREATE UNIQUE INDEX  "PK_EMPLEID" ON  "EMPLOYEE" ("EMPLEID") 
  ;CREATE UNIQUE INDEX  "PK_EMPLRID" ON  "EMPLOYER" ("EMPLRID") 
  ;CREATE UNIQUE INDEX  "PK_ENRLMNTID" ON  "ENROLLMENT" ("ENRLMNTID") 
  ;CREATE UNIQUE INDEX  "PK_PRODID" ON  "PRODUCT" ("PRODID") 
  ; CREATE SEQUENCE   "SEQ_PRODUCT"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 312 NOCACHE  NOORDER  NOCYCLE ; CREATE SEQUENCE   "ENROLLMENT_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 7016 NOCACHE  NOORDER  NOCYCLE ; CREATE SEQUENCE   "EMPLOYER_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1005 NOCACHE  NOORDER  NOCYCLE ; CREATE SEQUENCE   "EMPLOYEE_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 5008 NOCACHE  NOORDER  NOCYCLE ; CREATE SEQUENCE   "CASE_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 112 NOCACHE  ORDER  NOCYCLE ; CREATE SEQUENCE   "CASEPRODUCT_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 320 NOCACHE  NOORDER  NOCYCLE ; CREATE SEQUENCE   "CARRIER_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ;CREATE OR REPLACE TRIGGER  "ENROLLMENT_T1" 
BEFORE
insert or update or delete on "ENROLLMENT"
for each row
begin
begin
 IF :ENRLMNTID IS NULL THEN
 select ENROLLMENT_SEQ.nextval into :ENRLMNTID from dual;
end;
end;
/
ALTER TRIGGER  "ENROLLMENT_T1" DISABLE;CREATE OR REPLACE TRIGGER  "CASE_T1" 
BEFORE
insert on "CASE"
for each row
begin
DECLARE
  v_id case.csid%TYPE;
BEGIN
  SELECT case_seq.nextval INTO v_id FROM DUAL;
  :case.csid := v_id;
END CASE_T1;
end;
/
ALTER TRIGGER  "CASE_T1" DISABLE;CREATE OR REPLACE TRIGGER  "BI_CARRIER" 
  before insert on "CARRIER"               
  for each row  
begin   
  if :NEW."CARRIERID" is null then 
    select "CARRIER_SEQ".nextval into :NEW."CARRIERID" from dual; 
  end if; 
end; 

/
ALTER TRIGGER  "BI_CARRIER" ENABLE;CREATE OR REPLACE FORCE VIEW  "CASE_EMPLOYEE" ("CSNAME", "NAME") AS 
  select c.csname,em.NAME from case c,employee e,employer em where em.EMPLRID=e.EMPLRID and e.EMPLRID=c.EMPLRID;