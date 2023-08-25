<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="tn.esps.model.User"%>

<!DOCTYPE html>
<!-- Coding by CodingLab | www.codinglabweb.com-->
<html lang="en" dir="ltr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Registration or Sign Up form in HTML CSS | CodingLab</title>
<link rel="stylesheet" href="style.css">
</head>
<jsp:useBean id="user" class="tn.esps.model.User" scope="session" />
<jsp:setProperty property="*" name="user" />
<body>
	<div class="wrapper">
		<h2>Registration</h2>

		<%--Il faut éliminer l'espace dans la condition : test="${sessionScope.url=='Verif'} " --> test="${sessionScope.url=='Verif'}" --%>
		<c:if test="${requestScope.url=='Verif'}">
			<form action="RegisterController" method="post">
		</c:if>
		<c:if test="${empty requestScope.url}">


			<form action="Verif.jsp" method="post">
		</c:if>

		<c:if test="${requestScope.url=='Verif'}">
			<div class="input-box">
				<input type="text" placeholder="Enter your name" name="name"
					required disabled
					value='<jsp:getProperty property="name" name="user"/>'>
			</div>
		</c:if>
		<c:if test="${empty requestScope.url}">
			<div class="input-box">
				<input type="text" placeholder="Enter your name" name="name"
					required>
			</div>
		</c:if>

		<c:if test="${requestScope.url=='Verif'}">
			<div class="input-box">
				<input type="text" placeholder="Enter your email" name="email"
					required disabled
					value='<jsp:getProperty property="email" name="user"/>'>
			</div>
		</c:if>

		<c:if test="${empty requestScope.url}">
			<div class="input-box">
				<input type="text" placeholder="Enter your email" name="email"
					required>
			</div>
		</c:if>

		<c:if test="${requestScope.url=='Verif'}">
			<div class="input-box">
				<input type="password" placeholder="Create password" name="pwd"
					required disabled
					value='<jsp:getProperty property="pwd" name="user"/>'>
			</div>
		</c:if>

		<c:if test="${empty requestScope.url}">
			<div class="input-box">
				<input type="password" placeholder="Create password" name="pwd"
					required>
			</div>
		</c:if>


		<c:if test="${requestScope.url=='Verif'}">
			<div class="input-box">
				<input type="password" placeholder="Confirm password" name="cPwd"
					required hidden>
			</div>
		</c:if>

		<c:if test="${empty requestScope.url}">
			<div class="input-box">
				<input type="password" placeholder="Confirm password" name="cPwd"
					required>
			</div>
		</c:if>

		<div class="policy">
			<input type="checkbox" name="condition">
			<h3>I accept all terms & condition</h3>
		</div>
		<div class="input-box button">
			<input type="Submit" value="Register Now">
		</div>
		<div class="text">
			<h3>
				Already have an account? <a href="Login.jsp">Login now</a>
			</h3>
		</div>

		<c:if test="${requestScope.url=='Verif'}">
			<h3>
				<a href="Register.jsp">Update informations</a>
			</h3>
		</c:if>
		</form>

	</div>

</body>
</html>
