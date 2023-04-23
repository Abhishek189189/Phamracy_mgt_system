        <%
    if(session.getAttribute("admin_user") == null) {
%>
        <script>
            alert("Please login to access this page.");
            window.location.href = "admin_login.jsp";
        </script>
<%
    }
%>

<!DOCTYPE html>
<!-- Designined by CodingLab | www.youtube.com/codinglabyt -->
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <!--<title> Responsiive Admin Dashboard | CodingLab </title>-->
    <link rel="stylesheet" href="admin_style.css">
    <!-- Boxicons CDN Link -->
	<link rel="icon" type="image/x-icon" href="hops_icon.png">
    
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
   </head>
<body>
  <div class="sidebar">
    <div class="logo-details">
      <i class='bx bxl-c-plus-plus'></i>
      <span class="logo_name">Hops Healthcare</span>
    </div>
      <ul class="nav-links">
        <li>
          <a href="#" class="active">
            <i class='bx bx-grid-alt' ></i>
            <span class="links_name">Dashboard</span>
          </a>
        </li>
        <li>
          <a href="pharma_stock.jsp">
            <i class='bx bx-box' ></i>
            <span class="links_name">Pharma Stock</span>
          </a>
        </li>
    
      
     
        
        <li>
          <a href="emp.jsp">
            <i class='bx bx-user' ></i>
            <span class="links_name">Users</span>
          </a>
        </li>
     
       
        <li>
          <a href="admin_category.jsp">
            <i class='bx bx-cog' ></i>
            <span class="links_name">Category</span>
          </a>
        </li>
        <li class="log_out">
          <a href="Admin_logout">
            <i class='bx bx-log-out'></i>
            <span class="links_name">Log out</span>
          </a>
        </li>
      </ul>
  </div>
  <section class="home-section">
    <nav>
      <div class="sidebar-button">
        <i class='bx bx-menu sidebarBtn'></i>
        <span class="dashboard">Dashboard</span>
      </div>

      <div class="profile-details">
        <!--<img src="images/profile.jpg" alt="">-->
        <span class="admin_name">Abhishek Kadiya</span>
        <i class='bx bx-chevron-down' ></i>
      </div>
    </nav>
    <%@ page import="java.sql.*,java.text.SimpleDateFormat,java.text.SimpleDateFormat" 
 %>
    <%
  // Load the PostgreSQL JDBC driver
  Class.forName("org.postgresql.Driver");

  // Establish a connection to the database
  Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost/pharma_mgt_sys", "postgres", "root");

  // Define the SQL query to count the number of users
  String query = "SELECT COUNT(name) FROM users_info";

  // Create a PreparedStatement object with the query
  PreparedStatement pstmt = conn.prepareStatement(query);

  // Execute the query and retrieve the ResultSet
  ResultSet rs = pstmt.executeQuery();

  // Get the user count from the ResultSet
  int userCount = 0;
  if (rs.next()) {
    userCount = rs.getInt(1);
  }
  String query1 = "SELECT COUNT(product_id) FROM products";

  // Create a PreparedStatement object with the query
  PreparedStatement pstmt1 = conn.prepareStatement(query1);

  // Execute the query and retrieve the ResultSet
  ResultSet rs1 = pstmt1.executeQuery();

  // Get the user count from the ResultSet
  int product_cnt = 0;
  if (rs1.next()) {
	  product_cnt = rs1.getInt(1);
  }
%>

    <div class="home-content">
      <div class="overview-boxes">
        <div class="box">
          <div class="right-side">
            <div class="box-topic">Total Users</div>
            <center><div class="number" ><%= userCount %></div></center>
           
          </div>
        </div>
        <div class="box">
          <div class="right-side">
            <div class="box-topic">Medicine type</div>
            <center><div class="number">4</div></center>
            <div class="indicator">
            </div>
          </div>
        </div>
        <div class="box">
          <div class="right-side">
            <div class="box-topic">Total Stock</div>
            <center><div class="number"><%= product_cnt  %></div></center>
           
          </div>
        </div>
        <div class="box">
          <div class="right-side">
            <div class="box-topic">Category</div>
           <center><div class="number">4</div></center> 
         
          </div>
        </div>
      </div>

        </section>

  <script>
   let sidebar = document.querySelector(".sidebar");
let sidebarBtn = document.querySelector(".sidebarBtn");
sidebarBtn.onclick = function() {
  sidebar.classList.toggle("active");
  if(sidebar.classList.contains("active")){
  sidebarBtn.classList.replace("bx-menu" ,"bx-menu-alt-right");
}else
  sidebarBtn.classList.replace("bx-menu-alt-right", "bx-menu");
}
 </script>

</body>
</html>

