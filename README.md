자격증 정보 제공 사이트

---------------------------------------------------------------------------------------------------------

DB create.sql (oracle)

CREATE TABLE  users  (
    u_id    varchar2(50)   ,
    u_pw    varchar2(20)   NOT NULL,
    u_name    varchar2(20)   NOT NULL,
    u_birth    date   NOT NULL,
    u_phone    varchar2(20)   NOT NULL,
    u_addr    varchar2(4000)   NULL,
    u_interest    varchar2(100)   NULL
);

CREATE TABLE  exam  (
    e_id    number   GENERATED ALWAYS AS IDENTITY,
    qualgbcd    varchar2(100)   NOT NULL,
    qualgbnm    varchar2(100)   DEFAULT 0 NOT NULL ,
    seriescd    number   NOT NULL,
    seriesnm    varchar2(100)   NOT NULL,
    jmcd    number   NOT NULL,
    jmfldnm    varchar2(4000)   NOT NULL,
    y_id    number   NULL,
    obligfldcd    number   NULL,
    obligfldnm    varchar2(100)   NULL,
    mdobligfldcd    number   NULL,
    mdobligfldnm    varchar2(100)   NULL,
    detail    varchar2(4000)   NULL,
    e_count    number   DEFAULT 0 NOT NULL   
);

CREATE TABLE  youtube  (
    y_id    number   GENERATED ALWAYS AS IDENTITY,
    y_url    varchar2(4000)   NOT NULL
);

CREATE TABLE  qna  (
    q_id    number   GENERATED ALWAYS AS IDENTITY,
    q_title    varchar2(4000)   NOT NULL,
    q_answer    varchar2(4000)   NOT NULL
);

CREATE TABLE  study  (
    s_id    number   GENERATED ALWAYS AS IDENTITY,
    s_title    varchar2(100)   NOT NULL,
    s_content    varchar2(4000)   NOT NULL,
    s_date    date   DEFAULT sysdate NOT NULL     ,
    s_state    char   DEFAULT 'Y' NOT NULL   ,
    u_id    varchar2(20)   NOT NULL,
    exam_name    varchar2(1000)   NOT NULL,
    s_count    number   DEFAULT 0 NOT NULL   
);

CREATE TABLE  reply  (
    r_id    number   GENERATED ALWAYS AS IDENTITY,
    r_content    varchar2(4000)   NOT NULL,
    r_date    date   DEFAULT sysdate NOT NULL   ,
    s_id    number   NOT NULL,
    u_id    varchar2(20)   NOT NULL
);

CREATE TABLE  wishlist  (
    w_id    number   GENERATED ALWAYS AS IDENTITY,
    u_id    varchar2(20)   NOT NULL,
    e_id    number   NOT NULL
);

CREATE TABLE  inquiry  (
    i_id    number   GENERATED ALWAYS AS IDENTITY,
    i_title    varchar2(100)   NOT NULL,
    i_content    varchar2(4000)   NOT NULL,
    i_answer    varchar2(4000)   NULL,
    i_answerdate    date   DEFAULT sysdate NULL   ,
    i_inquirydate    date   DEFAULT sysdate NOT NULL   ,
    i_state    char   DEFAULT 'N' NOT NULL   ,
    u_id    varchar2(20)   NOT NULL
);

CREATE TABLE  new  (
    n_id    number   GENERATED ALWAYS AS IDENTITY,
    n_state    char   DEFAULT 'N' NOT NULL   ,
    n_msg    VARCHAR(255)   NULL,
    u_id    varchar2(20)   NOT NULL,
    i_id    number   NULL,
    s_id    number   NULL
);

CREATE TABLE  studystate  (
    s_s_id    number   GENERATED ALWAYS AS IDENTITY,
    s_id    number   NOT NULL,
    u_id    varchar2(20)   NOT NULL,
    s_s_state    number   DEFAULT 1 NOT NULL   
);

CREATE TABLE  exam_date  (
    exam_date_id    number   GENERATED ALWAYS AS IDENTITY,
    description    varchar2(4000)   NULL,
    docRegStartDt    Date   NULL,
    docRegEndDt    Date   NULL,
    docExamDt    Date   NULL,
    docPassDt    Date   NULL,
    docSubmitStartDt    Date   NULL,
    DOCSUBMITENTDT   Date   NULL,
    pracRegStartDt    Date   NULL,
    pracRegEndDt    Date   NULL,
    pracExamStartDt    Date   NULL,
    pracExamEndDt    Date   NULL,
    pracPassDt    Date   NULL
);
CREATE TABLE  passing_rate  (
       pr_id     number   GENERATED ALWAYS AS IDENTITY,
       examPassCnt    number      NULL,
       examTypCcd    varchar2(20)      NULL,
       grdNm    varchar2(30)      NULL,
       implSeq    number      NULL,
       implYy    number      NULL,
       jmFldNm    varchar2(50) NULL,
       passRate    varchar2(30) NULL,
       recptNoCnt    number      NULL
   );

