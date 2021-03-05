<!DOCTYPE html>
 <?php #include("func.php");?>
<html>
<head>
	<title>Doctor Details</title>
  <link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
</head>
<body>
<?php
include("newfunc.php");
if(isset($_POST['doctor_search_submit']))
{
	$doctorid=$_POST['doctor_id'];
  $query = "select * from doctor where doctor_id= '$doctorid'";
  $result = mysqli_query($con,$query);
  $row=mysqli_fetch_array($result);
  if($row['doctor_id']=="" & $row['doctor_name']=="" & $row['doctor_email']=="" & $row['hospital_id']==""){
    echo "<script> alert('No entries found!');
          window.location.href = 'admin-panel1.php#list-doc';</script>";
  }
  else {
    echo "<div class='container-fluid' style='margin-top:50px;'>
	<div class ='card'>
	<div class='card-body' style='background-color:#fffaa4;color:#0e49b5;'>
<table class='table table-hover'>
  <thead>
    <tr>
      <th scope='col'>Doctor Id</th>
      <th scope='col'>Doctor Name</th>
      <th scope='col'>Specialization</th>
      <th scope='col'>Phone Number</th>
      <th scope='col'>Email</th>
      <th scope='col'>Address</th>
      <th scope='col'>Hospital ID</th>
    </tr>
  </thead>
  <tbody>";

	// while ($row=mysqli_fetch_array($result)){
  $doctorid = $row['doctor_id'];
  $doctor = $row['doctor_name'];
  $special = $row['doctor_specialty'];
  $doctorph = $row['doctor_phone'];
  $demail = $row['doctor_email'];
  $doctoradd = $row['doctor_address'];
  $doctorhpid = $row['hospital_id'];

  echo "<tr>
    <td>$doctorid</td>
    <td>$doctor</td>
    <td>$special</td>
    <td>$doctorph</td>
    <td>$demail</td>
    <td>$doctoradd</td>
    <td>$doctorhpid</td>
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
