<%--
  Created by IntelliJ IDEA.
  User: 6612
  Date: 2024-04-02
  Time: 오후 12:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script>

    function toggleReadOnly(no) {
    var inputElement = document.getElementById(no + "_in");
    if (inputElement.readOnly) {
    inputElement.readOnly = false; // 읽기 전용 해제
} else {
    inputElement.readOnly = true; // 읽기 전용 설정
    inputElement.value = 1; // 값을 1로 설정
}
}
</script>
