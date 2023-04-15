<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@page import="com.db.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.dao.JobsDAO"%>
<%@page import="com.entity.Jobs"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_components/all_css.jsp"%>
</head>
<body style="background-color: #f0f1f2;">

<%@include file="all_components/navbar.jsp"%>

<c:if test="${empty userobj}">
	<c:redirect url="login.jsp"/>
	</c:if> 
	
	<div class="container text-center text-black top-cont">
		<h2>All Jobs</h2>
	</div>
	
	<%
	String loc = request.getParameter("location");
	String cat = request.getParameter("category");
	String msg = "";
	
	JobsDAO dao = new JobsDAO(DBConnect.getConn());
	
	List<Jobs> list = null;
	
	if("lo".equals(loc) && "ca".equals(cat)){
		list = new ArrayList<Jobs>();
		msg = "Jobs Not Available";
	}
	else if ("lo".equals(loc) || "ca".equals(cat)){
		list = dao.getJobsOrLocationOrCategory(cat,loc);
	}
	else {
		list = dao.getJobsAndLocationAndCategory(cat,loc);
	}
	
	if(list.isEmpty()){
	%>
	<div class="container text-center text-black top-cont">
		<h2>Job Not Available</h2>
	</div>
	<% 
	}
	if(list != null){
		for(Jobs j : list){
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
	} else {
	%>
	<div class="container text-center text-black top-cont">
		<h2><%=msg%></h2>
	</div>
	<%
	}
	%>
</body>
</html>