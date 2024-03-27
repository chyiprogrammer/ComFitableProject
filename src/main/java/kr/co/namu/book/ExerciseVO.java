package kr.co.namu.book;

import lombok.Data;

import java.sql.Date;
import java.sql.Time;

@Data
public class ExerciseVO {
    int exer_no, exer_wgt, exer_set, exer_totalVolume;
    String exer_id, exer_name, exer_status;
    Date exer_date;
    Time exer_start;
    Time exer_end;
}
