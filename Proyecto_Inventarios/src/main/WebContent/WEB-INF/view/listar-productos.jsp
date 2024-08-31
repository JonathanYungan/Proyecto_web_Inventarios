<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title> Lista De Productos</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-table.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Georgia', serif;
        }
        h1 {
            margin-bottom: 20px;
            text-align: center;
            color: #343a40;
            animation: bounceIn 1s ease;
        }

        @keyframes bounceIn {
            0% {
                opacity: 0;
                transform: scale(0.5);
            }
            50% {
                opacity: 1;
                transform: scale(1.1);
            }
            100% {
                transform: scale(1);
            }
        }

        .search-container {
            display: flex;
            justify-content: flex-end;
            margin-bottom: 10px;
        }
        .search-container input {
            width: 300px;
            margin-right: 10px;
            transition: all 0.3s ease;
        }
        .search-container input:focus {
            box-shadow: 0px 0px 10px #007bff;
        }
        .table-container {
            background: #fff;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
            position: relative;
        }
        .table-scroll {
            overflow-y: auto;
            max-height: 400px;
            border-radius: 8px;
            border: 1px solid #dee2e6;
        }
        .table thead th {
            background-color: #f8f9fa;
            color: #343a40;
            position: sticky;
            top: 0;
            z-index: 2;
        }
        .table tbody tr:hover {
            background-color: #c7eb7a; /* Sombreado verde claro */
        }
        .btn-primary, .btn-success, .btn-danger {
            transition: background-color 0.3s ease, transform 0.3s ease;
        }
        .btn-primary:hover, .btn-success:hover, .btn-danger:hover {
            transform: scale(1.05);
        }
        .btn-primary {
            background-color: #007bff;
        }
        .btn-success {
            background-color: #28a745;
        }
        .btn-danger {
            background-color: #dc3545;
        }
    </style>
</head>
<body>

<section class="px-5 py-5">
    <div class="container">
        <h1>Detalles Productos</h1>
        <div class="search-container">
            <input type="text" id="searchInput" class="form-control" placeholder="Buscar en la tabla...">
            <button class="btn btn-primary" onclick="window.location.href='/ProyectoWeb/productos/findOne?opcion=1'; return false;">
                <i class="fa-solid fa-plus"></i> Agregar
            </button>
        </div>
     
        <div class="table-container">
            <div class="table-scroll">
                <table id="tablaProductos" class="table table-striped table-sm">
                    <thead>
                        <tr>
                            <th>Id Producto</th>
                            <th>Nombre</th>
                            <th>Descripción</th>
                            <th>Precio</th>
                            <th>Stock</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${productos}">
                            <tr>
                                <td>${item.idProducto}</td>
                                <td>${item.nombre}</td>
                                <td>${item.descripcion}</td>
                                <td>${item.precio}</td>
                                <td>${item.stock}</td>
                                <td>
                                    <button class="btn btn-success" onclick="window.location.href='/ProyectoWeb/productos/findOne?idProducto=${item.idProducto}&opcion=1'; return false;">
                                        <i class="fa-solid fa-pen-to-square"></i> Actualizar
                                    </button>
                                    <button class="btn btn-danger" onclick="window.location.href='/ProyectoWeb/productos/findOne?idProducto=${item.idProducto}&opcion=2'; return false;">
                                        <i class="fa-solid fa-trash"></i> Eliminar
                                    </button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</section>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap-table.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap-table-es-MX.min.js"></script>
<script type="text/javascript">
    $(function() {
        $('#tablaProductos').bootstrapTable({ sortReset: true });
    });

    $('#searchInput').on('keyup', function() {
        var value = $(this).val().toLowerCase();
        $('#tablaProductos tbody tr').filter(function() {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
        });
    });
</script>

</body>
</html>
