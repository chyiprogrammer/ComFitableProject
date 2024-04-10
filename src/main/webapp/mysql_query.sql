
CREATE TABLE user_member(
                            u_m_id      VARCHAR(20)    NOT NULL,
                            u_m_pw      VARCHAR(100)    NOT NULL,
                            u_m_name   VARCHAR(20)    NOT NULL,
                            u_m_gender   VARCHAR(20)     NOT NULL,
                            u_m_mail   VARCHAR(50)    NOT NULL,
                            u_m_phone   VARCHAR(20)    NOT NULL,
                            u_m_reg_date    DATETIME DEFAULT CURRENT_TIMESTAMP,
                            u_m_mod_date   DATETIME DEFAULT CURRENT_TIMESTAMP,
                            PRIMARY KEY(u_m_id)
);

CREATE TABLE user_exercise(
                     exer_no      INT AUTO_INCREMENT,
                            exer_id      VARCHAR(20),
                            exer_name   VARCHAR(50),
                     exer_wgt    INT      default 1,
                            exer_cnt   INT      NOT NULL,
                            exer_set   INT      NOT NULL,
                            exer_totalVolume INT,
                     exer_date    datetime default current_timestamp,
                     exer_start    datetime default current_timestamp,
                     exer_end    datetime default current_timestamp,
                            exer_status VARCHAR(20) NOT NULL,
                            PRIMARY KEY(exer_no),
                     FOREIGN KEY (exer_id) REFERENCES user_member(u_m_id)
);

DELIMITER //

CREATE TRIGGER calculate_totalVolume
BEFORE INSERT ON user_exercise
FOR EACH ROW
BEGIN
    DECLARE totalVolume INT;
    SET totalVolume = NEW.exer_wgt * NEW.exer_cnt * NEW.exer_set;
    SET NEW.exer_totalVolume = totalVolume;
END;
//

DELIMITER ;

INSERT INTO user_exercise (exer_id, exer_name, exer_wgt, exer_cnt, exer_set, exer_end, exer_status) VALUES ("doodleg","푸쉬업", 1, 12, 3, "2024-04-01", "done");
INSERT INTO user_exercise (exer_id, exer_name, exer_wgt, exer_cnt, exer_set, exer_end, exer_status) VALUES ("doodleg","윗몸 일으키기", 1, 12, 3, "2024-04-01", "done");
INSERT INTO user_exercise (exer_id, exer_name, exer_wgt, exer_cnt, exer_set, exer_end, exer_status) VALUES ("doodleg","레그 레이즈", 1, 12, 3, "2024-04-01", "done");
INSERT INTO user_exercise (exer_id, exer_name, exer_wgt, exer_cnt, exer_set, exer_end, exer_status) VALUES ("doodleg","윗몸 일으키기", 6, 12, 3, "2024-04-01", "done");
INSERT INTO user_exercise (exer_id, exer_name, exer_wgt, exer_cnt, exer_set, exer_end, exer_status) VALUES ("doodleg","덤벨 컬", 8, 12, 3, "2024-03-31", "done");
INSERT INTO user_exercise (exer_id, exer_name, exer_wgt, exer_cnt, exer_set, exer_end, exer_status) VALUES ("doodleg","얼터네이팅 덤벨 컬", 8, 12, 3, "2024-03-31", "done");
INSERT INTO user_exercise (exer_id, exer_name, exer_wgt, exer_cnt, exer_set, exer_end, exer_status) VALUES ("doodleg","덤벨 킥백", 8, 12, 3, "2024-03-31", "done");
INSERT INTO user_exercise (exer_id, exer_name, exer_wgt, exer_cnt, exer_set, exer_end, exer_status) VALUES ("doodleg","시티드 벤트오버 레터럴 레이즈", 12, 15, 3, "2024-03-30", "done");
INSERT INTO user_exercise (exer_id, exer_name, exer_wgt, exer_cnt, exer_set, exer_end, exer_status) VALUES ("doodleg","파이크 푸쉬업", 1, 12, 3, "2024-03-30", "done");
INSERT INTO user_exercise (exer_id, exer_name, exer_wgt, exer_cnt, exer_set, exer_end, exer_status) VALUES ("doodleg","푸쉬업", 1, 12, 3, "2024-03-30", "done");
INSERT INTO user_exercise (exer_id, exer_name, exer_wgt, exer_cnt, exer_set, exer_end, exer_status) VALUES ("doodleg","덤벨 벤치 프레스", 12, 12, 3, "2024-03-29", "done");
INSERT INTO user_exercise (exer_id, exer_name, exer_wgt, exer_cnt, exer_set, exer_end, exer_status) VALUES ("doodleg","덤벨 벤츠 플라이", 12, 12, 3, "2024-03-29", "done");
INSERT INTO user_exercise (exer_id, exer_name, exer_wgt, exer_cnt, exer_set, exer_end, exer_status) VALUES ("doodleg","푸쉬업", 1, 20, 3, "2024-03-29", "done");
INSERT INTO user_exercise (exer_id, exer_name, exer_wgt, exer_cnt, exer_set, exer_end, exer_status) VALUES ("doodleg","푸쉬업", 8, 20, 3, "2024-03-28", "done");
INSERT INTO user_exercise (exer_id, exer_name, exer_wgt, exer_cnt, exer_set, exer_end, exer_status) VALUES ("doodleg","덤벨 프론트 레이즈", 8, 12, 3, "2024-03-28", "done");
INSERT INTO user_exercise (exer_id, exer_name, exer_wgt, exer_cnt, exer_set, exer_end, exer_status) VALUES ("doodleg","피스톨 스쿼트", 1, 12, 3, "2024-03-28", "done");
INSERT INTO user_exercise (exer_id, exer_name, exer_wgt, exer_cnt, exer_set, exer_end, exer_status) VALUES ("doodleg","덤벨 프론트 레이즈", 4, 20, 3, "2024-03-27", "done");
INSERT INTO user_exercise (exer_id, exer_name, exer_wgt, exer_cnt, exer_set, exer_end, exer_status) VALUES ("doodleg","덤벨 스쿼트", 12, 8, 3, "2024-03-27", "done");
INSERT INTO user_exercise (exer_id, exer_name, exer_wgt, exer_cnt, exer_set, exer_end, exer_status) VALUES ("doodleg","레그 레이즈", 1, 20, 3, "2024-03-27", "done");
INSERT INTO user_exercise (exer_id, exer_name, exer_wgt, exer_cnt, exer_set, exer_end, exer_status) VALUES ("doodleg","마운틴 클라이머", 1, 30, 3, "2024-03-26", "done");
INSERT INTO user_exercise (exer_id, exer_name, exer_wgt, exer_cnt, exer_set, exer_end, exer_status) VALUES ("doodleg","덤벨 스쿼트", 12, 12, 3, "2024-03-26", "done");
INSERT INTO user_exercise (exer_id, exer_name, exer_wgt, exer_cnt, exer_set, exer_end, exer_status) VALUES ("doodleg","덤벨 킥백", 12, 8, 3, "2024-03-26", "done");
