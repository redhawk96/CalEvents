<%-- 
    Document   : updateFacility
    Created on : Sep 1, 2018, 11:59:56 AM
    Author     : Lini Eisha
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="facilities.event.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style>
            .button {
                background-color: #4CAF50; /* Green */
                border: none;
                color: white;
                padding: 16px 32px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                margin: 4px 2px;
                -webkit-transition-duration: 0.4s; /* Safari */
                transition-duration: 0.4s;
                cursor: pointer;
            }
            
            .button5 {
                background-color: white;
                color: black;
                border: 2px solid #555555;
            }
            .button5:hover {
                background-color: #555555;
                color: white;
            }
</style>
        

</head>
    <body>
        
<div id="tentTable" class="w3-container tableName" style="margin-left: 0%; margin-top: 0%;">       
        <form>
            
<table class="table">
    <thead>
      <tr>
        <th>Tent</th>
        <th>Available Quantity</th>
        <th>Total Quantity</th>
        <th>Condition</th>
        <th>Color</th>
        <th>Size</th>
      </tr>
    </thead>
    <tbody>
              <%  String f_ID = request.getParameter("event_id");
                  Facility tent = new Tents();
                  
                  ResultSet uTent = tent.findFacility(f_ID);
              %>
      <tr><%while(uTent.next()){%>
          <td><%= uTent.getString("facilitiyName") %></td>
          <td><%= uTent.getString("availableQuantity") %></td>
          <td><%= uTent.getString("totalQuantity") %></td>
          <td><input type="text" name="name" value="<%= uTent.getString("facilityCondition") %>" /></td>
          <td><%= uTent.getString("tentColor") %></td>
          <td><%= uTent.getString("tentSize") %></td>
          <td><a href="deleteFacility.jsp?event_id=<%=uTent.getString("facilityID") %>" class="button button5">Update Changes</a></td>
      </tr><%}%>
      
    </tbody>
  </table>
      
        </form>             
</div>          
</html>
