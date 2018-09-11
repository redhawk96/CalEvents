<%-- 
    Document   : remove
    Created on : Aug 31, 2018, 11:01:46 PM
    Author     : Lini Eisha
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="test.fetch"%>
<!DOCTYPE html>
<html>
    <title>Kitchen</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <%@ include file="Layouts/Styles.jsp" %>

    <body class="w3-light-grey">

        <%@ include file="Layouts/Navigation.jsp" %>

        <!-- !PAGE CONTENT! -->
        <div class="w3-main" style="margin-left:300px;margin-top:43px;">

 


            <style>
                .button {
                    background-color:#009688;
                    border: none;
                    color: white;
                    padding: 10px 25px;
                    text-align: center;
                    text-decoration: none;
                    display: inline-block;
                    font-size: px;
                    margin: 5px 7px;
                    cursor: pointer;
                    align-items: right;
                }
                body h1{
                    background-color: #10707f;
                    color:white;
                    width: 45% ; 
                }
            </style>




            <div>
                <center><h1>Raw Materials </h1></center>
            </div>
            <hr><hr>

            <div class="container" style="align:    ">
            <h1>Remove Raw Materials</h1>
            <hr>
             
            <div class="row">
                
           <%-- <div class="col-6">
                <form action="../removeRaw" method="POST" onclick="submit">
                    <table>
                        
                        <tr>
                            <td>Raw material Name :</td>
                            <td><input type="text" name="name" placeholder="Name" required="" /></td>
                        </tr>
                      
                        <tr>
                            <td></td>
                            <td align="right"><button class="button">DELETE</button>  </td>
                        </tr>
                    </table>              
          /</div>--%> 
            <div class="col-sm-6">
                <!--<form action="../rem" method="POST" onclick="submit">-->
                <table class="table" border="5" width="90%" cellspacing="2" >
                     <thead class="thead-dark">
                        <tr>
                            <th>Raw Materials Name</th>
                            <th>Quantity</th>
                            <th>Quantity Type</th>
                            <th>Unit Price</th>
                           <th> </th>
                        </tr>
                    </thead>

                    <tbody>

                        <%
                            fetch name = new fetch();
                            ResultSet data1 = name.fetchData();
                        %>

                        <%while (data1.next()) {%>
                        <tr>
                            <td><%=data1.getString("name")%></td>
                            <td><%=data1.getString("quantity")%></td>
                            <td><%=data1.getString("qType")%></td>
                            <td style="text-align:right;"><%=data1.getDouble("unit_price")%></td>
                            <td><a href="removeRaw.jsp?name=<%=data1.getString("name") %>" class="button button5">Delete</a></td>
                            <%}%>
                            

                        </tr>
                    </tbody>
                </table>
                <!--</form>-->

            </div>
            </div>
            </div>
    </body>
</html>
