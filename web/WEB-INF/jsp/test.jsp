<%-- 
    Document   : test
    Created on : 17/04/2022, 15:36:45
    Author     : castulo
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <title>Test</title>
    </head>
    <body>
        <div class="container-fluid" id="formulario">
            <div class="pt-4">
                <div class="container d-flex align-items-center justify-content-center"> <!-- PARA ALINEAR OBJETOS -->
                    <div class="col-sm-6">
                        <div class="card border-light">
                            <div class="card-body">
                                <form id="formSolicitud">
                                    <h5>Mantenimiento de Solicitud</h5>
                                    <br>
                                    <label for="codigoSolicitud">Código de Solicitud</label>
                                    <input type="text"class="form-control" name="codigoSolicitud" placeholder="AA-00000000-00000" data-mask="aa-00000000-00000" id="codigoSolicitud">
                                    <br>
                                    <label for="noexpediente">Número de expediente</label>
                                    <input type="text" class="form-control" name="noexpediente" id="noexpediente" placeholder="0000-00-00-00-0000000" data-mask="0000-00-00-00-0000000">
                                    <br>
                                    <label for="nosoporte">Número de soporte</label>
                                    <input type="text" class="form-control" name="nosoporte" id="nosoporte" maxlength="50">
                                    <br>
                                    <label for="usuarioAsignacion">Usuario asignación</label>
                                    <input type="text" class="form-control" name="usuarioAsignacion" id="usuarioAsignacion" data-mask="aaaaaaaaaaaa">
                                    <br>
                                    <label>Rango de fechas</label>
                                    <div class="input-group mb-3">
                                        <input type="text" class="form-control"  id="fechaAntes" placeholder="fecha inicial yyyy-mm-dd" data-mask="yyyy-mm-dd" aria-label="fechaInicial" name="fechaAntes">
                                        <span class="input-group-text">hasta</span>
                                        <input type="text" class="form-control" id="fechaFinal" placeholder="fecha final yyyy-mm-dd" data-mask="yyyy-mm-dd" aria-label="fechaFinal" name="fechaFinal">
                                    </div>
                                    <br>
                                    <label for="nit">NIT</label>
                                    <input type="text" class="form-control" name="nit" id="nit" maxlength="11">
                                    <br>
                                    <label >Tipo de solicitud</label>
                                    <select class="form-select" name="tipoSolicitud">
                                        <option selected></option>
                                        <c:forEach var="d" items="${listaSolicitud}">
                                            <option value="${d.TIPOSOLI_solicitud}">${d.TIPOSOLI_solicitud}</option>
                                        </c:forEach>
                                    </select>
                                    <br>
                                    <br>
                                    <label for="estadoSolicitud">Estado de la solicitud</label>
                                    <select class="form-select" name="estadoSolicitud">
                                        <option selected></option>
                                        <c:forEach var="d1" items="${listaEstados}">
                                            <option value="${d1.VALIESTADO_estado}">${d1.VALIESTADO_estado}</option>
                                        </c:forEach>
                                    </select>
                                    <br>
                                    <button class="btn btn-primary" id="btnBuscar">Buscar</button>
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
        <script type="text/javascript">
            const form = document.querySelector("#formSolicitud");
            const btnBuscar = document.querySelector("#btnBuscar");
            const inputSolicitud = document.querySelector('#codigoSolicitud');

            inputSolicitud.addEventListener('keypress', () => {
                inputDisable();
            });


            btnBuscar.addEventListener('click', (e) => {
                e.preventDefault();
                const codigoSolicitud = form.codigoSolicitud.value;
                const noexpediente = form.noexpediente.value;
                const nosoporte = form.nosoporte.value;
                const usuarioAsignacion = form.usuarioAsignacion.value;
                const fechaAntes = form.fechaAntes.value;
                const fechaFinal = form.fechaFinal.value;
                const nit = form.nit.value;
                const tipoSolicitud = form.tipoSolicitud.value;
                const estadoSolicitud = form.estadoSolicitud.value;
                const mensajeM = new bootstrap.Modal(document.getElementById("mensajeModal"));
                const mensaje = document.querySelector('#mensaje');

                let fechaActual = new Date();
                let inicialA = new Date(fechaAntes);
                let finalA = new Date(fechaFinal);
                let restaFecha=finalA.getFullYear()-inicialA.getFullYear();


                if (evaluacionExp(noexpediente)) {
                    mensaje.innerHTML = "Debe ingresar No. expediente valido";
                    mensajeM.show();
                }
                if (evaluacionSoporte(nosoporte)) {
                    mensaje.innerHTML = "Debe ingresar No. soporte valido";
                    mensajeM.show();
                }
                if (evaluacionUsuario(usuarioAsignacion)) {
                    mensaje.innerHTML = "Debe ingresar nombre de usuario valido";
                    mensajeM.show();
                }

                if (evaluacionFecha(fechaAntes, fechaFinal)) {
                    mensaje.innerHTML = "Debe ingresar una fecha valida";
                    mensajeM.show();
                } else if (inicialA.getFullYear()>finalA.getFullYear()) {
                    mensaje.innerHTML = "La fecha inicial no debe ser mayor a la fecha final";
                    mensajeM.show();
                } else if (finalA.getFullYear()>fechaActual.getFullYear()) {
                    mensaje.innerHTML = "La fecha final no debe ser mayor a la fecha actual";
                    mensajeM.show();
                } else if(restaFecha>1){
                    mensaje.innerHTML="La diferencia entre la fecha inicial y la final no debe ser mayor a un año";
                    mensajeM.show();
                }

                if (evaluacionNIT(nit)) {
                    mensaje.innerHTML = "Debe ingresar número NIT valido";
                    mensajeM.show();
                }
                if (tipoSolicitud === "") {
                    mensaje.innerHTML = "Debe seleccionar un tipo de solicitud";
                    mensajeM.show();
                }

                if (estadoSolicitud === "") {
                    mensaje.innerHTML = "Debe seleccionar un tipo de estado";
                    mensajeM.show();
                }


            });

            function inputDisable() {
                //const inputAll=document.querySelectorAll('input[type="text"]');
                document.querySelector('#noexpediente').disabled = true;
                document.querySelector('#nosoporte').disabled = true;
                document.querySelector('#usuarioAsignacion').disabled = true;
                document.querySelector('#fechaAntes').disabled = true;
                document.querySelector('#fechaFinal').disabled = true;
                document.querySelector('#nit').disabled = true;
                const selectAll = document.querySelectorAll('.form-select');

                for (let i = 0; i < selectAll.length; i++) {
                    selectAll[i].disabled = true;
                }
            }

            function evaluacionSoli(solicitud) {
                if (solicitud.length < 17 || solicitud === "") {
                    return true;
                } else {
                    return false;
                }
            }

            function evaluacionExp(exp) {
                if (exp.length < 21 || exp === "") {
                    return true;
                } else {
                    return false;
                }
            }

            function evaluacionUsuario(usuario) {
                if (usuario.length < 8 || usuario.length < 12 || usuario === "") {
                    return true;
                } else {
                    return false;
                }
            }

            function evaluacionSoporte(sop) {
                if (sop.length < 3 || sop === "") {
                    return true;
                } else {
                    return false;
                }
            }

            function evaluacionNIT(nit) {
                if (nit.length < 2 || nit.length < 11 || nit === "") {
                    return true;
                } else {
                    return false;
                }
            }

            function evaluacionFecha(Fi, Ff) {
                if (Fi.length < 10 || Ff.length < 10 || Fi === "" || Ff === "") {
                    return true;
                } else {
                    return false;
                }
            }

        </script>
        <script src="https://jsuites.net/v4/jsuites.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

    </body>
</html>
