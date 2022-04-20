<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <title>Inicio</title>
    </head>

    <body>
        <div>
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#">Inicio</a><!--para el responsive-->
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navarMenu" aria-controls="navarMenu" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse" id="navarMenu">
                        <ul class="navbar-nav">
                            <li class="nav-item dropdown">
                            <li class="dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown" data-bs-auto-close="outside">
                                    Analisis tecnico de muestras medicas
                                </a>
                                <ul class="dropdown-menu">
                                    <li class="dropend">
                                        <a href="#" class="dropdown-item dropdown-toggle" data-bs-toggle="dropdown" data-bs-auto-close="outside">Clasificación</a>
                                        <ul class="dropdown-menu dropdown-submenu shadow">
                                            <li><a class="dropdown-item" href="#">Primer menu</a></li>
                                            <li class="dropend"><!--PARA CREAR OTRO MENU-->
                                                <a href="#" class="dropdown-item dropdown-toggle" data-bs-toggle="dropdown" data-bs-auto-close="outside">Mantenimiento</a>
                                                <ul class="dropdown-menu dropdown-submenu shadow">
                                                    <li><a class="dropdown-item" href="#" onclick='mantenimientoMuestras();' data-toggle="collapse">Mantenimiento de Muestras</a></li>
                                                    <li><a class="dropdown-item" href="mantenimientoSolicitud.htm" onclick='mantenimientoSolicitud();' data-toggle="collapse">Mantenimiento de Solicitudes</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </li>

                                </ul>
                            </li>
                        </ul>
                    </div>

                </div>
            </nav>
            <!-- MANTENIMIENTO MUESTRA -->
            <div id="cardMuestra" style="display: none">
                <div class="m-0 vh-100 row justify-content-center align-items-center" >
                    <div class="col-auto p-5 text-center">
                        <div class="card border-secondary mb-3" style="width: 18rem;">
                            <div class="card-body">
                                <h5 class="card-title">Mantenimiento</h5>
                                <a href="menuSolicitud.htm" class="btn btn-primary">Crear Soliciturd</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
       

        <!--Modal-->
        <div class="modal fade" id="mensajeModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">Notificacion</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div id="mensaje"></div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Aceptar</button>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            function mantenimientoMuestras() {
                document.getElementById('cardMuestra').style.display = 'block';
            }
        </script>
        <script src="https://jsuites.net/v4/jsuites.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    </body>
</html>
