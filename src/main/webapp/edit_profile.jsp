<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Profile</title>
<%@include file="all_components/all_css.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
<c:if test="${empty userobj}">
	<c:redirect url="login.jsp"/>
	</c:if> 
	
<%@include file="all_components/navbar.jsp"%>
<div class="container">
	<div class="row p-4">
		<div class="">
			<div class="card-body">
				<div class="text-center">
				<i class="fa-solid fa-pen-to-square fa-2x"></i>
				<h5>Edit Profile</h5>
				</div>
				<form action="update_profile" method="post">
					<input type="hidden" name="id" value="${userobj.id }">
					<div class="form-group">
						<label>Enter full name</label>
						<input type="text" required="required" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="name" value="${userobj.name }">
					</div>
					<div class="form-group mt-2">
						<label>Enter Qualification</label>
						<input type="text" required="required" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="qua" value="${userobj.qualification }">
					</div>
					<div class="form-group mt-2">
						<label>Enter Email</label>
						<input type="email" required="required" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="email" value="${userobj.email }">
					</div>
					<div class="form-group mt-2">
						<label>Enter Password</label>
						<input type="text" required="required" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="ps" value="${userobj.password }">
					</div>
					<button type="submit" class="btn btn-secondary badge-pill btn-block mt-2">Update</button>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>