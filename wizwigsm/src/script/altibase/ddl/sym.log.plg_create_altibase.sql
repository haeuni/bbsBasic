CREATE TABLE COMTNPRIVACYLOG
(
    REQUST_ID            VARCHAR2(20) NOT NULL,
    INQIRE_DT            DATE NOT NULL,
    SRVC_NM              VARCHAR2(500) NULL,
    INQIRE_INFO          VARCHAR2(100) NULL,
    RQESTER_ID           VARCHAR2(20) NULL,
    RQESTER_IP           VARCHAR2(23) NULL,
CONSTRAINT  REQUST_ID_PK PRIMARY KEY (REQUST_ID)
)
;