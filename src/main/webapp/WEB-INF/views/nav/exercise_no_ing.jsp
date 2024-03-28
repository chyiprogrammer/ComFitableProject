<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 6612
  Date: 2024-03-26
  Time: 오후 4:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>운동을 골라주세요</title>
</head>
<body>

<script>

  alert("진행중인 운동이 없습니다. 운동 목록으로 돌아갑니다.")
  window.location.href = "<c:url value='/user/member/exerciseType/Main' />";

</script>

</body>
</html>
