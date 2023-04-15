<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Job</title>
<%@include file="all_components/all_css.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
<c:if test="${userobj.role ne 'admin'}">
<c:redirect url="login.jsp"></c:redirect>
</c:if> 
<%@include file="all_components/navbar.jsp"%>
<c:if test="${not empty succMsg }">
	<div class="alert alert-success" role="alert">${succMsg}</div>
	<c:remove var="succMsg"/>
	</c:if>
<div class="container p-2 job-cont">
	<div class="col-md-10 offset-md-1">
		<div class="card">
			<div class="card-body">
				<div class="text-center text-success">
					<i class="fa fa-duotone fa-users fa-2x mb-1"></i>
					<h5>Add Job</h5>
				</div>
				<form action="add_job" method="post">
					<div class="form-group mb-4">
						<label>Enter Title</label>
						<input type="text" name="title" required class="form-control">
					</div>
					<div class="row mb-4">
						<div class="form-group col-md-4">
							<label>Location</label>
							<select name="location" class="custom-select form-control" id="inlineFormCustomSelectPref">
								<option selected>Choose...</option>
								<option value="Odisha">Odisha</option>
								<option value="Jharkhand">Jharkhand</option>
								<option value="Gujrat">Gujrat</option>
								<option value="Bhubaneshwar">Bhubaneshwar</option>
								<option value="Delhi">Delhi</option>
								<option value="Bangalore">Bangalore</option>
								<option value="Chennai">Chennai</option>
								<option value="Haryana">Haryana</option>
								<option value="Hyderabad">Hyderabad</option>
							</select>
						</div>
						<div class="form-group col-md-4">
							<label>Category</label>
							<select class="custom-select form-control" id="inlineFormCustom" name="category">
								<option selected>Choose...</option>
								<option value="IT">IT</option>
								<option value="Developer">Developer</option>
								<option value="Banking">Banking</option>
								<option value="Teacher">Teacher</option>
							</select>
						</div>
						<div class="form-group col-md-4">
							<label>Status</label>
							<select class="form-control" name="status">
								<option class="Active" value="Active">Active</option>
								<option class="Inactive" value="Inactive">Inactive</option>
							</select>
						</div>
					</div>
					
					<div class="form-group mb-4">
						.<label>Enter Description</label>
						<textarea required rows="6" cols="" name="desc" class="form-control"></textarea>
					</div>
					<button class="btn btn-success">Publish Job</button>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>