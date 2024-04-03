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
        
        .point{
            cursor: pointer;
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
    document.getElementById("body_section").innerText = "맨몸";
</script>

<div class="album py-5 bg-light">

        <p class="fs-3 text-primary">이미지를 클릭하시면 대략적인 운동 자세를 보여드립니다.</p>
    <hr>
        <button type="button" class="btn btn-primary">
            <a href="<c:url value='/user/member/exerciseType/body/rutin' />" class="text-decoration-none fs-2 text-white">추천 루틴으로 진행(맨몸)</a>
        </button>

    <hr>
    <br>
    <details>
        <summary class="fw-bold fs-2">
            루틴 확인
        </summary>
        <p class="text-center fs-4">
            푸쉬업 / 무게 없음 / 15개 / 2세트<br>
            파이크 푸쉬업 / 무게 없음 / 15개 / 2세트<br>
            윗몸 일으키기 / 무게 없음 / 15개 / 2세트 <br>
            레그 레이즈 / 무게 없음 / 20개 / 2세트 <br>
            마운틴 클라이머 / 무게 없음 / 30개 / 2세트 <br>
        </p>
    </details>
    <br>
    <hr>

        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3" id="health_map">


            <%--1번 [image-container 클래스를 가진 div 박스에 움직이고싶은 이미지를 두고 버튼의 class에 move-img를 넣어준다] --%>
            <div class="col">
                <div class="card shadow-sm">

                    <div class="image_container" onclick="javascript:exer_How(0)"> <%--이미지 바꾸기--%>
                        <img src="/resources/choi_machine/img/exercise/chest/C_p_1.jpg" class="bd-placeholder-img card-img-top" width="100%" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                        <img src="/resources/choi_machine/img/exercise/chest/C_p_2.jpg" class="bd-placeholder-img card-img-top" style="display: none" width="100%" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                    </div>

                    <div class="card-body">
                        <details>
                            <summary class="fw-bold fs-2">
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

                        <span class="badge rounded-pill bg-primary w-auto fs-4">대흉근(전면)/삼두근</span> <%--발달부위 바꾸기--%>
                        <hr>
                        <span class="badge rounded-pill bg-warning text-dark mb-2 fs-5">TIP !</span> <%--팁 바꾸기--%>

                        <p>발을 붙이고 복근에 긴장감을 넣어 머리부터 발끝까지 일자가 된 것처럼 유지합니다.</p>

                        <hr>

                        <div>
                            <div class="btn-group">
                                <button type="button" class="start_exer btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" onclick="javascript:exer_Start(0)">시작</button>
                            </div>
                        </div>

                        <%--DB로 보내야하는 부분 / 시작 ! 이라는 멘트와 함께 exercise_dia로 가야함--%>
                        <%--name으로 exer_wgt_or_cnt와 exer_set 추가--%>

                        <form action="<c:url value='/user/member/exerciseType/Body' />" name="exercise_type" method="post" id="valid_CheckForm0">

                            <div class="hidden_exer mt-3">

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text p-2 fs-6 fw-bold">운동 명</span> <%--운동명 value 바꾸기--%>
                                    <input type="text" name="exer_name" class="form-control fs-6" value="푸쉬업" readonly="readonly" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                                </div>

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text point fs-6 fw-bold" onclick="toggleReadOnly(1)">무게</span>
                                    <input type="number" name="exer_wgt" id="1_in" class="form-control fs-6" min="1" value="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2" readonly="readonly">
                                </div>

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text p-2 fs-6 fw-bold">반복 수</span>
                                    <input type="number" name="exer_cnt" class="form-control fs-6" min="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                                </div>

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text p-2 fs-6 fw-bold">세트 수</span>
                                    <input type="number" name="exer_set" class="form-control fs-6" min="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm3">
                                </div>

                                <input type="button" class="btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" value="완료" onclick="valid_Check(0)">

                            </div>

                        </form>

                    </div>

                </div>
            </div>
            <%--1번 끝--%>


            <%--2번 [image-container 클래스를 가진 div 박스에 움직이고싶은 이미지를 두고 버튼의 class에 move-img를 넣어준다] --%>
            <div class="col">
                <div class="card shadow-sm">

                    <div class="image_container" onclick="javascript:exer_How(1)">
                        <img src="/resources/choi_machine/img/exercise/chest/C_d_p_1.jpg" class="bd-placeholder-img card-img-top" width="100%" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                        <img src="/resources/choi_machine/img/exercise/chest/C_d_p_2.jpg" class="bd-placeholder-img card-img-top" style="display: none" width="100%" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                    </div>

                    <div class="card-body">
                        <details>
                            <summary class="fw-bold fs-2">
                                디클라인 푸쉬업
                            </summary>
                            <p>푸쉬업 자세에서 30도 ~ 45도 정도를 유지할 수 있으며 발을 편안하게 올릴 수 있는 반고정된 물체에 발을 올려놓은 상태로 시작합니다<br><br>
                                시선을 앞쪽으로 향한채로 푸쉬업과 동일하게 운동을 진행합니다
                            </p>
                        </details>

                        <hr>

                        <span class="badge rounded-pill bg-primary w-auto fs-4">대흉근(윗면)</span>
                        <hr>
                        <span class="badge rounded-pill bg-warning text-dark mb-2 fs-5">TIP !</span>

                        <p>처음에는 얕은 높이의 받침대를 사용하여 자세를 익힌 후 높이를 높이도록 합니다</p>

                        <hr>

                        <div>
                            <div class="btn-group">
                                <button type="button" class="start_exer btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" onclick="javascript:exer_Start(1)">시작</button>
                            </div>

                        </div>

                        <%--DB로 보내야하는 부분 / 시작 ! 이라는 멘트와 함께 exercise_dia로 가야함--%>
                        <%--name으로 exer_wgt_or_cnt와 exer_set 추가--%>

                        <form action="<c:url value='/user/member/exerciseType/Body' />" name="exercise_type" method="post" id="valid_CheckForm1">

                            <div class="hidden_exer mt-3">

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text p-2 fs-6 fw-bold">운동 명</span>
                                    <input type="text" name="exer_name" class="form-control fs-6" value="디클라인 푸쉬업" readonly="readonly" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                                </div>

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text point fs-6 fw-bold" onclick="toggleReadOnly(2)">무게</span>
                                    <input type="number" name="exer_wgt" id="2_in" class="form-control fs-6" min="1" value="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2" readonly="readonly">
                                </div>

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text p-2 fs-6 fw-bold">반복 수</span>
                                    <input type="number" name="exer_cnt" class="form-control fs-6" min="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                                </div>

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text p-2 fs-6 fw-bold">세트 수</span>
                                    <input type="number" name="exer_set" class="form-control fs-6" min="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm3">
                                </div>

                                <input type="button" class="btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" value="완료" onclick="valid_Check(1)">

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

                        <div class="image_container" onclick="javascript:exer_How(2)">
                            <img src="/resources/choi_machine/img/exercise/shoulder/S_p_p_1.jpg" class="bd-placeholder-img card-img-top" width="100%" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                            <img src="/resources/choi_machine/img/exercise/shoulder/S_p_p_2.jpg" class="bd-placeholder-img card-img-top" style="display: none" width="100%" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                        </div>

                        <div class="card-body">
                            <details>
                                <summary class="fw-bold fs-2">
                                    파이크 푸쉬업
                                </summary>
                                <p>푸쉬업 자세에서 양손의 간격이 어깨보다 약간 넓도록 벌린 상태로 다리를 손 방향을 향해 걷듯이 이동시킵니다<br>
                                    골반을 높게 들어올린 상태가되면 시작합니다<br><br>
                                    발 뒤꿈치를 살짝 들어올려 무게중심을 상체로 옮긴 후 어깨와 손목이 수직을 이루는 상태로 천천히 내려갑니다
                                </p>
                            </details>

                            <hr>

                            <span class="badge rounded-pill bg-primary w-auto fs-4">삼각근/삼두근</span>
                            <hr>
                            <span class="badge rounded-pill bg-warning text-dark mb-2 fs-5">TIP !</span>

                            <p>손목에 무리가 가는 경우엔 손가락의 방향을 45도정도 옆으로 돌려줍니다.</p>

                            <hr>

                            <div>
                                <div class="btn-group">
                                    <button type="button" class="start_exer btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" onclick="javascript:exer_Start(2)">시작</button>
                                </div>

                            </div>

                            <%--DB로 보내야하는 부분 / 시작 ! 이라는 멘트와 함께 exercise_dia로 가야함--%>
                            <%--name으로 exer_wgt_or_cnt와 exer_set 추가--%>

                            <form action="<c:url value='/user/member/exerciseType/Body' />" name="exercise_type" method="post" id="valid_CheckForm2">

                                <div class="hidden_exer mt-3">

                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text p-2 fs-6 fw-bold">운동 명</span>
                                        <input type="text" name="exer_name" class="form-control fs-6" value="파이크 푸쉬업" readonly="readonly" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                                    </div>

                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text point fs-6 fw-bold" onclick="toggleReadOnly(3)">무게</span>
                                        <input type="number" name="exer_wgt" id="3_in" class="form-control fs-6" min="1" value="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2" readonly="readonly">
                                    </div>

                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text p-2 fs-6 fw-bold">반복 수</span>
                                        <input type="number" name="exer_cnt" class="form-control fs-6" min="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                                    </div>

                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text p-2 fs-6 fw-bold">세트 수</span>
                                        <input type="number" name="exer_set" class="form-control fs-6" min="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm3">
                                    </div>

                                    <input type="button" class="btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" value="완료" onclick="valid_Check(2)">

                                </div>

                            </form>
                            <%--DB로 보내야하는 부분--%>

                        </div>

                    </div>
                </div>
                <%--3번 끝--%>


                <%--4번 시작--%>
                <div class="col">
                    <div class="card shadow-sm">

                        <div class="image_container" onclick="javascript:exer_How(3)"> <%--이미지 바꾸기--%>
                            <img src="/resources/choi_machine/img/exercise/core/C_m_c_1.jpg" class="bd-placeholder-img card-img-top" width="100%" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                            <img src="/resources/choi_machine/img/exercise/core/C_m_c_2.jpg" class="bd-placeholder-img card-img-top" style="display: none" width="100%" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                        </div>

                        <div class="card-body">
                            <details>
                                <summary class="fw-bold fs-2">
                                    마운틴 클라이머
                                </summary><br>
                                <p class="text-start">
                                    엎드린 자세에서 팔뚝으로 중심을 잡고, 다리는 약간 벌린상태로 일자를 유지한 상태에서 시작합니다.<br><br>

                                    왼쪽 다리를 가슴 방향으로 당겨 왼쪽 팔꿈치 근처까지 가져온 후 다시 원래 자세로 돌아갑니다 반대다리도 동일하게 진행합니다.
                                </p>
                            </details>

                            <hr>

                            <span class="badge rounded-pill bg-primary w-auto fs-4">코어/상하 복부</span> <%--발달부위 바꾸기--%>
                            <hr>
                            <span class="badge rounded-pill bg-warning text-dark mb-2 fs-5">TIP !</span> <%--팁 바꾸기--%>

                            <p>최대한 몸통을 고정시켜 흔들리지 않도록 유의하며 운동을 진행합니다.</p>

                            <hr>

                            <div>
                                <div class="btn-group">
                                    <button type="button" class="start_exer btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" onclick="javascript:exer_Start(3)">시작</button>
                                </div>
                            </div>

                            <%--DB로 보내야하는 부분 / 시작 ! 이라는 멘트와 함께 exercise_dia로 가야함--%>
                            <%--name으로 exer_sec와 exer_set 추가--%>

                            <form action="<c:url value='/user/member/exerciseType/Body' />" name="exercise_type" method="post" id="valid_CheckForm3"> <%--아이디 끝 숫자 바꾸기--%>

                                <div class="hidden_exer mt-3">

                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text p-2 fs-6 fw-bold">운동 명</span> <%--운동명 value 바꾸기--%>
                                        <input type="text" name="exer_name" class="form-control fs-6" value="마운틴 클라이머" readonly="readonly" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                                    </div>

                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text p-2 fs-6 fw-bold">무게</span>
                                        <input type="number" name="exer_wgt" class="form-control fs-6" min="1" value="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2" readonly="readonly">
                                    </div>

                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text p-2 fs-6 fw-bold">반복 수</span>
                                        <input type="number" name="exer_cnt" class="form-control fs-6" min="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                                    </div>

                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text p-2 fs-6 fw-bold">세트 수</span>
                                        <input type="number" name="exer_set" class="form-control fs-6" min="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm3">
                                    </div>

                                    <input type="button" class="btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" value="완료" onclick="valid_Check(3)"> <%--파라미터 숫자 바꾸기--%>

                                </div>

                            </form>

                        </div>

                    </div>
                </div>
                <%--4번 끝--%>


                <%--5번 [image-container 클래스를 가진 div 박스에 움직이고싶은 이미지를 두고 버튼의 class에 move-img를 넣어준다] --%>
                <div class="col">
                    <div class="card shadow-sm">

                        <div class="image_container" onclick="javascript:exer_How(4)">
                            <img src="/resources/choi_machine/img/exercise/core/C_s_u_1.jpg" class="bd-placeholder-img card-img-top" width="100%" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                            <img src="/resources/choi_machine/img/exercise/core/C_s_u_2.jpg" class="bd-placeholder-img card-img-top" style="display: none" width="100%" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                        </div>

                        <div class="card-body">
                            <details>
                                <summary class="fw-bold fs-2">
                                    윗몸 일으키기
                                </summary><br>
                                <p class="text-start">
                                    누운 상태에서 양 손을 머리뒤에 얹어 깍지를 끼고, 다리를 고정한 상태에서 시작합니다.<br><br>

                                    상체를 앞으로 굽혔다가 팔꿈치가 무릎을 닿고 다시 내려가는 동작을 반복합니다.
                                </p>
                            </details>

                            <hr>

                            <span class="badge rounded-pill bg-primary w-auto fs-4">코어/하 복부</span>
                            <hr>
                            <span class="badge rounded-pill bg-warning text-dark mb-2 fs-5">TIP !</span>

                            <p>허리에 부담을 줄 수 있으니 허리에 부담을 줄이려면 다리를 편 상태로 진행합니다.</p>

                            <hr>

                            <div>
                                <div class="btn-group">
                                    <button type="button" class="start_exer btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" onclick="javascript:exer_Start(4)">시작</button>
                                </div>

                            </div>

                            <%--DB로 보내야하는 부분 / 시작 ! 이라는 멘트와 함께 exercise_dia로 가야함--%>
                            <%--name으로 exer_sec와 exer_set 추가--%>

                            <form action="<c:url value='/user/member/exerciseType/Body' />" name="exercise_type" method="post" id="valid_CheckForm4">

                                <div class="hidden_exer mt-3">

                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text p-2 fs-6 fw-bold">운동 명</span>
                                        <input type="text" name="exer_name" class="form-control fs-6" value="윗몸 일으키기" readonly="readonly" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                                    </div>

                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text p-2 fs-6 fw-bold">무게</span>
                                        <input type="number" name="exer_wgt" class="form-control fs-6" min="1" value="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2" readonly="readonly">
                                    </div>

                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text p-2 fs-6 fw-bold">반복 수</span>
                                        <input type="number" name="exer_cnt" class="form-control fs-6" min="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                                    </div>

                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text p-2 fs-6 fw-bold">세트 수</span>
                                        <input type="number" name="exer_set" class="form-control fs-6" min="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm3">
                                    </div>

                                    <input type="button" class="btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" value="완료" onclick="valid_Check(4)">

                                </div>

                            </form>
                            <%--DB로 보내야하는 부분--%>

                        </div>

                    </div>
                </div>
                <%--5번 끝--%>


                <%--6번 [image-container 클래스를 가진 div 박스에 움직이고싶은 이미지를 두고 버튼의 class에 move-img를 넣어준다] --%>
                <div class="col">
                    <div class="card shadow-sm">

                        <div class="image_container" onclick="javascript:exer_How(5)"> <%--이미지 바꾸기--%>
                            <img src="/resources/choi_machine/img/exercise/core/C_c_1.jpg" class="bd-placeholder-img card-img-top" width="100%" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                            <img src="/resources/choi_machine/img/exercise/core/C_c_2.jpg" class="bd-placeholder-img card-img-top" style="display: none" width="100%" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                        </div>

                        <div class="card-body">
                            <details>
                                <summary class="fw-bold fs-2">
                                    크런치
                                </summary><br>
                                <p class="text-start">
                                    바닥에 누워 다리를 고정시키고, 허리와 바닥 사이의 공간이 없도록 한 상태로 시작합니다.<br>

                                    시선이 천장을 향하면서 복근을 쥐어짜는 힘으로 상반신을 적당히 듭니다.<br>
                                    그 후 다시 원래의 자세로 돌아옵니다.
                                </p>
                            </details>

                            <hr>

                            <span class="badge rounded-pill bg-primary w-auto fs-4">코어/상 복부</span> <%--발달부위 바꾸기--%>
                            <hr>
                            <span class="badge rounded-pill bg-warning text-dark mb-2 fs-5">TIP !</span> <%--팁 바꾸기--%>

                            <p>상체를 완전히 들어내지 않고, 적은 횟수를 자주 반복하는것이 근 성장에 유리합니다.</p>

                            <hr>

                            <div>
                                <div class="btn-group">
                                    <button type="button" class="start_exer btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" onclick="javascript:exer_Start(5)">시작</button>
                                </div>
                            </div>

                            <%--DB로 보내야하는 부분 / 시작 ! 이라는 멘트와 함께 exercise_dia로 가야함--%>
                            <%--name으로 exer_sec와 exer_set 추가--%>

                            <form action="<c:url value='/user/member/exerciseType/Body' />" name="exercise_type" method="post" id="valid_CheckForm5">

                                <div class="hidden_exer mt-3">

                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text p-2 fs-6 fw-bold">운동 명</span> <%--운동명 value 바꾸기--%>
                                        <input type="text" name="exer_name" class="form-control fs-6" value="크런치" readonly="readonly" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                                    </div>

                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text p-2 fs-6 fw-bold">무게</span>
                                        <input type="number" name="exer_wgt" class="form-control fs-6" min="1" value="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2" readonly="readonly">
                                    </div>

                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text p-2 fs-6 fw-bold">반복 수</span>
                                        <input type="number" name="exer_cnt" class="form-control fs-6" min="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                                    </div>

                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text p-2 fs-6 fw-bold">세트 수</span>
                                        <input type="number" name="exer_set" class="form-control fs-6" min="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm3">
                                    </div>

                                    <input type="button" class="btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" value="완료" onclick="valid_Check(5)">

                                </div>

                            </form>

                        </div>

                    </div>
                </div>
                <%--6번 끝--%>





                <%--7번 [image-container 클래스를 가진 div 박스에 움직이고싶은 이미지를 두고 버튼의 class에 move-img를 넣어준다] --%>
                <div class="col">
                    <div class="card shadow-sm">

                        <div class="image_container" onclick="javascript:exer_How(6)"> <%--이미지 바꾸기--%>
                            <img src="/resources/choi_machine/img/exercise/core/C_t_c_1.jpg" class="bd-placeholder-img card-img-top" width="100%" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                            <img src="/resources/choi_machine/img/exercise/core/C_t_c_2.jpg" class="bd-placeholder-img card-img-top" style="display: none" width="100%" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                        </div>

                        <div class="card-body">
                            <details>
                                <summary class="fw-bold fs-2">
                                    트위스트 크런치
                                </summary><br>
                                <p class="text-start">
                                    다리를 엉덩이 쪽으로 당기고 손은 머리에 댄 상태로 상복근에 힘을 살짝 준 상태를 유지하며, 왼 다리를 오른 다리에 올린 상태로 시작합니다.<br><br>

                                    오른쪽 팔꿈치가 왼쪽 무릎을 찍는다는 느낌으로 상체를 비틀어주면서 올립니다.
                                </p>
                            </details>

                            <hr>

                            <span class="badge rounded-pill bg-primary w-auto fs-4">삼두근</span> <%--발달부위 바꾸기--%>
                            <hr>
                            <span class="badge rounded-pill bg-warning text-dark mb-2 fs-5">TIP !</span> <%--팁 바꾸기--%>

                            <p>내려올 때 등이 굽거나 머리가 땅에 닿지 않도록 하는것이 좋습니다.</p>

                            <hr>

                            <div>
                                <div class="btn-group">
                                    <button type="button" class="start_exer btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" onclick="javascript:exer_Start(6)">시작</button>
                                </div>
                            </div>

                            <%--DB로 보내야하는 부분 / 시작 ! 이라는 멘트와 함께 exercise_dia로 가야함--%>
                            <%--name으로 exer_sec와 exer_set 추가--%>

                            <form action="<c:url value='/user/member/exerciseType/Body' />" name="exercise_type" method="post" id="valid_CheckForm6">

                                <div class="hidden_exer mt-3">

                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text p-2 fs-6 fw-bold">운동 명</span> <%--운동명 value 바꾸기--%>
                                        <input type="text" name="exer_name" class="form-control fs-6" value="트위스트 크런치" readonly="readonly" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                                    </div>

                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text p-2 fs-6 fw-bold">무게</span>
                                        <input type="number" name="exer_wgt" class="form-control fs-6" min="1" value="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2" readonly="readonly">
                                    </div>

                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text p-2 fs-6 fw-bold">반복 수</span>
                                        <input type="number" name="exer_cnt" class="form-control fs-6" min="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                                    </div>

                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text p-2 fs-6 fw-bold">세트 수</span>
                                        <input type="number" name="exer_set" class="form-control fs-6" min="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm3">
                                    </div>

                                    <input type="button" class="btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" value="완료" onclick="valid_Check(6)">

                                </div>

                            </form>

                        </div>

                    </div>
                </div>
                <%--7번 끝--%>


                <%--8번 [image-container 클래스를 가진 div 박스에 움직이고싶은 이미지를 두고 버튼의 class에 move-img를 넣어준다] --%>
                <div class="col">
                    <div class="card shadow-sm">

                        <div class="image_container" onclick="javascript:exer_How(7)">
                            <img src="/resources/choi_machine/img/exercise/core/C_l_r_1.jpg" class="bd-placeholder-img card-img-top" width="100%" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                            <img src="/resources/choi_machine/img/exercise/core/C_l_r_2.jpg" class="bd-placeholder-img card-img-top" style="display: none" width="100%" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                        </div>

                        <div class="card-body">
                            <details>
                                <summary class="fw-bold fs-2">
                                    레그레이즈
                                </summary><br>
                                <p class="text-start">
                                    배꼽에 힘을 주어 등을 바닥에 완전히 밀착한 상태로 시작합니다.<br><br>
                                    허리가 뜨는지 체크하며 두 다리를 그대로 올립니다.
                                </p>
                            </details>

                            <hr>

                            <span class="badge rounded-pill bg-primary w-auto fs-4">코어/등</span>
                            <hr>
                            <span class="badge rounded-pill bg-warning text-dark mb-2 fs-5">TIP !</span>

                            <p>
                                천천히 동작을 반복하며 발꿈치를 바닥에 닿지 않게 유의하며 진행합니다.
                            </p>

                            <hr>

                            <div>
                                <div class="btn-group">
                                    <button type="button" class="start_exer btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" onclick="javascript:exer_Start(7)">시작</button>
                                </div>

                            </div>

                            <%--DB로 보내야하는 부분 / 시작 ! 이라는 멘트와 함께 exercise_dia로 가야함--%>
                            <%--name으로 exer_sec와 exer_set 추가--%>

                            <form action="<c:url value='/user/member/exerciseType/Body' />" name="exercise_type" method="post" id="valid_CheckForm7">

                                <div class="hidden_exer mt-3">

                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text p-2 fs-6 fw-bold">운동 명</span>
                                        <input type="text" name="exer_name" class="form-control fs-6" value="레그레이즈" readonly="readonly" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                                    </div>

                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text p-2 fs-6 fw-bold">무게</span>
                                        <input type="number" name="exer_wgt" class="form-control fs-6" min="1" value="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2" readonly="readonly">
                                    </div>

                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text p-2 fs-6 fw-bold">반복 수</span>
                                        <input type="number" name="exer_cnt" class="form-control fs-6" min="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                                    </div>

                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text p-2 fs-6 fw-bold">세트 수</span>
                                        <input type="number" name="exer_set" class="form-control fs-6" min="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm3">
                                    </div>


                                    <input type="button" class="btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" value="완료" onclick="valid_Check(7)">

                                </div>

                            </form>
                            <%--DB로 보내야하는 부분--%>

                        </div>

                    </div>
                </div>
                <!--8번 끝-->


                <%--9번 [image-container 클래스를 가진 div 박스에 움직이고싶은 이미지를 두고 버튼의 class에 move-img를 넣어준다] --%>
                <div class="col">
                    <div class="card shadow-sm">

                        <div class="image_container" onclick="javascript:exer_How(8)"> <%--이미지 바꾸기--%>
                            <img src="/resources/choi_machine/img/exercise/arm/A_s_p_1.jpg" class="bd-placeholder-img card-img-top" width="100%" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                            <img src="/resources/choi_machine/img/exercise/arm/A_s_p_2.jpg" class="bd-placeholder-img card-img-top" style="display: none" width="100%" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                        </div>

                        <div class="card-body">
                            <details>
                                <summary class="fw-bold fs-2">
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

                            <span class="badge rounded-pill bg-primary w-auto fs-4">삼두근</span> <%--발달부위 바꾸기--%>
                            <hr>
                            <span class="badge rounded-pill bg-warning text-dark mb-2 fs-5">TIP !</span> <%--팁 바꾸기--%>

                            <p>내려올 때 등이 굽거나 머리가 땅에 닿지 않도록 하는것이 좋습니다.</p>

                            <hr>

                            <div>
                                <div class="btn-group">
                                    <button type="button" class="start_exer btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" onclick="javascript:exer_Start(8)">시작</button>
                                </div>
                            </div>

                            <%--DB로 보내야하는 부분 / 시작 ! 이라는 멘트와 함께 exercise_dia로 가야함--%>
                            <%--name으로 exer_wgt_or_cnt와 exer_set 추가--%>

                            <form action="<c:url value='/user/member/exerciseType/Body' />" name="exercise_type" method="post" id="valid_CheckForm8">

                                <div class="hidden_exer mt-3">

                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text p-2 fs-6 fw-bold">운동 명</span> <%--운동명 value 바꾸기--%>
                                        <input type="text" name="exer_name" class="form-control fs-6" value="사이드 푸쉬업" readonly="readonly" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                                    </div>

                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text p-2 fs-6 fw-bold">무게</span>
                                        <input type="number" name="exer_wgt" class="form-control fs-6" min="1" value="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2" readonly="readonly">
                                    </div>

                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text p-2 fs-6 fw-bold">반복 수</span>
                                        <input type="number" name="exer_cnt" class="form-control fs-6" min="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                                    </div>

                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text p-2 fs-6 fw-bold">세트 수</span>
                                        <input type="number" name="exer_set" class="form-control fs-6" min="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm3">
                                    </div>

                                    <input type="button" class="btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" value="완료" onclick="valid_Check(8)">

                                </div>

                            </form>

                        </div>

                    </div>
                </div>
                <%--9번 끝--%>


                <%--10번 [image-container 클래스를 가진 div 박스에 움직이고싶은 이미지를 두고 버튼의 class에 move-img를 넣어준다] --%>
                <div class="col">
                    <div class="card shadow-sm">

                        <div class="image_container"  onclick="javascript:exer_How(9)"> <%--이미지 바꾸기--%>
                            <img src="/resources/choi_machine/img/exercise/low/L_p_s_1.jpg" class="bd-placeholder-img card-img-top" width="100%" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                            <img src="/resources/choi_machine/img/exercise/low/L_p_s_2.jpg" class="bd-placeholder-img card-img-top" style="display: none" width="100%" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                        </div>

                        <div class="card-body">
                            <details>
                                <summary class="fw-bold fs-2">
                                    피스톨 스쿼트
                                </summary><br>
                                <p class="text-start">
                                    양다리를 어깨너비로 넓혀 선 상태로 시작합니다.<br><br>
                                    한쪽 다리를 반원을 그리듯 서서히 앞쪽으로 펴주며 내려갑니다.<br>
                                    앉은 후 균형을 잡으며 천천히 일어납니다.
                                </p>
                            </details>

                            <hr>

                            <span class="badge rounded-pill bg-primary w-auto fs-4">발목/햄스트링</span> <%--발달부위 바꾸기--%>
                            <hr>
                            <span class="badge rounded-pill bg-warning text-dark mb-2 fs-5">TIP !</span> <%--팁 바꾸기--%>

                            <p>내려가는 구간에서 털썩 앉지 않게끔 다리힘을 유지합니다.</p>

                            <hr>

                            <div>
                                <div class="btn-group">
                                    <button type="button" class="start_exer btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" onclick="javascript:exer_Start(9)">시작</button>
                                </div>
                            </div>

                            <%--DB로 보내야하는 부분 / 시작 ! 이라는 멘트와 함께 exercise_dia로 가야함--%>
                            <%--name으로 exer_wgt_or_cnt와 exer_set 추가--%>

                            <form action="<c:url value='/user/member/exerciseType/Body' />" name="exercise_type" method="post" id="valid_CheckForm9">

                                <div class="hidden_exer mt-3">

                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text p-2 fs-6 fw-bold">운동 명</span> <%--운동명 value 바꾸기--%>
                                        <input type="text" name="exer_name" class="form-control fs-6" value="피스톨 스쿼트" readonly="readonly" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                                    </div>

                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text point fs-6 fw-bold" onclick="toggleReadOnly(4)">무게</span>
                                        <input type="number" name="exer_wgt" id="4_in" class="form-control fs-6" min="1" value="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2" readonly="readonly">
                                    </div>

                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text p-2 fs-6 fw-bold">반복 수</span>
                                        <input type="number" name="exer_cnt" class="form-control fs-6" min="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                                    </div>

                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text p-2 fs-6 fw-bold">세트 수</span>
                                        <input type="number" name="exer_set" class="form-control fs-6" min="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm3">
                                    </div>

                                    <input type="button" class="btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" value="완료" onclick="valid_Check(9)">

                                </div>

                            </form>

                        </div>

                    </div>
                </div>
                <%--10번 끝--%>

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

<jsp:include page="../js_jsp/moreWgt.jsp" />

<jsp:include page="../js_jsp/exercise_List_start_exer.jsp" />

<jsp:include page="../js_jsp/exercise_List_img_Move.jsp" />

</body>
</html>
