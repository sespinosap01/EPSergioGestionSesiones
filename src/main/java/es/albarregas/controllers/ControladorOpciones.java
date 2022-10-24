/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.controllers;

import es.albarregas.beans.GuardadoDatos;
import es.albarregas.modelos.EnumConverter;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;

/**
 *
 * @author Sergio
 */
@WebServlet(name = "ControladorOpciones", urlPatterns = {"/ControladorOpciones"})
public class ControladorOpciones extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String url = "index.jsp";

        HttpSession sesion = request.getSession();
        String mensajeError = "";

        if (request.getParameter("crear") != null) {
            if (request.getParameter("id").length() > 0 && request.getParameter("nombre").length() > 0 && request.getParameter("fecha") != null && request.getParameter("tipoIdentificacion") != null && request.getParameter("identificacion").length() > 0) {

                try {                                           //guardamos la informacion del formulario con el mismo nombre en el bean
                    //y creamos la sesion
                    GuardadoDatos guardadoDatos = new GuardadoDatos();

                    DateConverter converter = new DateConverter();
                    converter.setPattern("yyyy-MM-dd");
                    ConvertUtils.register(converter, Date.class);
                    ConvertUtils.register(new EnumConverter(), GuardadoDatos.tipoId.class);
                    BeanUtils.populate(guardadoDatos, request.getParameterMap());
                    sesion.setAttribute("usuario", guardadoDatos);
                } catch (IllegalAccessException | InvocationTargetException ex) {
                    Logger.getLogger(ControladorOpciones.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else { //cierre if validar
                url = "JSP/crear.jsp";
                mensajeError = "Error: No puede haber datos vacíos";
                request.setAttribute("error", mensajeError);
            }
        }

        if (request.getParameter("cancelar") != null) {     //boton de cancelar
            url = "index.jsp";
        }

        if (request.getParameter("eliminar") != null) {     //boton de eliminar sesion
            sesion.invalidate();    //eliminar la sesion

        }

        if (request.getParameter("modificar") != null) {
            if (request.getParameter("id").length() > 0 && request.getParameter("nombre").length() > 0 && request.getParameter("fecha") != null && request.getParameter("tipoIdentificacion") != null && request.getParameter("identificacion").length() > 0) {

                try {                                           //modificamos la informacion del formulario
                    GuardadoDatos guardadoDatos = new GuardadoDatos();

                    DateConverter converter = new DateConverter();
                    converter.setPattern("yyyy-MM-dd");
                    ConvertUtils.register(converter, Date.class);
                    ConvertUtils.register(new EnumConverter(), GuardadoDatos.tipoId.class);
                    BeanUtils.populate(guardadoDatos, request.getParameterMap());
                    sesion.setAttribute("usuario", guardadoDatos);
                } catch (IllegalAccessException | InvocationTargetException ex) {
                    Logger.getLogger(ControladorOpciones.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else { //cierre if validar
                url = "JSP/modificar.jsp";
                mensajeError = "Error: No puede haber datos vacíos";
                request.setAttribute("error", mensajeError);

            }
        }

        request.getRequestDispatcher(url).forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
