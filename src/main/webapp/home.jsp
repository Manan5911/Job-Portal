<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@page import="com.db.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.dao.JobsDAO"%>
<%@page import="com.entity.Jobs"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Home</title>
<%@include file="all_components/all_css.jsp"%>
</head>
<body style="background-color: #f0f1f2;">

<c:if test="${empty userobj}">
	<c:redirect url="login.jsp"/>
	</c:if>

	<%@include file="all_components/navbar.jsp"%>
	
	<c:if test="${not empty succMsg }">
		<div class="alert alert-success" role="alert">${succMsg}</div>
		<c:remove var="succMsg" />
	</c:if>

	<div class="container text-center text-black top-cont">
		<h2>All Jobs</h2>
	</div>

	<div class="container job-cont">
		<div class="d-flex row justify-content-center">
			<div class="col w-100">
				<div class="job-card p-3 mt-3">
					<div class="p-2 row">
					<div class="col-md-5">
						<h5>Location</h5>
					</div>
					<div class="col-md-5">
						<h5>Category</h5>
					</div>
					</div>
					<form action="more_view.jsp" method="get">
					<div class="p-2 row">
						<div class="col-md-5">
							<select name="location" class="custom-select form-control" id="inlineFormCustomSelectPref">
								<option selected value="lo">Choose...</option>
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
						<div class="col-md-5">
							<select class="custom-select form-control" id="inlineFormCustom" name="category">
								<option value="ca" selected>Choose...</option>
								<option value="IT">IT</option>
								<option value="Developer">Developer</option>
								<option value="Banking">Banking</option>
								<option value="Teacher">Teacher</option>
							</select>
						</div>
						<div class="col-md-2">
						<button type="submit" class="btn btn-secondary">Submit</button>
						</div>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<%
	JobsDAO dao = new JobsDAO(DBConnect.getConn());
	List<Jobs> list = dao.getAllJobsForUser();
	for (Jobs j : list) {
	%>

	<div class="container job-cont">
		<div class="d-flex row justify-content-center">
			<div class="col w-100">
				<div class="job-card p-3 mt-3">
					<div class="p-2">
						<div class="head-cont d-flex justify-content-between">
							<h3 class="heading"><%=j.getTitle()%></h3>
							<div class="badge">
								<span><%=j.getCategory()%></span>
							</div>
						</div>
						<div class="mt-3">
							<label><b>Description:</b></label>
							<%
							if (j.getDescription().length() > 0 && j.getDescription().length() < 120) {
							%>
							<p><%=j.getDescription()%></p>
							<%
							} else { 
							%>
							<p><%=j.getDescription().substring(0,120)%>...
							</p>
							<%
							}
							%>
						</div>
						<div class="row mt-3">
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="Location: <%=j.getLocation()%>" readonly>
							</div>
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="Category: <%=j.getCategory()%>" readonly>
							</div>
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="Status: <%=j.getStatus()%>" readonly>
							</div>
						</div>
						<p class="mt-3">
							<b>Published On: </b><%=j.getPdate().toString()%>
						</p>
						<div>
							<a href="one_view.jsp?id=<%=j.getId()%>"
								class="btn btn-sm bg-secondary text-white">View More</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%
	}
	%>
</body>
</html>