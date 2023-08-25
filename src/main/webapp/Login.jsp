<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<!-- Website - www.codingnepalweb.com -->
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8" />
    <title>Responsive Login Form HTML CSS | CodingNepal</title>
    <link rel="stylesheet" href="./CSS/style.css" />
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  </head>
  <body>
    <div class="container">
    <%--Il faut ajouter une action et une method � votre Form --%>
      <form action="AuthController" method="post">
        <div class="title">Login</div>
        <div class="input-box underline">
          <input type="text" placeholder="Enter Your Email" required name="email" />
          <div class="underline"></div>
        </div>
        <div class="input-box">
          <input type="password" placeholder="Enter Your Password" name="pwd" required />
          <div class="underline"></div>
        </div>
        <div class="input-box button">
          <input type="submit" name="" value="Continue" />
        </div>
      </form>
      <div class="option">or Connect With Social Media</div>
      <div class="twitter">
        <a href="#"><i class="fab fa-twitter"></i>Sign in With Twitter</a>
      </div>
      <div class="facebook">
        <a href="#"><i class="fab fa-facebook-f"></i>Sign in With Facebook</a>
      </div>
    </div>
  </body>
</html>