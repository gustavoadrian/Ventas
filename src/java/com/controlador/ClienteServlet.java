/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controlador;

import com.modelo.Cliente;
import com.modelo.ClienteDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Virgilio Ramos
 */
public class ClienteServlet extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            //Captura de datos
            int codigo = Integer.parseInt(request.getParameter("txtCodigo"));
            String nombre = request.getParameter("txtNombre");
            int edad = Integer.parseInt(request.getParameter("txtEdad"));
            int categoria = Integer.parseInt(request.getParameter("txtCategoria"));
            String mensaje = "Error";
            int res;
            
            Cliente c = new Cliente(codigo, nombre, edad, categoria, nombre);
            ClienteDAO clienteDAO = new ClienteDAO();
            
            if(request.getParameter("btnGuardar") != null){
                res = clienteDAO.insertarCliente(c);
                if(res != 0){
                    mensaje = "Registro Agregado";
                }
            }else if(request.getParameter("btnEditar") != null){
                res = clienteDAO.modificarCliente(c);
                if(res != 0){
                    mensaje = "Registro Modificado";
                }
            }else if(request.getParameter("btnEliminar") != null){
                res = clienteDAO.eliminarCliente(c);
                if(res != 0){
                    mensaje = "Registro Eliminado";
                }
            }
            request.setAttribute("message", mensaje);
            request.getRequestDispatcher("/vistas/clientes.jsp").forward(request, response);
            
        }catch(Exception e){
            System.out.println("Error "+e.getLocalizedMessage());
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
        processRequest(request, response);
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
