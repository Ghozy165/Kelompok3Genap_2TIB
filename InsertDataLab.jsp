<%-- 
    Document   : InsertDataLab
    Created on : Feb 9, 2022, 12:58:29 AM
    Author     : M Fikri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
        <title>SIPPL PCR</title>

        <!-- General CSS Files -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">

        <!-- CSS Libraries -->

        <!-- Template CSS -->
        <link rel="stylesheet" href="../assets/css/style.css">
        <link rel="stylesheet" href="../assets/css/components.css">
    </head>

    <body>
    <sql:setDataSource
        var="TDataLab"
        driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/genap"
        user="root" password=""
        />
    <sql:query var="ShowDataLab"   dataSource="${TDataLab}">
        SELECT * FROM datalab;  
    </sql:query>
    <div id="app">
        <div class="main-wrapper">
            <div class="navbar-bg"></div>
            <nav class="navbar navbar-expand-lg main-navbar">
                <form class="form-inline mr-auto">
                    <ul class="navbar-nav mr-3">
                        <li><a href="#" data-toggle="sidebar" class="nav-link nav-link-lg"><i class="fas fa-bars"></i></a></li>
                        <li><a href="#" data-toggle="search" class="nav-link nav-link-lg d-sm-none"><i class="fas fa-search"></i></a></li>
                    </ul>
                </form>
                <ul class="navbar-nav navbar-right">
                    <li class="dropdown dropdown-list-toggle"><a href="#" data-toggle="dropdown"></a>
                        <div class="dropdown-menu dropdown-list dropdown-menu-right">
                            <div class="dropdown-header">
                                <div class="float-right">
                                    <a href="#"></a>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="dropdown"><a href="#" data-toggle="dropdown" class="nav-link dropdown-toggle nav-link-lg nav-link-user">
                            
                            <div class="d-sm-none d-lg-inline-block">Hi, Ujang Maman</div></a>
                        <div class="dropdown-menu dropdown-menu-right">
                            <div class="dropdown-title">Logged in 5 min ago</div>
                            <a href="features-profile.html" class="dropdown-item has-icon">
                                <i class="far fa-user"></i> Profile
                            </a>
                            <a href="features-activities.html" class="dropdown-item has-icon">
                                <i class="fas fa-bolt"></i> Activities
                            </a>
                            <a href="features-settings.html" class="dropdown-item has-icon">
                                <i class="fas fa-cog"></i> Settings
                            </a>
                            <div class="dropdown-divider"></div>
                            <a href="#" class="dropdown-item has-icon text-danger">
                                <i class="fas fa-sign-out-alt"></i> Logout
                            </a>
                        </div>
                    </li>
                </ul>
            </nav>
            <div class="main-sidebar">
                <aside id="sidebar-wrapper">
                    <div class="sidebar-brand">
                        <a href="index.html">SIPPL PCR</a>
                    </div>
                    <div class="sidebar-brand sidebar-brand-sm">
                        <a href="index.html">SIPPL PCR</a>
                    </div>
                    <ul class="sidebar-menu">
                        <li class="menu-header">Dashboard</li>
                        <li class="dropdown">
                            <a href="#" class="nav-link has-dropdown"><i class="fas fa-fire"></i><span>Dashboard</span></a>
                        </li>
                        <li class="menu-header">Management</li>
                        <li>
                            <a href="KelolaPeminjaman.jsp"  data-toggle="#"><i class="fas fa-columns"></i> <span>Kelola Peminjaman</span></a>
                        </li>
                        <li class="dropdown active">
                            <a class="nav-link" href="ViewDataLab.jsp"><i class="far fa-square"></i> <span>Data Lab</span></a></li>
                    </ul>
                    
                </aside>
            </div>
            <div class="main-content">
                <section class="section">
                    <div class="section-header">
                        <h1>Sistem Informasi Penjadwalan Peminjaman Lab</h1>
                        <div class="section-header-breadcrumb">
                             <div class="breadcrumb-item active"><a href="Dashboard.jsp">Dashboard</a></div>
                             <div class="breadcrumb-item"><a href="ViewDataLab.jsp">Data Lab</a></div>
                            <div class="breadcrumb-item">Tambah Data</div>
                        </div>
                    </div>
                    <div class="section-body">
                        <h2 class="section-title">Tambah Data Lab</h2>
                        
                        <div class="row">
                            <div class="col-12">
                                 <form action="insert_data.jsp" method="Post">
                                <div class="card">
                                    <div class="card-header">
                                       
                                        <h4>Form Tambah Data Lab</h4>
                                    </div>
                                    <div class="card-body">
                                        <div class="form-group" >
                                            <label>No Ruangan</label>
                                            <input type="text" class="form-control" name="no_ruangan">
                                        </div>
                                        <div class="form-group">
                                            <label>NIP</label>
                                             <%@page import= "java.sql.*, java.io.*"%>

                            <%
                                try {
                                    String Host = "jdbc:mysql://localhost:3306/genap";
                                    Connection connection = null;
                                    Statement statement = null;
                                    ResultSet rs = null;
                                    Class.forName("com.mysql.jdbc.Driver");
                                    connection = DriverManager.getConnection(Host, "root", "");
                                    statement = connection.createStatement();
                                    String Data = "Select nip from ail";
                                    rs = statement.executeQuery(Data);%>
                                    <select name="nip" class="form-control">
                                        <%while (rs.next()) {%>
                                        <option><%=rs.getString("nip")%></option>
                                        <%}%>
                                    </select><%
                    rs.close();
                    statement.close();
                    connection.close();
                    } catch (SQLException e) {
                    out.println("Can't connect to database, with error = " + e.getMessage());
}
%>
                                        </div>
                                        <div class="form-group">
                                            <label>Nama(AIL) </label>
                                           <%
                                try {
                                    String Host = "jdbc:mysql://localhost:3306/genap";
                                    Connection connection1 = null;
                                    Statement statement1 = null;
                                    ResultSet rs1 = null;
                                    Class.forName("com.mysql.jdbc.Driver");
                                    connection1 = DriverManager.getConnection(Host, "root", "");
                                    statement1 = connection1.createStatement();
                                    String Data1 = "Select nama from ail";
                                    rs1 = statement1.executeQuery(Data1);%>
                                    <select name="nama" class="form-control">
                                        <%while (rs1.next()) {%>
                                        <option><%=rs1.getString("nama")%></option>
                                        <%}%>
                                    </select><%
                    rs1.close();
                    statement1.close();
                    connection1.close();
                    } catch (SQLException e) {
                    out.println("Can't connect to database, with error = " + e.getMessage());
}
%>
                                        </div>
                                        <div class="form-group">
                                            <label>Keterangan</label>
                                            <input type="text" class="form-control" name="keterangan_ruangan">
                                        </div>
                                        <div class="card-footer text-right">
                                            <button class="btn btn-primary" type="submit" name="SimpanData" value="Simpan">Simpan</button>
                                        </div>
                                    </div>
                                </div>
                                 </form>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>

</body>
</html>
