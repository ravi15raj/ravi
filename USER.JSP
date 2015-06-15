<%@page import="java.sql.ResultSet"%>
<%@page import="com.gjcambrick.hterp.db.DBConnection"%>
<html>
<head>
<title>TGF</title>
<link rel="shortcut icon" href="images/logo.png" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<script src="js/jquery.min.js"></script>
<script src="js/skel.min.js"></script>
<script src="js/init.js"></script>
<noscript>
	<link rel="stylesheet" href="css/skel.css" />
	<link rel="stylesheet" href="css/style.css" />
	<link rel="stylesheet" href="css/style-xlarge.css" />
</noscript>
</head>
<body id="top">
	<!-- Main -->
	<section id="main" class="wrapper style1">
		<header class="major">
			<h2>Create New User</h2>
			<p>Master entry for Users</p>
		</header>
		<center>
			<div class="container">
				<form action=UsersAdd.jsp method=post>
					<table border=0>
						<tr>
							<td>User Type</td>
							<td><select name=usertype>
									<option>Tejasthan Admin</option>
									<option>Vertical Admin</option>
									<option>Super Admin</option>
							</select></td>
						</tr>
						<tr>
							<td>Admin</td>
							<td><select name=admin_id>
									<%
										ResultSet rs = DBConnection
												.fireSelect("select user_id,first_name,last_name from users where user_type='Super Admin' or user_type='Vertical Admin'");
										while (rs.next()) {
											out.println("<option value=" + rs.getInt("user_id") + ">"
													+ rs.getString("first_name") + " "
													+ rs.getString("last_name") + "</option>");
										}
										rs.close();
										rs = null;
									%>
							</select></td>
						</tr>
						<tr>
							<td>Username</td>
							<td><input type=text name=username></td>
						</tr>
						<tr>
							<td>Password</td>
							<td><input type=password name=pwd></td>
						</tr>
						<tr>
							<td>First Name</td>
							<td><input type=text name=fname></td>
						</tr>
						<tr>
							<td>Last Name</td>
							<td><input type=text name=lname></td>
						</tr>
						<tr>
							<td>Contact Number</td>
							<td><input type=text name=contactnumber></td>
						</tr>
						<tr>
							<td>Email ID</td>
							<td><input type=text name=emailid></td>
						</tr>
						<tr>
							<td>Tejsthan</td>
							<td><select name=tejsthan_id>
									<%
										rs = DBConnection
												.fireSelect("select center_name,center_id from center");
										while (rs.next()) {
											out.println("<option value=" + rs.getInt("center_id") + ">"
													+ rs.getString("center_name") + "</option>");
										}
										rs.close();
										rs = null;
									%>
							</select></td>
						</tr>
						<tr>
							<td><input type=submit value=Add></td>
							<td><input type=reset value=Clear></td>
						</tr>
					</table>
					<a href="MasterEntries.jsp">Home</a>
				</form>
			</div>
	</section>

	<!-- Footer -->
	<footer id="footer">
		<div class="container">
			<div class="row double">

				<div class="6u">
					<h2>GJ CAMBRiCK Software Pvt Ltd</h2>
					<p>Startup specialist with expertise in Mobile Application
						Development.</p>
					<ul class="icons">
						<li><a href="#" class="icon fa-twitter"><span
								class="label">Twitter</span></a></li>
						<li><a href="#" class="icon fa-facebook"><span
								class="label">Facebook</span></a></li>
						<li><a href="#" class="icon fa-instagram"><span
								class="label">Instagram</span></a></li>
						<li><a href="#" class="icon fa-linkedin"><span
								class="label">LinkedIn</span></a></li>
						<li><a href="#" class="icon fa-pinterest"><span
								class="label">Pinterest</span></a></li>
					</ul>
				</div>
			</div>
			<ul class="copyright">
				<li>&copy; All rights reserved.</li>
				<li>Design: <a href="gjcambrick.com">GJ CAMBRiCK Software</a></li>
			</ul>
		</div>
	</footer>
</body>
</html>
