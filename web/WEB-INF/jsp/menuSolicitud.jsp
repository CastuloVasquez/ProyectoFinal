<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="https://jsuites.net/v4/jsuites.css" type="text/css" />
        <title>Menu de Solicitud</title>
    </head>
    <body>
        <div class="p-5 text-center">
            <h4>Solicitudes</h4>
        </div>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col col-md-auto text-center">
                    <div class="card border-info mb-3" style="width: 25rem">
                        <div class="card-body">
                            <form method="POST" id="form">
                                <br>
                                <h6>Tipo Solicitante</h6>
                                <br>
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item">IN-Interno</li>
                                    <li class="list-group-item">EX-Externo</li>
                                </ul>
                                <br>
                                <select class="form-select" name="tipoSolicitante">
                                    <option selected></option>
                                    <c:forEach var="dato" items="${lista}">
                                        <option value="${dato.USU_tipoUsuario}">${dato.USU_tipoUsuario}</option>
                                    </c:forEach>
                                </select>
                                <br>
                                <h6>Tipo Solicitud</h6>
                                <br>
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item">MM-Muestra Medica</li>
                                    <li class="list-group-item">LQ-Laboratorio</li>
                                </ul>
                                <br>
                                <select class="form-select" name="tipoSolicitud">
                                    <option selected></option>
                                    <c:forEach var="dato" items="${listaSoli}">
                                        <option value="${dato.TIPOSOLI_solicitud}">${dato.TIPOSOLI_solicitud}</option>
                                    </c:forEach>
                                </select>
                                <br>
                                <h6>Descripción</h6>
                                <textarea class="form-control" name="descripcion" rows="4" maxlength="2000" minlength="10"></textarea>
                                <br>
                                <h6>No. Solicitud</h6>
                                <input class="form-control" name="noSolicitud" type="tel" placeholder="año-mes-dia-correlativo" data-mask='0000-00-00-0000000000'>
                            </form>
                        </div>
                        <div class="card-footer bg-transparent border-success">
                            
                            <a class="btn btn-danger" href="index.htm">Cancelar</a>
                            <button type="button" class="btn btn-primary" id="btnSiguiente">Siguiente</button>
                            <button class="btn btn-info" id="btnBuscar">Buscar</button>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-auto">
                    <div class="card border-success mb-3" style="width: 25rem">
                        <div class="card-header">
                            <h5>Resultado de Búsqueda</h5>
                        </div>
                        <div class="card-body">
                            <h4>NIT: XXXX-XXXX-XXXX</h4>
                            <h4>NOMBRE: XXXXXXXXX</h4>
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
            const form = document.querySelector("#form");
            const btnSiguiente = document.querySelector("#btnSiguiente");
            const pattern = /^[0-9]{4}-[0-9]{2}-[0-9]{2}-[0-9]{10}$/;

            btnSiguiente.addEventListener('click', () => {
                const tipoSolicitante = form.tipoSolicitante.value;
                const tipoSolicitud = form.tipoSolicitud.value;
                const descripcion = form.descripcion.value;
                const noSolicitud = form.noSolicitud.value;
                const modal = new bootstrap.Modal(document.getElementById('mensajeModal'));
                const mensaje = document.querySelector("#mensaje");
                if (tipoSolicitante === "") {
                    mensaje.innerHTML = "Seleccionar un tipo de solicitante interno o externo";
                    modal.show();
                } else if (tipoSolicitud === "") {
                    mensaje.innerHTML = "Seleccionar un tipo solicitud";
                    modal.show();
                } else if (descripcion === "") {
                    mensaje.innerHTML = "Ingresar una descripcion";
                    modal.show();
                } else if (!pattern.test(noSolicitud)) {
                    mensaje.innerHTML = "Respete el formato 'año - mes - dia - correlativo'";
                    modal.show();
                } else if (tipoSolicitante !== "" && tipoSolicitud !== "" && descripcion !== "" && noSolicitud !== "") {
                    form.submit();
                    window.window.location.href = "soporteContacto.htm";
                } 
            });
        </script>
        <script src="https://jsuites.net/v4/jsuites.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    </body>
</html>
