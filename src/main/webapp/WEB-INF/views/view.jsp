<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Sneaker Heads</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" type="text/css" href="../../css/main.css">
  <style>
    .table td {
      background-color: inherit;
      color: inherit;
      font-size: 16px;
      font-weight: bold;
    }
  </style>
</head>
<body style="background-color:#A3EEE9">
<%-- header --%>
<nav class="navbar navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="../list">Sneaker Heads</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarText">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="../list">Outfit List</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="../add">Add Outfit</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<%-- body --%>
<div class="container mt-5">
  <div class="row justify-content-center">
    <div class="col-md-6">
      <table class="table table-bordered" style="border-radius:30px">
        <tbody class="${p.getColor()}">
        <tr>
          <td style="width: 30%; font-size: 23px; font-weight: bold;">
            <div style="display:flex;justify-content: space-around">
              <span>${p.getName()}</span>
            </div>
            <img src="${pageContext.request.getContextPath()}/image/${p.getImage()}" class="card-img-top d-block mx-auto menu-image" alt="Picture of ${p.getName()}">
          </td>
          <td style="font-size: 19px; font-weight: bold; padding: 20px;">
            <div style="margin-bottom: 15px">
              Type: ${p.getShoeType()}
            </div>
            <div style="margin-bottom: 15px">
              Style: ${p.getStyle()}
            </div>
            <div style="margin-bottom: 15px">
              Color: ${p.getColor()}
            </div>
            <div style="margin-bottom: 15px">
              Worn Date: ${p.getWornDate()}
            </div>
            <div style="margin-bottom: 15px">
              Price: ${p.getPrice()}
            </div>
            <div style="margin-bottom: 15px">
              Short Description: ${p.getDescription()}
            </div>
          </td>
        </tr>

        </tbody>
      </table>
      <div style="text-align: right;">
        <button class="btn btn-outline-warning" onclick="location.href='../edit/${p.getId()}'" type="button">
          Modify
        </button>
        <button class="btn btn-outline-danger" onclick="location.href='../delete/${p.getId()}'" type="button">
          Delete
        </button>
    </div>

    </div>
  </div>
</div>

</body>
</html>