package kr.co.namu.book.user;

import com.sun.net.httpserver.HttpPrincipal;
import kr.co.namu.book.ChartVO;
import kr.co.namu.book.ExerciseVO;
import kr.co.namu.book.HistoryVO;
import kr.co.namu.user.member.UserMemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.annotation.RequestScope;

import javax.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.*;


@RequestMapping("user/member")
@Controller("userHistoryController")
public class HistoryController {
    @Autowired private HistoryServiceImpl service;

    @RequestMapping("/hitoryConfirm")
    public String history(ExerciseVO exerciseVO, HttpSession session, Model model){
        model.addAttribute("list", 1);

        String nextPage;

        UserMemberVO userMemberVO = (UserMemberVO) session.getAttribute("loginedUserMemberVo");

        exerciseVO.setExer_id(userMemberVO.getU_m_id());

        int historyVOs = service.history_list(exerciseVO);
        if(historyVOs > 0){
            nextPage = "redirect:/user/member/exerStatus";
        }else{
            nextPage = "user/member/login_ng";
        }
        return nextPage;
    }
    @RequestMapping("/exerStatus")
    public String exerStatus(ExerciseVO exerciseVO,HttpSession session, Model model){
        model.addAttribute("list", 1);

        String nextPage;
        UserMemberVO userMemberVO = (UserMemberVO) session.getAttribute("loginedUserMemberVo");
        exerciseVO.setExer_id(userMemberVO.getU_m_id());

        List<ExerciseVO> exer_status = service.exer_status(exerciseVO);

        if(!exer_status.isEmpty()){
            model.addAttribute("status",exer_status);
            nextPage = "/nav/exercise_history";
        }else{
            nextPage = "nav/exercise_his_all";
        }

        if(exer_status.isEmpty()){
            nextPage = "nav/exercise_no_ing";
        }

        return nextPage;
    }

    @RequestMapping("/exerCheck")
    public String exerCheck(ExerciseVO exerciseVO, HttpSession session, Model model){
        model.addAttribute("list", 1);

        String nextPage;
        UserMemberVO userMemberVO = (UserMemberVO) session.getAttribute("loginedUserMemberVo");
        exerciseVO.setExer_id(userMemberVO.getU_m_id());

        int checkVOs = service.exer_check(exerciseVO);

        if(checkVOs > 0){
            nextPage = "redirect:/user/member/exerStatus";
        }else{
            nextPage = "nav/exercise_his_all";
        }
        return nextPage;

    }

    @RequestMapping("/exerHisAll")
    public String exerHisAll(ExerciseVO exerciseVO, HttpSession session, Model model){
        model.addAttribute("list", 1);

        UserMemberVO userMemberVO = (UserMemberVO) session.getAttribute("loginedUserMemberVo");
        exerciseVO.setExer_id(userMemberVO.getU_m_id());

        String nextPage;
        List<ExerciseVO> exer_his_all = service.exer_his_all(exerciseVO);

        if(!exer_his_all.isEmpty()){
            model.addAttribute("history",exer_his_all);
            nextPage = "/nav/exercise_his_all";
        }else{
            nextPage = "nav/exercise_type";
        }
        if(exer_his_all.isEmpty()){
            nextPage = "nav/exercise_no_all";
        }
        return nextPage;
    }


    @GetMapping("/chartSee")
    @ResponseBody
    public List<ChartVO> chartSee(HttpSession session, @RequestParam("start") String start, @RequestParam("end") String end){

        ExerciseVO exerciseVO = new ExerciseVO();

        UserMemberVO userMemberVO = (UserMemberVO) session.getAttribute("loginedUserMemberVo");
        exerciseVO.setExer_id(userMemberVO.getU_m_id());

        exerciseVO.setStart(start);
        exerciseVO.setEnd(end);

        List<LocalDate> dateRange = getDateRange(start, end);

        List<ExerciseVO> volumeS = service.history_chart(exerciseVO);
        Map<String, Integer> salesByDate = new TreeMap<>(); // TreeMap 사용

        // 초기화: 7일 동안의 날짜를 TreeMap에 추가하고 값은 0으로 설정
        for (LocalDate date : dateRange) {
            salesByDate.put(date.format(DateTimeFormatter.ofPattern("YYYY-MM-dd")), 0);
        }

        // 판매 데이터 반영

        for (ExerciseVO vol : volumeS) {
            String dateString = vol.getExer_end().substring(0,10);
            System.out.println(dateString);
            int count = vol.getExer_totalVolume();

            // 선택한 날짜 범위에 속하는 판매 데이터만 고려합니다.
            if (salesByDate.containsKey(dateString)) {
                salesByDate.put(dateString, salesByDate.get(dateString)+count);
            }
        }

        int max = Collections.max(salesByDate.values());

        // ChartVO 리스트 생성
        List<ChartVO> chartList = new ArrayList<>();
        for (Map.Entry<String, Integer> entry : salesByDate.entrySet()) {
            ChartVO chart = new ChartVO();
            chart.setChart_date(entry.getKey());
            chart.setChart_value(entry.getValue());
            chartList.add(chart);
        }

        // 최대 판매량도 추가
        ChartVO maxChart = new ChartVO();
        maxChart.setChart_date("max");
        maxChart.setChart_value(max + max/3);
        chartList.add(maxChart);

        return chartList;
    }


    private List<LocalDate> getDateRange(String start, String end) {
        LocalDate startDate = LocalDate.parse(start);
        LocalDate endDate = LocalDate.parse(end);
        List<LocalDate> dateRange = new ArrayList<>();

        // 시작 날짜부터 종료 날짜까지 반복하며 날짜를 추가합니다.
        while (!startDate.isAfter(endDate)) {
            dateRange.add(startDate);
            startDate = startDate.plusDays(1); // 다음 날짜로 이동
        }
        return dateRange;
    }


}
