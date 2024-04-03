<%--
  Created by IntelliJ IDEA.
  User: 6612
  Date: 2024-03-21
  Time: 오후 5:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<script>

function valid_Check(no) {
    var inputValue = document.getElementsByName('exer_wgt')[no].value.trim(); // 무게
    var inputValue1 = document.getElementsByName('exer_cnt')[no].value.trim(); // 갯수
    var inputValue2 = document.getElementsByName('exer_set')[no].value.trim(); // 세트 수

    if (inputValue === "" && inputValue1 === "" && inputValue2 === "") {
        alert("입력된 값이 없습니다.");
        return;
    }

    if (inputValue === "") {
        alert("무게를 입력해주세요.");
        return;
    }

    if (inputValue1 === "") {
        alert("갯수를 입력해주세요.");
        return;
    }

    if (inputValue2 === "") {
        alert("세트 수를 입력해주세요.");
        return;
    }

    if (parseFloat(inputValue) < 0 || parseFloat(inputValue1) < 0 || parseFloat(inputValue2) < 0) {
        alert("음수는 입력하실 수 없습니다.");
        return;
    }

    if (inputValue.includes(".")){
        alert("무게에 소수점이 포함되어 있습니다.")
        return;
    }

    if(inputValue1.includes(".")){
        alert("반복 수에 소수점이 포함되어 있습니다.")
        return;
    }

    if(inputValue2.includes(".")){
        alert("세트 수에 소수점이 포함되어 있습니다.")
        return;
    }


    document.getElementById("valid_CheckForm" + no).submit();
}

</script>
