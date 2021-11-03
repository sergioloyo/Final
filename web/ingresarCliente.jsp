<%-- 
    Document   : ingresarCliente
    Created on : 23-oct-2021, 8:15:51
    Author     : iserg
--%>
<%@page import="java.sql.Statement"%>
<%@page import ="java.sql.Connection" %>
<%@page import ="java.sql.DriverManager" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Games</title>
    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

    <!--Import Google Icon Font-->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

</head>

<body class="grey lighten-5">

    <nav>
        <div class="nav-wrapper  grey darken-3">
            <a href="#" class="brand-logo center">Ingreso de usuario</a>
            <ul id="nav-mobile" class="left hide-on-med-and-down">
            </ul>
        </div>
    </nav>


    <div class="container section">

        <a href="#" class="btn-floating pulse sidenav-trigger grey darken-2" data-target="menu-side">
            <i class="medium material-icons">menu</i>
        </a>

        <ul class="sidenav grey darken-4" id="menu-side">
                <li>
                    <div class="user-view">
                        <div class="background">
                            <img src="Imagenes/s3.jpg" alt="">
                        </div>
                        <a href="#">
                            <img src="Imagenes/s1.png" alt="" class="circle">
                        </a>
                        <a href="">
                            <span class="name white-text">Administrador</span>
                        </a>
                        <a href="">
                            <span class="email white-text">admi123@gmail.com</span>
                        </a>
                    </div>
                </li>
                <li>
                    <a class="white-text" href="index.html">
                        <i class="white-text material-icons">looks_one</i>
                        Inicio
                    </a>
                </li>
                <li>
                    <a class="white-text" href="ingresarCliente.jsp">
                        <i class="white-text material-icons">face</i>
                        Ingreso de usuarios
                    </a>
                </li>
                <li>
                    <a class="white-text" href="ingresoVideojuego.jsp">
                        <i class="white-text red-text material-icons">videogame_asset </i>
                        Ingreso de videojuego
                    </a>
                </li>
                <li>
                <li>
                    <a class="white-text" href="Extension.jsp">
                        <i class="white-text material-icons">av_timer</i>
                        Extension de tiempo
                    </a>
                </li>
                <li>
                <li>
                    <a class="white-text" href="prestamoVideojuego.jsp">
                        <i class="white-text material-icons">child_care</i>
                        Prestamo de videojuego
                    </a>
                </li>

                <li>
                    <a class="white-text" href="devolucion.jsp">
                        <i class="white-text material-icons">games</i>
                        Devolucion de videojuego
                    </a>
                </li>

                <li>
                    <div class="divider grey darken-3"></div>
                </li>

                <li>
                    <a class="white-text" href="reportes.jsp">
                        <i class="white-text material-icons">cloud</i>
                        Reportes
                    </a>
                </li>
            </ul>

        <div class="row">
            <form class="col s12">
                <div class="row">
                    <div class="input-field col s6">
                        <i class="material-icons prefix">account_circle</i>
                        <input id="icon_prefix" type="text" class="validate" name="nombre" required="Requiere">
                        <label for="icon_prefix">Nombre</label>
                    </div>
                    <div class="input-field col s6">
                        <i class="material-icons prefix">folder_shared</i>
                        <input id="icon_telephone" type="tel" class="validate" name="cui"required="Requiere">
                        <label for="icon_telephone">Dpi</label>
                    </div>
                </div>

                <button class="btn waves-effect waves-light" type="submit" name="action">Guardar
                    <i class="material-icons right">send</i>
                  </button>
            </form> 
        </div>
    </div>
    </div>
    </div>
    
    <%
        if (request.getParameter("action") != null) {

            String nombreC = request.getParameter("nombre");
            String dpi = request.getParameter("cui");

            String sql = "select idVd,nombreCliente from videojuego where estado ='Disponible' ";
            try {
                Connection conn = null;
                Statement st=null;
                
                Class.forName("org.postgresql.Driver");
                conn = DriverManager.getConnection("jdbc:postgresql://ec2-52-204-213-254.compute-1.amazonaws.com:5432/d9bsq98bjkrjbh","hihujuaylegcge","cd6cadefe328f45bc77750a190ec484011810e3995ba880e49c66b482e068e0e");
                st=conn.createStatement();
                st.executeUpdate("insert into Cliente (nombrec,idcliente) values ('"+nombreC+"','"+dpi+"')");
                
            } catch (Exception Ex) {
                out.print(Ex);

            }

        }

    %>
    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-rc.2/js/materialize.min.js">
    </script>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var elems = document.querySelectorAll('.slider');
            var instances = M.Slider.init(elems, {
            });
            var elems = document.querySelectorAll('.materialboxed');
            var instances = M.Materialbox.init(elems);

            var elems = document.querySelectorAll('.sidenav');
            var instances = M.Sidenav.init(elems);
        });
    </script>
    </script>

</body>
</html>
