<%-- 
    Document   : reportes
    Created on : 29/10/2021, 10:42:09
    Author     : Alejandro
--%>

<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="java.awt.HeadlessException"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="com.itextpdf.text.DocumentException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.itextpdf.text.pdf.PdfPTable"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="com.itextpdf.text.Document"%>
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
                <a href="#" class="brand-logo center">Reportes</a>
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
            
            <div class="section">
                <h5>Generador de reportes</h5>
                <div class="divider"></div>
            </div>
            
            
            
            <div class="row">
                <form class="col s12">
                    <div class="row">
                        <div class="input-field col s6">
                            <i class="material-icons prefix">games</i>
                            <input id="icon_prefix" type="text" class="validate"name="nombreVideojuego" >
                            <label for="icon_prefix">Nombre Videojuego</label>
                        </div>

                         <div class="input-field col s6">
                            <i class="material-icons prefix">games</i>
                            <input id="icon_prefix" type="text" class="validate"name="nombreCliente">
                            <label for="icon_prefix">Nombre cliente</label>
                        </div>
                    </div>

                    

                    <form action="reportes.jsp">
                        <p>
                            <label>
                                <input name="opcion" type="radio" value="A" checked />
                                <span>PlayStation</span>
                            </label>
                        </p>
                        <p>
                            <label>
                                <input name="opcion" type="radio" value="B" />
                                <span>Nintendo</span>
                            </label>
                        </p>
                        <p>
                            <label>
                                <input name="opcion" type="radio" value="C" />
                                <span>Xbox</span>
                            </label>
                        </p>
                        
                        <blockquote>
                        Reporte de informacion de videojuegos con filtro de (Nombre videojuego y plataforma)
                        </blockquote>
                        
                        <button class="btn waves-effect waves-teal" type="submit" name="infoVideojuego">Generar reporte 1
                        <i class="material-icons right">cloud</i>
                        </button>
                        
                        <blockquote>
                        Reporte de informacion de alquiler con filtro de (Nombre videojuego, Nombre cliente y plataforma)
                        </blockquote>
                        
                        <button class="btn waves-effect waves-teal" type="submit" name="infoAlquiler">Generar reporte 2
                        <i class="material-icons right">cloud</i>
                        </button>
                        
                        <blockquote>
                        Reporte información de clientes morosos
                        </blockquote>
                        
                        <button class="btn waves-effect waves-teal" type="submit" name="clientesMorosos">Generar reporte 3
                        <i class="material-icons right">cloud</i>
                        </button>
                        
                        <blockquote>
                        Reporte información de top videojuegos
                        </blockquote>
                        
                        <button class="btn waves-effect waves-teal" type="submit" name="topVideojuegos">Generar reporte 4
                        <i class="material-icons right">cloud</i>
                        </button>
                        
                    </form>
                    
                </form>
            </div>
        </div>
    </div>
</div>

