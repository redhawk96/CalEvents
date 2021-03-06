<!-- Top container -->
<div class="w3-bar w3-top w3-black w3-large" style="z-index:4">
  <button class="w3-bar-item w3-button w3-hide-large w3-hover-none w3-hover-text-light-grey" onclick="w3_open();"><i class="fa fa-bars"></i> &nbsp;Menu</button>
    <span class="w3-bar-item w3-right">Simcoes Blues & Jazz</span>
</div>
<!--End of Top container -->

<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
  <div class="w3-container w3-row">
      <img src="../External/images/SB.PNG" class="w3-bar w3-margin-right" style="width:160px"><br>

    <div class="w3-col s4">
          </div>
    <div class="w3-col s8 w3-bar">
      <span>Welcome, <strong>Mike</strong></span><br>
      <a href="#" class="w3-bar-item w3-button"><i class="fa fa-envelope"></i></a>
      <a href="#" class="w3-bar-item w3-button"><i class="fa fa-user"></i></a>
      <a href="#" class="w3-bar-item w3-button"><i class="fa fa-cog"></i></a>
    </div>
  </div>
  <hr>
  <div class="_ontainer">
    <h5>Dashboard</h5>
  </div>
  <div class="w3-bar-block">
    <a href="#" class="w3-bar-item w3-button w3-padding-16 w3-hide-large w3-dark-grey w3-hover-black" onclick="w3_close()" title="close menu"><i class="fa fa-remove fa-fw"></i>&nbsp; Close Menu</a>
    <a href="index.jsp" class="w3-bar-item w3-button w3-padding w3-blue" style="text-decoration: none"><i class="fa fa-users fa-fw"></i>&nbsp; Dashboard</a>
    <a href="calendarview.jsp" class="w3-bar-item w3-button w3-padding bg-light" style="text-decoration: none"><i class="fa fa-users fa-fw"></i>&nbsp; Calendar</a>
    <a href="Stats.jsp" class="w3-bar-item w3-button w3-padding bg-light" style="text-decoration: none"><i class="fa fa-users fa-fw"></i>&nbsp; Statistics</a>

    <div class="w3-dropdown-hover">
    <button class="w3-button" style="text-decoration: none"><i class="fa fa-users fa-fw"></i>&nbsp; Events <i class="fa fa-caret-down"></i></button>
    <div class="w3-dropdown-content w3-bar-block">
      <a href="insertEvent.jsp" class="w3-bar-item w3-button bg-light" style="text-decoration: none">Add Public Events</a>
      <a href="insert_B_events.jsp" class="w3-bar-item w3-button bg-light" style="text-decoration: none">Add Booked Events</a>
      <a href="insert_P_events.jsp" class="w3-bar-item w3-button bg-light" style="text-decoration: none">Add  Private Events</a>
    </div>
    </div>
    <div class="w3-dropdown-hover">
        <button class="w3-button" style="text-decoration: none"><i class="fa fa-users fa-fw"></i>&nbsp; Events List <i class="fa fa-caret-down"></i></button>
        <div class="w3-dropdown-content w3-bar-block">
      <a href="eventListP.jsp" class="w3-bar-item w3-button bg-light" style="text-decoration: none">Public Events List</a>
      <a href="eventListB.jsp" class="w3-bar-item w3-button bg-light" style="text-decoration: none">Booked Events List</a>
      <a href="eventListRequest.jsp" class="w3-bar-item w3-button bg-light" style="text-decoration: none">Private Events Request List</a>
    </div>
 <a href="#" class="w3-bar-item w3-button w3-padding" style="text-decoration: none"><i class="fa fa-users fa-fw"></i>&nbsp; Profile</a>        
        <%--<a href="#" class="w3-bar-item w3-button w3-padding" style="text-decoration: none"><i class="fa fa-users fa-fw"></i>&nbsp; Profile</a>
    <a href="#" class="w3-bar-item w3-button w3-padding" style="text-decoration: none"><i class="fa fa-bullseye fa-fw"></i>&nbsp; Geo</a>
    <a href="#" class="w3-bar-item w3-button w3-padding" style="text-decoration: none"><i class="fa fa-truck fa-fw"></i>&nbsp; Orders</a>
    <a href="#" class="w3-bar-item w3-button w3-padding" style="text-decoration: none"><i class="fa fa-bell fa-fw"></i>&nbsp; News</a>
    <a href="#" class="w3-bar-item w3-button w3-padding" style="text-decoration: none"><i class="fa fa-bank fa-fw"></i>&nbsp; General</a>
    <a href="#" class="w3-bar-item w3-button w3-padding" style="text-decoration: none"><i class="fa fa-history fa-fw"></i>&nbsp; History</a>
    <a href="#" class="w3-bar-item w3-button w3-padding" style="text-decoration: none"><i class="fa fa-cog fa-fw"></i>&nbsp; Settings</a><br><br>--%>
  </div>
</nav>
<!-- End of Sidebar/menu -->


<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>