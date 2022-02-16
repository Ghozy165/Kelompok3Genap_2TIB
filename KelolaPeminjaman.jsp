<%-- 
    Document   : KelolaPeminjaman
    Created on : Feb 9, 2022, 3:07:09 PM
    Author     : A S U S
--%>

<%@ page language="java"contentType="text/html; charset=UTF-8"pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    String no_ruangan = request.getParameter("no_ruangan");
    String driver = "com.mysql.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://localhost:3306/";
    String database = "genap";
    String userid = "root";
    String password = "";
    try {
        Class.forName(driver);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
        <title>SIPPL PCR</title>

        <!-- General CSS Files -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
        <link rel="stylesheet" href="../node_modules/datatables.net-bs4/css/dataTables.bootstrap4.min.css">
        <link rel="stylesheet" href="../node_modules/datatables.net-select-bs4/css/select.bootstrap4.min.css">

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
            SELECT * FROM kelola_peminjaman;  
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
                            <li class="dropdown active">
                                <a href="KelolaPeminjaman.jsp"  data-toggle="#"><i class="fas fa-columns"></i> <span>Kelola Peminjaman</span></a>
                            </li>
                            <li><a class="nav-link" href="ViewDataLab.jsp"><i class="far fa-square"></i> <span>Data Lab</span></a></li>
                        </ul>

                    </aside>
                </div>

                <!-- Main Content -->
                <div class="main-content">
                    <section class="section">
                        <div class="section-header">
                            <h1>Sistem Informasi Penjadwalan Peminjaman Lab</h1>
                            <div class="section-header-breadcrumb">
                                <div class="breadcrumb-item active"><a href="Dashboard.jsp">Dashboard</a></div>
                                <div class="breadcrumb-item">Kelola Peminjaman</div>
                            </div>
                        </div>

                        <div class="section-body">
                            <h2 class="section-title">Kelola Peminjaman Lab</h2>
                            <div class="card">
                                <div class="card-header">
                                    <h4>Table Kelola Peminjaman</h4>

                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <form action="KelolaGoip.jsp" method="POST">
                                            <table class="table table-bordered table-md">
                                                <tr>
                                                    <th>Nomor Ruangan</th>
                                                    <th></th>
                                                    <th>NIP</th>
                                                    <th></th>
                                                    <th>Status</th>
                                                    <th colspan="2">Aksi</th>
                                                    <th>Keterangan</th>
                                                </tr>
                                                <%
                                                    try {
                                                        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/genap", "root", "");
                                                        statement = connection.createStatement();
                                                        String sql = "select * from kelola_peminjaman";
                                                        resultSet = statement.executeQuery(sql);
                                                        while (resultSet.next()) {
                                                %>
                                                <tr>
                                                    <td><%=resultSet.getString("no_ruangan")%></td>
                                                    <td><input type="hidden" class="form-control" name="no_ruangan" value="<%=resultSet.getString("no_ruangan")%>"/></td>
                                                    <td><%=resultSet.getString("nip")%></td>
                                                    <td></td>

                                                    <td>
                                                        <p>
                                                            <%=resultSet.getString("status")%>
                                                        </p>
                                                        
                                                    <td rowspan="2">
                                                        <select class="form-control" name="status">
                                                            <option>Pilih Status</option>
                                                            <option value="sedang diajukan">sedang diajukan</option>
                                                            <option value="sedang dipinjam">sedang dipinjam</option>
                                                            <option value="bisa dipinjam">bisa dipinjam</option>
                                                            <option value="tidak bisa di pinjam">tidak bisa di pinjam</option>
                                                        </select>
                                                    </td>

                                                    <td class="col-sm-2"><button type="submit" name="simpan" value="Simpan" class="btn btn-success">Simpan</button>&emsp;&emsp;&emsp;&ensp;&nbsp;&ensp;<button type="reset" name="batal" class="btn btn-danger">Batal</button></td>
                                                    <td><%=resultSet.getString("keterangan_ruangan")%></td>
                                                </tr>
                                                <%
                                                        }
                                                        connection.close();
                                                    } catch (Exception e) {
                                                        e.printStackTrace();
                                                    }
                                                %>
                                                <%-- <c:forEach var="data" items="${ShowDataLab.rows}">
                                                    <tr>
                                                        <td><c:out value="${data.no_ruangan}" /></td>
                                                        <td><c:out value="${data.nip}" /></td>
                                                        <td><c:out value="${data.nama}" /></td>
                                                        <td><c:out value="${data.keterangan_ruangan}" /></td>
                                                    </tr>
                                                </c:forEach> --%>
                                            </table>
                                        </form>

                                    </div>
                                </div>

                                <div class="card-footer bg-whitesmoke">

                                </div>
                            </div>
                        </div>
                    </section>
                </div>
                <footer class="main-footer">
                    <div class="footer-left">
                        Copyright © 2022 <div class="bullet"></div> Design By <a href="#">Kelompok 3 Genap</a>
                    </div>
                    <div class="footer-right">
                        GIM, MLG, MF, OF
                    </div>
                </footer>
            </div>
        </div>

        <!-- General JS Scripts -->
        <script src="../dist/modules/jquery.min.js"></script>
        <script src="../dist/modules/popper.js"></script>
        <script src="../dist/modules/tooltip.js"></script>
        <script src="../dist/modules/bootstrap/js/bootstrap.min.js"></script>
        <script src="../dist/modules/nicescroll/jquery.nicescroll.min.js"></script>
        <script src="../dist/modules/moment.min.js"></script>
        <script src="../dist/js/stisla.js"></script>

        <!-- Plugins -->

        <!-- Page Specific JS File -->

        <!-- Template JS File -->
        <script src="../dist/js/scripts.js"></script>
        <script src="../dist/js/custom.js"></script>
    </body>
</html>
