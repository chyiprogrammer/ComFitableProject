<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 6612
  Date: 2024-03-28
  Time: 오후 2:31
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<script>

  alert("완료된 운동이 없습니다. 운동현황으로 돌아갑니다.")
  window.location.href = "<c:url value='/user/member/exerStatus' />";

</script>

</body>
</html>
