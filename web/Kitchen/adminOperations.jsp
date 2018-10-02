<%-- 
    Document   : adminOperations
    Created on : Sep 30, 2018, 10:26:27 PM
    Author     : Lini Eisha
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="test.fetch"%>
<!DOCTYPE html>
<html>
    <head>

        <title>Kitchen</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <%@ include file="Layouts/Styles.jsp" %>

        <%--<%@ include file="Layouts/Navigation.jsp" %>--%>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>



        <style> 
            body h3{

                color:#004085;
                width: 40%;
                align-content: center;
            }

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


                color:#004085;
                width: 45% ; 
            }

            h4{
                color:#0c5460;
                width: 45%;
                height:20%; 
            }

            input[type=text] {
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                box-sizing: border-box;
                border: none;
                background-color: #c0c0c0;
                color: black;
            }

        </style>


        <script>
            
            function addRaw() {
                document.getElementById('moreRaw').style.display = "block";
                $(document).scrollTop($(document).height());
            }


            function displayModal(obj) {
                var rawID = obj;
                //alert(rawID);

                $.post("updateRaw.jsp", {event_id: rawID}, function (data) {
                    $("#updateModal .modal-body").html(data);
                });
                $("#updateModal").modal();
            }

        </script>
    </head>

    <body class="w3-light-grey">

        <%@ include file="Layouts/Navigation.jsp" %>

        <!-- !PAGE CONTENT! -->


        <div class="w3-main" style="margin-left:300px;margin-top:43px;">
            <div>
                <center><h1>Raw Materials </h1></center>
            </div>

           

            <!--<div class="container">-->
            <h1 style="padding-left:0%;">Raw Operations</h1>
            <hr><br>


            <div class="container">
                <ul class="nav nav-pills ">
                    <li class="active"><a data-toggle="tab" href="#ins">Insert  Raw</a></li>
                    <li><a data-toggle="tab" href="#del">Delete Raw</a></li>
                    <li><a data-toggle="tab" href="#upd">Update Stock</a></li>
                    <li><a data-toggle="tab" href="#det">Determine Raw</a></li>
                    <li><a data-toggle="tab" href="#allo">Allocate Raw</a></li>
                </ul>

                <% try { %>
                <div class="tab-content">


                    <%-- insert raw --%>
                    <div id="ins" class="tab-pane fade in active"><br>      
                        <h3>Insert Raw Materials</h3>


                        <div class="row">
                            <div class="col-6">
                                <form action="../ins" method="POST" onclick="submit">
                                    <table class="table table-hover">
                                        <tr>
                                            <td>Raw material Name :</td>
                                            <td><input type="text" name="name"  placeholder="Name" required="" /></td>
                                        </tr>
                                        <tr>
                                            <td>Unit Type :</td>
                                            <td><input type="text" name="Utype"  placeholder="Type" required="" /></td>
                                        </tr>
                                        <tr>
                                            <td>Unit price :</td>
                                            <td><input type="text" name="Uprice"  placeholder="Price" required="" /></td>
                                        </tr>
                                        <tr>
                                            <td> Quantity :</td>
                                            <td><input type="text" name="qty"  placeholder="Quantity" required="" /></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td align="right"><button class="button">INSERT</button>  </td>
                                        </tr>
                                    </table>
                                </form>
                            </div>
                            <div class="col-sm-6-" style="overflow-y:scroll; height:400px;">
                                <div class="">
                                    <table class="table" border="5" width="35%" cellspacing="2" >
                                        <thead class="thead-dark">
                                            <tr>
                                                <th>Raw Materials Name</th>
                                                <th>Quantity</th>
                                                <th>Quantity Type</th>
                                                <th>Unit Price</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                fetch nameI = new fetch();
                                                ResultSet data1 = nameI.fetchData();
                                            %>
                                            <%while (data1.next()) {%>
                                            <tr>
                                                <td class="table-info"><%=data1.getString("name")%></td>
                                                <td class="table-info"><%=data1.getString("quantity")%></td>
                                                <td class="table-info"><%=data1.getString("qType")%></td>
                                                <td class="table-info" style="text-align:right;"><%=data1.getDouble("unit_price")%></td>
                                            </tr>
                                            <%}%>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div> 



                    <%-- delete raw --%>
                    <div id="del" class="tab-pane fade in"><br>      
                        <h3>Delete Raw Materials</h3>

                   

                        <div class="col-sm-8" style="overflow-y:scroll; height:400px;">
                            <table class="table" border="5" width="90%" cellspacing="5">
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
                                        ResultSet data2 = name.fetchData();
                                    %>
                                    <%while (data2.next()) {%>
                                    <tr>
                                        <td style="text-align:center"><%=data2.getString("name")%></td>
                                        <td style="text-align:center"><%=data2.getString("quantity")%></td>
                                        <td style="text-align:center"><%=data2.getString("qType")%></td>
                                        <td style="text-align:center;"><%=data2.getDouble("unit_price")%></td>
                                        <td style="text-align:center"><a href="removeRaw.jsp?name=<%=data2.getString("name")%>" class="btn btn-danger">Delete</a></td>
                                    </tr>
                                    <%}%>
                                </tbody>
                            </table>

                        </div>
                    </div>


                    <%-- update raw --%>
                    <div id="upd" class="tab-pane fade in"><br>      
                        <h3>Update Raw Materials</h3>


                        <div class="col-sm-8" style="overflow-y:scroll; height:400px;" >
                            <table class="table" border="5" width="90%" cellspacing="5" >
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
                                        fetch nameU = new fetch();
                                        ResultSet dataU = name.fetchData();

                                        while (dataU.next()) {%>
                                    <tr>
                                        <td style="text-align:center"><%=dataU.getString("name")%></td>
                                        <td style="text-align:center"><%=dataU.getString("quantity")%></td>
                                        <td style="text-align:center"><%=dataU.getString("qType")%></td>
                                        <td style="text-align:center;"><%=dataU.getDouble("unit_price")%></td>
                                        <td style="text-align:center"><a href="updateRaw.jsp?nameU=<%=dataU.getString("name")%>" class="btn btn-warning">Update</a></td> 
                                        <%--  <td><button class="button" type="button" id="<%=dataU.getString("name")%>" onclick="displayModel(this.name)"> Update </button></td>--%>
                                    </tr>
                                    <%}%>
                                </tbody>
                            </table>
                        </div>
                    </div>



                    <%-- determine raw --%>
                    <div id="det" class="tab-pane fade in">
                        <br>      
                        <h3>Determine Raw Materials</h3>

                        <hr><hr>
                        <div class="col-sm-8" style="overflow-y:scroll; height:400px;">
                            <table class="table" border="5" width="35%" cellspacing="2" >
                                <thead class="thead-dark">
                                    <tr>
                                        <th class="table-info">Menu Name</th>
                                        <th class="table-info">Food Name</th>
                                        <th class="table-info">Ingredients </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        fetch food = new fetch();
                                        ResultSet foodI = food.getFood();
                                    %>
                                    <%while (foodI.next()) {%>
                                    <tr>
                                        <td class="table-info"><%=foodI.getString("category")%></td>
                                        <td class="table-info"><%=foodI.getString("name")%></td>
                                        <td class="table-info"><%=foodI.getString("ingredients")%></td>
                                    </tr>
                                    <%}%>
                                </tbody>
                            </table> 
                        </div>
                        <form action="../detIns" method="POST" onclick="submit">
                            <h4>DETERMINE </h4>
                            <table  class="table table-hover" >
                                <%
                                    fetch items = new fetch();
                                    ResultSet nameitems = items.fetchItems();
                                %>
                                <tr>
                                    <td><select name="nameitems">
                                            <option>Food Name</option>
                                            <%while (nameitems.next()) {%>
                                            <option><%=nameitems.getString("name")%></option>
                                            <%}%>
                                        </select>
                                    </td>
                                    <%

                                        fetch raw = new fetch();
                                        ResultSet names = raw.fetchData();
                                    %>
                                    <td>
                                        <select name="name">
                                            <option>Raw Material Name</option>
                                            <%while (names.next()) {%>
                                            <option><%=names.getString("name")%></option>
                                            <%}%>
                                        </select>
                                    </td>
                                    <td>
                                        <input type="text" name="qty"  placeholder="Quantity" width="20%" required="" />
                                    </td>
                                    <td>
                                    <td align="right"><button class="button" onclick="submit">INSERT</button>  </td> 
                                    </td>
                                </tr> 
                            </table>
                        </form>

                        <table  class="table table-hover">
                            <tr>
                                <td>
                                    <h4>  New Raw Material? </h4>
                                </td>
                                <td> 
                                    <Button type="button"  class="btn btn-outline-info" value="add" onclick="addRaw()">Add Raw Material</button> 
                                </td>
                            </tr>
                        </table>  

                    </div>


                    <%-- Allocate raw  --%>
                    <div id="allo" class="tab-pane fade in"><br>      
                        <h3>Allocate Raw Materials</h3>

                        <hr>

                        <div class="col-sm-8" style="overflow-y:scroll; height:200px;">
                            
                            <table class="table" border="5" width="35%" cellspacing="2" >
                                <thead class="thead-dark">
                                    <tr>
                                        <th class="table-info">Order Name</th>
                                        <th class="table-info">Menu Name</th>
                                        <th class="table-info">Expected Crowd</th>
                                        <th class="table-info">Ingredients </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        fetch order = new fetch();
                                        ResultSet foodO = order.getOderRaw();
                                    %>
                                    <%while (foodO.next()) {%>
                                    <tr>
                                        <td class="table-info"><%=foodO.getString("private_Id")%></td>
                                        <td class="table-info"><%=foodO.getString("name")%></td>
                                        <td class="table-info"><%=foodO.getInt("crowd_expected")%></td>
                                        <td class="table-info"><%=foodO.getString("ingredients")%></td>
                                    </tr>
                                    <%}%>
                                </tbody>
                            </table> 
                        </div>
                                <h4>ALLOCATE</h4>
                                <table  class="table table-hover" >
                                    <%
                                    fetch event = new fetch();
                                    ResultSet eventName = items.fetchItems();
                                %>
                                <tr>
                                    <td><select name="eventList">
                                            <option>Food Name</option>
                                            <%while (eventName.next()) {%>
                                            <option><%=eventName.getString("name")%></option>
                                            <%}%>
                                        </select>
                                    </td>
                                  
                                    <td>
                                         <input type="text" name="crowd"  placeholder="Expected crowd" required=""/>
                                    </td>
                                    <td>
                                         <input type="text" name="ing"  placeholder="ingredients" required=""/>
                                    </td>
                                    <td>
                                         <input type="text" name="qty"  placeholder="Quantity" required=""/>
                                    </td>
                                    <td>
                                         <input type="text" name="tot"  placeholder="Total" required=""/>
                                    </td>
                                </tr>
                                <tr>
                                    
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>
                                       <Button type="button"  class="btn btn-outline-info" value="add" onclick="**">Allocate</button> 
                                    </td>
                                    
                                </tr>
                                    
                                    
                                </table>
                                
                                



                    </div>











                    <%-- More Raw Materials --%>
                    <div id="moreRaw"  style="display:none;" class="addMore">
                        <div id="ins" class="tab-pane fade in active"><br>      
                            <h3>Insert Raw Materials</h3>


                            <hr>
                            <div class="row">
                                <div class="col-6">
                                    <form action="../ins" method="POST" onclick="submit">
                                        <table class="table table-hover">
                                            <tr>
                                                <td>Raw material Name :</td>
                                                <td><input type="text" name="name"  placeholder="Name" required="" /></td>
                                            </tr>
                                            <tr>
                                                <td>Unit Type :</td>
                                                <td><input type="text" name="Utype"  placeholder="Type" required="" /></td>
                                            </tr>
                                            <tr>
                                                <td>Unit price :</td>
                                                <td><input type="text" name="Uprice"  placeholder="Price" required="" /></td>
                                            </tr>
                                            <tr>
                                                <td> Quantity :</td>
                                                <td><input type="text" name="qty"  placeholder="Quantity" required="" /></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td align="right"><button class="button">INSERT</button>  </td>
                                            </tr>
                                        </table>
                                    </form>
                                </div>
                            </div>
                            <%} catch (Exception e) {
                                    out.println(e);
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>
    </body>
</html>
