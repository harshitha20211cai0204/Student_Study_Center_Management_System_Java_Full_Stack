<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Display Student Data</title>
<style>
    body {
        background-color: #ADD8E6;
        font-family: Arial, sans-serif;
    }
    table {
        width: 80%;
        border-collapse: collapse;
        margin: 20px auto;
        background-color: #E6ADBB;
    }
    th, td {
        padding: 8px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }
    th {
        background-color: #f2f2f2;
    }
</style>
</head>
<body>
<h1>Student Study Center Management System</h1>
<h2>Student Data</h2>
<table>
    <tr>
        <th>Student No</th>
        <th>Name</th>
        <th>Email</th>
        <th>Gender</th>
        <th>Age</th>
        <th>Preferences</th>
        <th>Phone</th>
        <th>Department</th>
        <th>Fees</th>
        <th>Semester</th>
        <th>University</th>
    </tr>
<%
Connection con = null;
Statement statement = null;
ResultSet rs = null;
try {
    Class.forName("com.mysql.jdbc.Driver"); 
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/center?characterEncoding=latin1", "root", "root");
    statement = con.createStatement();
    rs = statement.executeQuery("SELECT * FROM study");
    while(rs.next()) {
%>
    <tr>
        <td><%= rs.getInt("sno") %></td>
        <td><%= rs.getString("name") %></td>
        <td><%= rs.getString("email") %></td>
        <td><%= rs.getString("gender") %></td>
        <td><%= rs.getInt("age") %></td>
        <td><%= rs.getString("preferences") %></td>
        <td><%= rs.getString("phone") %></td>
        <td><%= rs.getString("dept") %></td>
        <td><%= rs.getInt("fees") %></td>
        <td><%= rs.getInt("semester") %></td>
        <td><%= rs.getString("university") %></td>
    </tr>
<%
    }
} catch (SQLException | ClassNotFoundException ex) { 
    // Log exception
    ex.printStackTrace();
} finally {
    // Close resources
    try {
        if (rs != null) {
            rs.close();
        }
        if (statement != null) {
            statement.close();
        }
        if (con != null) {
            con.close();
        }
    } catch (SQLException ex) {
        ex.printStackTrace();
    }
}
%>
</table>
</body>
</html>
