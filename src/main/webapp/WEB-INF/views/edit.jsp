<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>My Closet</title>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="../../css/main.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        form {max-width: 800px; margin: auto;}
        label {margin-top: 10px; font-size: 18px; font-weight: bold;}
        input {margin-bottom: 15px; font-size: 16px;}
        .form-check-label {
            margin-right: 70px;
            font-size: 16px;
            font-weight: bold;
        }
        h2 {font-size: 24px; font-weight: bold; margin-bottom: 20px;}
        .btn-primary {font-size: 16px; font-weight: bold;}
    </style>
</head>

<body style="background-color:#A3EEE9">
<nav class="navbar navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="../list">Shoe Rack</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarText">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="../list">Outfit List</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="../add">Add Outfit</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<form action="../editok/${p.getId()}" method="post" class="mb-3 border p-3" style="margin-top: 50px;background-color: #FFFBF5" enctype="multipart/form-data">
    <input type="hidden" value="${p.getId()}" id="id" name="id">
    <h2 class="mb-4">Modify Shoe Info</h2>
    <div class="mb-3">
        <div class="row">
            <div class="col-md-6">
                <label for="name" class="form-label">Name*</label>
                <input type="text" id="name" name="name" class="form-control" value="${p.getName()}" required>
            </div>
            <div class="col-md-6">
                <label for="type" class="form-label">Type*</label>
                <input type="text" id="type" value="${p.getShoeType()}" name="type" class="form-control" required>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <label for="style" class="form-label">Style*</label>
                <input type="text" id="style" value="${p.getStyle()}" name="style" class="form-control" required>
            </div>
            <div class="col-md-6">
                <label for="color" class="form-label">Color*</label>
                <input type="text" id="color" name="color" value="${p.getColor()}" class="form-control" required>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <label for="photo" class="form-label">Picture*</label>
                <input type="file" id="photo" name="photo" class="form-control">
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <label for="price" class="form-label">Price*</label>
                <input type="number" id="price" value="${p.getPrice()}" name="price" class="form-control" min="0" required>
            </div>
            <div class="col-md-6">
                <label for="purchasedDate" class="form-label">Worn Date*</label>
                <input type="date" id="purchasedDate" value="${p.getWornDate()}" name="purchasedDate" class="form-control" required>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <label for="description" class="form-label">Short description*</label>
                <input type="text" id="description" name="description" class="form-control" required>
            </div>
        </div>

    </div>
    <div style="display: flex; justify-content: end">
        <input class="btn btn-warning" onclick="location.href='../view/${p.getId()}'" type="button" value="취소" style="margin-right: 10px;">
    <input type="submit" value="제출" class="btn btn-primary" style="margin-right: 10px;">

    </div>
</form>
</body>
</html>