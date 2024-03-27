<%--
  Created by IntelliJ IDEA.
  User: 6612
  Date: 2024-03-14
  Time: 오후 12:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script>
  // Submit 버튼 클릭 시 동작
  document.getElementById('submit-btn').addEventListener('click', function () {

    var startTime = document.getElementById('start-time').value;
    var endTime = document.getElementById('end-time').value;

    // 선택한 날짜와 시간 정보를 콘솔에 출력

    console.log("Start Time: " + startTime);
    console.log("End Time: " + endTime);

    // 여기서 선택한 날짜와 시간 정보를 서버로 전송하여 처리할 수 있습니다.
  });

</script>