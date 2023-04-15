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
<title>View Jobs</title>
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

	<div class="container text-center text-black top-cont">
		<h2>All Jobs</h2>
	</div>
	<%
	JobsDAO dao = new JobsDAO(DBConnect.getConn());
	List<Jobs> list = dao.getAllJobs();
	for (Jobs j : list) {
	%>
	<div class="container job-cont">
		<div class="d-flex row justify-content-center">
			<div class="col w-100">
				<div class="job-card p-3 mt-3">
					<div class="p-2">
						<div class="head-cont d-flex justify-content-between">
							<h3 class="heading"><%=j.getTitle() %></h3>
							<div class="badge">
								<span><%=j.getCategory() %></span>
							</div>
						</div>
						<div class="mt-3">
							<label><b>Description:</b></label>
							<p><%=j.getDescription() %></p>
						</div>
						<div class="row mt-3">
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="Location: <%=j.getLocation() %>" readonly>
							</div>
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="Category: <%=j.getCategory() %>" readonly>
							</div>
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="Status: <%=j.getStatus() %>" readonly>
							</div>
						</div>
						<p class="mt-3">
							<b>Published On: </b><%=j.getPdate() %>
						</p>
						<div>
							<a href="edit_job.jsp?id=<%=j.getId() %>" class="btn btn-sm bg-secondary text-white">Edit</a> <a
								href="delete?id=<%=j.getId() %>" class="btn btn-sm bg-secondary text-white">Delete</a>
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