<%--
  Created by IntelliJ IDEA.
  User: 6612
  Date: 2024-03-12
  Time: 오후 12:00
  To change this template use File | Settings | File Templates.
--%>
<%@page import="kr.co.namu.user.member.UserMemberVO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>

    <link href="<c:url value="/resources/choi_machine/css/bootstrap/bootstrap.min.css"/>" rel="stylesheet">


    <title>Title</title>

    <style>
        .hidden_exer{
            display: none;
        }
    </style>

</head>
<body class="text-center">

<jsp:include page="/WEB-INF/views/include/header.jsp" />

<jsp:include page="/WEB-INF/views/user/include/nav.jsp" />


<%
    UserMemberVO loginedUserMemberVo = (UserMemberVO) session.getAttribute("loginedUserMemberVo");
    if (loginedUserMemberVo != null) {	//로그인이 되어있을 때
%>

<script>
    document.getElementById("body_section").innerText = "팔";
</script>

<div class="album py-5 bg-light">
    <div class="container">

        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3" id="health_map">

            <%--1번 [image-container 클래스를 가진 div 박스에 움직이고싶은 이미지를 두고 버튼의 class에 move-img를 넣어준다] --%>
            <div class="col">
                <div class="card shadow-sm">

                    <div class="image_container"> <%--이미지 바꾸기--%>
                        <img src="/resources/choi_machine/img/exercise/arm/A_d_c_1.jpg" class="bd-placeholder-img card-img-top" width="100%" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                        <img src="/resources/choi_machine/img/exercise/arm/A_d_c_2.jpg" class="bd-placeholder-img card-img-top" style="display: none" width="100%" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                    </div>

                    <div class="card-body">
                        <details>
                            <summary class="fw-bold">
                                덤벨 컬
                            </summary>
                            <p>
                                손바닥이 위로 가도록 덤벨을 양손으로 잡은 후 가슴을 열고 팔꿈치를 옆구리에 자연스럽게 붙인 상태로 시작합니다.<br><br>

                                팔꿈치를 그대로 고정시키고 팔꿈치가 몸통 뒤로 가지 않도록 유의하며 들어올립니다<br>
                                내릴 때 천천히 내려오면 자극을 더 줄 수 있습니다
                            </p>
                        </details>

                        <hr>

                        <span class="badge rounded-pill bg-primary w-auto">이두근</span> <%--발달부위 바꾸기--%>
                        <hr>
                        <span class="badge rounded-pill bg-warning text-dark mb-2">TIP !</span> <%--팁 바꾸기--%>

                        <p>팔을 내리는 동작에서 몸이 따라 내려오지 않도록 유의하고, 팔을 쭉 피지 않도록 하는것이 좋습니다.</p>

                        <hr>

                        <div class="d-flex justify-content-between align-items-center">
                            <div class="btn-group">
                                <button type="button" class="move_img btn btn-sm btn-outline-secondary px-4 py-3" onclick="javascript:exer_How(0)">운동법</button>
                            </div>


                            <div class="btn-group">
                                <button type="button" class="start_exer btn btn-sm btn-outline-secondary px-4 py-3" onclick="javascript:exer_Start(0)">시작</button>
                            </div>
                        </div>

                        <%--DB로 보내야하는 부분 / 시작 ! 이라는 멘트와 함께 exercise_dia로 가야함--%>
                        <%--name으로 exer_wgt와 exer_set 추가--%>

                        <form action="<c:url value='/user/member/exerciseType/arm' />" name="exercise_type" method="post" id="valid_CheckForm0"> <%--아이디 끝 숫자 바꾸기--%>

                            <div class="hidden_exer mt-3">

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text">운동 명</span> <%--운동명 value 바꾸기--%>
                                    <input type="text" name="exer_name" class="form-control" value="덤벨 컬" readonly="readonly" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                                </div>

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text">무게</span>
                                    <input type="number" name="exer_wgt" class="form-control" min="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                                </div>

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text">세트 수</span>
                                    <input type="number" name="exer_set" class="form-control" min="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm3">
                                </div>

                                <input type="button" class="btn btn-sm btn-outline-secondary px-5 py-3" value="완료" onclick="valid_Check(0)"> <%--파라미터 숫자 바꾸기--%>

                            </div>

                        </form>

                    </div>

                </div>
            </div>
            <%--1번 끝--%>


            <%--2번 [image-container 클래스를 가진 div 박스에 움직이고싶은 이미지를 두고 버튼의 class에 move-img를 넣어준다] --%>
            <div class="col">
                <div class="card shadow-sm">

                    <div class="image_container">
                        <img src="/resources/choi_machine/img/exercise/arm/A_d_e_1.jpg" class="bd-placeholder-img card-img-top" width="100%" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                        <img src="/resources/choi_machine/img/exercise/arm/A_d_e_2.jpg" class="bd-placeholder-img card-img-top" style="display: none" width="100%" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                    </div>

                    <div class="card-body">
                        <details>
                            <summary class="fw-bold">
                                얼터네이팅 덤벨 컬
                            </summary>
                            <p>손바닥이 마주보게 덤벨을 양손으로 잡은 후
                                가슴을 열고 팔꿈치를 옆구리에 자연스럽게 붙인 상태로 시작합니다.<br><br>

                                팔꿈치를 그대로 고정시키고 팔꿈치가 몸통 뒤로 가지 않도록 유의하며 들어올립니다<br>
                                내릴 때 천천히 내려오면 자극을 더 줄 수 있습니다
                            </p>
                        </details>

                        <hr>

                        <span class="badge rounded-pill bg-primary w-auto">이두근</span>
                        <hr>
                        <span class="badge rounded-pill bg-warning text-dark mb-2">TIP !</span>

                        <p>팔을 내리는 동작에서 몸이 따라 내려오지 않도록 유의하고, 팔을 쭉 피지 않도록 하는것이 좋습니다.</p>

                        <hr>

                        <div class="d-flex justify-content-between align-items-center">
                            <div class="btn-group">
                                <button type="button" class="move_img btn btn-sm btn-outline-secondary px-4 py-3" onclick="javascript:exer_How(1)">운동법</button>
                            </div>


                            <div class="btn-group">
                                <button type="button" class="start_exer btn btn-sm btn-outline-secondary px-4 py-3" onclick="javascript:exer_Start(1)">시작</button>
                            </div>

                        </div>

                        <%--DB로 보내야하는 부분 / 시작 ! 이라는 멘트와 함께 exercise_dia로 가야함--%>
                        <%--name으로 exer_wgt와 exer_set 추가--%>

                        <form action="<c:url value='/user/member/exerciseType/arm' />" name="exercise_type" method="post" id="valid_CheckForm1">

                            <div class="hidden_exer mt-3">

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text">운동 명</span>
                                    <input type="text" name="exer_name" class="form-control" value="얼터네이팅 덤벨 컬" readonly="readonly" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                                </div>

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text">무게</span>
                                    <input type="number" name="exer_wgt" class="form-control" min="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                                </div>

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text">세트 수</span>
                                    <input type="number" name="exer_set" class="form-control" min="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm3">
                                </div>

                                <input type="button" class="btn btn-sm btn-outline-secondary px-5 py-3" value="완료" onclick="valid_Check(1)">

                            </div>

                        </form>
                        <%--DB로 보내야하는 부분--%>

                    </div>

                </div>
            </div>
            <%--2번 끝--%>


            <%--3번 [image-container 클래스를 가진 div 박스에 움직이고싶은 이미지를 두고 버튼의 class에 move-img를 넣어준다] --%>
            <div class="col">
                <div class="card shadow-sm">

                    <div class="image_container"> <%--이미지 바꾸기--%>
                        <img src="/resources/choi_machine/img/exercise/arm/A_d_k_1.jpg" class="bd-placeholder-img card-img-top" width="100%" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                        <img src="/resources/choi_machine/img/exercise/arm/A_d_k_2.jpg" class="bd-placeholder-img card-img-top" style="display: none" width="100%" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                    </div>

                    <div class="card-body">
                        <details>
                            <summary class="fw-bold">
                                덤벨 킥백
                            </summary>
                            <p>
                                상체는 완전히 숙인 상태에서 고개만 살짝 들어주고
                                자극을 줄 팔은 상체와 일직선이 되게 만들고 팔꿈치만 고정시켜 줍니다<br>
                                팔과 반대방향의 다리는 굽혀서 벤치 혹은 의자에 올린 상태로 시작합니다<br><br>

                                상완근(팔뚝 윗부분부터 팔꿈치전까지)은 고정시킨 상태로 전완근(팔꿈치부터 손목전까지)만 천천히 들어올리며 몸과 수직이 될 수 있도록 만들어줍니다
                            </p>
                        </details>

                        <hr>

                        <span class="badge rounded-pill bg-primary w-auto">삼두근</span> <%--발달부위 바꾸기--%>
                        <hr>
                        <span class="badge rounded-pill bg-warning text-dark mb-2">TIP !</span> <%--팁 바꾸기--%>

                        <p>팔을 펴고 나서 잠깐 정지해 수축을 최대로 거는것이 좋습니다.</p>

                        <hr>

                        <div class="d-flex justify-content-between align-items-center">
                            <div class="btn-group">
                                <button type="button" class="move_img btn btn-sm btn-outline-secondary px-4 py-3" onclick="javascript:exer_How(2)">운동법</button>
                            </div>


                            <div class="btn-group">
                                <button type="button" class="start_exer btn btn-sm btn-outline-secondary px-4 py-3" onclick="javascript:exer_Start(2)">시작</button>
                            </div>
                        </div>

                        <%--DB로 보내야하는 부분 / 시작 ! 이라는 멘트와 함께 exercise_dia로 가야함--%>
                        <%--name으로 exer_wgt와 exer_set 추가--%>

                        <form action="<c:url value='/user/member/exerciseType/arm' />" name="exercise_type" method="post" id="valid_CheckForm2">

                            <div class="hidden_exer mt-3">

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text">운동 명</span> <%--운동명 value 바꾸기--%>
                                    <input type="text" name="exer_name" class="form-control" value="덤벨 킥백" readonly="readonly" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                                </div>

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text">무게</span>
                                    <input type="number" name="exer_wgt" class="form-control" min="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                                </div>

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text">세트 수</span>
                                    <input type="number" name="exer_set" class="form-control" min="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm3">
                                </div>

                                <input type="button" class="btn btn-sm btn-outline-secondary px-5 py-3" value="완료" onclick="valid_Check(2)">

                            </div>

                        </form>

                    </div>

                </div>
            </div>
            <%--3번 끝--%>





            <%--4번 [image-container 클래스를 가진 div 박스에 움직이고싶은 이미지를 두고 버튼의 class에 move-img를 넣어준다] --%>
            <div class="col">
                <div class="card shadow-sm">

                    <div class="image_container"> <%--이미지 바꾸기--%>
                        <img src="/resources/choi_machine/img/exercise/arm/A_s_p_1.jpg" class="bd-placeholder-img card-img-top" width="100%" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                        <img src="/resources/choi_machine/img/exercise/arm/A_s_p_2.jpg" class="bd-placeholder-img card-img-top" style="display: none" width="100%" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                    </div>

                    <div class="card-body">
                        <details>
                            <summary class="fw-bold">
                                사이드 푸쉬업
                            </summary>
                            <p>
                                자극을 줄 팔은 푸쉬업 자세에서 옆으로 눕기만하듯 팔꿈치만 꺾고,
                                반대쪽 팔은 자연스럽게 접어 외복사근에 놓습니다<br>
                                다리는 무릎까지 몸통과 같은 방향으로하고 정강이만 뒤로 접은 상태로 시작합니다.<br><br>
                                자세를 전부 유지하고 팔만 사용한다는 느낌으로 밀어줍니다.</p>
                            </p>
                        </details>

                        <hr>

                        <span class="badge rounded-pill bg-primary w-auto">삼두근</span> <%--발달부위 바꾸기--%>
                        <hr>
                        <span class="badge rounded-pill bg-warning text-dark mb-2">TIP !</span> <%--팁 바꾸기--%>

                        <p>내려올 때 등이 굽거나 머리가 땅에 닿지 않도록 하는것이 좋습니다.</p>

                        <hr>

                        <div class="d-flex justify-content-between align-items-center">
                            <div class="btn-group">
                                <button type="button" class="move_img btn btn-sm btn-outline-secondary px-4 py-3" onclick="javascript:exer_How(3)">운동법</button>
                            </div>


                            <div class="btn-group">
                                <button type="button" class="start_exer btn btn-sm btn-outline-secondary px-4 py-3" onclick="javascript:exer_Start(3)">시작</button>
                            </div>
                        </div>

                        <%--DB로 보내야하는 부분 / 시작 ! 이라는 멘트와 함께 exercise_dia로 가야함--%>
                        <%--name으로 exer_wgt와 exer_set 추가--%>

                        <form action="<c:url value='/user/member/exerciseType/arm' />" name="exercise_type" method="post" id="valid_CheckForm3">

                            <div class="hidden_exer mt-3">

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text">운동 명</span> <%--운동명 value 바꾸기--%>
                                    <input type="text" name="exer_name_b" class="form-control" value="사이드 푸쉬업" readonly="readonly" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                                </div>

                                <div class="input-group input-group-sm mb-3">
<<<<<<< HEAD
                                    <span class="input-group-text">시간(초)</span>
                                    <input type="number" name="exer_sec_b" class="form-control" min="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
=======
                                    <span class="input-group-text">무게</span>
                                    <input type="number" name="exer_wgt" class="form-control" min="1" -label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
>>>>>>> parent of 80ed4ee (전체적인 다듬기 작업 중)
                                </div>

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text">세트 수</span>
                                    <input type="number" name="exer_set_b" class="form-control" min="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm3">
                                </div>

                                <input type="button" class="btn btn-sm btn-outline-secondary px-5 py-3" value="완료" onclick="valid_Check(3)">

                            </div>

                        </form>

                    </div>

                </div>
            </div>
            <%--4번 끝--%>


            <%--5번 [image-container 클래스를 가진 div 박스에 움직이고싶은 이미지를 두고 버튼의 class에 move-img를 넣어준다] --%>
            <div class="col">
                <div class="card shadow-sm">

                    <div class="image_container">
                        <img src="/resources/choi_machine/img/exercise/arm/A_d_r_1.jpg" class="bd-placeholder-img card-img-top" width="100%" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                        <img src="/resources/choi_machine/img/exercise/arm/A_d_r_2.jpg" class="bd-placeholder-img card-img-top" style="display: none" width="100%" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                    </div>

                    <div class="card-body">
                        <details>
                            <summary class="fw-bold">
                                덤벨 리버스 리스트 컬
                            </summary>
                            <p>무릎을 꿇은 상태로 손바닥이 아래를 향하도록 덤벨을 양손으로 잡고,
                                팔을 어깨너비로 벌린 후
                                벤치 혹은 의자에 전완근을 올려놓은 상태로 시작합니다.<br><br>
                                최대한 천천히 손목을 구부려서 올렸다가 천천히 내려옵니다
                            </p>
                        </details>

                        <hr>

                        <span class="badge rounded-pill bg-primary w-auto">전완근</span>
                        <hr>
                        <span class="badge rounded-pill bg-warning text-dark mb-2">TIP !</span>

                        <p>손목을 구부려 올려 최대 지점에 올라가면 잠깐 정지해 수축을 최대로 거는것이 좋습니다.</p>

                        <hr>

                        <div class="d-flex justify-content-between align-items-center">
                            <div class="btn-group">
                                <button type="button" class="move_img btn btn-sm btn-outline-secondary px-4 py-3" onclick="javascript:exer_How(4)">운동법</button>
                            </div>


                            <div class="btn-group">
                                <button type="button" class="start_exer btn btn-sm btn-outline-secondary px-4 py-3" onclick="javascript:exer_Start(4)">시작</button>
                            </div>

                        </div>

                        <%--DB로 보내야하는 부분 / 시작 ! 이라는 멘트와 함께 exercise_dia로 가야함--%>
                        <%--name으로 exer_wgt와 exer_set 추가--%>

                        <form action="<c:url value='/user/member/exerciseType/arm' />" name="exercise_type" method="post" id="valid_CheckForm4">

                            <div class="hidden_exer mt-3">

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text">운동 명</span>
                                    <input type="text" name="exer_name" class="form-control" value="덤벨 리버스 리스트 컬" readonly="readonly" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                                </div>

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text">무게</span>
                                    <input type="number" name="exer_wgt" class="form-control" min="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                                </div>

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text">세트 수</span>
                                    <input type="number" name="exer_set" class="form-control" min="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm3">
                                </div>
                                <input type="button" class="btn btn-sm btn-outline-secondary px-5 py-3" value="완료" onclick="valid_Check(4)">

                            </div>

                        </form>
                        <%--DB로 보내야하는 부분--%>

                    </div>

                </div>
            </div>
            <%--5번 끝--%>

        </div>
    </div>
</div>

<%
} else {
%>

<script>

    // 페이지 로드 시 실행되는 함수
    window.onload = function() {
        // 사용자에게 경고 메시지를 보여줌
        alert('로그인이 필요한 서비스입니다');

        // 로그인 페이지로 이동
        window.location.href = "<c:url value='/user/member/loginForm' />";
    };

</script>

<%
    }
%>

<jsp:include page="../js_jsp/valid_check.jsp" />


<jsp:include page="../js_jsp/exercise_List_start_exer.jsp" />

<jsp:include page="../js_jsp/exercise_List_img_Move.jsp" />

</body>
</html>
