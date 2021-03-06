<%-- 
    Document   : updateFacility
    Created on : Sep 1, 2018, 11:59:56 AM
    Author     : Lini Eisha
--%>

<%@page import="facilities.event.*"%>
<%@page import="java.sql.ResultSet"%>
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
    <form action="../updatefacilitiesSevelet" method="POST">
            
<table class="table">

    <tbody>
              <%  String f_ID = request.getParameter("event_id");
                  Facility tent = new Tents();
                  
                  ResultSet uTent = tent.findFacility(f_ID);
              %>
      <tr><%while(uTent.next()){%>
          
          <td style="width:30%; text-align:center;">Facility Name</td>
          <td style="width:30%; text-align:center;"><input type="text" name="name" id="name" value="<%= uTent.getString("facilitiyName") %>"/>
      </td>
      <tr>
          <td><input type="hidden" name="id" id="key" value="<%= f_ID %>"/></td>
      </tr>
      <tr>
          <td style="width:30%">Available Quantity</td>
          <td style="width:30%; text-align:center;"><input type="text" name="avalQ" value="<%= uTent.getString("availableQuantity") %>" disabled/></td>
      </tr>
      <tr>
          <td style="width:30%; text-align:center;">Total Quantity</td>
          <td style="width:30%; text-align:center;"><input type="text" name="totalQ" id="totalQ" value="<%= uTent.getString("totalQuantity") %>"/></td>
      </tr>
      <tr>
          <td style="width:30%; text-align:center;">Facility Condition</td>
          <td style="width:30%; text-align:center;"><input type="text" name="condition" value="<%= uTent.getString("facilityCondition") %>" />
              <select name="condition1" style="width:100%;" id="condition">
                                        <option value="">select condition</option>                       
                                        <option value="good">good</option>
                                        <option value="very good">very good</option>
                                        <option value="bad">bad</option>
                                        <option value="very bad">very bad</option>            
                                    </select></td>
                                    <!--<td><button type="buton" class="btn btn-success">Update Changes</button></td>-->
      </tr>
      <tr>
          <td><button type="submit" class="btn btn-success">Update Changes</button></td>
      </tr>
      <%}%>
      
    </tbody>
  </table>
      
        </form>             
</div>          
</html>
