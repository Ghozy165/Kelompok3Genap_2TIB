<%-- 
    Document   : Searchdata.jsp
    Created on : Feb 9, 2022, 3:27:51 PM
    Author     : M Fikri
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="KoneksiTable.Koneksi" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
          <%
        try {
        String search = request.getParameter("Search");
        String no_ruangan = request.getParameter("no_ruangan");
            String nip = request.getParameter("nip");
            String nama = request.getParameter("nama");
            String keterangan_ruangan = request.getParameter("keterangan_ruangan");
        String Host = "jdbc:mysql://localhost:3306/genap";
        Connection connection = null;
        Statement statement = null;
        ResultSet rs = null;
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection(Host, "root", "");
        statement = connection.createStatement();
        String Data = "Select * from datalab where no_ruangan like '%"+search+"%' or nama like '%"+search+"%';";
        rs = statement.executeQuery(Data);
        while(rs.next()) {
            rs.getString(no_ruangan);
            rs.getString(nip);
            rs.getString(nama);
            rs.getString(keterangan_ruangan);
        }
        
} catch (Exception e) {
        out.println("Can't connect to database:" + e.getMessage());
}
 %>
    </body>
</html>
