<%-- 
    Document   : interReservation
    Created on : Aug 11, 2018, 9:46:28 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <script>
            alert("Your record has been deleted");
        </script>
        
        <% String customer_id = session.getAttribute("customer_id").toString(); 
            response.sendRedirect("handleReservation.jsp?customer_id=" +customer_id);
        %>
        
        
    </body>
</html>
