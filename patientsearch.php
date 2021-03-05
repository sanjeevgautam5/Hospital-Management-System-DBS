<!DOCTYPE html>
 <?php #include("func.php");?>
<html>
<head>
	<title>Patient Details</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
</head>
<body>
<?php
include("newfunc.php");
if(isset($_POST['patient_search_submit']))
{
	$patientid=$_POST['patient_id'];
	$query = "select * from patient where patient_id= '$patientid'";
  $result = mysqli_query($con,$query);
  $row=mysqli_fetch_array($result);
  if($row['patient_id']=="" & $row['patient_name']=="" & $row['patient_phone']=="" & $row['doctor_id']==""){
    echo "<script> alert('No entries found! Please enter valid details');
          window.location.href = 'admin-panel1.php#list-doc';</script>";
  }
  else {
    echo "<div class='container-fluid' style='margin-top:50px;'>
	<div class='card'>
  <div class='card-body' style='background-color:#fffaa4;color:#0e49b5;'>
<table class='table table-hover'>
  <thead>
    <tr>
      <th scope='col'>Patient ID</th>
      <th scope='col'>Name</th>
      <th scope='col'>Phone</th>
      <th scope='col'>Address</th>
      <th scope='col'>Doctor ID</th>
    </tr>
  </thead>
  <tbody>";


  $pid = $row['patient_id'];
  $pname = $row['patient_name'];
  $pphone = $row['patient_phone'];
  $padress = $row['patient_address'];
  $docid = $row['doctor_id'];


  echo "<tr>
    <td>$pid</td>
    <td>$pname</td>
    <td>$pphone</td>
    <td>$padress</td>
    <td>$docid</td>
  </tr>";



echo "</tbody></table><center><a href='admin-panel1.php' class='btn btn-dark'>Back to dashboard</a></div></center></div></div></div>";
}
  }

?>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
</body>
</html>
