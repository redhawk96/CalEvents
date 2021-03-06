<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<!-- Top container -->
<div class="w3-bar w3-top w3-black w3-large" style="z-index:4">
    <button class="w3-bar-item w3-button w3-hide-large w3-hover-none w3-hover-text-light-grey" onclick="w3_open();"><i class="fa fa-bars"></i> &nbsp;Menu</button>
    <span class="w3-bar-item w3-right"><span style="background-image: linear-gradient(to bottom, red, transparent); padding: 0 5px">S</span>IMCOE <span style="background-image: linear-gradient(to bottom, darkcyan, transparent); padding: 0 5px">B</span>LUE & JAZZ</span>
</div>
<!--End of Top container -->

<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
    <div class="w3-container w3-row">
        <div class="w3-col s4">
            <a href="Profile"><img src="${p_avatar}" class="w3-circle w3-margin-right" style="width:46px"></a>
        </div>
        <div class="w3-col s8 w3-bar">
            <span>Welcome, <strong>${p_first_name} ${p_last_name}</strong></span><br>
            <div class='w3-dropdown-hover'>
                <button class='w3-button'><i class='fa fa-cog'></i></button>
                <div class='w3-dropdown-content w3-bar-block w3-border'>
                    <a data-toggle="modal" data-target="#logout-modal" style='text-decoration: none;' class='w3-bar-item w3-button'>Logout</a>
                    <a href='Profile' class='w3-bar-item w3-button' style='text-decoration: none;'>Update Profile</a>
                </div>
            </div>
            <a data-toggle="modal" data-target="#leaveRequestModal" class="w3-bar-item w3-button"><i class="fa fa-envelope"></i></a>
        </div>
    </div>
    <hr>
    <div class="w3-container text-center py-3">
        <h5><a href='Dashboard' style='text-decoration: none;' class="${nav00}">Dashboard</a></h5>
    </div>
    <div class="w3-bar-block">
        <a href="#" class="w3-bar-item w3-button w3-padding-16 w3-hide-large w3-dark-grey w3-hover-black" onclick="w3_close()" title="close menu"><i class="fa fa-remove fa-fw"></i>&nbsp; Close Menu</a>

        <a href="New-Employee" class="w3-bar-item w3-button w3-padding w3-hover-blue-gray ${nav01}" style="text-decoration: none"><i class="fa fa-user-tie fa-fw"></i>&nbsp; New Employee</a>
        <a href="Employees" class="w3-bar-item w3-button w3-padding w3-hover-blue-gray ${nav02}" style="text-decoration: none"><i class="fa fa-users fa-fw"></i>&nbsp; Employees</a>
        <a href="Logs" class="w3-bar-item w3-button w3-padding w3-hover-blue-gray ${nav04}" style="text-decoration: none"><i class="fa fa-calendar-alt fa-fw"></i>&nbsp; Activity Log</a>
        <a href="Statistics" class="w3-bar-item w3-button w3-padding w3-hover-blue-gray ${nav05}" style="text-decoration: none"><i class="fa fa-calendar-alt fa-fw"></i>&nbsp; Statistics</a>
        <a href="Schedule-Leaves" class="w3-bar-item w3-button w3-padding w3-hover-blue-gray ${nav06}" style="text-decoration: none"><i class="fa fa-calendar-alt fa-fw"></i>&nbsp; Schedule Leaves</a>
        
        
        
        <!--    <div class="w3-dropdown-hover">
            <button class="w3-button" style="text-decoration: none"><i class="fa fa-users fa-fw"></i>&nbsp; Employees <i class="fa fa-caret-down"></i></button>
            <div class="w3-dropdown-content w3-bar-block">
              <a href="#" class="w3-bar-item w3-button bg-light" style="text-decoration: none">Managers</a>
              <a href="#" class="w3-bar-item w3-button bg-light" style="text-decoration: none">Workers</a>
            </div>
            </div>-->

        <!--    <div class="d-none d-md-block" style="margin-top: 66vh">
                <footer class="w3-container w3-light-grey text-center pt-4 pb-2">
                    <p>Copyright � CalEvents 2018</p>
                </footer>
            </div>--> 
    </div>
</nav>
<!-- End of Sidebar/menu -->


<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>


<div id="snackbar">${message}</div>


<!-- Modal HTML -->
<div id="logout-modal" class="modal fade">
    <div class="modal-dialog modal-confirm">
        <div class="modal-content">
            <div class="modal-header">
                <div class="col-md-2 float-right">
                    <div class="icon-box">
                        <i class="fa fa-exclamation text-warning"></i>
                    </div>
                </div>
                <div class="col-md-9 pl-5">
                    <h4 class="modal-title"> Leaving Office?</h4>
                </div>
                <div class="col">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
            </div>
            <div class="modal-body">
                <p>Once you select leave you wont be able to login back until tomorrow. Want a break? press temporary</p>
            </div>

            <div class="modal-footer">
                <div class="col-md-12">
                    <div class="row">
                        <form action="/CalEvents/Logout" method="POST">
                            <div class="col-md-3 offset-md-5"> <button type="submit" value="Temporary" name="logout" class="btn btn-info p-3">Temporary</button></div>
                        </form>
                        <form action="/CalEvents/Logout" method="POST">
                            <div class="col-md-3 offset-md-5">
                                <button type="submit" name="logout" value="leave" class="btn btn-danger p-3">Leave</button>
                            </div>
                        </form>
                    </div>
                </div> 
            </div>
        </div>

    </div>
</div>


<!-- Modal -->
<div class="modal fade" id="leaveRequestModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="margin-top:12%">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
        <form action="/CalEvents/E-Management/Process-Leave" method="POST">
      <div class="modal-body">
          <div class="form-group">
              <label for="inputAddress">Employee ID</label>
              <input type="text" class="form-control" name="empId" value="${p_id}" readonly>
          </div>
          <div class="form-row">
              <div class="form-group col-md-6">
                  <input type="text" name="action" value="requestLeave" hidden>
                  <input type="text" name="department" value="${p_department}" hidden>
                  <label for="inputCity">Date requested</label>
                  <input type="date" class="form-control" name="date">
              </div>
              <div class="form-group col-md-6">
                  <label for="inputState">Leave type</label>
                  <select name="type" class="form-control">
                      <option selected>Short</option>
                      <option>Full</option>
                  </select>
              </div>
          </div>
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-primary">Request leave</button>
      </div>
      </form>
    </div>
  </div>
</div>
<%@page import="Employee.Business, Employee.Attendance" %>
<%
    try {
        Object authenticate = request.getSession(false).getAttribute("authenticated");
        if (null != authenticate) {

            Object leave = request.getSession(false).getAttribute("ShortLeave");

            if (leave != null) {

                boolean status = Attendance.isTimeForShortLeave();
                if (status == true) {
                    request.getSession().setAttribute("ForceSignOut", "Your session for today has expired !");
                    response.sendRedirect("/CalEvents/ForceLogOut");
                }
            }

            if (Business.setAutoLogOut() == true) {
                request.getSession().setAttribute("ForceSignOut", "Operating hours are now closed !");
                response.sendRedirect("/CalEvents/ForceLogOut");
            }

        } else {
            response.sendRedirect("/CalEvents/Admin");
        }
    } catch (Exception e) {
        out.println(e);
    }
%>