<%
    if (request.getParameter("clientesMorosos") != null) {
        ResultSet rs;
        Document documento = new Document();

        try {

            String ruta = System.getProperty("user.home");
            PdfWriter.getInstance(documento, new FileOutputStream(ruta + "/Desktop/Clientes_morosos.pdf"));
            documento.open();
            PdfPTable tabla = new PdfPTable(4);

            tabla.addCell("ID Cliente");
            tabla.addCell("Nombre del cliente");
            tabla.addCell("Total");
            tabla.addCell("Monto");

            try {
                Connection conn = null;
                Class.forName("org.postgresql.Driver");
                conn = DriverManager.getConnection("jdbc:postgresql://ec2-52-204-213-254.compute-1.amazonaws.com:5432/d9bsq98bjkrjbh", "hihujuaylegcge", "cd6cadefe328f45bc77750a190ec484011810e3995ba880e49c66b482e068e0e");
                PreparedStatement ps = conn.prepareStatement("select a.idcliente,c.nombrec, count(a.pagomulta) as Total, sum(a.pagomulta) as monto from alquiler as a inner join cliente as c on c.idcliente = a.idcliente group by a.idcliente, a.pagomulta, c.nombrec having count(a.pagomulta)>0 limit 10");
                rs = ps.executeQuery();

                if (rs.next()) {
                    do {
                        tabla.addCell(rs.getString("idcliente"));
                        tabla.addCell(rs.getString("nombrec"));
                        tabla.addCell(rs.getString("total"));
                        tabla.addCell(rs.getString("monto"));
                    } while (rs.next());

                    documento.add(tabla);
                }

            } catch (DocumentException | SQLException e) {
            }

            documento.close();

        } catch (DocumentException | HeadlessException | FileNotFoundException e) {
        }
    }

    if (request.getParameter("topVideojuegos") != null) {
        ResultSet rs;
        Document documento = new Document();
        try {

            String ruta = System.getProperty("user.home");
            PdfWriter.getInstance(documento, new FileOutputStream(ruta + "/Desktop/Top_videojuegos.pdf"));
            documento.open();
            PdfPTable tabla = new PdfPTable(3);

            tabla.addCell("ID Videojuego");
            tabla.addCell("Nombre del cliente");
            tabla.addCell("Conteo");

            try {
                Connection conn = null;
                Class.forName("org.postgresql.Driver");
                conn = DriverManager.getConnection("jdbc:postgresql://ec2-52-204-213-254.compute-1.amazonaws.com:5432/d9bsq98bjkrjbh", "hihujuaylegcge", "cd6cadefe328f45bc77750a190ec484011810e3995ba880e49c66b482e068e0e");
                PreparedStatement ps = conn.prepareStatement(" select a.idvd,c.nombrecliente,count (a.idvd) as conteo from alquiler as a inner join videojuego as c on c.idvd = a.idvd group by a.idvd,c.nombrecliente having count (a.idvd)>0 limit 10  ");
                rs = ps.executeQuery();

                if (rs.next()) {
                    do {
                        tabla.addCell(rs.getString("idvd"));
                        tabla.addCell(rs.getString("nombrecliente"));
                        tabla.addCell(rs.getString("conteo"));
                    } while (rs.next());

                    documento.add(tabla);
                }

            } catch (DocumentException | SQLException e) {
            }

            documento.close();

        } catch (DocumentException | HeadlessException | FileNotFoundException e) {
        }

    }

    if (request.getParameter("infoVideojuego") != null) {
        ResultSet rs;
        Document documento = new Document();
        String opcion = request.getParameter("opcion");
        String nombreV = request.getParameter("nombreVideojuego");
        String consola = "";
        
        //out.print("Nombre " + nombreV);
        //out.print("Valor de opcion " + opcion);

        if (opcion.equals("A")) {
             consola = "PS4";
             out.print("Opcion1");
        } else if (opcion.equals("B")) {
            consola = "NINTENDO";
             out.print("Opcion2");
        } else if (opcion.equals("C")) {
             consola = "XBOX";
             out.print("Opcion3");
        }
        
        try {
            String ruta = System.getProperty("user.home");
            PdfWriter.getInstance(documento, new FileOutputStream(ruta + "/Desktop/Info_videojuegos.pdf"));
            documento.open();
            PdfPTable tabla = new PdfPTable(4);

            tabla.addCell("ID videojuego");
            tabla.addCell("Nombre del cliente");
            tabla.addCell("Estado");
            tabla.addCell("Plataforma");
            

            try {
                Connection conn = null;
                Class.forName("org.postgresql.Driver");
                conn = DriverManager.getConnection("jdbc:postgresql://ec2-52-204-213-254.compute-1.amazonaws.com:5432/d9bsq98bjkrjbh", "hihujuaylegcge", "cd6cadefe328f45bc77750a190ec484011810e3995ba880e49c66b482e068e0e");
                PreparedStatement ps = conn.prepareStatement("select * from videojuego WHERE nombrecliente LIKE '%"+nombreV+"_%' or  plataforma like '%"+consola+"%'");
                rs = ps.executeQuery();

                 if (rs.next()) {
                    do {
                        tabla.addCell(rs.getString("idvd"));
                        tabla.addCell(rs.getString("nombrecliente"));
                        tabla.addCell(rs.getString("estado"));
                        tabla.addCell(rs.getString("plataforma"));
                    } while (rs.next());

                    documento.add(tabla);
                } else {
                    out.print("No hay datos que mostrar");
                }

            } catch (DocumentException | SQLException e) {
            }

            documento.close();

        } catch (DocumentException | HeadlessException | FileNotFoundException e) {
        }
    }

    if (request.getParameter("infoAlquiler") != null) {
        ResultSet rs;
        Document documento = new Document();
        String opcion = request.getParameter("opcion");
        String nombreV = request.getParameter("nombreVideojuego");
        String nombreP = request.getParameter("nombreCliente");
        String consola = "";

        if (opcion.equals("A")) {
            consola = "PS4";
        } else if (opcion.equals("B")) {
            consola = "NINTENDO";
        } else if (opcion.equals("C")) {
            consola = "XBOX";
        }

        try {

            String ruta = System.getProperty("user.home");
            PdfWriter.getInstance(documento, new FileOutputStream(ruta + "/Desktop/Info_alquiler.pdf"));
            documento.open();
            PdfPTable tabla = new PdfPTable(6);

            tabla.addCell("ID Cliente");
            tabla.addCell("Nombre del cliente");
            tabla.addCell("Entrega");
            tabla.addCell("Extensiones");
            tabla.addCell("Atraso");
            tabla.addCell("Multa");

            try {
                Connection conn = null;
                Class.forName("org.postgresql.Driver");
                conn = DriverManager.getConnection("jdbc:postgresql://ec2-52-204-213-254.compute-1.amazonaws.com:5432/d9bsq98bjkrjbh", "hihujuaylegcge", "cd6cadefe328f45bc77750a190ec484011810e3995ba880e49c66b482e068e0e");
                PreparedStatement ps = conn.prepareStatement("select a.idcliente,c.nombrec, a.fentregap as Entrega , a.extensiones, extract(day from a.fentregap - current_timestamp) as Atraso, extract(day from a.fentregap - current_timestamp)*5 as multa from alquiler as a inner join cliente as c on c.idcliente = a.idcliente  inner join videojuego as v on v.idvd = a.idvd WHERE c.nombrec LIKE '%"+nombreP+"_%' or  v.plataforma LIKE '%"+consola+"%' or v.nombrecliente like '%"+nombreV+"_%' group by a.idcliente, a.pagomulta, c.nombrec,a.fentregap ,a.extensiones ");
                rs = ps.executeQuery();

                if (rs.next()) {
                    do {
                        tabla.addCell(rs.getString("idcliente"));
                        tabla.addCell(rs.getString("nombrec"));
                        tabla.addCell(rs.getString("entrega"));
                        tabla.addCell(rs.getString("extensiones"));
                        tabla.addCell(rs.getString("atraso"));
                        tabla.addCell(rs.getString("multa"));
                    } while (rs.next());

                    documento.add(tabla);
                } else {
                    out.print("No hay datos que mostrar");
                }

            } catch (DocumentException | SQLException e) {
            }

            documento.close();

        } catch (DocumentException | HeadlessException | FileNotFoundException e) {
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
