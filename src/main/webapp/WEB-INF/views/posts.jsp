<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
  <title>My Closet</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" type="text/css" href="../css/main.css">
</head>
<body style="background-color:#A3EEE9">

  <%--                 header                    --%>
    <nav class="navbar navbar-dark bg-dark">
      <div class="container-fluid">
        <a class="navbar-brand" href="list">My Closet</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarText">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="list">Outfit List</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="add">Add SHOE</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
  <%--                 body                   --%>
  <div style="display: flex; justify-content: center; margin: 50px;">
    <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 100px; width: 90%;">
      <c:forEach items="${list}" var="p">
        <div class="card menu-card ${p.getShoeType()}">
          <div style="display: flex; justify-content: space-between; width: 100%">
            <h3> ${p.getShoeType()} </h3>
          </div>
          <img src="${pageContext.request.getContextPath()}/image/${p.getImage()}" class="card-img-top d-block mx-auto menu-image" alt="${p.getName()} picture">
          <div class="card-body">
            <h5 class="card-title">Shoe Name: ${p.getName()}</h5>
                <p class="card-text">Color: ${p.getColor()}</p>
                <p class="card-text">Style: ${p.getStyle()}</p>
            <div style="display: flex; justify-content: space-between; padding-top: 10px">
              <div> </div>
              <div onclick="location.href='view/${p.getId()}'">...see more... >> </div>
            </div>
          </div>
        </div>
      </c:forEach>
    </div>
  </div>


</body>
</html>

