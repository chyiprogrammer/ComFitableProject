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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

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

<jsp:include page="../include/header.jsp" />

<jsp:include page="../user/include/nav.jsp" />

<%
    UserMemberVO loginedUserMemberVo = (UserMemberVO) session.getAttribute("loginedUserMemberVo");
    if (loginedUserMemberVo != null) {	//로그인이 되어있을 때
%>

<div class="album py-5 bg-light">

        <p class="fs-3 text-primary">이미지를 클릭하시면 대략적인 운동 자세를 보여드립니다.</p>

    <hr>
    <br>
    <details>
        <summary class="fw-bold fs-3 text-primary">
            무게 조절이 가능한 맨몸 운동 리스트
        </summary><br>
        <p class="text-center fs-3">
            푸쉬업<br>
            디클라인 푸쉬업<br>
            파이크 푸쉬업<br>
            피스톨 스쿼트<br>
        </p>
    </details>
    <br>
    <hr>

        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3" id="health_map">
    <%--가슴운동 시작--%>
            <%--1번 [image-container 클래스를 가진 div 박스에 움직이고싶은 이미지를 두고 버튼의 class에 move-img를 넣어준다] --%>
            <div class="col">
                <div class="card shadow-sm">

                            <div class="image_container" onclick="javascript:exer_How(0)"> <%--이미지 바꾸기--%>
                                <img src="/resources/choi_machine/img/exercise/chest/C_b_p_1.jpg" class="bd-placeholder-img card-img-top" width="300px" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                                <img src="/resources/choi_machine/img/exercise/chest/C_b_p_2.jpg" class="bd-placeholder-img card-img-top" style="display: none" width="300px" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                            </div>

                    <div class="card-body">
                        <details>
                            <summary class="fw-bold fs-2">
                                덤벨 벤치 프레스
                            </summary><br>
                            <p class="text-start">
                                가슴을 열며 어깨가 들리지 않도록 고정한 후 아치형 허리를 유지한 상태로 시작합니다.<br><br>
                                팔꿈치가 어깨보다 낮은 상태를 유지한 채로 팔이 지면과 수직이 되도록 천천히 내려옵니다 들어올릴 때에도 수직으로 올라옵니다.</p>
                            </p>
                        </details>

                        <hr>

                        <span class="badge rounded-pill bg-primary w-auto fs-4">대흉근/삼각근</span> <%--발달부위 바꾸기--%>
                        <hr>
                        <span class="badge rounded-pill bg-warning text-dark mb-2 fs-5">TIP !</span> <%--팁 바꾸기--%>

                        <p>팔꿈치가 안쪽으로 들어오는 형태로 올려주면 자극을 조금 더 줄 수 있습니다.</p>

                        <hr>

                        <div>
                            <div class="btn-group">
                                <button type="button" class="start_exer btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" onclick="javascript:exer_Start(0)">시작</button>
                            </div>
                        </div>

                        <%--DB로 보내야하는 부분 / 시작 ! 이라는 멘트와 함께 exercise_dia로 가야함--%>
                        <%--name으로 exer_wgt_or_cnt와 exer_set 추가--%>

                        <form action="<c:url value='/user/member/exerciseType/Main_Confirm' />" name="exercise_type" method="post" id="valid_CheckForm0"> <%--아이디 끝 숫자 바꾸기--%>

                            <div class="hidden_exer mt-3">

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text p-2 fs-6 fw-bold">운동 명</span> <%--운동명 value 바꾸기--%>
                                    <input type="text" name="exer_name" class="form-control fs-6" value="덤벨 벤치 프레스" readonly="readonly" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
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
                            <img src="/resources/choi_machine/img/exercise/chest/C_b_f_1.jpg" class="bd-placeholder-img card-img-top" width="300px" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                            <img src="/resources/choi_machine/img/exercise/chest/C_b_f_2.jpg" class="bd-placeholder-img card-img-top" style="display: none" width="300px" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                        </div>

                        <div class="card-body">
                            <details>
                                <summary class="fw-bold fs-2">
                                    덤벨 벤치 플라이
                                </summary><br>
                                <p class="text-start">
                                가슴을 열며 어깨가 들리지 않도록 고정한 후 아치형 허리를 유지한 상태로 시작합니다<br><br>

                                손바닥이 서로 마주보도록 덤벨을 잡아 허벅지에 올린 후 무릎으로 덤벨을 받치며 자연스럽게 누운 후 다리를 내리고 가슴위로 양 팔을 밀어 덤벨을 서로 붙여줍니다<br>

                                   팔을 구부린 상태로 가슴이 충분히 이완되어 스트레칭 되는 지점까지 내린 후 반원을 그리며 천천히 덤벨을 모아줍니다 다시 가슴이 충분히 이완되어 스트레칭 되는 지점까지 내려갑니다
                               </p>
                            </details>

                            <hr>

                            <span class="badge rounded-pill bg-primary w-auto fs-4">대흉근(안쪽)</span>
                            <hr>
                            <span class="badge rounded-pill bg-warning text-dark mb-2 fs-5">TIP !</span>

                            <p>팔을 내리거나 올릴 때 팔이 완전히 펴지지 않도록 신경쓰면서 하는것이 좋습니다.</p>

                            <hr>

                            <div>
                                <div class="btn-group">
                                    <button type="button" class="start_exer btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" onclick="javascript:exer_Start(1)">시작</button>
                                </div>

                            </div>

                            <%--DB로 보내야하는 부분 / 시작 ! 이라는 멘트와 함께 exercise_dia로 가야함--%>
                            <%--name으로 exer_wgt_or_cnt와 exer_set 추가--%>

                            <form action="<c:url value='/user/member/exerciseType/Main_Confirm' />" name="exercise_type" method="post" id="valid_CheckForm1">

                                <div class="hidden_exer mt-3">

                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text p-2 fs-6 fw-bold">운동 명</span>
                                        <input type="text" name="exer_name" class="form-control fs-6" value="덤벨 벤치 플라이" readonly="readonly" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
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
                            <img src="/resources/choi_machine/img/exercise/chest/C_b_p_o_1.jpg" class="bd-placeholder-img card-img-top" width="300px" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                            <img src="/resources/choi_machine/img/exercise/chest/C_b_p_o_2.jpg" class="bd-placeholder-img card-img-top" style="display: none" width="300px" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                        </div>

                        <div class="card-body">
                            <details>
                                <summary class="fw-bold fs-2">
                                    벤트 암 덤벨 풀오버
                                </summary><br>
                                <p class="text-start">
                                    발을 바닥에 평평하게 유지한 후 허리를 벤치에 붙인 상태로 시작합니다<br><br>
                                    양손으로 덤벨을 잡을 때 손바닥과 손가락으로 다이아몬드 모양을 만든 상태로
                                    팔이 몸과 일직선이 될 때까지, 팔꿈치가 약 90도가 될 때까지 구부리며 덤벨을 머리 위로 천천히 내립니다 잠시 멈춘 후 덤벨을 처음의 위치로 당겨줍니다
                                </p>
                            </details>

                            <hr>

                            <span class="badge rounded-pill bg-primary w-auto fs-4">대흉근/광배근</span> <%--발달부위 바꾸기--%>
                            <hr>
                            <span class="badge rounded-pill bg-warning text-dark mb-2 fs-5">TIP !</span> <%--팁 바꾸기--%>

                            <p>발을 벤치로 올려 무릎을 세우면 코어 근육을 사용하기 때문에 척추에 부담을 덜어줍니다.</p>

                            <hr>

                            <div>
                                <div class="btn-group">
                                    <button type="button" class="start_exer btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" onclick="javascript:exer_Start(2)">시작</button>
                                </div>
                            </div>

                            <%--DB로 보내야하는 부분 / 시작 ! 이라는 멘트와 함께 exercise_dia로 가야함--%>
                            <%--name으로 exer_wgt_or_cnt와 exer_set 추가--%>

                            <form action="<c:url value='/user/member/exerciseType/Main_Confirm' />" name="exercise_type" method="post" id="valid_CheckForm2">

                                <div class="hidden_exer mt-3">

                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text p-2 fs-6 fw-bold">운동 명</span> <%--운동명 value 바꾸기--%>
                                        <input type="text" name="exer_name" class="form-control fs-6" value="벤트 암 덤벨 풀오버" readonly="readonly" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
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

                        <div class="image_container" onclick="javascript:exer_How(3)"> <%--이미지 바꾸기--%>
                            <img src="/resources/choi_machine/img/exercise/chest/C_p_1.jpg" class="bd-placeholder-img card-img-top" width="300px" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                            <img src="/resources/choi_machine/img/exercise/chest/C_p_2.jpg" class="bd-placeholder-img card-img-top" style="display: none" width="300px" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                        </div>

                        <div class="card-body">
                            <details>
                                <summary class="fw-bold fs-2">
                                   푸쉬업
                                </summary><br>
                                <p class="text-start">
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
                                    <button type="button" class="start_exer btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" onclick="javascript:exer_Start(3)">시작</button>
                                </div>
                            </div>

                            <%--DB로 보내야하는 부분 / 시작 ! 이라는 멘트와 함께 exercise_dia로 가야함--%>
                            <%--name으로 exer_wgt_or_cnt와 exer_set 추가--%>

                            <form action="<c:url value='/user/member/exerciseType/chest' />" name="exercise_type" method="post" id="valid_CheckForm3">

                                <div class="hidden_exer mt-3">

                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text p-2 fs-6 fw-bold">운동 명</span> <%--운동명 value 바꾸기--%>
                                        <input type="text" name="exer_name" class="form-control fs-6" value="푸쉬업" readonly="readonly" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                                    </div>

                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text p-2 fs-6 fw-bold" onclick="toggleReadOnly(0)">무게 (클릭 후 조절가능)</span>
                                        <input type="number" name="exer_wgt" id="0_in" class="form-control fs-6" value="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2" readonly="readonly">
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
                            <img src="/resources/choi_machine/img/exercise/chest/C_d_p_1.jpg" class="bd-placeholder-img card-img-top" width="300px" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                            <img src="/resources/choi_machine/img/exercise/chest/C_d_p_2.jpg" class="bd-placeholder-img card-img-top" style="display: none" width="300px" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                        </div>

                        <div class="card-body">
                            <details>
                                <summary class="fw-bold fs-2">
                                    디클라인 푸쉬업
                                </summary><br>
                                <p class="text-start">
                                    푸쉬업 자세에서 30도 ~ 45도 정도를 유지할 수 있으며 발을 편안하게 올릴 수 있는 반고정된 물체에 발을 올려놓은 상태로 시작합니다<br><br>
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
                                    <button type="button" class="start_exer btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" onclick="javascript:exer_Start(4)">시작</button>
                                </div>

                            </div>

                            <%--DB로 보내야하는 부분 / 시작 ! 이라는 멘트와 함께 exercise_dia로 가야함--%>
                            <%--name으로 exer_wgt_or_cnt와 exer_set 추가--%>

                            <form action="<c:url value='/user/member/exerciseType/chest' />" name="exercise_type" method="post" id="valid_CheckForm4">

                                <div class="hidden_exer mt-3">

                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text p-2 fs-6 fw-bold">운동 명</span>
                                        <input type="text" name="exer_name" class="form-control fs-6" value="디클라인 푸쉬업" readonly="readonly" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                                    </div>

                                    <div class="input-group input-group-sm mb-3">
                                        <span class="input-group-text p-2 fs-6 fw-bold" onclick="toggleReadOnly(1)">무게 (클릭 후 조절가능)</span>
                                        <input type="number" name="exer_wgt" id="1_in" class="form-control fs-6" value="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2" readonly="readonly">
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
                <%-- 5번 끝--%>
        <%--가슴운동 끝 0 ~ 4 --%>



        <%--어깨 운동 시작 5 ~ 9 --%>
        <%--1번 [image-container 클래스를 가진 div 박스에 움직이고싶은 이미지를 두고 버튼의 class에 move-img를 넣어준다] --%>
        <div class="col">
            <div class="card shadow-sm">

                <div class="image_container" onclick="javascript:exer_How(5)"> <%--이미지 바꾸기--%>
                    <img src="/resources/choi_machine/img/exercise/shoulder/S_d_p_1.jpg" class="bd-placeholder-img card-img-top" width="300px" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                    <img src="/resources/choi_machine/img/exercise/shoulder/S_d_p_2.jpg" class="bd-placeholder-img card-img-top" style="display: none" width="300px" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                </div>

                <div class="card-body">
                    <details>
                        <summary class="fw-bold fs-2">
                            덤벨 숄더 프레스
                        </summary><br>
                        <p class="text-start">

                            팔을 옆으로 벌려 덤벨을 머리의 중간 지점 쯤 오게 한 후 시작합니다 .<br><br>

                            어깨가 솟지 않도록 유의하며 팔만 들어줍니다<br>
                            팔을 내릴 때에는 처음에 시작했던 머리의 중간 지점으로 다시 돌아옵니다
                        </p>
                    </details>

                    <hr>

                    <span class="badge rounded-pill bg-primary w-auto fs-4">삼각근(전면과 측면)</span> <%--발달부위 바꾸기--%>
                    <hr>
                    <span class="badge rounded-pill bg-warning text-dark mb-2 fs-5">TIP !</span> <%--팁 바꾸기--%>

                    <p>덤벨을 들어 올리는 동작에서 팔을 쭉 피지 않도록 유의하며 진행합니다.</p>

                    <hr>

                    <div>
                        <div class="btn-group">
                            <button type="button" class="start_exer btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" onclick="javascript:exer_Start(5)">시작</button>
                        </div>
                    </div>

                    <%--DB로 보내야하는 부분 / 시작 ! 이라는 멘트와 함께 exercise_dia로 가야함--%>
                    <%--name으로 exer_wgt_or_cnt와 exer_set 추가--%>

                    <form action="<c:url value='/user/member/exerciseType/shoulder' />" name="exercise_type" method="post" id="valid_CheckForm5"> <%--아이디 끝 숫자 바꾸기--%>

                        <div class="hidden_exer mt-3">

                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text p-2 fs-6 fw-bold">운동 명</span> <%--운동명 value 바꾸기--%>
                                <input type="text" name="exer_name" class="form-control fs-6" value="덤벨 숄더 프레스" readonly="readonly" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
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


                            <input type="button" class="btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" value="완료" onclick="valid_Check(5)"> <%--파라미터 숫자 바꾸기--%>

                        </div>

                    </form>

                </div>

            </div>
        </div>
        <%--1번 끝--%>


        <%--2번 [image-container 클래스를 가진 div 박스에 움직이고싶은 이미지를 두고 버튼의 class에 move-img를 넣어준다] --%>
        <div class="col">
            <div class="card shadow-sm">

                <div class="image_container" onclick="javascript:exer_How(6)">
                    <img src="/resources/choi_machine/img/exercise/shoulder/S_d_f_1.jpg" class="bd-placeholder-img card-img-top" width="300px" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                    <img src="/resources/choi_machine/img/exercise/shoulder/S_d_f_2.jpg" class="bd-placeholder-img card-img-top" style="display: none" width="300px" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                </div>

                <div class="card-body">
                    <details>
                        <summary class="fw-bold fs-2">
                            덤벨 프론트 레이즈
                        </summary><br>
                        <p class="text-start">
                            다리를 어깨넓이 정도로 벌려 자연스럽게 섭니다<br>
                            팔꿈치를 살짝 구부린 후 허벅지 앞쪽에 둔 상태로 시작합니다.<br><br>

                            팔을 앞으로 올려주고 올라가는 속도보다 천천히 내려옵니다.
                        </p>
                    </details>

                    <hr>

                    <span class="badge rounded-pill bg-primary w-auto fs-4">삼각근(전면)</span>
                    <hr>
                    <span class="badge rounded-pill bg-warning text-dark mb-2 fs-5">TIP !</span>

                    <p>팔을 올리 때 팔꿈치 윗부분이 보이지 않으면 팔의 개입이 있으니 조금 내립니다.</p>

                    <hr>

                    <div>
                        <div class="btn-group">
                            <button type="button" class="start_exer btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" onclick="javascript:exer_Start(6)">시작</button>
                        </div>

                    </div>

                    <%--DB로 보내야하는 부분 / 시작 ! 이라는 멘트와 함께 exercise_dia로 가야함--%>
                    <%--name으로 exer_wgt_or_cnt와 exer_set 추가--%>

                    <form action="<c:url value='/user/member/exerciseType/shoulder' />" name="exercise_type" method="post" id="valid_CheckForm6">

                        <div class="hidden_exer mt-3">

                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text p-2 fs-6 fw-bold">운동 명</span>
                                <input type="text" name="exer_name" class="form-control fs-6" value="덤벨 프론트 레이즈" readonly="readonly" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
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


                            <input type="button" class="btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" value="완료" onclick="valid_Check(6)">

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

                <div class="image_container" onclick="javascript:exer_How(7)"> <%--이미지 바꾸기--%>
                    <img src="/resources/choi_machine/img/exercise/shoulder/S_d_s_1.jpg" class="bd-placeholder-img card-img-top" width="300px" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                    <img src="/resources/choi_machine/img/exercise/shoulder/S_d_s_2.jpg" class="bd-placeholder-img card-img-top" style="display: none" width="300px" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                </div>

                <div class="card-body">
                    <details>
                        <summary class="fw-bold fs-2">
                            덤벨 사이드 레터럴 레이즈
                        </summary><br>
                        <p class="text-start">
                            덤벨을 양손으로 들고 다리를 자연스럽게 벌린 상태로 시작합니다<br><br>

                            어깨를 내린다는 느낌을 유지한 채 양 팔을 옆으로 들어올리고 올라가는 속도보다 천천히 내려옵니다
                        </p>
                    </details>

                    <hr>

                    <span class="badge rounded-pill bg-primary w-auto fs-4">삼각근(측면)</span> <%--발달부위 바꾸기--%>
                    <hr>
                    <span class="badge rounded-pill bg-warning text-dark mb-2 fs-5">TIP !</span> <%--팁 바꾸기--%>

                    <p> 손이 높이 올라가게되면 승모근의 개입이 있을 수 있으니 팔을 높이 올리지 않도록 합니다.</p>

                    <hr>

                    <div>
                        <div class="btn-group">
                            <button type="button" class="start_exer btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" onclick="javascript:exer_Start(7)">시작</button>
                        </div>
                    </div>

                    <%--DB로 보내야하는 부분 / 시작 ! 이라는 멘트와 함께 exercise_dia로 가야함--%>
                    <%--name으로 exer_wgt_or_cnt와 exer_set 추가--%>

                    <form action="<c:url value='/user/member/exerciseType/shoulder' />" name="exercise_type" method="post" id="valid_CheckForm7">

                        <div class="hidden_exer mt-3">

                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text p-2 fs-6 fw-bold">운동 명</span> <%--운동명 value 바꾸기--%>
                                <input type="text" name="exer_name" class="form-control fs-6" value="덤벨 사이드 레터럴 레이즈" readonly="readonly" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
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


                            <input type="button" class="btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" value="완료" onclick="valid_Check(7)">

                        </div>

                    </form>

                </div>

            </div>
        </div>
        <%--3번 끝--%>





        <%--4번 [image-container 클래스를 가진 div 박스에 움직이고싶은 이미지를 두고 버튼의 class에 move-img를 넣어준다] --%>
        <div class="col">
            <div class="card shadow-sm">

                <div class="image_container" onclick="javascript:exer_How(8)"> <%--이미지 바꾸기--%>
                    <img src="/resources/choi_machine/img/exercise/shoulder/S_s_b_r_1.jpg" class="bd-placeholder-img card-img-top" width="300px" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                    <img src="/resources/choi_machine/img/exercise/shoulder/S_s_b_r_2.jpg" class="bd-placeholder-img card-img-top" style="display: none" width="300px" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                </div>

                <div class="card-body">
                    <details>
                        <summary class="fw-bold fs-2">
                            시티드 벤트오버 레터럴 레이즈
                        </summary><br>
                        <p class="text-start">
                            덤벨을 양손에 들고 벤치 혹은 등받이가 없는 의자에 앉아 두발을 가까이 둔 후 허리를 약간 굽힌 상태로 시작합니다<br><br>

                            팔꿈치로 움직여 올린다는 느낌으로 덤벨을 어깨보다 약간 낮은 위치까지 들어올리고 올라가는 속도보다 천천히 내려옵니다.
                        </p>
                    </details>

                    <hr>

                    <span class="badge rounded-pill bg-primary w-auto fs-4">삼각근(후면)</span> <%--발달부위 바꾸기--%>
                    <hr>
                    <span class="badge rounded-pill bg-warning text-dark mb-2 fs-5">TIP !</span> <%--팁 바꾸기--%>

                    <p>손목을 살짝 기울여 덤벨의 뒷면이 앞면보다 올라오게 하면 자극을 조금 더 줄 수 있습니다.</p>

                    <hr>

                    <div>
                        <div class="btn-group">
                            <button type="button" class="start_exer btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" onclick="javascript:exer_Start(8)">시작</button>
                        </div>
                    </div>

                    <%--DB로 보내야하는 부분 / 시작 ! 이라는 멘트와 함께 exercise_dia로 가야함--%>
                    <%--name으로 exer_wgt_or_cnt와 exer_set 추가--%>

                    <form action="<c:url value='/user/member/exerciseType/shoulder' />" name="exercise_type" method="post" id="valid_CheckForm8">

                        <div class="hidden_exer mt-3">

                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text p-2 fs-6 fw-bold">운동 명</span> <%--운동명 value 바꾸기--%>
                                <input type="text" name="exer_name" class="form-control fs-6" value="시티드 벤트오버 레터럴 레이즈" readonly="readonly" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
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


                            <input type="button" class="btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" value="완료" onclick="valid_Check(8)">

                        </div>

                    </form>

                </div>

            </div>
        </div>
        <%--4번 끝--%>


        <%--5번 [image-container 클래스를 가진 div 박스에 움직이고싶은 이미지를 두고 버튼의 class에 move-img를 넣어준다] --%>
        <div class="col">
            <div class="card shadow-sm">

                <div class="image_container" onclick="javascript:exer_How(9)">
                    <img src="/resources/choi_machine/img/exercise/shoulder/S_p_p_1.jpg" class="bd-placeholder-img card-img-top" width="300px" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                    <img src="/resources/choi_machine/img/exercise/shoulder/S_p_p_2.jpg" class="bd-placeholder-img card-img-top" style="display: none" width="300px" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                </div>

                <div class="card-body">
                    <details>
                        <summary class="fw-bold fs-2">
                            파이크 푸쉬업
                        </summary><br>
                        <p class="text-start">
                            푸쉬업 자세에서 양손의 간격이 어깨보다 약간 넓도록 벌린 상태로 다리를 손 방향을 향해 걷듯이 이동시킵니다<br>
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
                            <button type="button" class="start_exer btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" onclick="javascript:exer_Start(9)">시작</button>
                        </div>

                    </div>

                    <%--DB로 보내야하는 부분 / 시작 ! 이라는 멘트와 함께 exercise_dia로 가야함--%>
                    <%--name으로 exer_wgt_or_cnt와 exer_set 추가--%>

                    <form action="<c:url value='/user/member/exerciseType/shoulder' />" name="exercise_type" method="post" id="valid_CheckForm9">

                        <div class="hidden_exer mt-3">

                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text p-2 fs-6 fw-bold">운동 명</span>
                                <input type="text" name="exer_name" class="form-control fs-6" value="파이크 푸쉬업" readonly="readonly" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                            </div>

                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text p-2 fs-6 fw-bold" onclick="toggleReadOnly(2)">무게 (클릭 후 조절가능)</span>
                                <input type="number" name="exer_wgt" id="2_in" class="form-control fs-6" value="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2" readonly="readonly">
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
                    <%--DB로 보내야하는 부분--%>

                </div>

            </div>
        </div>
        <%--5번 끝--%>
        <%--어깨 운동 끝--%>



        <%--복근 운동 시작 10 ~ 14 --%>
        <%--1번 [image-container 클래스를 가진 div 박스에 움직이고싶은 이미지를 두고 버튼의 class에 move-img를 넣어준다] --%>
        <div class="col">
            <div class="card shadow-sm">

                <div class="image_container" onclick="javascript:exer_How(10)"> <%--이미지 바꾸기--%>
                    <img src="/resources/choi_machine/img/exercise/core/C_m_c_1.jpg" class="bd-placeholder-img card-img-top" width="300px" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                    <img src="/resources/choi_machine/img/exercise/core/C_m_c_2.jpg" class="bd-placeholder-img card-img-top" style="display: none" width="300px" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
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
                            <button type="button" class="start_exer btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" onclick="javascript:exer_Start(10)">시작</button>
                        </div>
                    </div>

                    <%--DB로 보내야하는 부분 / 시작 ! 이라는 멘트와 함께 exercise_dia로 가야함--%>
                    <%--name으로 exer_wgt_or_cnt와 exer_set 추가--%>

                    <form action="<c:url value='/user/member/exerciseType/core' />" name="exercise_type" method="post" id="valid_CheckForm10"> <%--아이디 끝 숫자 바꾸기--%>

                        <div class="hidden_exer mt-3">

                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text p-2 fs-6 fw-bold">운동 명</span> <%--운동명 value 바꾸기--%>
                                <input type="text" name="exer_name" class="form-control fs-6" value="마운틴 클라이머" readonly="readonly" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                            </div>

                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text p-2 fs-6 fw-bold">무게</span>
                                <input type="number" name="exer_wgt" class="form-control fs-6" value="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2" readonly="readonly">
                            </div>

                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text p-2 fs-6 fw-bold">반복 수</span>
                                <input type="number" name="exer_cnt" class="form-control fs-6" min="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                            </div>

                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text p-2 fs-6 fw-bold">세트 수</span>
                                <input type="number" name="exer_set" class="form-control fs-6" min="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm3">
                            </div>


                            <input type="button" class="btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" value="완료" onclick="valid_Check(10)"> <%--파라미터 숫자 바꾸기--%>

                        </div>

                    </form>

                </div>

            </div>
        </div>
        <%--1번 끝--%>


        <%--2번 [image-container 클래스를 가진 div 박스에 움직이고싶은 이미지를 두고 버튼의 class에 move-img를 넣어준다] --%>
        <div class="col">
            <div class="card shadow-sm">

                <div class="image_container" onclick="javascript:exer_How(11)">
                    <img src="/resources/choi_machine/img/exercise/core/C_s_u_1.jpg" class="bd-placeholder-img card-img-top" width="300px" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                    <img src="/resources/choi_machine/img/exercise/core/C_s_u_2.jpg" class="bd-placeholder-img card-img-top" style="display: none" width="300px" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
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
                            <button type="button" class="start_exer btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" onclick="javascript:exer_Start(11)">시작</button>
                        </div>

                    </div>

                    <%--DB로 보내야하는 부분 / 시작 ! 이라는 멘트와 함께 exercise_dia로 가야함--%>
                    <%--name으로 exer_wgt_or_cnt와 exer_set 추가--%>

                    <form action="<c:url value='/user/member/exerciseType/core' />" name="exercise_type" method="post" id="valid_CheckForm11">

                        <div class="hidden_exer mt-3">

                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text p-2 fs-6 fw-bold">운동 명</span>
                                <input type="text" name="exer_name" class="form-control fs-6" value="윗몸 일으키기" readonly="readonly" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                            </div>

                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text p-2 fs-6 fw-bold">무게</span>
                                <input type="number" name="exer_wgt" class="form-control fs-6" value="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2" readonly="readonly">
                            </div>

                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text p-2 fs-6 fw-bold">반복 수</span>
                                <input type="number" name="exer_cnt" class="form-control fs-6" min="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                            </div>

                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text p-2 fs-6 fw-bold">세트 수</span>
                                <input type="number" name="exer_set" class="form-control fs-6" min="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm3">
                            </div>

                            <input type="button" class="btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" value="완료" onclick="valid_Check(11)">

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

                <div class="image_container" onclick="javascript:exer_How(12)"> <%--이미지 바꾸기--%>
                    <img src="/resources/choi_machine/img/exercise/core/C_c_1.jpg" class="bd-placeholder-img card-img-top" width="300px" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                    <img src="/resources/choi_machine/img/exercise/core/C_c_2.jpg" class="bd-placeholder-img card-img-top" style="display: none" width="300px" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
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
                            <button type="button" class="start_exer btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" onclick="javascript:exer_Start(12)">시작</button>
                        </div>
                    </div>

                    <%--DB로 보내야하는 부분 / 시작 ! 이라는 멘트와 함께 exercise_dia로 가야함--%>
                    <%--name으로 exer_wgt_or_cnt와 exer_set 추가--%>

                    <form action="<c:url value='/user/member/exerciseType/core' />" name="exercise_type" method="post" id="valid_CheckForm12">

                        <div class="hidden_exer mt-3">

                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text p-2 fs-6 fw-bold">운동 명</span> <%--운동명 value 바꾸기--%>
                                <input type="text" name="exer_name" class="form-control fs-6" value="크런치" readonly="readonly" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                            </div>

                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text p-2 fs-6 fw-bold">무게</span>
                                <input type="number" name="exer_wgt" class="form-control fs-6" value="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2" readonly="readonly">
                            </div>

                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text p-2 fs-6 fw-bold">반복 수</span>
                                <input type="number" name="exer_cnt" class="form-control fs-6" min="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                            </div>

                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text p-2 fs-6 fw-bold">세트 수</span>
                                <input type="number" name="exer_set" class="form-control fs-6" min="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm3">
                            </div>

                            <input type="button" class="btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" value="완료" onclick="valid_Check(12)">

                        </div>

                    </form>

                </div>

            </div>
        </div>
        <%--3번 끝--%>





        <%--4번 [image-container 클래스를 가진 div 박스에 움직이고싶은 이미지를 두고 버튼의 class에 move-img를 넣어준다] --%>
        <div class="col">
            <div class="card shadow-sm">

                <div class="image_container" onclick="javascript:exer_How(13)"> <%--이미지 바꾸기--%>
                    <img src="/resources/choi_machine/img/exercise/core/C_t_c_1.jpg" class="bd-placeholder-img card-img-top" width="300px" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                    <img src="/resources/choi_machine/img/exercise/core/C_t_c_2.jpg" class="bd-placeholder-img card-img-top" style="display: none" width="300px" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
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
                            <button type="button" class="start_exer btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" onclick="javascript:exer_Start(13)">시작</button>
                        </div>
                    </div>

                    <%--DB로 보내야하는 부분 / 시작 ! 이라는 멘트와 함께 exercise_dia로 가야함--%>
                    <%--name으로 exer_wgt_or_cnt와 exer_set 추가--%>

                    <form action="<c:url value='/user/member/exerciseType/core' />" name="exercise_type" method="post" id="valid_CheckForm13">

                        <div class="hidden_exer mt-3">

                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text p-2 fs-6 fw-bold">운동 명</span> <%--운동명 value 바꾸기--%>
                                <input type="text" name="exer_name" class="form-control fs-6" value="트위스트 크런치" readonly="readonly" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                            </div>

                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text p-2 fs-6 fw-bold">무게</span>
                                <input type="number" name="exer_wgt" class="form-control fs-6" value="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2" readonly="readonly">
                            </div>

                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text p-2 fs-6 fw-bold">반복 수</span>
                                <input type="number" name="exer_cnt" class="form-control fs-6" min="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                            </div>

                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text p-2 fs-6 fw-bold">세트 수</span>
                                <input type="number" name="exer_set" class="form-control fs-6" min="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm3">
                            </div>

                            <input type="button" class="btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" value="완료" onclick="valid_Check(13)">

                        </div>

                    </form>

                </div>

            </div>
        </div>
        <%--4번 끝--%>


        <%--5번 [image-container 클래스를 가진 div 박스에 움직이고싶은 이미지를 두고 버튼의 class에 move-img를 넣어준다] --%>
        <div class="col">
            <div class="card shadow-sm">

                <div class="image_container" onclick="javascript:exer_How(14)">
                    <img src="/resources/choi_machine/img/exercise/core/C_l_r_1.jpg" class="bd-placeholder-img card-img-top" width="300px" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                    <img src="/resources/choi_machine/img/exercise/core/C_l_r_2.jpg" class="bd-placeholder-img card-img-top" style="display: none" width="300px" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                </div>

                <div class="card-body">
                    <details>
                        <summary class="fw-bold fs-2">
                            레그 레이즈
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
                            <button type="button" class="start_exer btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" onclick="javascript:exer_Start(14)">시작</button>
                        </div>

                    </div>

                    <%--DB로 보내야하는 부분 / 시작 ! 이라는 멘트와 함께 exercise_dia로 가야함--%>
                    <%--name으로 exer_wgt_or_cnt와 exer_set 추가--%>

                    <form action="<c:url value='/user/member/exerciseType/core' />" name="exercise_type" method="post" id="valid_CheckForm14">

                        <div class="hidden_exer mt-3">

                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text p-2 fs-6 fw-bold">운동 명</span>
                                <input type="text" name="exer_name" class="form-control fs-6" value="레그레이즈" readonly="readonly" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                            </div>

                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text p-2 fs-6 fw-bold">무게</span>
                                <input type="number" name="exer_wgt"class="form-control fs-6" value="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2" readonly="readonly">
                            </div>

                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text p-2 fs-6 fw-bold">반복 수</span>
                                <input type="number" name="exer_cnt" class="form-control fs-6" min="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                            </div>

                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text p-2 fs-6 fw-bold">세트 수</span>
                                <input type="number" name="exer_set" class="form-control fs-6" min="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm3">
                            </div>

                            <input type="button" class="btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" value="완료" onclick="valid_Check(14)">

                        </div>

                    </form>
                    <%--DB로 보내야하는 부분--%>

                </div>

            </div>
        </div>
        <%--5번 끝--%>
        <%--복근 운동 끝--%>



        <%--팔 운동 시작 15 ~ 19 --%>
        <%--1번 [image-container 클래스를 가진 div 박스에 움직이고싶은 이미지를 두고 버튼의 class에 move-img를 넣어준다] --%>
        <div class="col">
            <div class="card shadow-sm">

                <div class="image_container" onclick="javascript:exer_How(15)"> <%--이미지 바꾸기--%>
                    <img src="/resources/choi_machine/img/exercise/arm/A_d_c_1.jpg" class="bd-placeholder-img card-img-top" width="300px" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                    <img src="/resources/choi_machine/img/exercise/arm/A_d_c_2.jpg" class="bd-placeholder-img card-img-top" style="display: none" width="300px" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                </div>

                <div class="card-body">
                    <details>
                        <summary class="fw-bold fs-2">
                            덤벨 컬
                        </summary><br>
                        <p class="text-start">
                            손바닥이 위로 가도록 덤벨을 양손으로 잡은 후 가슴을 열고 팔꿈치를 옆구리에 자연스럽게 붙인 상태로 시작합니다.<br><br>

                            팔꿈치를 그대로 고정시키고 팔꿈치가 몸통 뒤로 가지 않도록 유의하며 들어올립니다<br>
                            내릴 때 천천히 내려오면 자극을 더 줄 수 있습니다
                        </p>
                    </details>

                    <hr>

                    <span class="badge rounded-pill bg-primary w-auto fs-4">이두근</span> <%--발달부위 바꾸기--%>
                    <hr>
                    <span class="badge rounded-pill bg-warning text-dark mb-2 fs-5">TIP !</span> <%--팁 바꾸기--%>

                    <p>팔을 내리며 몸이 따라 내려오지 않도록 유의하고, 팔을 쭉 피지 않도록 합니다.</p>

                    <hr>

                    <div>
                        <div class="btn-group">
                            <button type="button" class="start_exer btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" onclick="javascript:exer_Start(15)">시작</button>
                        </div>
                    </div>

                    <%--DB로 보내야하는 부분 / 시작 ! 이라는 멘트와 함께 exercise_dia로 가야함--%>
                    <%--name으로 exer_wgt_or_cnt와 exer_set 추가--%>

                    <form action="<c:url value='/user/member/exerciseType/arm' />" name="exercise_type" method="post" id="valid_CheckForm15"> <%--아이디 끝 숫자 바꾸기--%>

                        <div class="hidden_exer mt-3">

                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text p-2 fs-6 fw-bold">운동 명</span> <%--운동명 value 바꾸기--%>
                                <input type="text" name="exer_name" class="form-control fs-6" value="덤벨 컬" readonly="readonly" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
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

                            <input type="button" class="btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" value="완료" onclick="valid_Check(15)"> <%--파라미터 숫자 바꾸기--%>

                        </div>

                    </form>

                </div>

            </div>
        </div>
        <%--1번 끝--%>


        <%--2번 [image-container 클래스를 가진 div 박스에 움직이고싶은 이미지를 두고 버튼의 class에 move-img를 넣어준다] --%>
        <div class="col">
            <div class="card shadow-sm">

                <div class="image_container" onclick="javascript:exer_How(16)">
                    <img src="/resources/choi_machine/img/exercise/arm/A_d_e_1.jpg" class="bd-placeholder-img card-img-top" width="300px" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                    <img src="/resources/choi_machine/img/exercise/arm/A_d_e_2.jpg" class="bd-placeholder-img card-img-top" style="display: none" width="300px" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                </div>

                <div class="card-body">
                    <details>
                        <summary class="fw-bold fs-2">
                            얼터네이팅 덤벨 컬
                        </summary><br>
                        <p class="text-start">
                            손바닥이 마주보게 덤벨을 양손으로 잡은 후
                            가슴을 열고 팔꿈치를 옆구리에 자연스럽게 붙인 상태로 시작합니다.<br><br>

                            팔꿈치를 그대로 고정시키고 팔꿈치가 몸통 뒤로 가지 않도록 유의하며 들어올립니다<br>
                            내릴 때 천천히 내려오면 자극을 더 줄 수 있습니다
                        </p>
                    </details>

                    <hr>

                    <span class="badge rounded-pill bg-primary w-auto fs-4">이두근</span>
                    <hr>
                    <span class="badge rounded-pill bg-warning text-dark mb-2 fs-5">TIP !</span>

                    <p>팔을 내리며 몸이 따라 내려오지 않도록 유의하고, 팔을 쭉 피지 않도록 합니다.</p>

                    <hr>

                    <div>
                        <div class="btn-group">
                            <button type="button" class="start_exer btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" onclick="javascript:exer_Start(16)">시작</button>
                        </div>

                    </div>

                    <%--DB로 보내야하는 부분 / 시작 ! 이라는 멘트와 함께 exercise_dia로 가야함--%>
                    <%--name으로 exer_wgt_or_cnt와 exer_set 추가--%>

                    <form action="<c:url value='/user/member/exerciseType/arm' />" name="exercise_type" method="post" id="valid_CheckForm16">

                        <div class="hidden_exer mt-3">

                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text p-2 fs-6 fw-bold">운동 명</span>
                                <input type="text" name="exer_name" class="form-control fs-6" value="얼터네이팅 덤벨 컬" readonly="readonly" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
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

                            <input type="button" class="btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" value="완료" onclick="valid_Check(16)">

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

                <div class="image_container" onclick="javascript:exer_How(17)"> <%--이미지 바꾸기--%>
                    <img src="/resources/choi_machine/img/exercise/arm/A_d_k_1.jpg" class="bd-placeholder-img card-img-top" width="300px" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                    <img src="/resources/choi_machine/img/exercise/arm/A_d_k_2.jpg" class="bd-placeholder-img card-img-top" style="display: none" width="300px" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                </div>

                <div class="card-body">
                    <details>
                        <summary class="fw-bold fs-2">
                            덤벨 킥백
                        </summary><br>
                        <p class="text-start">
                            상체는 완전히 숙인 상태에서 고개만 살짝 들어주고
                            자극을 줄 팔은 상체와 일직선이 되게 만들고 팔꿈치만 고정시켜 줍니다<br>
                            팔과 반대방향의 다리는 굽혀서 벤치 혹은 의자에 올린 상태로 시작합니다<br><br>

                            상완근(팔뚝 윗부분부터 팔꿈치전까지)은 고정시킨 상태로 전완근(팔꿈치부터 손목전까지)만 천천히 들어올리며 몸과 수직이 될 수 있도록 만들어줍니다
                        </p>
                    </details>

                    <hr>

                    <span class="badge rounded-pill bg-primary w-auto fs-4">삼두근</span> <%--발달부위 바꾸기--%>
                    <hr>
                    <span class="badge rounded-pill bg-warning text-dark mb-2 fs-5">TIP !</span> <%--팁 바꾸기--%>

                    <p>팔을 천천히 펴고 난 후에 잠깐 정지해 수축을 최대로 거는것이 좋습니다.</p>

                    <hr>

                    <div>
                        <div class="btn-group">
                            <button type="button" class="start_exer btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" onclick="javascript:exer_Start(17)">시작</button>
                        </div>
                    </div>

                    <%--DB로 보내야하는 부분 / 시작 ! 이라는 멘트와 함께 exercise_dia로 가야함--%>
                    <%--name으로 exer_wgt_or_cnt와 exer_set 추가--%>

                    <form action="<c:url value='/user/member/exerciseType/arm' />" name="exercise_type" method="post" id="valid_CheckForm17">

                        <div class="hidden_exer mt-3">

                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text p-2 fs-6 fw-bold">운동 명</span> <%--운동명 value 바꾸기--%>
                                <input type="text" name="exer_name" class="form-control fs-6" value="덤벨 킥백" readonly="readonly" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
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

                            <input type="button" class="btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" value="완료" onclick="valid_Check(17)">

                        </div>

                    </form>

                </div>

            </div>
        </div>
        <%--3번 끝--%>





        <%--4번 [image-container 클래스를 가진 div 박스에 움직이고싶은 이미지를 두고 버튼의 class에 move-img를 넣어준다] --%>
        <div class="col">
            <div class="card shadow-sm">

                <div class="image_container" onclick="javascript:exer_How(18)"> <%--이미지 바꾸기--%>
                    <img src="/resources/choi_machine/img/exercise/arm/A_s_p_1.jpg" class="bd-placeholder-img card-img-top" width="300px" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                    <img src="/resources/choi_machine/img/exercise/arm/A_s_p_2.jpg" class="bd-placeholder-img card-img-top" style="display: none" width="300px" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                </div>

                <div class="card-body">
                    <details>
                        <summary class="fw-bold fs-2">
                            사이드 푸쉬업
                        </summary><br>
                        <p class="text-start">
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
                            <button type="button" class="start_exer btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" onclick="javascript:exer_Start(18)">시작</button>
                        </div>
                    </div>

                    <%--DB로 보내야하는 부분 / 시작 ! 이라는 멘트와 함께 exercise_dia로 가야함--%>
                    <%--name으로 exer_wgt_or_cnt와 exer_set 추가--%>

                    <form action="<c:url value='/user/member/exerciseType/arm' />" name="exercise_type" method="post" id="valid_CheckForm18">

                        <div class="hidden_exer mt-3">

                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text p-2 fs-6 fw-bold">운동 명</span> <%--운동명 value 바꾸기--%>
                                <input type="text" name="exer_name" class="form-control fs-6" value="사이드 푸쉬업" readonly="readonly" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                            </div>

                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text p-2 fs-6 fw-bold">무게</span>
                                <input type="number" name="exer_wgt" class="form-control fs-6" value="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2" readonly="readonly">
                            </div>

                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text p-2 fs-6 fw-bold">반복 수</span>
                                <input type="number" name="exer_cnt" class="form-control fs-6" min="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                            </div>

                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text p-2 fs-6 fw-bold">세트 수</span>
                                <input type="number" name="exer_set" class="form-control fs-6" min="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm3">
                            </div>

                            <input type="button" class="btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" value="완료" onclick="valid_Check(18)">

                        </div>

                    </form>

                </div>

            </div>
        </div>
        <%--4번 끝--%>


        <%--5번 [image-container 클래스를 가진 div 박스에 움직이고싶은 이미지를 두고 버튼의 class에 move-img를 넣어준다] --%>
        <div class="col">
            <div class="card shadow-sm">

                <div class="image_container" onclick="javascript:exer_How(19)">
                    <img src="/resources/choi_machine/img/exercise/arm/A_d_r_1.jpg" class="bd-placeholder-img card-img-top" width="300px" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                    <img src="/resources/choi_machine/img/exercise/arm/A_d_r_2.jpg" class="bd-placeholder-img card-img-top" style="display: none" width="300px" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                </div>

                <div class="card-body">
                    <details>
                        <summary class="fw-bold fs-2">
                            덤벨 리버스 리스트 컬
                        </summary><br>
                        <p class="text-start">
                            무릎을 꿇은 상태로 손바닥이 아래를 향하도록 덤벨을 양손으로 잡고,
                            팔을 어깨너비로 벌린 후
                            벤치 혹은 의자에 전완근을 올려놓은 상태로 시작합니다.<br><br>
                            최대한 천천히 손목을 구부려서 올렸다가 천천히 내려옵니다
                        </p>
                    </details>

                    <hr>

                    <span class="badge rounded-pill bg-primary w-auto fs-4">전완근</span>
                    <hr>
                    <span class="badge rounded-pill bg-warning text-dark mb-2 fs-5">TIP !</span>

                    <p>손목을 구부려 올려 최대 지점에 올라가면 잠깐 정지해 수축을 최대로 거는것이 좋습니다.</p>

                    <hr>

                    <div>
                        <div class="btn-group">
                            <button type="button" class="start_exer btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" onclick="javascript:exer_Start(19)">시작</button>
                        </div>

                    </div>

                    <%--DB로 보내야하는 부분 / 시작 ! 이라는 멘트와 함께 exercise_dia로 가야함--%>
                    <%--name으로 exer_wgt_or_cnt와 exer_set 추가--%>

                    <form action="<c:url value='/user/member/exerciseType/arm' />" name="exercise_type" method="post" id="valid_CheckForm19">

                        <div class="hidden_exer mt-3">

                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text p-2 fs-6 fw-bold">운동 명</span>
                                <input type="text" name="exer_name" class="form-control fs-6" value="덤벨 리버스 리스트 컬" readonly="readonly" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
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

                            <input type="button" class="btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" value="완료" onclick="valid_Check(19)">

                        </div>

                    </form>
                    <%--DB로 보내야하는 부분--%>

                </div>

            </div>
        </div>
        <%--5번 끝--%>

    <%--팔 운동 끝--%>



        <%--하체 운동 시작 20 ~ 24 --%>
        <%--1번 [image-container 클래스를 가진 div 박스에 움직이고싶은 이미지를 두고 버튼의 class에 move-img를 넣어준다] --%>
        <div class="col">
            <div class="card shadow-sm">

                <div class="image_container" onclick="javascript:exer_How(20)"> <%--이미지 바꾸기--%>
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

                    <p>동작을 천천히 진행하며 체중은 앞발의 뒤꿈치에 두도록 하는것이 근 성장에 유리합니다.</p>

                    <hr>

                    <div>
                        <div class="btn-group">
                            <button type="button" class="start_exer btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" onclick="javascript:exer_Start(20)">시작</button>
                        </div>
                    </div>

                    <%--DB로 보내야하는 부분 / 시작 ! 이라는 멘트와 함께 exercise_dia로 가야함--%>
                    <%--name으로 exer_wgt_or_cnt와 exer_set 추가--%>

                    <form action="<c:url value='/user/member/exerciseType/low' />" name="exercise_type" method="post" id="valid_CheckForm20"> <%--아이디 끝 숫자 바꾸기--%>

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

                            <input type="button" class="btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" value="완료" onclick="valid_Check(20)"> <%--파라미터 숫자 바꾸기--%>

                        </div>

                    </form>

                </div>

            </div>
        </div>
        <%--1번 끝--%>


        <%--2번 [image-container 클래스를 가진 div 박스에 움직이고싶은 이미지를 두고 버튼의 class에 move-img를 넣어준다] --%>
        <div class="col">
            <div class="card shadow-sm">

                <div class="image_container" onclick="javascript:exer_How(21)">
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
                            <button type="button" class="start_exer btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" onclick="javascript:exer_Start(21)">시작</button>
                        </div>

                    </div>

                    <%--DB로 보내야하는 부분 / 시작 ! 이라는 멘트와 함께 exercise_dia로 가야함--%>
                    <%--name으로 exer_wgt_or_cnt와 exer_set 추가--%>

                    <form action="<c:url value='/user/member/exerciseType/low' />" name="exercise_type" method="post" id="valid_CheckForm21">

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

                            <input type="button" class="btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" value="완료" onclick="valid_Check(21)">

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

                <div class="image_container" onclick="javascript:exer_How(22)"> <%--이미지 바꾸기--%>
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
                            <button type="button" class="start_exer btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" onclick="javascript:exer_Start(22)">시작</button>
                        </div>
                    </div>

                    <%--DB로 보내야하는 부분 / 시작 ! 이라는 멘트와 함께 exercise_dia로 가야함--%>
                    <%--name으로 exer_wgt_or_cnt와 exer_set 추가--%>

                    <form action="<c:url value='/user/member/exerciseType/low' />" name="exercise_type" method="post" id="valid_CheckForm22">

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

                            <input type="button" class="btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" value="완료" onclick="valid_Check(22)">

                        </div>

                    </form>

                </div>

            </div>
        </div>
        <%--3번 끝--%>





        <%--4번 [image-container 클래스를 가진 div 박스에 움직이고싶은 이미지를 두고 버튼의 class에 move-img를 넣어준다] --%>
        <div class="col">
            <div class="card shadow-sm">

                <div class="image_container" onclick="javascript:exer_How(23)"> <%--이미지 바꾸기--%>
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
                            <button type="button" class="start_exer btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" onclick="javascript:exer_Start(23)">시작</button>
                        </div>
                    </div>

                    <%--DB로 보내야하는 부분 / 시작 ! 이라는 멘트와 함께 exercise_dia로 가야함--%>
                    <%--name으로 exer_wgt_or_cnt와 exer_set 추가--%>

                    <form action="<c:url value='/user/member/exerciseType/low' />" name="exercise_type" method="post" id="valid_CheckForm23">

                        <div class="hidden_exer mt-3">

                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text p-2 fs-6 fw-bold">운동 명</span> <%--운동명 value 바꾸기--%>
                                <input type="text" name="exer_name" class="form-control fs-6" value="피스톨 스쿼트" readonly="readonly" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                            </div>

                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text p-2 fs-6 fw-bold" onclick="toggleReadOnly(9)">무게 (클릭 후 조절가능)</span>
                                <input type="number" name="exer_wgt" id="9_in" class="form-control fs-6" value="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2" readonly="readonly">
                            </div>

                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text p-2 fs-6 fw-bold">반복 수</span>
                                <input type="number" name="exer_cnt" class="form-control fs-6" min="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                            </div>

                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text p-2 fs-6 fw-bold">세트 수</span>
                                <input type="number" name="exer_set" class="form-control fs-6" min="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm3">
                            </div>

                            <input type="button" class="btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" value="완료" onclick="valid_Check(23)">

                        </div>

                    </form>

                </div>

            </div>
        </div>
        <%--4번 끝--%>


        <%--5번 [image-container 클래스를 가진 div 박스에 움직이고싶은 이미지를 두고 버튼의 class에 move-img를 넣어준다] --%>
        <div class="col">
            <div class="card shadow-sm">

                <div class="image_container" onclick="javascript:exer_How(24)">
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
                            <button type="button" class="start_exer btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" onclick="javascript:exer_Start(24)">시작</button>
                        </div>

                    </div>

                    <%--DB로 보내야하는 부분 / 시작 ! 이라는 멘트와 함께 exercise_dia로 가야함--%>
                    <%--name으로 exer_wgt_or_cnt와 exer_set 추가--%>

                    <form action="<c:url value='/user/member/exerciseType/low' />" name="exercise_type" method="post" id="valid_CheckForm24">

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

                            <input type="button" class="btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" value="완료" onclick="valid_Check(24)">

                        </div>

                    </form>
                    <%--DB로 보내야하는 부분--%>

                </div>

            </div>
        </div>
        <%--5번 끝--%>
        <%--하체 운동 끝--%>



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
<jsp:include page="../user/js_jsp/valid_check.jsp" />

<jsp:include page="../user/js_jsp/moreWgt.jsp" />

<jsp:include page="../user/js_jsp/exercise_List_start_exer.jsp" />

<jsp:include page="../user/js_jsp/exercise_List_img_Move.jsp" />

</body>
</html>
