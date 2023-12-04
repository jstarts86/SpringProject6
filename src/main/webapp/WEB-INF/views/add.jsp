<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>My Closet</title>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="../css/main.css">
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
        <a class="navbar-brand" href="list">Shoe Rack</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarText">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="list">Outfit List</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="add">Add Outfit</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<form action="addok" method="post" class="mb-3 border p-3" style="margin-top: 50px;background-color: #FFFBF5" enctype="multipart/form-data">
    <h2 class="mb-4">Add Shoe</h2>
    <div class="mb-3">
        <div class="row">
            <div class="col-md-6">
                <label for="name" class="form-label">Name*</label>
                <input type="text" id="name" name="name" class="form-control" required>
            </div>
            <div class="col-md-6">
                <label for="shoeType" class="form-label">Shoe Type*</label>
                <input type="text" id="shoeType" name="shoeType" class="form-control" required>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <label for="style" class="form-label">Style*</label>
                <input type="text" id="style" name="style" class="form-control" required>
            </div>
            <div class="col-md-6">
                <label for="color" class="form-label">Color*</label>
                <input type="text" id="color" name="color" class="form-control" required>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <label for="photo" class="form-label">Picture*</label>
                <input type="file" id="photo" name="photo" class="form-control" required>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <label for="price" class="form-label">Price*</label>
                <input type="number" id="price" name="price" class="form-control" min="0" required>
            </div>
            <div class="col-md-6">
                <label for="wornDate" class="form-label">Purchased Date*</label>
                <input type="date" id="wornDate" name="wornDate" class="form-control" required>
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
        <input class="btn btn-warning" onclick="location.href='list'" type="button" value="Cancel" style="margin-right: 10px;">
        <input type="submit" value="Submit" class="btn btn-primary" style="margin-right: 10px;">
    </div>
</form>
</body>
</html>