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
    document.getElementById("body_section").innerText = "하체";
</script>

<div class="album py-5 bg-light">

        <p class="fs-3 text-primary">이미지를 클릭하시면 대략적인 운동 자세를 보여드립니다.</p>
    <hr>
        <button type="button" class="btn btn-primary">
            <a href="<c:url value='/user/member/exerciseType/low/rutin' />" class="text-decoration-none fs-2 text-white">추천 루틴으로 진행(하체)</a>
        </button>

    <hr>
    <br>
    <details>
        <summary class="fw-bold fs-2">
            루틴 확인
        </summary>
        <p class="text-center fs-4">
            덤벨 스쿼트 / 8kg / 12개 / 3세트<br>
            덤벨 스플릿 스쿼트 / 8kg / 15개 / 2세트<br>
            덤벨 리어런지 / 8kg / 15개 / 2세트 <br>
        </p>
    </details>
    <br>
    <hr>

        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3" id="health_map">

            <%--1번 [image-container 클래스를 가진 div 박스에 움직이고싶은 이미지를 두고 버튼의 class에 move-img를 넣어준다] --%>
            <div class="col">
                <div class="card shadow-sm">

                    <div class="image_container" onclick="javascript:exer_How(0)"> <%--이미지 바꾸기--%>
                        <img src="/resources/choi_machine/img/exercise/low/L_d_r_l_1.jpg" class="bd-placeholder-img card-img-top" width="300px" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                        <img src="/resources/choi_machine/img/exercise/low/L_d_r_l_2.jpg" class="bd-placeholder-img card-img-top" style="display: none" width="300px" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                    </div>

                    <div class="card-body">
                        <details>
                            <summary class="fw-bold fs-2">
                                덤벨 리어런지
                            </summary><br>
                            <p class="text-start">
                                측면에서 봤을 때 앞 다리는 "ㄱ"자 뒷 다리는 "ㄴ"자가 되도록 무릎을 구부리기 전 상태에서 시작합니다.<br><br>

                                가슴을 들어올리고 어깨를 뒤로 젖혀 앞으로 기울어지지 않도록 하면서 뒷발을 밀어 선 자세로 돌아갑니다.<br>
                                왼발을 뒤로 내딛으며 같은 자세를 반복합니다.
                            </p>
                        </details>

                        <hr>

                        <span class="badge rounded-pill bg-primary w-auto fs-4">대퇴사두근/햄스트링</span> <%--발달부위 바꾸기--%>
                        <hr>
                        <span class="badge rounded-pill bg-warning text-dark mb-2 fs-5">TIP !</span> <%--팁 바꾸기--%>

                        <p>동작을 진행하되 체중은 앞발의 뒤꿈치에 두도록 하는것이 근 성장에 유리합니다.</p>

                        <hr>

                        <div>
                            <div class="btn-group">
                                <button type="button" class="start_exer btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" onclick="javascript:exer_Start(0)">시작</button>
                            </div>
                        </div>

                        <%--DB로 보내야하는 부분 / 시작 ! 이라는 멘트와 함께 exercise_dia로 가야함--%>
                        <%--name으로 exer_wgt_or_cnt와 exer_set 추가--%>

                        <form action="<c:url value='/user/member/exerciseType/low' />" name="exercise_type" method="post" id="valid_CheckForm0"> <%--아이디 끝 숫자 바꾸기--%>

                            <div class="hidden_exer mt-3">

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text p-2 fs-6 fw-bold">운동 명</span> <%--운동명 value 바꾸기--%>
                                    <input type="text" name="exer_name" class="form-control fs-6" value="덤벨 리어런지" readonly="readonly" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                                </div>

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text p-2 fs-6 fw-bold">무게</span>
                                    <input type="number" name="exer_wgt" class="form-control fs-6" min="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                                </div>

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text p-2 fs-6 fw-bold">반복 수</span>
                                    <input type="number" name="exer_cnt" class="form-control fs-6" min="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                                </div>

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text p-2 fs-6 fw-bold">세트 수</span>
                                    <input type="number" name="exer_set" class="form-control fs-6" min="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm3">
                                </div>

                                <input type="button" class="btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" value="완료" onclick="valid_Check(0)"> <%--파라미터 숫자 바꾸기--%>

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
                        <img src="/resources/choi_machine/img/exercise/low/L_d_s_1.jpg" class="bd-placeholder-img card-img-top" width="300px" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                        <img src="/resources/choi_machine/img/exercise/low/L_d_s_2.jpg" class="bd-placeholder-img card-img-top" style="display: none" width="300px" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                    </div>

                    <div class="card-body">
                        <details>
                            <summary class="fw-bold fs-2">
                                덤벨 스쿼트
                            </summary><br>
                            <p class="text-start">
                                어깨 넓이로 발을 벌리고 서서 가슴을 곧게 펴주고, 상체도 꼿꼿하게 핀 상태로 시작합니다.<br><br>

                                허벅지를 바닥과 평행을 이루도록 맞춰주는 동시에 무릎은 발 앞쪽 이상으로 튀어나가지 않게 합니다.
                            </p>
                        </details>

                        <hr>

                        <span class="badge rounded-pill bg-primary w-auto fs-4">대퇴사두근/둔근</span>
                        <hr>
                        <span class="badge rounded-pill bg-warning text-dark mb-2 fs-5">TIP !</span>

                        <p>내려갈 때 천천히 하며, 상체가 앞으로 숙여지지 않도록 유의하며 진행합니다.</p>

                        <hr>

                        <div>
                            <div class="btn-group">
                                <button type="button" class="start_exer btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" onclick="javascript:exer_Start(1)">시작</button>
                            </div>

                        </div>

                        <%--DB로 보내야하는 부분 / 시작 ! 이라는 멘트와 함께 exercise_dia로 가야함--%>
                        <%--name으로 exer_wgt_or_cnt와 exer_set 추가--%>

                        <form action="<c:url value='/user/member/exerciseType/low' />" name="exercise_type" method="post" id="valid_CheckForm1">

                            <div class="hidden_exer mt-3">

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text p-2 fs-6 fw-bold">운동 명</span>
                                    <input type="text" name="exer_name" class="form-control fs-6" value="덤벨 스쿼트" readonly="readonly" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                                </div>

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text p-2 fs-6 fw-bold">무게</span>
                                    <input type="number" name="exer_wgt" class="form-control fs-6" min="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
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

                    <div class="image_container" onclick="javascript:exer_How(2)"> <%--이미지 바꾸기--%>
                        <img src="/resources/choi_machine/img/exercise/low/L_d_s_s_1.jpg" class="bd-placeholder-img card-img-top" width="300px" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                        <img src="/resources/choi_machine/img/exercise/low/L_d_s_s_2.jpg" class="bd-placeholder-img card-img-top" style="display: none" width="300px" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                    </div>

                    <div class="card-body">
                        <details>
                            <summary class="fw-bold fs-2">
                                덤벨 스플릿 스쿼트
                            </summary><br>
                            <p class="text-start">
                                양손에 덤벨을 든 채로 허리를 펴고, 계단 혹은 스텝박스에 한쪽 다리를 발목정도까지 올려놓은 상태로 시작합니다.<br><br>

                                가슴을 들어올리고 어깨를 뒤로 젖혀 앞으로 기울어지지 않도록 한 상태로 몸을 수직으로 내리며 자연스럽게 무릎을 구부려줍니다.<br>
                                반대 발로 땅을 밀며 다시 원래의 상태로 돌아갑니다.
                            </p>
                        </details>

                        <hr>

                        <span class="badge rounded-pill bg-primary w-auto fs-4">대퇴사두근</span> <%--발달부위 바꾸기--%>
                        <hr>
                        <span class="badge rounded-pill bg-warning text-dark mb-2 fs-5">TIP !</span> <%--팁 바꾸기--%>

                        <p>동작에 집중하여 코어가 천천히 위아래로만 움직일 수 있도록 합니다.</p>

                        <hr>

                        <div>
                            <div class="btn-group">
                                <button type="button" class="start_exer btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" onclick="javascript:exer_Start(2)">시작</button>
                            </div>
                        </div>

                        <%--DB로 보내야하는 부분 / 시작 ! 이라는 멘트와 함께 exercise_dia로 가야함--%>
                        <%--name으로 exer_wgt_or_cnt와 exer_set 추가--%>

                        <form action="<c:url value='/user/member/exerciseType/low' />" name="exercise_type" method="post" id="valid_CheckForm2">

                            <div class="hidden_exer mt-3">

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text p-2 fs-6 fw-bold">운동 명</span> <%--운동명 value 바꾸기--%>
                                    <input type="text" name="exer_name" class="form-control fs-6" value="덤벨 스플릿 스쿼트" readonly="readonly" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                                </div>

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text p-2 fs-6 fw-bold">무게</span>
                                    <input type="number" name="exer_wgt" class="form-control fs-6" min="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
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

                    </div>

                </div>
            </div>
            <%--3번 끝--%>





            <%--4번 [image-container 클래스를 가진 div 박스에 움직이고싶은 이미지를 두고 버튼의 class에 move-img를 넣어준다] --%>
            <div class="col">
                <div class="card shadow-sm">

                    <div class="image_container"  onclick="javascript:exer_How(3)"> <%--이미지 바꾸기--%>
                        <img src="/resources/choi_machine/img/exercise/low/L_p_s_1.jpg" class="bd-placeholder-img card-img-top" width="300px" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                        <img src="/resources/choi_machine/img/exercise/low/L_p_s_2.jpg" class="bd-placeholder-img card-img-top" style="display: none" width="300px" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
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
                                <button type="button" class="start_exer btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" onclick="javascript:exer_Start(3)">시작</button>
                            </div>
                        </div>

                        <%--DB로 보내야하는 부분 / 시작 ! 이라는 멘트와 함께 exercise_dia로 가야함--%>
                        <%--name으로 exer_wgt_or_cnt와 exer_set 추가--%>

                        <form action="<c:url value='/user/member/exerciseType/low' />" name="exercise_type" method="post" id="valid_CheckForm3">

                            <div class="hidden_exer mt-3">

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text p-2 fs-6 fw-bold">운동 명</span> <%--운동명 value 바꾸기--%>
                                    <input type="text" name="exer_name" class="form-control fs-6" value="피스톨 스쿼트" readonly="readonly" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                                </div>

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text point p-2 fs-6 fw-bold" onclick="toggleReadOnly(1)">무게 (클릭 후 조절가능)</span>
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

                                <input type="button" class="btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" value="완료" onclick="valid_Check(3)">

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
                        <img src="/resources/choi_machine/img/exercise/low/L_d_s_u_1.jpg" class="bd-placeholder-img card-img-top" width="300px" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                        <img src="/resources/choi_machine/img/exercise/low/L_d_s_u_2.jpg" class="bd-placeholder-img card-img-top" style="display: none" width="300px" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                    </div>

                    <div class="card-body">
                        <details>
                            <summary class="fw-bold fs-2">
                                덤벨 스텝업
                            </summary><br>
                            <p class="text-start">
                                계단 혹은 스텝박스 위에서 양손에 적당한 무게의 덤벨을 들고 섭니다<br>
                                시선은 정면을 바라보고 허리는 편 상태로 시작합니다<br><br>

                                올린 발에 힘을 주며 위로 올라섭니다.<br>
                                반대편 발과 나란히 균형을 유지하고, 반대편 발도 똑같은 방법으로 동일하게 수행합니다.
                            </p>
                        </details>

                        <hr>

                        <span class="badge rounded-pill bg-primary w-auto fs-4">대퇴사두근/햄스트링</span>
                        <hr>
                        <span class="badge rounded-pill bg-warning text-dark mb-2 fs-5">TIP !</span>

                        <p>몸을 구부리거나 앞으로 기울이지 않도록 유의하며 운동을 진행합니다.</p>

                        <hr>

                        <div>
                            <div class="btn-group">
                                <button type="button" class="start_exer btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" onclick="javascript:exer_Start(4)">시작</button>
                            </div>

                        </div>

                        <%--DB로 보내야하는 부분 / 시작 ! 이라는 멘트와 함께 exercise_dia로 가야함--%>
                        <%--name으로 exer_wgt_or_cnt와 exer_set 추가--%>

                        <form action="<c:url value='/user/member/exerciseType/low' />" name="exercise_type" method="post" id="valid_CheckForm4">

                            <div class="hidden_exer mt-3">

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text p-2 fs-6 fw-bold">운동 명</span>
                                    <input type="text" name="exer_name" class="form-control fs-6" value="덤벨 스텝업" readonly="readonly" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                                </div>

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text p-2 fs-6 fw-bold">무게</span>
                                    <input type="number" name="exer_wgt" class="form-control fs-6" min="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
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
            <!--5번째 마지막-->

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
<jsp:include page="../js_jsp/alertRutin.jsp" />

<jsp:include page="../js_jsp/valid_check.jsp" />

<jsp:include page="../js_jsp/moreWgt.jsp" />

<jsp:include page="../js_jsp/exercise_List_start_exer.jsp" />

<jsp:include page="../js_jsp/exercise_List_img_Move.jsp" />

</body>
</html>
