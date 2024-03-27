use namu_db;

CREATE TABLE admin_member(
                             a_m_no		INT 	AUTO_INCREMENT,
                             a_m_approval	INT	NOT NULL DEFAULT 0,
                             a_m_id		VARCHAR(20) 	NOT NULL,
                             a_m_pw		VARCHAR(100) 	NOT NULL,
                             a_m_name	VARCHAR(20) 	NOT NULL,
                             a_m_gender	CHAR(1) 	NOT NULL,
                             a_m_part	VARCHAR(20) 	,
                             a_m_position	VARCHAR(20) 	,
                             a_m_mail	VARCHAR(50) 	,
                             a_m_phone	VARCHAR(20) 	,
                             a_m_reg_date 	DATETIME DEFAULT current_timestamp,
                             a_m_mod_date	DATETIME DEFAULT current_timestamp,

                             PRIMARY KEY(a_m_no)
);

select * from admin_member where a_m_no =2;

CREATE TABLE namu_book(
                          b_no			INT	AUTO_INCREMENT,
                          b_category        VARCHAR(20) NOT NULL,
                          b_category_number int NOT NULL,
                          b_thumbnail		VARCHAR(100),
                          b_name			VARCHAR(100)	NOT NULL,
                          b_author		VARCHAR(100)	NOT NULL,
                          b_publisher		VARCHAR(20)	NOT NULL,
                          b_publish_year	VARCHAR(20)		NOT NULL,
                          b_isbn			VARCHAR(30)	NOT NULL,
                          b_call_number		VARCHAR(30)	NOT NULL,
                          b_rental_able		TINYINT	NOT NULL DEFAULT 1,
                          b_reg_date		DATETIME DEFAULT CURRENT_TIMESTAMP,
                          b_mod_date		DATETIME DEFAULT CURRENT_TIMESTAMP,
                          b_description   VARCHAR(2000),
                          PRIMARY KEY(b_no)
);

select * from namu_book;


CREATE TABLE user_member(
                            u_m_no		INT 	AUTO_INCREMENT,
                            u_m_id		VARCHAR(20) 	NOT NULL,
                            u_m_pw		VARCHAR(100) 	NOT NULL,
                            u_m_name	VARCHAR(20) 	NOT NULL,
                            u_m_gender	VARCHAR(20)     NOT NULL,
                            u_m_mail	VARCHAR(50) 	NOT NULL,
                            u_m_phone	VARCHAR(20) 	NOT NULL,
                            u_m_reg_date 	DATETIME DEFAULT CURRENT_TIMESTAMP,
                            u_m_mod_date	DATETIME DEFAULT CURRENT_TIMESTAMP,
                            PRIMARY KEY(u_m_no)
);

select * from user_member;

CREATE TABLE rental_book(
                            rb_no            INT AUTO_INCREMENT,
                            b_no             INT,
                            u_m_no           INT,
                            rb_start_date    DATETIME DEFAULT CURRENT_TIMESTAMP,
                            rb_end_date      DATETIME DEFAULT '1000-01-01',
                            rb_reg_date      DATETIME DEFAULT CURRENT_TIMESTAMP,
                            rb_mod_date      DATETIME DEFAULT CURRENT_TIMESTAMP,
                            PRIMARY KEY(rb_no)
);

select * from rental_book;

CREATE TABLE hope_book(
                          hb_no 		     INT		AUTO_INCREMENT,
                          u_m_no		     INT,
                          hb_name		     VARCHAR(100)	NOT NULL,
                          hb_author	     VARCHAR(100)	NOT NULL,
                          hb_publisher	     VARCHAR(20),
                          hb_publish_year	      VARCHAR(20),
                          hb_reg_date	    DATETIME DEFAULT CURRENT_TIMESTAMP,
                          hb_mod_date	    DATETIME DEFAULT CURRENT_TIMESTAMP,
                          hb_result	     TINYINT	        NOT NULL DEFAULT 0,
                          hb_result_last_date   DATETIME DEFAULT CURRENT_TIMESTAMP,
                          PRIMARY KEY(hb_no)
);

select * from hope_book;
