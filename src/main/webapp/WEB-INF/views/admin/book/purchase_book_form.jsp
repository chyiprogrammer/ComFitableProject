<%--
  Created by IntelliJ IDEA.
  User: David Jung
  Date: 2024-03-08
  Time: 오후 11:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.84.0">
    <title>Checkout example · Bootstrap v5.0</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/checkout/">



    <!-- Bootstrap core CSS -->
    <link href="/resources/css/admin/test/bootstrap.min.css" rel="stylesheet">

    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
    </style>


    <!-- Custom styles for this template -->
    <link href="/resources/css/admin/test/form-validation.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container">
    <main>
        <div class="py-5 text-center">
            <img class="d-block mx-auto mb-4" src="/resources/img/admin/namuicon2.png" alt="Namu" width="72" height="57">
            <h2>도서 발주서</h2>
            <p class="lead">업체를 선택한 후 발주할 도서 리스트를 작성한다.</p>
        </div>

        <div class="row g-5">

            <div class="col-md-12 col-lg-12">
                <h4 class="mb-3">발주 업체명</h4>
                <hr class="my-4">
                <form class="needs-validation" novalidate>
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label for="country" class="form-label">등록업체</label>
                            <select class="form-select" id="country" required>
                                <option value="">업체선택...</option>
                                <option>위키북스</option>
                                <option>이지스퍼블리싱</option>
                                <option>한빛아카데미</option>
                                <option>루비페이퍼</option>
                                <option>도서출판 해냄</option>
                                <option>생각의 길</option>
                                <option>좋은책 신사고</option>
                            </select>
                        </div>

                        <div class="col-sm-6">
                            <label for="companyno" class="form-label">사업자번호</label>
                            <input type="text" class="form-control" id="companyno" placeholder="" value="" required>
                            <div class="invalid-feedback">
                                Valid last name is required.
                            </div>
                        </div>

                        <div class="col-12">
                            <label for="address" class="form-label">등록 주소</label>
                            <input type="text" class="form-control" id="address" placeholder="1234 Main St" required>
                            <div class="invalid-feedback">
                                Please enter your shipping address.
                            </div>
                        </div>

                        <div class="col-sm-6">
                            <label for="person" class="form-label">담당자</label>
                            <input type="text" class="form-control" id="person" placeholder="" value="" required>
                            <div class="invalid-feedback">
                                Valid last name is required.
                            </div>
                        </div>

                        <div class="col-sm-6">
                            <label for="phone" class="form-label">연락처<span class="text-muted">(알림 발송)</span></label>
                            <input type="text" class="form-control" id="phone" placeholder="" value="" required>
                            <div class="invalid-feedback">
                                Valid last name is required.
                            </div>
                        </div>

                        <div class="col-12">
                            <label for="email" class="form-label">Email <span class="text-muted">(발주서 발송)</span></label>
                            <input type="email" class="form-control" id="email" placeholder="you@example.com">
                            <div class="invalid-feedback">
                                Please enter a valid email address for shipping updates.
                            </div>
                        </div>
                        <hr class="my-4">
                    </div>
                    <h4 class="mb-3">발주 내역</h4>
                    <hr class="my-4">
                    <div class="row g-3">
                        <div class="col-md-2">
                            <label for="isbn" class="form-label">ISBN</label>
                            <input type="text" class="form-control" id="isbn" placeholder="" required>
                            <div class="invalid-feedback">
                                ISBN code required.
                            </div>
                        </div>
                        <div class="col-md-3">
                            <label for="bookname" class="form-label">도서명</label>
                            <input type="text" class="form-control" id="bookname" placeholder="" required>
                            <div class="invalid-feedback">
                                ISBN code required.
                            </div>
                        </div>
                        <div class="col-md-2">
                            <label for="unitprice" class="form-label">도서단가</label>
                            <input type="text" class="form-control" id="unitprice" placeholder="" required>
                            <div class="invalid-feedback">
                                ISBN code required.
                            </div>
                        </div>
                        <div class="col-md-1">
                            <label for="qty" class="form-label">수량</label>
                            <input type="text" class="form-control" id="qty" placeholder="" required>
                            <div class="invalid-feedback">
                                ISBN code required.
                            </div>
                        </div>
                        <div class="col-md-2">
                            <label for="naverbook" class="form-label">NAVER검색</label>
                            <button type="submit" class="btn btn-secondary form-control" id="naverbook">도서검색</button>
                        </div>
                        <div class="col-md-2">
                            <label for="hopebook" class="form-label">희망도서 </label>
                            <button type="submit" class="btn btn-secondary form-control" id="hopebook">희망도서</button>
                        </div>
                        <hr class="my-4">
                        <form class="card p-2">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="검색할 도서 입력">
                                <button type="submit" class="btn btn-secondary" id="searchbook">도서검색</button>
                            </div>
                        </form>

                        <div class="row g-2">
                            <div class="col-md-2">
                                <label for="isbn" class="form-label">ISBN</label>
                                <input type="text" class="form-control"  placeholder="" required>
                                <div class="invalid-feedback">
                                    ISBN code required.
                                </div>
                            </div>
                            <div class="col-md-3">
                                <label for="bookname" class="form-label">도서명</label>
                                <input type="text" class="form-control"  placeholder="" required>
                                <div class="invalid-feedback">
                                    ISBN code required.
                                </div>
                            </div>
                            <div class="col-md-1">
                                <label for="author" class="form-label">저자</label>
                                <input type="text" class="form-control" id="author" placeholder="" required>
                                <div class="invalid-feedback">
                                    ISBN code required.
                                </div>
                            </div>
                            <div class="col-md-2">
                                <label for="publisher" class="form-label">출판사</label>
                                <input type="text" class="form-control" id="publisher" placeholder="" required>
                                <div class="invalid-feedback">
                                    ISBN code required.
                                </div>
                            </div>
                            <div class="col-md-1">
                                <label for="publishdate" class="form-label">출판일</label>
                                <input type="text" class="form-control" id="publishdate" placeholder="" required>
                                <div class="invalid-feedback">
                                    ISBN code required.
                                </div>
                            </div>
                            <div class="col-md-2">
                                <img src="/resources/img/admin/namuicon1.png" alt="BookImage" width="90" height="70">
                                <div class="invalid-feedback">
                                    ISBN code required.
                                </div>
                            </div>
                            <div class="col-md-1">
                                <label for="selectbook" class="form-label">선택 </label>
                                <button type="submit" class="btn btn-secondary form-control">선택</button>
                            </div>

                        </div>

                        <hr class="my-4">

                        <div class="col-md-9 col-lg-9 order-md-last">
                            <h4 class="d-flex justify-content-between align-items-center mb-3">
                                <span class="text-primary">발주 금액</span>
                                <span class="badge bg-primary rounded-pill">3</span>
                            </h4>
                            <ul class="list-group mb-3">
                                <li class="list-group-item d-flex justify-content-between lh-sm">
                                    <div>
                                        <h6 class="my-0">도서 구입가</h6>
                                        <small class="text-muted">소비자판매가</small>
                                    </div>
                                    <h3 class="text-muted">34,000<small class="text-muted">원</small> </h3>
                                </li>
                                <li class="list-group-item d-flex justify-content-between bg-light">
                                    <div class="text-success">
                                        <h6 class="my-0">도서 할인율</h6>
                                        <small class="text-muted">5권이상 5% 10권이상 10%</small>
                                    </div>
                                    <h3 class="text-success">10<small class="text-muted">%</small></h3>
                                </li>
                                <li class="list-group-item d-flex justify-content-between lh-sm">
                                    <div>
                                        <h6 class="my-0">부가세</h6>
                                        <small class="text-muted">10%</small>
                                    </div>
                                    <h3 class="text-muted">10<small class="text-muted">%</small></h3>
                                </li>
                                <li class="list-group-item d-flex justify-content-between lh-sm">
                                    <div>
                                        <h6 class="my-0">총금액</h6>
                                        <small class="text-muted">소비자판매가</small>
                                    </div>
                                    <h2 class="text-muted">32,000<small class="text-muted">원</small> </h2>
                                </li>
                            </ul>

                        </div>
                    </div>



                <hr class="my-4">
                <div class="row g-3">
                    <div class="col-sm-6">
                        <button class="w-100 btn btn-primary btn-lg" type="submit">발주진행</button>
                    </div>
                    <div class="col-sm-6">
                        <button class="w-100 btn btn-secondary btn-lg" type="submit">임시저장</button>
                    </div>
                </div>
                </form>
        </div>
    </div>
 </main>

<footer class="my-5 pt-5 text-muted text-center text-small">
    <p class="mb-1">&copy; 2017–2021 NamuLibraryCompany</p>
</footer>

</div>
<script src="/resources/js/bootstrap.bundle.min.js"></script>
<script src="/resources/js/form-validation.js"></script>
</body>
</html>
