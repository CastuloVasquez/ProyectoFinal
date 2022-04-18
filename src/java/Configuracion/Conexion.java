/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Configuracion;

import org.springframework.jdbc.datasource.DriverManagerDataSource;

/**
 *
 * @author castulo
 */
public class Conexion {
    public DriverManagerDataSource Conectar(){
        DriverManagerDataSource ds=new DriverManagerDataSource();
        ds.setDriverClassName("com.mysql.cj.jdbc.Driver");
        ds.setUrl("jdbc:mysql://localhost:3306/ProyectoSemestre");
        ds.setUsername("root");
        ds.setPassword("");
        return ds;
    }
}
