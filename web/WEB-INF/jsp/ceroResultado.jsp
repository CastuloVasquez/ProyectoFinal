<%-- 
    Document   : ceroResultado
    Created on : 21/04/2022, 21:06:24
    Author     : castulo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <title>No Resultado</title>
    </head>
    <body>
        <div class="m-0 vh-100 row justify-content-center align-items-center">
            <div class="container d-flex align-items-center justify-content-center">
                <div class="card border-dark">
                    <div class="card-header" style="text-align: center">
                        <h5>Sin Resutados</h5>
                    </div>
                    <div class="card-body">
                        <div class="alert alert-light alert-dismissible fade show shadow">
                            <i class="bi bi-exclamation-lg"></i> No se han encontrado resultados de la búsqueda
                        </div>
                        <a href="mantenimientoSolicitud.htm" class="btn btn-primary">Aceptar</a>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
