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

                var inputValue = document.getElementsByName('exer_wgt')[no].value; // 무게
                var inputValue1 = document.getElementsByName('exer_cnt')[no].value; // 갯수
                var inputValue2 = document.getElementsByName('exer_set')[no].value; // 세트 수

                if(inputValue ==="" && inputValue1 ==="" && inputValue2 ===""){
                    alert("입력된 값이 없습니다.")
                    return;
                }else if (inputValue === "" && inputValue1 != "" && inputValue2 != "") {
                    alert("무게를 입력해주세요.");
                    return;
                }else if(inputValue != "" && inputValue1 === "" && inputValue2 != ""){
                    alert("갯수를 입력해주세요.")
                    return;
                }else if (inputValue != "" && inputValue1 != "" && inputValue2 === "") {
                    alert("세트 수를 입력해주세요.");
                    return;
                }else if(inputValue && inputValue2 <0){
                    alert("음수는 입력하실 수 없습니다.")
                }
                document.getElementById("valid_CheckForm"+no).submit();
            }

</script>
