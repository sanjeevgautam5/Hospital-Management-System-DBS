<!DOCTYPE html>
 <?php #include("func.php");?>
<html>
<head>
	<title>Hospital Details</title>
  <link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
</head>
<body>
<?php
include("newfunc.php");
if(isset($_POST['hospital_search_submit']))
{
	$hospitalid=$_POST['hospital_id'];
  $query = "select * from hospital where hospital_id= '$hospitalid'";
  $result = mysqli_query($con,$query);
  $row=mysqli_fetch_array($result);
  if($row['hospital_id']=="" & $row['hospital_name']==""){
    echo "<script> alert('No entries found!');
          window.location.href = 'admin-panel1.php#list-hosp';</script>";
  }
  else {
    echo "<div class='container-fluid' style='margin-top:50px;'>
	<div class ='card'>
	<div class='card-body' style='background-color:#fffaa4;color:#0e49b5;'>
<table class='table table-hover'>
  <thead>
    <tr>
      <th scope='col'>Hospital Id</th>
      <th scope='col'>Hospital Name</th>
      <th scope='col'>Address</th>
    </tr>
  </thead>
  <tbody>";

	// while ($row=mysqli_fetch_array($result)){
  $hospitalid = $row['hospital_id'];
  $hospital = $row['hospital_name'];
  $hospitaladd = $row['hospital_address'];
  echo "<tr>
    <td>$hospitalid</td>
    <td>$hospital</td>
    <td>$hospitaladd</td>
  </tr>";
	// }
	echo "</tbody></table><center><a href='admin-panel1.php' class='btn btn-dark'>Back to dashboard</a></div></center></div></div></div>";
}
  }


?>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
</body>
</html>
