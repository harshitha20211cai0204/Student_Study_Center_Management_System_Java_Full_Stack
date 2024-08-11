<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Student Data</title>
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
    input[type="text"], select, input[type="submit"] {
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
<h1>Student Study Center Management System </h1>
<form action="#" method="post">
    <label for="sno">Enter Student Number to Update:</label>
    <input type="text" id="sno" name="sno" required><br>
    <label for="name">Name:</label>
    <input type="text" id="name" name="name" required><br>
    <label for="email">Email:</label>
    <input type="text" id="email" name="email" required><br>
    <label for="gender">Gender:</label>
    <input type="text" id="gender" name="gender" required><br>
    <!-- Additional fields for preferences -->
    <label>Preferences:</label><br>
    <input type="checkbox" name="preferences" value="Python"> Python<br>
    <input type="checkbox" name="preferences" value="Java"> Java<br>
    <input type="checkbox" name="preferences" value="C"> C<br>
    <input type="checkbox" name="preferences" value="C++"> C++<br>
    <!-- End of additional fields -->
    <input type="submit" value="Update">
</form>

<%
if (request.getMethod().equalsIgnoreCase("post")) {
    int snoToUpdate = Integer.parseInt(request.getParameter("sno"));
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String gender = request.getParameter("gender");
    String preferences = request.getParameter("preferences");
    // Add additional variables for other attributes as needed
    
    Connection con = null;
    PreparedStatement pstatement = null;
    try {
        Class.forName("com.mysql.jdbc.Driver"); 
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/center?characterEncoding=latin1", "root", "root");
        pstatement = con.prepareStatement("UPDATE study SET name=?, email=?, gender=?, preferences=? WHERE sno=?");
        pstatement.setString(1, name);
        pstatement.setString(2, email);
        pstatement.setString(3, gender);
        pstatement.setString(4, preferences);
        // Set additional parameters for other attributes as needed
        pstatement.setInt(5, snoToUpdate);
        
        int rowsAffected = pstatement.executeUpdate();
        if (rowsAffected > 0) {
%>
<div style="background-color: #E3E4FA; padding: 10px; margin-top: 20px; text-align: center;">
    <p>Record with Student Number <%= snoToUpdate %> has been successfully updated.</p>
</div>
<%
        } else {
%>
<div style="background-color: #FFCDD2; padding: 10px; margin-top: 20px; text-align: center;">
    <p>No record found with Student Number <%= snoToUpdate %>.</p>
</div>
<%
        }
    } catch (SQLException | ClassNotFoundException ex) { 
        // Log exception
        ex.printStackTrace();
    } finally {
        // Close resources
        try {
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