ALTER TABLE  passing_rate  ADD CONSTRAINT  PK_PASSING_RATE  PRIMARY KEY (
   pr_id 
);

ALTER TABLE users ADD CONSTRAINT PK_USERS PRIMARY KEY (
   u_id
);

ALTER TABLE exam ADD CONSTRAINT PK_EXAM PRIMARY KEY (
   e_id
);

ALTER TABLE youtube ADD CONSTRAINT PK_YOUTUBE PRIMARY KEY (
   y_id
);

ALTER TABLE qna ADD CONSTRAINT PK_QNA PRIMARY KEY (
   q_id
);

ALTER TABLE study ADD CONSTRAINT PK_STUDY PRIMARY KEY (
   s_id
);

ALTER TABLE reply ADD CONSTRAINT PK_REPLY PRIMARY KEY (
   r_id
);

ALTER TABLE wishlist ADD CONSTRAINT PK_WISHLIST PRIMARY KEY (
   w_id
);

ALTER TABLE inquiry ADD CONSTRAINT PK_INQUIRY PRIMARY KEY (
   i_id
);

ALTER TABLE new ADD CONSTRAINT PK_NEW PRIMARY KEY (
   n_id
);

ALTER TABLE studystate ADD CONSTRAINT PK_STUDYSTATE PRIMARY KEY (
   s_s_id
);

ALTER TABLE exam_date ADD CONSTRAINT PK_EXAM_DATE PRIMARY KEY (
   exam_date_id
);

ALTER TABLE study 
ADD (CONSTRAINT FK_users_TO_study_1 FOREIGN KEY (u_id)
REFERENCES users ON DELETE CASCADE);


ALTER TABLE reply 
ADD (CONSTRAINT FK_study_TO_reply_1 FOREIGN KEY (s_id)
REFERENCES study ON DELETE CASCADE);


ALTER TABLE reply 
ADD (CONSTRAINT FK_users_TO_reply_1 FOREIGN KEY (u_id)
REFERENCES users ON DELETE CASCADE);


ALTER TABLE wishlist 
ADD (CONSTRAINT FK_users_TO_wishlist_1 FOREIGN KEY (u_id)
REFERENCES users ON DELETE CASCADE);


ALTER TABLE wishlist 
ADD (CONSTRAINT FK_exam_TO_wishlist_1 FOREIGN KEY (e_id)
REFERENCES exam ON DELETE CASCADE);

ALTER TABLE inquiry 
ADD (CONSTRAINT FK_users_TO_inquiry_1 FOREIGN KEY (u_id)
REFERENCES users ON DELETE CASCADE);

ALTER TABLE new 
ADD (CONSTRAINT FK_users_TO_new_1 FOREIGN KEY (u_id)
REFERENCES users ON DELETE CASCADE);


ALTER TABLE new 
ADD (CONSTRAINT FK_inquiry_TO_new_1 FOREIGN KEY (i_id)
REFERENCES inquiry ON DELETE CASCADE);


ALTER TABLE new 
ADD (CONSTRAINT FK_study_TO_new_1 FOREIGN KEY (s_id)
REFERENCES study ON DELETE CASCADE);

ALTER TABLE studystate 
ADD (CONSTRAINT FK_study_TO_studystate_1 FOREIGN KEY (s_id)
REFERENCES study ON DELETE CASCADE);


ALTER TABLE studystate 
ADD (CONSTRAINT FK_users_TO_studystate_1 FOREIGN KEY (u_id)
REFERENCES users ON DELETE CASCADE);


-- 추가
ALTER TABLE exam ADD img varchar2(100);


---------------------------------------------------------------------------------------------------------

server.xml에 추가할 내용

<Context docBase="Moja" path="/tp" reloadable="true"
  source="org.eclipse.jst.jee.server:Moja">
  <Resource auth="Container"
    driverClassName="oracle.jdbc.driver.OracleDriver" maxIdle="10"
    maxTotal="20" maxWaitMillis="-1" name="sist" password="madang"
    type="javax.sql.DataSource"
    url="jdbc:oracle:thin:@localhost:1521:XE" username="c##project1" />
</Context>


