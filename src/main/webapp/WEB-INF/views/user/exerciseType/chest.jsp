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
    document.getElementById("body_section").innerText = "가슴";
</script>

<div class="album py-5 bg-light">
    <div class="container">

        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3" id="health_map">

            <%--1번 [image-container 클래스를 가진 div 박스에 움직이고싶은 이미지를 두고 버튼의 class에 move-img를 넣어준다] --%>
            <div class="col">
                <div class="card shadow-sm">

                    <div class="image_container"> <%--이미지 바꾸기--%>
                        <img src="/resources/choi_machine/img/exercise/chest/C_b_p_1.jpg" class="bd-placeholder-img card-img-top" width="100%" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                        <img src="/resources/choi_machine/img/exercise/chest/C_b_p_2.jpg" class="bd-placeholder-img card-img-top" style="display: none" width="100%" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                    </div>

                    <div class="card-body">
                        <details>
                            <summary class="fw-bold">
                                덤벨 벤치 프레스
                            </summary>
                            <p>
                                가슴을 열며 어깨가 들리지 않도록 고정한 후 아치형 허리를 유지한 상태로 시작합니다.<br><br>
                                팔꿈치가 어깨보다 낮은 상태를 유지한 채로 팔이 지면과 수직이 되도록 천천히 내려옵니다 들어올릴 때에도 수직으로 올라옵니다.</p>
                            </p>
                        </details>

                        <hr>

                        <span class="badge rounded-pill bg-primary w-auto">대흉근/삼각근</span> <%--발달부위 바꾸기--%>
                        <hr>
                        <span class="badge rounded-pill bg-warning text-dark mb-2">TIP !</span> <%--팁 바꾸기--%>

                        <p>팔꿈치가 안쪽으로 들어오는 형태로 올려주면 자극을 조금 더 줄 수 있습니다.</p>

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

                        <form action="<c:url value='/user/member/exerciseType/chest' />" name="exercise_type" method="post" id="valid_CheckForm0"> <%--아이디 끝 숫자 바꾸기--%>

                            <div class="hidden_exer mt-3">

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text">운동 명</span> <%--운동명 value 바꾸기--%>
                                    <input type="text" name="exer_name" class="form-control" value="덤벨 벤치 프레스" readonly="readonly" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
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
                        <img src="/resources/choi_machine/img/exercise/chest/C_b_f_1.jpg" class="bd-placeholder-img card-img-top" width="100%" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                        <img src="/resources/choi_machine/img/exercise/chest/C_b_f_2.jpg" class="bd-placeholder-img card-img-top" style="display: none" width="100%" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                    </div>

                    <div class="card-body">
                        <details>
                            <summary class="fw-bold">
                                덤벨 벤치 플라이
                            </summary>
                            <p>가슴을 열며 어깨가 들리지 않도록 고정한 후 아치형 허리를 유지한 상태로 시작합니다<br><br>

                                손바닥이 서로 마주보도록 덤벨을 잡아 허벅지에 올린 후 무릎으로 덤벨을 받치며 자연스럽게 누운 후 다리를 내리고 가슴위로 양 팔을 밀어 덤벨을 서로 붙여줍니다<br>

                                팔을 구부린 상태로 가슴이 충분히 이완되어 스트레칭 되는 지점까지 내린 후 반원을 그리며 천천히 덤벨을 모아줍니다 다시 가슴이 충분히 이완되어 스트레칭 되는 지점까지 내려갑니다
                            </p>
                        </details>

                        <hr>

                        <span class="badge rounded-pill bg-primary w-auto">대흉근(안쪽)</span>
                        <hr>
                        <span class="badge rounded-pill bg-warning text-dark mb-2">TIP !</span>

                        <p>팔을 내리거나 올릴 때 팔이 완전히 펴지지 않도록 신경쓰면서 하는것이 좋습니다.</p>

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

                        <form action="<c:url value='/user/member/exerciseType/chest' />" name="exercise_type" method="post" id="valid_CheckForm1">

                            <div class="hidden_exer mt-3">

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text">운동 명</span>
                                    <input type="text" name="exer_name" class="form-control" value="덤벨 벤치 플라이" readonly="readonly" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
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
                        <img src="/resources/choi_machine/img/exercise/chest/C_b_p_o_1.jpg" class="bd-placeholder-img card-img-top" width="100%" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                        <img src="/resources/choi_machine/img/exercise/chest/C_b_p_o_2.jpg" class="bd-placeholder-img card-img-top" style="display: none" width="100%" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                    </div>

                    <div class="card-body">
                        <details>
                            <summary class="fw-bold">
                                벤트 암 덤벨 풀오버
                            </summary>
                            <p>
                                발을 바닥에 평평하게 유지한 후 허리를 벤치에 붙인 상태로 시작합니다<br><br>
                                양손으로 덤벨을 잡을 때 손바닥과 손가락으로 다이아몬드 모양을 만든 상태로
                                팔이 몸과 일직선이 될 때까지, 팔꿈치가 약 90도가 될 때까지 구부리며 덤벨을 머리 위로 천천히 내립니다 잠시 멈춘 후 덤벨을 처음의 위치로 당겨줍니다
                            </p>
                        </details>

                        <hr>

                        <span class="badge rounded-pill bg-primary w-auto">대흉근/광배근</span> <%--발달부위 바꾸기--%>
                        <hr>
                        <span class="badge rounded-pill bg-warning text-dark mb-2">TIP !</span> <%--팁 바꾸기--%>

                        <p>발을 벤치로 올려 무릎을 세우면 코어 근육을 사용하기 때문에 척추에 부담을 덜어줍니다.</p>

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

                        <form action="<c:url value='/user/member/exerciseType/chest' />" name="exercise_type" method="post" id="valid_CheckForm2">

                            <div class="hidden_exer mt-3">

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text">운동 명</span> <%--운동명 value 바꾸기--%>
                                    <input type="text" name="exer_name" class="form-control" value="벤트 암 덤벨 풀오버" readonly="readonly" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
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
                        <img src="/resources/choi_machine/img/exercise/chest/C_p_1.jpg" class="bd-placeholder-img card-img-top" width="100%" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                        <img src="/resources/choi_machine/img/exercise/chest/C_p_2.jpg" class="bd-placeholder-img card-img-top" style="display: none" width="100%" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                    </div>

                    <div class="card-body">
                        <details>
                            <summary class="fw-bold">
                                푸쉬업
                            </summary>
                            <p>
                                손을 바깥으로 돌린 상태로 손의 간격이 어깨너비보다 좁아지지 않게 유의하며 어깨 밑에 손목을 위치시킵니다 양 발이 벌어지지 않도록 발을 붙여준 상태로 시작합니다<br><br>
                                양쪽 어깨가 멀어지도록, 등이 넓어지는 모양을 유지하며 내려갑니다.
                                이때 손목과 팔꿈치는 서로 수직을 이룹니다.
                                날개뼈가 살짝 모여지는 지점까지 내려간 후 다시 원래 위치로 돌아갑니다.</p>
                            </p>
                        </details>

                        <hr>

                        <span class="badge rounded-pill bg-primary w-auto">대흉근(전면)/삼두근</span> <%--발달부위 바꾸기--%>
                        <hr>
                        <span class="badge rounded-pill bg-warning text-dark mb-2">TIP !</span> <%--팁 바꾸기--%>

                        <p>머리부터 발끝까지 막대가 된 것처럼 긴장을 유지합니다.</p>

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

                        <form action="<c:url value='/user/member/exerciseType/chest' />" name="exercise_type" method="post" id="valid_CheckForm3">

                            <div class="hidden_exer mt-3">

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text">운동 명</span> <%--운동명 value 바꾸기--%>
                                    <input type="text" name="exer_name" class="form-control" value="푸쉬업" readonly="readonly" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                                </div>

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text">무게</span>
                                    <input type="number" name="exer_wgt" class="form-control" min="1" -label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                                </div>

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text">세트 수</span>
                                    <input type="number" name="exer_set" class="form-control" min="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm3">
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
                        <img src="/resources/choi_machine/img/exercise/chest/C_d_p_1.jpg" class="bd-placeholder-img card-img-top" width="100%" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                        <img src="/resources/choi_machine/img/exercise/chest/C_d_p_2.jpg" class="bd-placeholder-img card-img-top" style="display: none" width="100%" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                    </div>

                    <div class="card-body">
                        <details>
                            <summary class="fw-bold">
                                디클라인 푸쉬업
                            </summary>
                            <p>푸쉬업 자세에서 30도 ~ 45도 정도를 유지할 수 있으며 발을 편안하게 올릴 수 있는 반고정된 물체에 발을 올려놓은 상태로 시작합니다<br><br>
                                시선을 앞쪽으로 향한채로 푸쉬업과 동일하게 운동을 진행합니다
                            </p>
                        </details>

                        <hr>

                        <span class="badge rounded-pill bg-primary w-auto">대흉근(윗면)</span>
                        <hr>
                        <span class="badge rounded-pill bg-warning text-dark mb-2">TIP !</span>

                        <p>자세를 익힌 후 점차 높이를 높이도록 합니다</p>

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

                        <form action="<c:url value='/user/member/exerciseType/chest' />" name="exercise_type" method="post" id="valid_CheckForm4">

                            <div class="hidden_exer mt-3">

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text">운동 명</span>
                                    <input type="text" name="exer_name" class="form-control" value="디클라인 푸쉬업" readonly="readonly" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
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
