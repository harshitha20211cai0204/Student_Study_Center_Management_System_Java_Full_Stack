<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Study Center Management System - Insert</title>
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
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }
    th, td {
        padding: 8px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }
    th {
        background-color: #f2f2f2;
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
<script>
function appendGmail() {
    var emailField = document.getElementsByName('email')[0];
    var emailValue = emailField.value;
    if (!emailValue.endsWith("@gmail.com")) {
        emailField.value = emailValue + "@gmail.com";
    }
}
</script>
</head>
<body>
<h1>Student Study Center Management System</h1>
<form action="insert.jsp" method="post" onsubmit="appendGmail()">
    <table>
        <tr>
            <th width="50%">Student No:</th>
            <td width="50%"><input type="text" name="sno" required></td>
        </tr>
        <tr>
            <th width="50%">Student Name:</th>
            <td width="50%"><input type="text" name="name" required></td>
        </tr>
        <tr>
            <th width="50%">Email Id:</th>
            <td width="50%"><input type="text" name="email" required></td>
        </tr>
        <tr>
            <th width="50%">Student Gender:</th>
            <td width="50%"><input type="text" name="gender" required></td>
        </tr>
        <tr>
            <th width="50%">Age:</th>
            <td width="50%"><input type="text" name="age" required></td>
        </tr>
        <tr>
            <th width="50%">Preferences:</th>
            <td width="50%">
                <input type="checkbox" name="preferences" value="Python"> Python<br>
                <input type="checkbox" name="preferences" value="Java"> Java<br>
                <input type="checkbox" name="preferences" value="C"> C<br>
                <input type="checkbox" name="preferences" value="C++"> C++<br>
            </td>
        </tr>
        <tr>
            <th width="50%">Phone Number:</th>
            <td width="50%"><input type="text" name="phone" required></td>
        </tr>
        <tr>
            <th width="50%">Department:</th>
            <td width="50%"><input type="text" name="dept" required></td>
        </tr>
        <tr>
            <th width="50%">Student Fees:</th>
            <td width="50%"><input type="text" name="fees" required></td>
        </tr>
        <tr>
            <th width="50%">Semester:</th>
            <td width="50%">
                <select name="semester" required>
                    <option value="">Select Semester</option>
                    <option value="1">1st Semester</option>
                    <option value="2">2nd Semester</option>
                    <option value="3">3rd Semester</option>
                    <option value="4">4th Semester</option>
                    <option value="5">5th Semester</option>
                    <option value="6">6th Semester</option>
                    <option value="7">7th Semester</option>
                    <option value="8">8th Semester</option>
                </select>
            </td>
        </tr>
        <tr>
            <th width="50%">University:</th>
            <td width="50%"><input type="text" name="university" required></td>
        </tr>
        <tr>
            <td colspan="2" align="center"><input type="submit" value="Submit"></td>
        </tr>
    </table>
<%
int uq = 0;
try {
    Class.forName("com.mysql.jdbc.Driver"); 
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/center?characterEncoding=latin1","root","root");
    PreparedStatement pstatement = con.prepareStatement("INSERT INTO study VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
    pstatement.setInt(1, Integer.valueOf(request.getParameter("sno")));
    pstatement.setString(2, request.getParameter("name"));
    pstatement.setString(3, request.getParameter("email"));
    pstatement.setString(4, request.getParameter("gender"));
    pstatement.setInt(5, Integer.valueOf(request.getParameter("age")));
    pstatement.setString(6, request.getParameter("preferences"));
    pstatement.setString(7, request.getParameter("phone"));
    pstatement.setString(8, request.getParameter("dept"));
    pstatement.setInt(9, Integer.valueOf(request.getParameter("fees")));
    pstatement.setInt(10, Integer.valueOf(request.getParameter("semester")));
    pstatement.setString(11, request.getParameter("university"));
    uq = pstatement.executeUpdate();
    pstatement.close();
    con.close();
} catch(Exception ex) { 
    //out.println("Unable to connect to database.");
}
if (uq != 0) {
%>
<br>
<TABLE style="background-color: #E3E4FA;" WIDTH="30%" border="1">
<tr><th>Data is inserted successfully in database.</th></tr>
</table>
<%
} 
%> 
</form> 
</body>
</html>
