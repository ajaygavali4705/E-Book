<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.DB.DBConnect"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="all_component/allcss.jsp"%>
<style type="text/css">
.back-img {
	background: url("img/bgimg.jpg");
	height: 50vh;
	width: 100% background-repeat: no-repeat;
	background-size: cover;
}

.crd-ho:hover {
	background-color: #fcf7f7;
}
</style>
<title>Insert title here</title>
</head>
<body style="background-color: #f7f7f7;">
<%
User u=(User)session.getAttribute("userobj");

%>

	<%@include file="all_component/navbar.jsp"%>
	<div class="countainer-fluid back-img">
		<h2 class="text-center text-danger pt-5">E-Book Management System</h2>
	</div>





	<!-- Start recent book -->
	<div class="container">
		<h3 class="text-center">Recent Book</h3>
		<div class="row">
			<%
			BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list2 = dao2.getRecentBook();
			for (BookDtls b : list2) {
			%>

			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getBookname()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							<%
							if (b.getBookCategory().equals("Old")) {
							%>
						Categories:<%=b.getBookCategory()%></p>
						<div class="row">
							
							<a href="view_books.jsp?bid=<%=b.getBookid() %>" class="btn btn-success btn-sm ml-5">view Details</a> 
							<a href="" class="btn btn-danger btn-sm ml-1"><i class="fas fa-rupee-sign"></i> <%=b.getPrice()%></a>
						</div>
						<%
						} else {
						%>
						<p> Categories:<%=b.getBookCategory()%></p>
						<div class="row">
						
						<%if(u==null)
						{%>
						
						<a href="login.jsp" class="btn btn-danger btn-sm ml-1"><i
								class="fas fa-cart-plus"></i>Add Cart</a>
						
						<%}else{%>
						  <a href="cart?bid=<%=b.getBookid()%>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm ml-1"><i
								class="fas fa-cart-plus"></i>Add Cart</a>
						<%} %>
						
							 <a href="view_books.jsp?bid=<%=b.getBookid() %>"
								class="btn btn-success btn-sm ml-1">view Details</a>
								
							 <a href="" class="btn btn-danger btn-sm ">
							 <i class="fas fa-rupee-sign"></i><%=b.getPrice()%></a>
						</div>

						<%
						}
						%>

					</div>
				</div>
			</div>

			<%
			}
			%>


		</div>
		<div class="text-center mt-1">
			<a href="all_recent_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
		</div>
	</div>

	<!-- End recent book -->

	<hr>

	<!-- Start New book -->
	<div class="container">
		<h3 class="text-center">New Book</h3>
		<div class="row">



			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list = dao.getNewBook();
			for (BookDtls b : list) {
			%>
			<div class="col-md-3 mt-2">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getBookname()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Categories:<%=b.getBookCategory()%></p>
						<div class="row">
						
						<%if(u==null)
						{%>
						
						<a href="login.jsp" class="btn btn-danger btn-sm ml-1"><i
								class="fas fa-cart-plus"></i>Add Cart</a>
						
						<%}else{%>
						  <a href="cart?bid=<%=b.getBookid()%>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm ml-1"><i
								class="fas fa-cart-plus"></i>Add Cart</a>
						<%} %>
							<a href="view_books.jsp?bid=<%=b.getBookid() %>" class="btn btn-success btn-sm ml-1">view Details</a>
							<a href="" class="btn btn-danger btn-sm ">
								<i class="fas fa-rupee-sign"></i><%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>



		</div>
		<div class="text-center mt-1">
			<a href="all_new_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
		</div>
	</div>

	<!-- End New book -->

	<hr>

	<!-- Start Old book -->
	<div class="container">
		<h3 class="text-center">Old Book</h3>
		<div class="row">
		
		<%
			BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list3 = dao3.getOldBook();
			for (BookDtls b : list3) {
			%>

			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getBookname()%></p>
						<p><%=b.getAuthor()%></p>
						<p><%=b.getBookCategory() %></p>
							
                        <div class="row">
							 <a href="view_books.jsp?bid=<%=b.getBookid() %>" class="btn btn-success btn-sm ml-5"> view Details</a> <a
								href="" class="btn btn-danger btn-sm ml-1">
								<i class="fas fa-rupee-sign"></i> <%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>

			<%
			}
			%>

			

		</div>
		<div class="text-center mt-1">
			<a href="all_old_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
		</div>
	</div>

	<!-- End Old book -->

	<%@include file="all_component/footer.jsp"%>
</body>
</html>