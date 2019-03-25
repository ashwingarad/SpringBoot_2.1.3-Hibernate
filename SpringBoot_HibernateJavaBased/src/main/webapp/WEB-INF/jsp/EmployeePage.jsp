<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee Registration Page</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.0/css/bootstrap.min.css">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.0/js/bootstrap.min.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<style type="text/css" class="init"></style>

<script type="text/javascript" language="javascript"
	src="https://code.jquery.com/jquery-2.2.4.js"></script>

<script type="text/javascript" language="javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery.dataTables.js">
	
</script>

<script type="text/javascript" language="javascript"
	src="${pageContext.request.contextPath}/resources/js/shCore.js"></script>


<script type="text/javascript" language="javascript"
	src="${pageContext.request.contextPath}/resources/js/demo.js"></script>


<script type="text/javascript" language="javascript" class="init"></script>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/jquery.dataTables.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/shCore.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/demo.css">
<link rel="shortcut icon" type="image/ico"
	href="http://www.datatables.net/favicon.ico">

</head>
<body class="dt-example">
	<form:form class="form-horizontal" method="post" id="employee"
		name="employee" action="empRegister.html" modelAttribute="employee">

		<fieldset>

			<!-- Form Name -->
			<legend>Employee Registration</legend>

			<c:if test="${not empty success}">
				<div class="alert alert-success alert-dismissible fade show"
					role="alert">
					<strong>Message</strong> ${success}
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
			</c:if>
			<c:if test="${not empty error}">
				<div class="alert alert-danger alert-dismissible fade show"
					role="alert">
					<strong>Message</strong> ${error}
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
			</c:if>

			<form:input path="id" type="hidden" name="id" />

			<!-- Text input-->
			<div class="form-group">
				<form:label path="" class="col-md-4 control-label" for="name">Name</form:label>
				<div class="col-md-5">
					<form:input path="ename" id="ename" name="ename"
						placeholder="Enter Name" class="form-control input-md" required=""
						type="text" />

				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<form:label path="" class="col-md-4 control-label" for="addr">Address</form:label>
				<div class="col-md-5">
					<form:input path="salary" id="salary" name="salary"
						placeholder="Salary" class="form-control input-md" required=""
						type="text" />

				</div>
			</div>

			<div class="form-group">
				<c:choose>
					<c:when test="${employee.id==null}">
						<!-- Button -->
						<form:label path="" class="col-md-4 control-label" for="btnSave"></form:label>
						<div class="col-md-4">
							<input type="submit" id="btnSave" value="Save"
								class="btn btn-success" />
						</div>
					</c:when>
					<c:otherwise>
						<!-- Button -->
						<form:label path="" class="col-md-4 control-label" for="btnSave"></form:label>
						<div class="col-md-4">
							<input type="submit" id="btnSave" value="Update"
								class="btn btn-primary" />
						</div>
					</c:otherwise>
				</c:choose>
			</div>

		</fieldset>
	</form:form>

	<div class="container">
		<section>
		<h1>Employee Records</h1>
		<table id="example" class="display" cellspacing="0" width="100%">
			<thead>
				<tr>
					<th>ID</th>
					<th>Name</th>
					<th>Salary</th>
					<th>Action</th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<th>ID</th>
					<th>Name</th>
					<th>Salary</th>
					<th>Action</th>
				</tr>
			</tfoot>
			<tbody>
				<c:forEach items="${employeeList}" var="emp">
					<tr>
						<td data-search=<c:out value="${emp.id}"/>>${emp.id}</td>
						<td data-search=<c:out value="${emp.ename}"/>>${emp.ename}</td>
						<td data-search=<c:out value="${emp.salary}"/>>${emp.salary}</td>
						<td><a href="index.html?id=${emp.id}">Edit</a>&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="empDelete.html?id=${emp.id}">Delete</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</section>
	</div>

</body>
</html>