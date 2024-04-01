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
    document.getElementById("body_section").innerText = "어깨";
</script>

<div class="album py-5 bg-light">
    <div class="container">

        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3" id="health_map">

            <%--1번 [image-container 클래스를 가진 div 박스에 움직이고싶은 이미지를 두고 버튼의 class에 move-img를 넣어준다] --%>
            <div class="col">
                <div class="card shadow-sm">

                    <div class="image_container" onclick="javascript:exer_How(0)"> <%--이미지 바꾸기--%>
                        <img src="/resources/choi_machine/img/exercise/shoulder/S_d_p_1.jpg" class="bd-placeholder-img card-img-top" width="100%" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                        <img src="/resources/choi_machine/img/exercise/shoulder/S_d_p_2.jpg" class="bd-placeholder-img card-img-top" style="display: none" width="100%" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                    </div>

                    <div class="card-body">
                        <details>
                            <summary class="fw-bold">
                                덤벨 숄더 프레스
                            </summary>
                            <p>
                                팔을 옆으로 벌려 덤벨을 머리의 중간 지점 쯤 오게 한 후 시작합니다 .<br><br>

                                어깨가 솟지 않도록 유의하며 팔만 들어줍니다<br>
                                팔을 내릴 때에는 처음에 시작했던 머리의 중간 지점으로 다시 돌아옵니다
                            </p>
                        </details>

                        <hr>

                        <span class="badge rounded-pill bg-primary w-auto">삼각근(전면과 측면)</span> <%--발달부위 바꾸기--%>
                        <hr>
                        <span class="badge rounded-pill bg-warning text-dark mb-2">TIP !</span> <%--팁 바꾸기--%>

                        <p>들어 올리는 동작에서 팔을 쭉 피지 않도록 합니다.</p>

                        <hr>

                        <div>
                            <div class="btn-group">
                                <button type="button" class="start_exer btn btn-sm btn-outline-secondary px-5 py-4" onclick="javascript:exer_Start(0)">시작</button>
                            </div>
                        </div>

                        <%--DB로 보내야하는 부분 / 시작 ! 이라는 멘트와 함께 exercise_dia로 가야함--%>
                        <%--name으로 exer_wgt_or_cnt와 exer_set 추가--%>

                        <form action="<c:url value='/user/member/exerciseType/shoulder' />" name="exercise_type" method="post" id="valid_CheckForm0"> <%--아이디 끝 숫자 바꾸기--%>

                            <div class="hidden_exer mt-3">

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text">운동 명</span> <%--운동명 value 바꾸기--%>
                                    <input type="text" name="exer_name" class="form-control" value="덤벨 숄더 프레스" readonly="readonly" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                                </div>

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text">무게/갯수</span>
                                    <input type="number" name="exer_wgt_or_cnt" class="form-control" min="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
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

                    <div class="image_container" onclick="javascript:exer_How(1)">
                        <img src="/resources/choi_machine/img/exercise/shoulder/S_d_f_1.jpg" class="bd-placeholder-img card-img-top" width="100%" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                        <img src="/resources/choi_machine/img/exercise/shoulder/S_d_f_2.jpg" class="bd-placeholder-img card-img-top" style="display: none" width="100%" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                    </div>

                    <div class="card-body">
                        <details>
                            <summary class="fw-bold">
                                덤벨 프론트 레이즈
                            </summary>
                            <p>다리를 어깨넓이 정도로 벌려 자연스럽게 서고,
                                팔꿈치를 살짝 구부린 후 허벅지 앞쪽에 둔 상태로 시작합니다.<br><br>

                                팔을 앞으로 올려주고 올라가는 속도보다 천천히 내려옵니다<br>
                            </p>
                        </details>

                        <hr>

                        <span class="badge rounded-pill bg-primary w-auto">삼각근(전면)</span>
                        <hr>
                        <span class="badge rounded-pill bg-warning text-dark mb-2">TIP !</span>

                        <p>팔꿈치를 많이 올리지 않도록 합니다.</p>

                        <hr>

                        <div>
                            <div class="btn-group">
                                <button type="button" class="start_exer btn btn-sm btn-outline-secondary px-5 py-4" onclick="javascript:exer_Start(1)">시작</button>
                            </div>

                        </div>

                        <%--DB로 보내야하는 부분 / 시작 ! 이라는 멘트와 함께 exercise_dia로 가야함--%>
                        <%--name으로 exer_wgt_or_cnt와 exer_set 추가--%>

                        <form action="<c:url value='/user/member/exerciseType/shoulder' />" name="exercise_type" method="post" id="valid_CheckForm1">

                            <div class="hidden_exer mt-3">

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text">운동 명</span>
                                    <input type="text" name="exer_name" class="form-control" value="덤벨 프론트 레이즈" readonly="readonly" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                                </div>

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text">무게/갯수</span>
                                    <input type="number" name="exer_wgt_or_cnt" class="form-control" min="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
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

                    <div class="image_container"  onclick="javascript:exer_How(2)"> <%--이미지 바꾸기--%>
                        <img src="/resources/choi_machine/img/exercise/shoulder/S_d_s_1.jpg" class="bd-placeholder-img card-img-top" width="100%" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                        <img src="/resources/choi_machine/img/exercise/shoulder/S_d_s_2.jpg" class="bd-placeholder-img card-img-top" style="display: none" width="100%" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                    </div>

                    <div class="card-body">
                        <details>
                            <summary class="fw-bold">
                                덤벨 사이드 레터럴 레이즈
                            </summary>
                            <p>
                                덤벨을 양손으로 들고 다리를 자연스럽게 벌린 상태로 시작합니다<br><br>

                                어깨를 내린다는 느낌을 유지한 채 양 팔을 옆으로 들어올리고 올라가는 속도보다 천천히 내려옵니다
                            </p>
                        </details>

                        <hr>

                        <span class="badge rounded-pill bg-primary w-auto">삼각근(측면)</span> <%--발달부위 바꾸기--%>
                        <hr>
                        <span class="badge rounded-pill bg-warning text-dark mb-2">TIP !</span> <%--팁 바꾸기--%>

                        <p>팔을 높이 올리지 않도록 합니다.</p>

                        <hr>

                        <div>
                            <div class="btn-group">
                                <button type="button" class="start_exer btn btn-sm btn-outline-secondary px-5 py-4" onclick="javascript:exer_Start(2)">시작</button>
                            </div>
                        </div>

                        <%--DB로 보내야하는 부분 / 시작 ! 이라는 멘트와 함께 exercise_dia로 가야함--%>
                        <%--name으로 exer_wgt_or_cnt와 exer_set 추가--%>

                        <form action="<c:url value='/user/member/exerciseType/shoulder' />" name="exercise_type" method="post" id="valid_CheckForm2">

                            <div class="hidden_exer mt-3">

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text">운동 명</span> <%--운동명 value 바꾸기--%>
                                    <input type="text" name="exer_name" class="form-control" value="덤벨 사이드 레터럴 레이즈" readonly="readonly" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                                </div>

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text">무게/갯수</span>
                                    <input type="number" name="exer_wgt_or_cnt" class="form-control" min="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
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

                    <div class="image_container" onclick="javascript:exer_How(3)"> <%--이미지 바꾸기--%>
                        <img src="/resources/choi_machine/img/exercise/shoulder/S_s_b_r_1.jpg" class="bd-placeholder-img card-img-top" width="100%" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                        <img src="/resources/choi_machine/img/exercise/shoulder/S_s_b_r_2.jpg" class="bd-placeholder-img card-img-top" style="display: none" width="100%" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                    </div>

                    <div class="card-body">
                        <details>
                            <summary class="fw-bold">
                                시티드 벤트오버 레터럴 레이즈
                            </summary>
                            <p>
                                덤벨을 양손에 들고 벤치 혹은 등받이가 없는 의자에 앉아 두발을 가까이 둔 후 허리를 약간 굽힌 상태로 시작합니다<br><br>

                                팔꿈치로 움직여 올린다는 느낌으로 덤벨을 어깨보다 약간 낮은 위치까지 들어올리고 올라가는 속도보다 천천히 내려옵니다.</p>
                            </p>
                        </details>

                        <hr>

                        <span class="badge rounded-pill bg-primary w-auto">삼각근(후면)</span> <%--발달부위 바꾸기--%>
                        <hr>
                        <span class="badge rounded-pill bg-warning text-dark mb-2">TIP !</span> <%--팁 바꾸기--%>

                        <p>덤벨의 뒷면이 앞면보다 올라오게 하면 좋습니다.</p>

                        <hr>

                        <div>
                            <div class="btn-group">
                                <button type="button" class="start_exer btn btn-sm btn-outline-secondary px-5 py-4" onclick="javascript:exer_Start(3)">시작</button>
                            </div>
                        </div>

                        <%--DB로 보내야하는 부분 / 시작 ! 이라는 멘트와 함께 exercise_dia로 가야함--%>
                        <%--name으로 exer_wgt_or_cnt와 exer_set 추가--%>

                        <form action="<c:url value='/user/member/exerciseType/shoulder' />" name="exercise_type" method="post" id="valid_CheckForm3">

                            <div class="hidden_exer mt-3">

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text">운동 명</span> <%--운동명 value 바꾸기--%>
                                    <input type="text" name="exer_name" class="form-control" value="시티드 벤트오버 레터럴 레이즈" readonly="readonly" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                                </div>

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text">무게/갯수</span>
                                    <input type="number" name="exer_wgt_or_cnt" class="form-control" min="1" -label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
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

                    <div class="image_container" onclick="javascript:exer_How(4)">
                        <img src="/resources/choi_machine/img/exercise/shoulder/S_p_p_1.jpg" class="bd-placeholder-img card-img-top" width="100%" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                        <img src="/resources/choi_machine/img/exercise/shoulder/S_p_p_2.jpg" class="bd-placeholder-img card-img-top" style="display: none" width="100%" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                    </div>

                    <div class="card-body">
                        <details>
                            <summary class="fw-bold">
                                파이크 푸쉬업
                            </summary>
                            <p>푸쉬업 자세에서 양손의 간격이 어깨보다 약간 넓도록 벌린 상태로 다리를 손 방향을 향해 걷듯이 이동시킵니다<br>
                                골반을 높게 들어올린 상태가되면 시작합니다<br><br>
                                발 뒤꿈치를 살짝 들어올려 무게중심을 상체로 옮긴 후 어깨와 손목이 수직을 이루는 상태로 천천히 내려갑니다
                            </p>
                        </details>

                        <hr>

                        <span class="badge rounded-pill bg-primary w-auto">삼각근/삼두근</span>
                        <hr>
                        <span class="badge rounded-pill bg-warning text-dark mb-2">TIP !</span>

                        <p>손목에 무리가 가는 경우엔 손가락의 방향을 45도정도 옆으로 돌려줍니다.</p>

                        <hr>

                        <div>
                            <div class="btn-group">
                                <button type="button" class="start_exer btn btn-sm btn-outline-secondary px-5 py-4" onclick="javascript:exer_Start(4)">시작</button>
                            </div>

                        </div>

                        <%--DB로 보내야하는 부분 / 시작 ! 이라는 멘트와 함께 exercise_dia로 가야함--%>
                        <%--name으로 exer_wgt_or_cnt와 exer_set 추가--%>

                        <form action="<c:url value='/user/member/exerciseType/shoulder' />" name="exercise_type" method="post" id="valid_CheckForm4">

                            <div class="hidden_exer mt-3">

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text">운동 명</span>
                                    <input type="text" name="exer_name" class="form-control" value="파이크 푸쉬업" readonly="readonly" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
                                </div>

                                <div class="input-group input-group-sm mb-3">
                                    <span class="input-group-text">갯수</span>
                                    <input type="number" name="exer_wgt_or_cnt" class="form-control" min="1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm2">
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
