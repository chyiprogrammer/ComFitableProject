<%@page import="java.util.List"%>
<%@page import="kr.co.namu.book.BookVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<jsp:include page="../../include/title.jsp" />

<link href="<c:url value='/resources/css/admin/rental_books.css' />" rel="stylesheet" type="text/css">

</head>
<body>

	<jsp:include page="../../include/header.jsp" />
	
	<jsp:include page="../include/nav.jsp" />
	
	<section>
		
		<div id="section_wrap">
		
			<div class="word">
			
				<h3>RENTAL BOOKS</h3>
				
			</div>
			
			<div class="book_list">
			
				<table>
					<thead>
						<tr>
							<th>회원명(계정)</th>
							<th>도서명</th>
							<th>저자</th>
							<th>발행처</th>
							<th>ISBN</th>
							<th>청구기호</th>
							<th>반납</th>
						</tr>
					</thead>
					
					<tbody>
						
						<c:forEach var="item" items="${orderMachineVos}">
							<tr>
								<td>${item.u_m_name}<br>(${item.u_m_id})</td>
								<td>
								<c:url value='/book/admin/bookDetail' var='detail_url'>
									<c:param name='b_no' value='${item.b_no}'/>
								</c:url>
								<a href="${detail_url}">${item.b_name}</a>
								</td>
								<td>${item.b_author}</td>
								<td>${item.b_publisher}<br>(${item.b_publish_year})</td>
								<td>${item.b_isbn}</td>
								<td>${item.b_call_number}</td>
								<td>
									<c:url value='/book/admin/returnBookConfirm' var='return_url'>
										<c:param name='b_no' value='${item.b_no}'/>
										<c:param name='rb_no' value='${item.rb_no}'/>
									</c:url>
									<a href="${return_url}">반납</a>
								</td>
							</tr>
						</c:forEach>
						
					</tbody>
					
					<%--
					<tbody>
						<%
							List<BookVo> machineVos = (List<BookVo>) request.getAttribute("machineVos");
							for (int i = 0; i < machineVos.size(); i++) {
						%>
						<tr>
							<td>
								<a href="/library/book/admin/bookDetail?b_no=<%=machineVos.get(i).getB_no()%>"><%=machineVos.get(i).getB_name()%></a>
							</td>
							<td><%=machineVos.get(i).getB_author()%></td>
							<td><%=machineVos.get(i).getB_publisher()%></td>
							<td><%=machineVos.get(i).getB_publish_year()%></td>
							<td><%=machineVos.get(i).getB_isbn()%></td>
							<td><%=machineVos.get(i).getB_call_number()%></td>
							<td><%=machineVos.get(i).getB_rantal_able()%></td>
						</tr>
						<%
							}
						%>
					</tbody>
					--%>
					
				</table>
				
			</div>
			
		</div>
		
	</section>
	
	<jsp:include page="../../include/footer.jsp" />
	
</body>
</html>