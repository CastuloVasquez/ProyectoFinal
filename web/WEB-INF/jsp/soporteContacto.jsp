<%-- 
    Document   : soporteContacto
    Created on : 16/04/2022, 13:46:03
    Author     : castulo
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="https://jsuites.net/v4/jsuites.css" type="text/css" />
        <title>Soporte y Contacto</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Soporte y Contacto</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDarkDropdown" aria-controls="navbarNavDarkDropdown" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
            </div>
        </nav>




        <div class="container-fluid">
            <div class="pt-4">
                <div class="container d-flex align-items-center justify-content-center"> <!-- PARA ALINEAR OBJETOS -->
                    <div class="col-sm-6">
                        <div class="card border-dark">
                            <div class="card-body">
                                <form id="form">
                                    <label>Tipo de Soporte</label>
                                    <br>
                                    <ul class="list-group list-group-flush" style="text-align: center">
                                        <li class="list-group-item">SM - solicitud medica</li>
                                        <li class="list-group-item">ET - examén externo</li>
                                        <li class="list-group-item">FP - factura</li>
                                        <li class="list-group-item">HO - Hoja de oficio</li>
                                    </ul>
                                    <br>
                                    <select class="form-select" name="tipoSoporte">
                                        <option selected></option>
                                        <c:forEach var="dato" items="${soporte}">
                                            <option value="${dato.TIPOSOPORTE_soporte}">${dato.TIPOSOPORTE_soporte}</option>
                                        </c:forEach>
                                    </select>
                                    <br>
                                    <label>No. de Soporte</label>
                                    <input class="form-control" type="text" name="nosoporte" maxlength="50">
                                    <br>
                                    <label>Teléfono</label>
                                    <input class="form-control" type="text" name="telefono" data-mask="00000000" maxlength="8">
                                    <br>
                                    <label>E-mail</label>
                                    <input class="form-control" type="text" name="correo">
                                    <br>
                                    <button type="button" class="btn btn-primary" id="btnSiguiente">Siguiente</button>
                                </form>
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

        <!--Modal-->
        <div class="modal fade" id="mensajeAceptar" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">Notificacion</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div id="mensajeA"></div>
                    </div>
                    <div class="modal-footer">
                        <a class="btn btn-danger" href="index.htm">Cancelar</a>
                        <button type="button" class="btn btn-primary" id="btnAceptar">Aceptar</button>
                        <button type="button" class="btn btn-warning" data-bs-dismiss="modal">Anterior</button>
                    </div>
                </div>
            </div>
        </div>

        <script type="text/javascript">
            const form = document.querySelector('#form');
            const btnSiguiente = document.querySelector('#btnSiguiente');
            const emailRegex = /^[a-zA-Z0-9\._-]+@[a-zA-Z0-9-]{2,}[.][a-zA-Z]{2,4}$/;
            btnSiguiente.addEventListener('click', () => {
                const modal = new bootstrap.Modal(document.getElementById('mensajeModal'));
                const modalAceptar = new bootstrap.Modal(document.getElementById('mensajeAceptar'));
                const tipo = form.tipoSoporte.value;
                const soporte = form.nosoporte.value;
                const telefono = form.telefono.value;
                const email = form.correo.value;

                if (tipo === "") {
                    mensaje.innerHTML = "Seleccione un tipo de soporte";
                    modal.show();
                } else if (soporte === "") {
                    mensaje.innerHTML = "ingrese el número de soporte";
                    modal.show();
                } else if (telefono === "") {
                    mensaje.innerHTML = "ingrese un número de teléfono";
                    modal.show();
                } else if (verificacionEmail(email)) {
                    mensaje.innerHTML="ingrese un correo electronico valido";
                    modal.show();
                } else if (tipo !== "" && soporte !== "" && telefono !== "" && email) {
                    btnAceptar();
                }

                function btnAceptar() {
                    const modalAceptar = new bootstrap.Modal(document.getElementById('mensajeAceptar'));
                    const btnAceptar = document.querySelector('#btnAceptar');
                    const mensajeA = document.querySelector('#mensajeA');
                    mensajeA.innerHTML = "¿Desea crear la solicitud?";
                    modalAceptar.show();
                    btnAceptar.addEventListener('click', () => {
                        form.submit();
                    });
                }
                
                function verificacionEmail(e){
                    const emailRegex = /^[a-zA-Z0-9\._-]+@[a-zA-Z0-9-]{2,}[.][a-zA-Z]{2,4}$/;
                    const regexEmail = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
                    if(!regexEmail.test(e) || e===""){
                        return true;
                    }else{
                        return false;
                    }
                }
            });
        </script>

        <script src="https://jsuites.net/v4/jsuites.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    </body>
</html>
