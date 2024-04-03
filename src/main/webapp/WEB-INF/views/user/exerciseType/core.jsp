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
    document.getElementById("body_section").innerText = "코어";
</script>

<div class="album py-5 bg-light">

        <p class="fs-3 text-primary">이미지를 클릭하시면 대략적인 운동 자세를 보여드립니다.</p>
    <hr>
        <button type="button" class="btn btn-primary">
            <a href="<c:url value='/user/member/exerciseType/core/rutin' />" class="text-decoration-none fs-2 text-white">추천 루틴으로 진행(코어)</a>
        </button>

    <hr>
    <br>
    <details>
        <summary class="fw-bold fs-2">
            루틴 확인
        </summary>
        <p class="text-center fs-4">
            윗몸 일으키기 / 무게 없음 / 20개 / 3세트<br>
            마운틴 클라이머 / 무게 없음 / 30개 / 2세트<br>
            레그 레이즈 / 무게 없음 / 15개 / 3세트 <br>
        </p>
    </details>
    <br>
    <hr>

        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3" id="health_map">

            <div class="col">
                <div class="card shadow-sm">

                    <div class="image_container" onclick="javascript:exer_How(0)"> <%--이미지 바꾸기--%>
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
                                <button type="button" class="start_exer btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" onclick="javascript:exer_Start(0)">시작</button>
                            </div>
                        </div>

                        <%--DB로 보내야하는 부분 / 시작 ! 이라는 멘트와 함께 exercise_dia로 가야함--%>
                        <%--name으로 exer_sec와 exer_set 추가--%>

                        <form action="<c:url value='/user/member/exerciseType/core' />" name="exercise_type" method="post" id="valid_CheckForm0"> <%--아이디 끝 숫자 바꾸기--%>

                            <div class="hidden_exer mt-3">

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text p-2 fs-6 fw-bold">운동 명</span> <%--운동명 value 바꾸기--%>
                                    <input type="text" name="exer_name" class="form-control" value="마운틴 클라이머" readonly="readonly" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                                </div>

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text p-2 fs-6 fw-bold">무게</span>
                                    <input type="number" name="exer_wgt" class="form-control" min="1" value="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2" readonly="readonly">
                                </div>

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text p-2 fs-6 fw-bold">반복 수</span>
                                    <input type="number" name="exer_cnt" class="form-control" min="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                                </div>

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text p-2 fs-6 fw-bold">세트 수</span>
                                    <input type="number" name="exer_set" class="form-control" min="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm3">
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
                                <button type="button" class="start_exer btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" onclick="javascript:exer_Start(1)">시작</button>
                            </div>

                        </div>

                        <%--DB로 보내야하는 부분 / 시작 ! 이라는 멘트와 함께 exercise_dia로 가야함--%>
                        <%--name으로 exer_sec와 exer_set 추가--%>

                        <form action="<c:url value='/user/member/exerciseType/core' />" name="exercise_type" method="post" id="valid_CheckForm1">

                            <div class="hidden_exer mt-3">

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text p-2 fs-6 fw-bold">운동 명</span>
                                    <input type="text" name="exer_name" class="form-control" value="윗몸 일으키기" readonly="readonly" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                                </div>

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text p-2 fs-6 fw-bold">무게</span>
                                    <input type="number" name="exer_wgt" class="form-control" min="1" value="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2" readonly="readonly">
                                </div>

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text p-2 fs-6 fw-bold">반복 수</span>
                                    <input type="number" name="exer_cnt" class="form-control" min="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                                </div>

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text p-2 fs-6 fw-bold">세트 수</span>
                                    <input type="number" name="exer_set" class="form-control" min="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm3">
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
                                <button type="button" class="start_exer btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" onclick="javascript:exer_Start(2)">시작</button>
                            </div>
                        </div>

                        <%--DB로 보내야하는 부분 / 시작 ! 이라는 멘트와 함께 exercise_dia로 가야함--%>
                        <%--name으로 exer_sec와 exer_set 추가--%>

                        <form action="<c:url value='/user/member/exerciseType/core' />" name="exercise_type" method="post" id="valid_CheckForm2">

                            <div class="hidden_exer mt-3">

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text p-2 fs-6 fw-bold">운동 명</span> <%--운동명 value 바꾸기--%>
                                    <input type="text" name="exer_name" class="form-control" value="크런치" readonly="readonly" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                                </div>

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text p-2 fs-6 fw-bold">무게</span>
                                    <input type="number" name="exer_wgt" class="form-control" min="1" value="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2" readonly="readonly">
                                </div>

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text p-2 fs-6 fw-bold">반복 수</span>
                                    <input type="number" name="exer_cnt" class="form-control" min="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                                </div>

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text p-2 fs-6 fw-bold">세트 수</span>
                                    <input type="number" name="exer_set" class="form-control" min="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm3">
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

                        <span class="badge rounded-pill bg-primary w-auto fs-4">코어/하 복부</span> <%--발달부위 바꾸기--%>
                        <hr>
                        <span class="badge rounded-pill bg-warning text-dark mb-2 fs-5">TIP !</span> <%--팁 바꾸기--%>

                        <p>내려올 때 등이 굽거나 머리가 땅에 닿지 않도록 하는것이 좋습니다.</p>

                        <hr>

                        <div>
                            <div class="btn-group">
                                <button type="button" class="start_exer btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" onclick="javascript:exer_Start(3)">시작</button>
                            </div>
                        </div>

                        <%--DB로 보내야하는 부분 / 시작 ! 이라는 멘트와 함께 exercise_dia로 가야함--%>
                        <%--name으로 exer_sec와 exer_set 추가--%>

                        <form action="<c:url value='/user/member/exerciseType/core' />" name="exercise_type" method="post" id="valid_CheckForm3">

                            <div class="hidden_exer mt-3">

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text p-2 fs-6 fw-bold">운동 명</span> <%--운동명 value 바꾸기--%>
                                    <input type="text" name="exer_name" class="form-control" value="트위스트 크런치" readonly="readonly" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                                </div>

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text p-2 fs-6 fw-bold">무게</span>
                                    <input type="number" name="exer_wgt" class="form-control" min="1" value="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2" readonly="readonly">
                                </div>

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text p-2 fs-6 fw-bold">반복 수</span>
                                    <input type="number" name="exer_cnt" class="form-control" min="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                                </div>

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text p-2 fs-6 fw-bold">세트 수</span>
                                    <input type="number" name="exer_set" class="form-control" min="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm3">
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
                                <button type="button" class="start_exer btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" onclick="javascript:exer_Start(4)">시작</button>
                            </div>

                        </div>

                        <%--DB로 보내야하는 부분 / 시작 ! 이라는 멘트와 함께 exercise_dia로 가야함--%>
                        <%--name으로 exer_sec와 exer_set 추가--%>

                        <form action="<c:url value='/user/member/exerciseType/core' />" name="exercise_type" method="post" id="valid_CheckForm4">

                            <div class="hidden_exer mt-3">

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text p-2 fs-6 fw-bold">운동 명</span>
                                    <input type="text" name="exer_name" class="form-control" value="레그레이즈" readonly="readonly" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                                </div>

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text p-2 fs-6 fw-bold">무게</span>
                                    <input type="number" name="exer_wgt" class="form-control" min="1" value="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2" readonly="readonly">
                                </div>

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text p-2 fs-6 fw-bold">반복 수</span>
                                    <input type="number" name="exer_cnt" class="form-control" min="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                                </div>

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text p-2 fs-6 fw-bold">세트 수</span>
                                    <input type="number" name="exer_set" class="form-control" min="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm3">
                                </div>

                                <input type="button" class="btn btn-sm btn-primary text-white px-5 py-3 fs-3 fs-3" value="완료" onclick="valid_Check(4)">

                            </div>

                        </form>
                        <%--DB로 보내야하는 부분--%>

                    </div>

                </div>
            </div>
            <!--5번 끝-->

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


<jsp:include page="../js_jsp/exercise_List_start_exer.jsp" />

<jsp:include page="../js_jsp/exercise_List_img_Move.jsp" />

</body>
</html>
