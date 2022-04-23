<%-- 
    Document   : resultadoMantSolicitud
    Created on : 21/04/2022, 21:58:45
    Author     : castulo
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <title>Resultado Busqueda</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Resultado de la Búsqueda</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDarkDropdown" aria-controls="navbarNavDarkDropdown" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <a href="url">Información General</a>
            </div>
        </nav>
        <br>
        <div class="container d-flex align-items-center justify-content-center">
            <h4>Revision de información</h4>
        </div>
        <br>
        <div class="container d-flex align-items-center justify-content-center">
            <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                <input type="radio" class="btn-check" onclick="exportTableToExcel('tabla')" name="btnradio" id="btnradio1" autocomplete="off" checked>
                <label class="btn btn-outline-primary" for="btnradio1">Excel</label>

                <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off">
                <label class="btn btn-outline-primary" for="btnradio2">Radio 2</label>

                <input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off">
                <label class="btn btn-outline-primary" for="btnradio3">Radio 3</label>
            </div>
        </div>

        <div class="pt-4">
            <div class="container d-flex align-items-center justify-content-center">
                <table class="table table-hover" id="tabla">
                    <thead class="table-dark">
                        <tr>
                            <th>Codigo Solicitud</th>
                            <th>No. expediente</th>
                            <th>NIT</th>
                            <th>No. soporte</th>
                            <th>Tipo Solicitud</th>
                            <th>Usuario asignación</th>
                            <th>Estado solicitud</th>
                            <th>Fecha creacion</th>
                            <th>Cantidad Muestras</th>
                            <th>Cantidad items</th>
                            <th>Cantidad documentos</th>
                            <th>Días vencimiento</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>51545515</td>
                            <td>4515456</td>
                            <td>998445315</td>
                            <td>MM</td>
                            <td>Vasquez</td>
                            <td>Finalizado</td>
                            <td>21-04-2022</td>
                            <td>10</td>
                            <td>4</td>
                            <td>8</td>
                            <td>10</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <script type="text/javascript">
            function exportTableToExcel(tablaID, filename=''){
                let downloadLink;
                let dataType='application/vnd.ms-excel';
                let tableSelect=document.getElementById('tabla');
                let tableHTML=tableSelect.outerHTML.replace(/ /g,'%20');
                
                // especificar el nombre
                filename=filename?filename+'xls':'excel_data.xls';
                
                // creando link descarga
                downloadLink=document.createElement("a");
                document.body.appendChild(downloadLink);
                
                if(navigator.msSaveOrOpenBlob){
                    let blob =new Blob(['\ufeff',tableHTML],{
                        type:dataType
                    });
                    navigator.msSaveOrOpenBlob(blob.filename);
                }else{
                    // creando link en el archivo
                    downloadLink.href='data:'+dataType+', '+tableHTML;
                    
                    //setting the file name
                    downloadLink.download=filename;
                    
                    // triggering the function
                    downloadLink.click();
                }
            }
        </script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    </body>
</html>
