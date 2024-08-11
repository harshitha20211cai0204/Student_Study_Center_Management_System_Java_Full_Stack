<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Student Data</title>
<style>
    body {
        background-color: #ADD8E6;
        font-family: Arial, sans-serif;
    }
    form {
        margin: 0 auto;
        padding: 20px;
        width: 50%;
        background-color: #E6ADBB;
        border-radius: 10px;
    }
    h1 {
        text-align: center;
        color: #0F2932;
    }
    input[type="text"], input[type="submit"] {
        width: calc(100% - 20px);
        padding: 8px;
        margin: 5px 0;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }
    input[type="submit"] {
        background-color: #4CAF50;
        color: white;
        cursor: pointer;
    }
    input[type="submit"]:hover {
        background-color: #45a049;
    }
</style>
</head>
<body>
<h1>Student Study Center Management System - Search Student Data</h1>
<form action="#" method="post">
    <label for="sno">Enter Student Number to Search:</label>
    <input type="text" id="sno" name="sno" required><br>
    <input type="submit" value="Search">
</form>

<%
if (request.getMethod().equalsIgnoreCase("post")) {
    int snoToSearch = Integer.parseInt(request.getParameter("sno"));
    
    Connection con = null;
    PreparedStatement pstatement = null;
    ResultSet resultSet = null;
    try {
        Class.forName("com.mysql.jdbc.Driver"); 
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/center?characterEncoding=latin1", "root", "root");
        pstatement = con.prepareStatement("SELECT * FROM study WHERE sno=?");
        pstatement.setInt(1, snoToSearch);
        
        resultSet = pstatement.executeQuery();
        if (resultSet.next()) {
%>
<div style="background-color: #E3E4FA; padding: 10px; margin-top: 20px;">
    <h2>Student Details</h2>
    <p><strong>Student Number:</strong> <%= resultSet.getInt("sno") %></p>
    <p><strong>Name:</strong> <%= resultSet.getString("name") %></p>
    <p><strong>Email:</strong> <%= resultSet.getString("email") %></p>
    <p><strong>Gender:</strong> <%= resultSet.getString("gender") %></p>
    <p><strong>Course:</strong> <%= resultSet.getString("preferences") %></p>
    <!-- Add more details as needed -->
</div>
<%
        } else {
%>
<div style="background-color: #FFCDD2; padding: 10px; margin-top: 20px;">
    <p>No record found with Student Number <%= snoToSearch %>.</p>
</div>
<%
        }
    } catch (SQLException | ClassNotFoundException ex) { 
        // Log exception
        ex.printStackTrace();
    } finally {
        // Close resources
        try {
            if (resultSet != null) {
                resultSet.close();
            }
            if (pstatement != null) {
                pstatement.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}
%>
</body>
</html>
