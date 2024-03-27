package kr.co.namu.book;

import lombok.Data;

import java.sql.Date;
@Data
public class HistoryVO {
        int his_no, his_wgt, his_set, his_totalVolume;
        String his_id, his_name, his_status;
        Date his_date;
}
