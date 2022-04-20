/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import Configuracion.Conexion;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.portlet.ModelAndView;

/**
 *
 * @author castulo
 */
@Controller
public class Controlador {
    
    

    Conexion con = new Conexion();
    ModelAndView mv = new ModelAndView();
    JdbcTemplate jdbc = new JdbcTemplate(con.Conectar());

    
    //////  PRUEBAS ///////////
    
    @RequestMapping("test.htm")
    public ModelAndView test(){
        mv.setViewName("test");
        return new ModelAndView("test");
    }
    
    @RequestMapping(value="test.htm", method=RequestMethod.GET)
    public ModelAndView testGET(HttpServletRequest request){
        String sql="select TIPOSOLI_solicitud from tipoSolicitud";
        String sql2="select VALIESTADO_estado from validacionEstado";
        List solicitud=this.jdbc.queryForList(sql);
        List estados=this.jdbc.queryForList(sql2);
        request.setAttribute("listaEstados", estados);
        request.setAttribute("listaSolicitud", solicitud);
        return mv;
    }
    
    ////////////////////////
    
    @RequestMapping("index.htm")
    public ModelAndView index(){
        mv.setViewName("index");
        return new ModelAndView ("index");
    }
    
    @RequestMapping("menuSolicitud.htm")
    public ModelAndView menuSolicitud(){
        mv.setViewName("menuSolicitud");
        return new ModelAndView("menuSolicitud");
    }
    
    @RequestMapping("soporteContacto.htm")
    public ModelAndView soporteContacto() {
        mv.setViewName("soporteContacto");
        return new ModelAndView("soporteContacto");
    }
    
    @RequestMapping("mantenimientoSolicitud.htm")
    public ModelAndView mantenimientoSolicitud(){
        mv.setViewName("mantenimientoSolicitud");
        return mv;
    }
    
    
    

    @RequestMapping(value="menuSolicitud.htm", method=RequestMethod.GET)
    public ModelAndView menuSolicitudGET(HttpServletRequest request) {
        String sql = "select USU_tipoUsuario from tipoUsuario";
        List lista = this.jdbc.queryForList(sql);
        request.setAttribute("lista", lista);
        String sqlSoli="select TIPOSOLI_solicitud from tipoSolicitud";
        List solicitud=this.jdbc.queryForList(sqlSoli);
        request.setAttribute("listaSoli", solicitud);
        return mv;
    }
    
    @RequestMapping(value="soporteContacto.htm", method=RequestMethod.GET)
    public ModelAndView soporteContactoGET(HttpServletRequest request){
        String sql="SELECT TIPOSOPORTE_soporte FROM tipoSoporte";
        List sptSQL=this.jdbc.queryForList(sql);
        request.setAttribute("soporte", sptSQL);
        return mv;
    }
    
    @RequestMapping(value="mantenimientoSolicitud.htm", method=RequestMethod.GET)
    public ModelAndView mantenimientoSolicitudGET(HttpServletRequest request){
        String sql="select TIPOSOLI_solicitud from tipoSolicitud";
        String sql2="select VALIESTADO_estado from validacionEstado";
        List solicitud=this.jdbc.queryForList(sql);
        List estados=this.jdbc.queryForList(sql2);
        request.setAttribute("listaEstados", estados);
        request.setAttribute("listaSolicitud", solicitud);
        return mv;
    }
    
    @RequestMapping(value="index.htm", method=RequestMethod.GET)
    public ModelAndView indexGET(HttpServletRequest request){
        String sql="select TIPOSOLI_solicitud from tipoSolicitud";
        String sql2="select VALIESTADO_estado from validacionEstado";
        List solicitud=this.jdbc.queryForList(sql);
        List estados=this.jdbc.queryForList(sql2);
        request.setAttribute("listaEstados", estados);
        request.setAttribute("listaSolicitud", solicitud);
        return mv;
    }
}
