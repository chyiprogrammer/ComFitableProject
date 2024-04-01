package kr.co.namu.book;

import lombok.Data;


@Data
public class ExerciseVO {
    int exer_no, exer_wgt, exer_cnt, exer_set, exer_totalVolume;
    String exer_id, exer_name, exer_status, exer_date, exer_start, exer_end;
}
