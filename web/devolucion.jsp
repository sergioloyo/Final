<%-- 
    Document   : Extension
    Created on : 29/10/2021, 00:02:08
    Author     : Alejandro
--%>


<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.time.temporal.ChronoUnit"%>
<%@page import="java.time.Instant"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

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
                <a href="#" class="brand-logo center">Devolucion Videojuego</a>
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
                            <i class="material-icons prefix">timer</i>
                            <input id="icon_prefix" type="text" class="validate" name="cui" required="Requiere">
                            <label for="icon_prefix">Dpi</label>
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
    Statement st = null;
    ResultSet rs;
    Connection conn = null;
    PreparedStatement ps;
    PreparedStatement pc;
    String dpi = request.getParameter("cui");

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    if (request.getParameter("action") != null) {

        try {
            Class.forName("org.postgresql.Driver");
            conn = DriverManager.getConnection("jdbc:postgresql://ec2-52-204-213-254.compute-1.amazonaws.com:5432/d9bsq98bjkrjbh", "hihujuaylegcge", "cd6cadefe328f45bc77750a190ec484011810e3995ba880e49c66b482e068e0e");
            //ps = conn.prepareStatement("select extensiones, estadoalquiler from alquiler where idcliente ='" + dpi + "' and estadoalquiler='Pendiente' ");
            ps = conn.prepareStatement("select idcliente, idvd, fdeprestamo,fentregap from alquiler where idcliente ='" + dpi + "' and estadoalquiler='Pendiente' ");
            pc = conn.prepareStatement("");

            rs = ps.executeQuery();

            if (rs.next()) {
                int videojuego = rs.getByte("idvd");
                Date date = new Date(System.currentTimeMillis());
                String fechaPrestamo = rs.getString("fdeprestamo");
                Date fecha = sdf.parse(fechaPrestamo);
                String fechaHora = sdf.format(date);

                int milisecondsByDay = 86400000;
                int dias = (int) ((date.getTime() - fecha.getTime()) / milisecondsByDay);

                //variable para cobro de multas
                double tarifa = 5;
                double multa = 5;
                double pagop = Math.abs((dias * tarifa));
                double pagom = Math.abs(multa * (dias));
                double pagot = Math.abs(pagop + pagom);

                // 
                if (rs.getString("fdeprestamo").equals(fechaHora)) {
                    st = conn.createStatement();
                    st.executeUpdate("update  alquiler set fentregaf='" + date + "',pagoparcial='" + pagop + "', pagatotal='" + pagop + "', estadoAlquiler='Pagado' where idcliente = '" + dpi + "'");
                    st.executeUpdate("UPDATE VIDEOJUEGO SET estado = 'Disponible' WHERE idvd = " + videojuego);
                } else if (dias <= 7) {
                    st = conn.createStatement();
                    st.executeUpdate("update  alquiler set fentregaf='" + date + "',pagoparcial='" + pagop + "', pagatotal='" + pagop + "', estadoAlquiler='Pagado' where idcliente = '" + dpi + "'");
                    st.executeUpdate("UPDATE VIDEOJUEGO SET estado = 'Disponible' WHERE idvd = " + videojuego);
                } else {
                    st = conn.createStatement();
                    st.executeUpdate("update  alquiler set fentregaf='" + date + "',pagoparcial='" + pagop + "',pagomulta='" + pagom + "', pagatotal='" + pagot + "', estadoAlquiler='Pagado' where idcliente = '" + dpi + "'");
                    st.executeUpdate("UPDATE VIDEOJUEGO SET estado = 'Disponible' WHERE idvd = " + videojuego);
                }

            } else {
                out.print("No hay devoluciones pendientes...");
            }

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