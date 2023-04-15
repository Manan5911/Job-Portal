 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@page isELIgnored="false" %>
<nav class="navbar navbar-expand-lg text-color">
  <div class="container-fluid">
    <a class="navbar-brand link" href="#">Job Portal</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon">
      	<i class="fa-solid fa-bars" style="color:#fff; font-size:28px;"></i>
      </span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item mx-2">
          <a class="link" aria-current="page" href="index.jsp"><i class="fa-solid fa-house"></i> Home</a>
        </li>
        
        <c:if test="${userobj.role eq 'admin'}">
        <li class="nav-item mx-2">
          <a class="link" href="add_job.jsp"><i class="fa-solid fa-circle-plus"></i> Post A Job</a>
        </li>
        <li class="nav-item mx-2">
          <a class="link" href="view_jobs.jsp"><i class="fa-solid fa-hurricane"></i> View Jobs</a>
        </li>
        </c:if>
        
      </ul>
      <form class="d-flex ms-auto" role="search">
      
      	<c:if test="${userobj.role eq 'admin' }">
      	<a href="#" class="btn link mx-2 a-hover"><i class="fa-solid fa-user"></i> Admin</a>
      	<a href="logout" class="btn link a-hover me-2"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
      	</c:if>
      	<c:if test="${userobj.role eq 'user' }">
      	<a href="#" class="btn link mx-2 a-hover" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa-solid fa-user"></i> ${userobj.name}</a>
      	<a href="logout" class="btn link a-hover me-2"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
      	</c:if>
      
      	<c:if test="${empty userobj }">
        <a href="login.jsp" class="btn link mx-2 a-hover"><i class="fa-solid fa-arrow-right-to-bracket"></i> Login</a>
        <a href="register.jsp" class="btn link a-hover me-2"><i class="fa-solid fa-user"></i> Signup</a>
        </c:if>
      </form>
    </div>
  </div>
</nav>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Profile</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       <div class="">
       	<div class="card-body">
       		<div class="text-center text-primary">
       			<i class="fa-solid fa-user fa-3x"></i>
       		</div>
       		<table class="table mt-3">
       			<tbody>
       				<tr>
       					<th scope="row">Name</th>
       					<th>${userobj.name }</th>
       				</tr>
       				<tr>
       					<th scope="row">Qualification</th>
       					<th>${userobj.qualification }</th>
       				</tr>
       				<tr>
       					<th scope="row">Email</th>
       					<th>${userobj.email }</th>
       				</tr>
       			</tbody>
       		</table>
       	</div>
       </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <a href="edit_profile.jsp" class="btn btn-primary">Edit</a>
      </div>
    </div>
  </div>
</div>
