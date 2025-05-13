<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, com.productos.datos.Conexion" %>
<%
    ResultSet rs = null;
    try {
        Conexion con = new Conexion();
        String sql = "SELECT id_pr, nombre_pr, cantidad_pr, precio_pr FROM tb_producto;";
        rs = con.Consulta(sql);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/c1.css">
</head>
<body>
<main>
    <div id="content">
        <h2>Lista de Productos</h2>
        <table border="1" style="width:90%; margin:auto; border-collapse:collapse; text-align:center;">
            <tr style="background:#f0f0f0;">
                <th>ID</th>
                <th>Nombre</th>
                <th>Cantidad</th>
                <th>Precio</th>
            </tr>
            <%
                while(rs != null && rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt("id_pr") %></td>
                <td><%= rs.getString("nombre_pr") %></td>
                <td><%= rs.getInt("cantidad_pr") %></td>
                <td>$<%= rs.getDouble("precio_pr") %></td>
            </tr>
            <%
                }
            %>
        </table>
    </div>
</main>
<%
    } catch(Exception ex) {
        out.println("<p style='color:red; text-align:center;'>Error al mostrar productos: " + ex.getMessage() + "</p>");
    } finally {
        if (rs != null) rs.close();
    }
%>
    <footer>
        <p>Síguenos en nuestras redes sociales</p>
        <div class="social">
            <a href="https://www.facebook.com/"><img src="iconos/facebook.png" alt="Facebook"></a>
            <a href="https://www.instagram.com/"><img src="iconos/instagram.png" alt="Instagram"></a>
            <a href="https://www.tiktok.com/"><img src="iconos/tiktok.png" alt="TikTok"></a>
        </div>
        <p>&copy; 2025 PandaMax Tech Repair - Todos los derechos reservados.</p>
    </footer>
</body>
</html>