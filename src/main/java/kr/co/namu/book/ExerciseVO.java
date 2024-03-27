package kr.co.namu.book;

import lombok.Data;

import java.sql.Date;

@Data
public class ExerciseVO {
    int exer_no, exer_wgt, exer_set, exer_totalVolume;
    String exer_id, exer_name, exer_status;
    Date exer_date;
}
