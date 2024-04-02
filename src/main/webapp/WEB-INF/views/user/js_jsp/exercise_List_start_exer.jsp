<%--
  Created by IntelliJ IDEA.
  User: 6612
  Date: 2024-03-16
  Time: 오후 5:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<script>
    function exer_Start(no){
        var exer_Start = document.getElementsByClassName("hidden_exer")[no];

        if(exer_Start.style.display === "block"){
            exer_Start.style.display = "";
        } else {
            exer_Start.style.display = "block";
        }
    }
</script>