<%-- 
    Document   : menu
    Created on : 3 oct 2022, 16:56:26
    Author     : Virgilio Ramos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Ventas</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="${pageContext.servletContext.contextPath}/index.jsp">Home</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="${pageContext.servletContext.contextPath}/vistas/clientes.jsp">Clientes</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#">Usuarios</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Reportes
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" target="_blank" href="#">Todos los Clientes</a></li>
            <li><a class="dropdown-item" href="#">Clientes por Categoria</a></li>
          </ul>
        </li>        
      </ul>
      <!-- Example single danger button -->
        <div class="btn-group">
          <button type="button" class="btn btn-danger dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
            Username
          </button>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" style="cursor: pointer">Acceso: No definido</a></li>
            <li><a class="dropdown-item" href="#">Cerrar Sesion</a></li>
          </ul>
        </div>
    </div>
  </div>
</nav>
