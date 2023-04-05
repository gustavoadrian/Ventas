<%-- 
    Document   : clientes
    Created on : 3 oct 2022, 16:49:10
    Author     : Virgilio Ramos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.modelo.Categoria" %>
<%@page import="com.modelo.CategoriaDAO" %>
<%@page import="java.util.ArrayList" %>
<%@page import="com.modelo.Cliente" %>
<%@page import="com.modelo.ClienteDAO" %>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>..::Clientes::..</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap5.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/11.4.38/sweetalert2.min.css" />
    </head>
    <body>
        <%! 
            CategoriaDAO categoriaDAO = new CategoriaDAO();
            ClienteDAO clienteDAO = new ClienteDAO();
        %>
        <div class="container">
            <%@include file="../template/menu.jsp" %>
            <hr>
            <div class="row align-items-start">
                <div class="col-9"><h1>Gestion de Clientes</h1></div>
                <div class="col-3 align-self-center">
                    <div class="d-grid gap-2">
                        <button type="button" class="btn btn-success btnAdd" data-bs-toggle="modal" data-bs-target="#exampleModal">Agregar</button>
                    </div>                    
                </div>
            </div>
            
            
            <hr>
            <div class="table-responsive">
                <table class="table table-striped" id="mydataTable">
                    <thead>
                        <th>Código</th>
                        <th>Nombre</th>
                        <th>Edad</th>
                        <th>Categoría</th>
                        <th>Acciones</th>
                    </thead>
                    <tbody>
                        <%
                        ArrayList<Cliente> listaCliente = clienteDAO.mostrarClientes();
                        
                        for (Cliente elem : listaCliente) {     
                            
                        %>
                        <tr>
                            <td class="codigo"><%= elem.getIdCliente() %></td>
                            <td class="nombre"><%= elem.getNombre() %></td>
                            <td class="edad"><%= elem.getEdad() %></td>
                            <td class="categoria"><%= elem.getCategoria() %></td>
                            <td>
                                <button type="button" class="btn btn-dark btnEditar" data-bs-toggle="modal" data-bs-target="#exampleModal">Editar</button>
                                <button type="button" class="btn btn-danger btnEliminar" data-bs-toggle="modal" data-bs-target="#exampleModal">Eliminar</button>
                            </td>
                        </tr>
                        <%
                        }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- Button trigger modal -->
        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-lg">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Datos Cliente</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                  <form action="${pageContext.servletContext.contextPath}/ClienteServlet" method="POST" role="form">
                      <div class="row">
                          <div class="col-6">
                              <label>Codigo</label>
                              <input type="text" name="txtCodigo" class="form-control" id="txtCodigo" value="0" readonly="true">
                        </div>
                          <div class="col-6">
                              <label>Nombre</label>
                              <input type="text" name="txtNombre" class="form-control" id="txtNombre">
                        </div>
                      </div>
                      <div class="row">
                          <div class="col-6">
                              <label>Edad</label>
                              <input type="number" min="17" name="txtEdad" class="form-control" id="txtEdad">
                        </div>
                      </div>
                      <div class="row">
                          <div class="col-6">
                              <label>Categoría</label>
                              <select name="txtCategoria" id="txtCategoria" class="form-select">
                                  <option value="0">Seleccionar Categoria...</option>
                                  <%
                                      ArrayList<Categoria> lista = categoriaDAO.mostarCategorias();
                                      for (Categoria elem : lista) {
                                              
                                          
                                  %>
                                    <option value="<%= elem.getIdCategoria() %>"><%= elem.getCategoria() %></option>
                                  <%
                                    }
                                  %>
                              </select>
                        </div>
                      </div><br>
                      <div class="row">
                          <div class="col-12">
                              <button type="submit" name="btnGuardar" class="btn btn-success btnOcultar1">Guardar</button>
                              <button type="submit" name="btnEditar" class="btn btn-dark btnOcultar">Editar</button>
                              <button type="submit" name="btnEliminar" class="btn btn-danger btnOcultar">Eliminar</button>
                              <button type="button" class="btn btn-info" data-bs-dismiss="modal">Cancelar</button>
                          </div>
                      </div>
                  </form>
              </div>
            </div>
          </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js" ></script>
        <script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js" ></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/11.4.38/sweetalert2.all.min.js"></script>

        <%
        if (request.getAttribute("message") != null) {
        %>
        <script>
            $(document).ready(function(){
                Swal.fire({
                    position: 'top-end',
                    icon: 'success',
                    title: '<%= request.getAttribute("message") %>',
                    showConfirmButton: false,
                    timer: 3000
                  });
            });
        </script>
        <%
        }
        %>
        <script src="${pageContext.servletContext.contextPath}/js/cliente.js"></script>
    </body>
</html>
