<!DOCTYPE html>
<?php
$con=mysqli_connect("localhost","root","","myhmsdb");

include('newfunc.php');

if(isset($_POST['docsub']))
{
  $doctorid=$_POST['doctorid'];
  $doctor=$_POST['doctor'];
  $spec=$_POST['special'];
  $doctorph=$_POST['doctorph'];
  $demail=$_POST['demail'];
  $doctoradd=$_POST['doctoradd'];
  $hosp_id = $_POST['doctorhpid'];


  $query="insert into doctor(doctor_id,doctor_name,doctor_specialty,doctor_phone,doctor_email,doctor_address,HOSPITAL_id )values('$doctorid','$doctor','$spec','$doctorph','$demail','$doctoradd','$hosp_id')";
  $result=mysqli_query($con,$query);
  print_r($result);
  if($result)
    {
      echo "<script>alert('Doctor added successfully!');</script>";
  }
}

############Patient##########################
if(isset($_POST['patsub']))
{
  $patientid=$_POST['patientid'];
  $patient=$_POST['patient'];
  $patientph=$_POST['patientph'];
  $patientadd=$_POST['patientadd'];
  $doc_id = $_POST['patientdcid'];


  $query="insert into patient(patient_id ,patient_name,patient_phone,patient_address,doctor_id)values('$patientid','$patient','$patientph','$patientadd','$doc_id')";
  $result=mysqli_query($con,$query);
  if($result)
    {
      echo "<script>alert('Patient added successfully!');</script>";
  }
}
#############################################

if(isset($_POST['docsub1']))
{
  $doctorid=$_POST['doctorid'];
  $query="delete from doctor where doctor_id='$doctorid';";
  $result=mysqli_query($con,$query);
  if($result)
    {
      echo "<script>alert('Doctor removed successfully!');</script>";
  }
  else{
    echo "<script>alert('Unable to delete!');</script>";
  }
}

#################Delete Patient
if(isset($_POST['patsub1']))
{
  $patientid=$_POST['patientid'];
  $query="delete from patient where patient_id='$patientid';";
  $result=mysqli_query($con,$query);
  if($result)
    {
      echo "<script>alert('Patient removed successfully!');</script>";
  }
  else{
    echo "<script>alert('Unable to delete!');</script>";
  }
}
##############

?>
<html lang="en">
  <head>


    <!-- Required meta tags -->
    <meta charset="utf-8">
    <link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" type="text/css" href="font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="style.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="vendor/fontawesome/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css?family=IBM+Plex+Sans&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
      <nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <a class="navbar-brand" href="#"><i  aria-hidden="true"></i> DBS 6710 </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <script >
    var check = function() {
  if (document.getElementById('dpassword').value ==
    document.getElementById('cdpassword').value) {
    document.getElementById('message').style.color = '#5dd05d';
    document.getElementById('message').innerHTML = 'Matched';
  } else {
    document.getElementById('message').style.color = '#f55252';
    document.getElementById('message').innerHTML = 'Not Matching';
  }
}

    function alphaOnly(event) {
  var key = event.keyCode;
  return ((key >= 65 && key <= 90) || key == 8 || key == 32);
};
  </script>

  <style >
    .bg-primary {
    background: -webkit-linear-gradient(left, #3931af, #00c6ff);
}

.col-md-4{
  max-width:20% !important;
}

.list-group-item.active {
    z-index: 2;
    color: #fff;
    background-color: #342ac1;
    border-color: #007bff;
}
.text-primary {
    color: #342ac1!important;
}

#cpass {
  display: -webkit-box;
}

#list-app{
  font-size:15px;
}

.btn-primary{
  background-color: #3c50c1;
  border-color: #3c50c1;
}
  </style>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
     <ul class="navbar-nav mr-auto">
       <li class="nav-item">
        <a class="nav-link" href="logout1.php"><i class="fa " aria-hidden="true"></i>Logout</a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="#"></a>
      </li>
    </ul>
  </div>
</nav>
  </head>
  <style type="text/css">
    button:hover{cursor:pointer;}
    #inputbtn:hover{cursor:pointer;}
  </style>
  <body style="padding-top:50px;background-color: #f8f7de;">
   <div class="container-fluid" style="margin-top:50px;">
    <h3 style = "margin-left: 40%; padding-bottom: 20px;font-family: 'IBM Plex Sans', sans-serif;"> HOSPITAL MANAGEMENT SYSTEM </h3>
    <div class="row">
  <div class="col-md-4" style="max-width:25%;margin-top: 3%;">
    <div class="list-group" id="list-tab" role="tablist">
      <!--<a class="list-group-item list-group-item-action active" id="list-dash-list" data-toggle="list" href="#list-dash" role="tab" aria-controls="home">Dashboard</a>-->
      <a class="list-group-item list-group-item-action" href="#list-doc" id="list-doc-list"  role="tab"    aria-controls="home" data-toggle="list">Doctor List</a>
      <a class="list-group-item list-group-item-action" href="#list-pat" id="list-pat-list"  role="tab" data-toggle="list" aria-controls="home">Patient List</a>
      <a class="list-group-item list-group-item-action" href="#list-settings" id="list-adoc-list"  role="tab" data-toggle="list" aria-controls="home">Add Doctor</a>
      <a class="list-group-item list-group-item-action" href="#list-settings1" id="list-ddoc-list"  role="tab" data-toggle="list" aria-controls="home">Delete Doctor</a>
      <a class="list-group-item list-group-item-action" href="#list-settings2" id="list-adpt-list"  role="tab" data-toggle="list" aria-controls="home">Add Pateint</a>
      <a class="list-group-item list-group-item-action" href="#list-settings3" id="list-dpt-list"  role="tab" data-toggle="list" aria-controls="home">Delete Patient</a>
      <a class="list-group-item list-group-item-action" href="#list-hosp" id="list-hosp-list"  role="tab" data-toggle="list" aria-controls="home">HOSPITAL Details</a>

    </div><br>
  </div>
  <div class="col-md-8" style="margin-top: 3%;">
    <div class="tab-content" id="nav-tabContent" style="width: 950px;">


<!--
      <div class="tab-pane fade show active" id="list-dash" role="tabpanel" aria-labelledby="list-dash-list">
        <div class="container-fluid container-fullw bg-white" >
              <div class="row">
               <div class="col-sm-4">
                  <div class="panel panel-white no-radius text-center">
                    <div class="panel-body">
                      <span class="fa-stack fa-2x"> <i class="fa fa-square fa-stack-2x text-primary"></i> <i class="fa fa-users fa-stack-1x fa-inverse"></i> </span>
                      <h4 class="StepTitle" style="margin-top: 5%;">Doctor List</h4>
                      <script>
                        function clickDiv(id) {
                          document.querySelector(id).click();
                        }
                      </script>
                      <p class="links cl-effect-1">
                        <a href="#list-doc" onclick="clickDiv('#list-doc-list')">
                          View Doctors
                        </a>
                      </p>
                    </div>
                  </div>
                </div>

                <div class="col-sm-4" style="left: -3%">
                  <div class="panel panel-white no-radius text-center">
                    <div class="panel-body" >
                      <span class="fa-stack fa-2x"> <i class="fa fa-square fa-stack-2x text-primary"></i> <i class="fa fa-users fa-stack-1x fa-inverse"></i> </span>
                      <h4 class="StepTitle" style="margin-top: 5%;">Patient List</h4>

                      <p class="cl-effect-1">
                        <a href="#app-hist" onclick="clickDiv('#list-pat-list')">
                          View Patients
                        </a>
                      </p>
                    </div>
                  </div>
                </div>


                <div class="col-sm-4">
                  <div class="panel panel-white no-radius text-center">
                    <div class="panel-body" >
                      <span class="fa-stack fa-2x"> <i class="fa fa-square fa-stack-2x text-primary"></i> <i class="fa fa-paperclip fa-stack-1x fa-inverse"></i> </span>
                      <h4 class="StepTitle" style="margin-top: 5%;">Appointment Details</h4>

                      <p class="cl-effect-1">
                        <a href="#app-hist" onclick="clickDiv('#list-app-list')">
                          View Appointments
                        </a>
                      </p>
                    </div>
                  </div>
                </div>
                </div>

                <div class="row">
                <div class="col-sm-4" style="left: 13%;margin-top: 5%;">
                  <div class="panel panel-white no-radius text-center">
                    <div class="panel-body" >
                      <span class="fa-stack fa-2x"> <i class="fa fa-square fa-stack-2x text-primary"></i> <i class="fa fa-list-ul fa-stack-1x fa-inverse"></i> </span>
                      <h4 class="StepTitle" style="margin-top: 5%;">Prescription List</h4>

                      <p class="cl-effect-1">
                        <a href="#list-pres" onclick="clickDiv('#list-pres-list')">
                          View Prescriptions
                        </a>
                      </p>
                    </div>
                  </div>
                </div>


                <div class="col-sm-4" style="left: 18%;margin-top: 5%">
                  <div class="panel panel-white no-radius text-center">
                    <div class="panel-body" >
                      <span class="fa-stack fa-2x"> <i class="fa fa-square fa-stack-2x text-primary"></i> <i class="fa fa-plus fa-stack-1x fa-inverse"></i> </span>
                      <h4 class="StepTitle" style="margin-top: 5%;">Manage Doctors</h4>

                      <p class="cl-effect-1">
                        <a href="#app-hist" onclick="clickDiv('#list-adoc-list')">Add Doctors</a>
                        &nbsp|
                        <a href="#app-hist" onclick="clickDiv('#list-ddoc-list')">
                          Delete Doctors
                        </a>
                      </p>
                    </div>
                  </div>
                </div>
                </div>




              </div>
            </div>
-->








      <div class="tab-pane fade" id="list-doc" role="tabpanel" aria-labelledby="list-home-list">


              <div class="col-md-8">
      <form class="form-group" action="doctorsearch.php" method="post">
        <div class="row">
        <div class="col-md-10"><input type="text" name="doctor_id" placeholder="Enter Doctor ID" class = "form-control"></div>
        <div class="col-md-2"><input type="submit" name="doctor_search_submit" class="btn btn-primary" value="Search"></div></div>
      </form>
    </div>
              <table class="table table-hover">
                <thead>
                  <tr>
                    <th scope="col">Doctor Id</th>
                    <th scope="col">Doctor Name</th>
                    <th scope="col">Specialization</th>
                    <th scope="col">Phone Number</th>
                    <th scope="col">Email</th>
                    <th scope="col">Address</th>
                    <th scope="col">HOSPITAL ID</th>

                  </tr>
                </thead>
                <tbody>
                  <?php
                    $con=mysqli_connect("localhost","root","","myhmsdb");
                    global $con;
                    $query = "select * from doctor";
                    $result = mysqli_query($con,$query);
                    while ($row = mysqli_fetch_array($result)){
                      $doctorid = $row['doctor_id'];
                      $doctor = $row['doctor_name'];
                      $special = $row['doctor_specialty'];
                      $doctorph = $row['doctor_phone'];
                      $demail = $row['doctor_email'];
                      $doctoradd = $row['doctor_address'];
                      $doctorhpid = $row['HOSPITAL_id'];

                      echo "<tr>
                        <td>$doctorid</td>
                        <td>$doctor</td>
                        <td>$special</td>
                        <td>$doctorph</td>
                        <td>$demail</td>
                        <td>$doctoradd</td>
                        <td>$doctorhpid</td>
                      </tr>";
                    }

                  ?>
                </tbody>
              </table>
        <br>
      </div>

<!-- HOSPITALDetails-->
<div class="tab-pane fade" id="list-hosp" role="tabpanel" aria-labelledby="list-hosp-list">


  <div class="col-md-8">
<form class="form-group" action="HOSPITALsearch.php" method="post">
  <div class="row">
  <div class="col-md-10"><input type="text" name="HOSPITAL_id" placeholder="Enter HOSPITAL ID" class = "form-control"></div>
  <div class="col-md-2"><input type="submit" name="HOSPITAL_search_submit" class="btn btn-primary" value="Search"></div></div>
</form>
</div>
        <table class="table table-hover">
          <thead>
            <tr>
              <th scope="col">HOSPITAL Id</th>
              <th scope="col">HOSPITAL Name</th>
              <th scope="col">Address</th>
            </tr>
          </thead>
          <tbody>
            <?php
              $con=mysqli_connect("localhost","root","","myhmsdb");
              global $con;
              $query = "select * from HOSPITAL";
              $result = mysqli_query($con,$query);
              while ($row = mysqli_fetch_array($result)){
                $HOSPITALid = $row['HOSPITAL_id'];
                $HOSPITAL = $row['HOSPITAL_name'];
                $HOSPITALadd = $row['HOSPITAL_address'];

                echo "<tr>
                  <td>$HOSPITALid</td>
                  <td>$HOSPITAL</td>
                  <td>$HOSPITALadd</td>
                </tr>";
              }

            ?>
          </tbody>
        </table>
  <br>
</div>

<!-- Patient Details-->
      <div class="tab-pane fade" id="list-pat" role="tabpanel" aria-labelledby="list-pat-list">

             <div class="col-md-8">
            <form class="form-group" action="patientsearch.php" method="post">
              <div class="row">
              <div class="col-md-10"><input type="text" name="patient_id" placeholder="Enter Patient ID" class = "form-control"></div>
              <div class="col-md-2"><input type="submit" name="patient_search_submit" class="btn btn-primary" value="Search"></div></div>
            </form>
          </div>

                    <table class="table table-hover">
                      <thead>
                        <tr>
                        <th scope="col">Patient ID</th>
                          <th scope="col">Name</th>
                          <th scope="col">Phone</th>
                          <th scope="col">Address</th>
                          <th scope="col">Doctor ID</th>
                        </tr>
                      </thead>
                      <tbody>
                        <?php
                          $con=mysqli_connect("localhost","root","","myhmsdb");
                          global $con;
                          $query = "select * from patient";
                          $result = mysqli_query($con,$query);
                          while ($row = mysqli_fetch_array($result)){
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
                          }

                        ?>
                      </tbody>
                    </table>
              <br>
            </div>

      <div class="tab-pane fade" id="list-pres" role="tabpanel" aria-labelledby="list-pres-list">

       <div class="col-md-8">

        <div class="row">



              <table class="table table-hover">
                <thead>
                  <tr>
                  <th scope="col">Doctor</th>
                    <th scope="col">Patient ID</th>
                    <th scope="col">Appointment ID</th>
                    <th scope="col">First Name</th>
                    <th scope="col">Last Name</th>
                    <th scope="col">Appointment Date</th>
                    <th scope="col">Appointment Time</th>
                    <th scope="col">Disease</th>
                    <th scope="col">Allergy</th>
                    <th scope="col">Prescription</th>
                  </tr>
                </thead>
                <tbody>
                  <?php
                    $con=mysqli_connect("localhost","root","","myhmsdb");
                    global $con;
                    $query = "select * from prestb";
                    $result = mysqli_query($con,$query);
                    while ($row = mysqli_fetch_array($result)){
                      $doctor = $row['doctor'];
                      $pid = $row['pid'];
                      $ID = $row['ID'];
                      $fname = $row['fname'];
                      $lname = $row['lname'];
                      $appdate = $row['appdate'];
                      $apptime = $row['apptime'];
                      $disease = $row['disease'];
                      $allergy = $row['allergy'];
                      $pres = $row['prescription'];


                      echo "<tr>
                        <td>$doctor</td>
                        <td>$pid</td>
                        <td>$ID</td>
                        <td>$fname</td>
                        <td>$lname</td>
                        <td>$appdate</td>
                        <td>$apptime</td>
                        <td>$disease</td>
                        <td>$allergy</td>
                        <td>$pres</td>
                      </tr>";
                    }

                  ?>
                </tbody>
              </table>
        <br>
      </div>
      </div>
      </div>




      <div class="tab-pane fade" id="list-app" role="tabpanel" aria-labelledby="list-pat-list">

         <div class="col-md-8">
      <form class="form-group" action="appsearch.php" method="post">
        <div class="row">
        <div class="col-md-10"><input type="text" name="app_contact" placeholder="Enter Contact" class = "form-control"></div>
        <div class="col-md-2"><input type="submit" name="app_search_submit" class="btn btn-primary" value="Search"></div></div>
      </form>
    </div>

              <table class="table table-hover">
                <thead>
                  <tr>
                  <th scope="col">Appointment ID</th>
                  <th scope="col">Patient ID</th>
                    <th scope="col">First Name</th>
                    <th scope="col">Last Name</th>
                    <th scope="col">Gender</th>
                    <th scope="col">Email</th>
                    <th scope="col">Contact</th>
                    <th scope="col">Doctor Name</th>
                    <th scope="col">Consultancy Fees</th>
                    <th scope="col">Appointment Date</th>
                    <th scope="col">Appointment Time</th>
                    <th scope="col">Appointment Status</th>
                  </tr>
                </thead>
                <tbody>
                  <?php

                    $con=mysqli_connect("localhost","root","","myhmsdb");
                    global $con;

                    $query = "select * from appointmenttb;";
                    $result = mysqli_query($con,$query);
                    while ($row = mysqli_fetch_array($result)){
                  ?>
                      <tr>
                        <td><?php echo $row['ID'];?></td>
                        <td><?php echo $row['pid'];?></td>
                        <td><?php echo $row['fname'];?></td>
                        <td><?php echo $row['lname'];?></td>
                        <td><?php echo $row['gender'];?></td>
                        <td><?php echo $row['email'];?></td>
                        <td><?php echo $row['contact'];?></td>
                        <td><?php echo $row['doctor'];?></td>
                        <td><?php echo $row['docFees'];?></td>
                        <td><?php echo $row['appdate'];?></td>
                        <td><?php echo $row['apptime'];?></td>
                        <td>
                    <?php if(($row['userStatus']==1) && ($row['doctorStatus']==1))
                    {
                      echo "Active";
                    }
                    if(($row['userStatus']==0) && ($row['doctorStatus']==1))
                    {
                      echo "Cancelled by Patient";
                    }

                    if(($row['userStatus']==1) && ($row['doctorStatus']==0))
                    {
                      echo "Cancelled by Doctor";
                    }
                        ?></td>
                      </tr>
                    <?php } ?>
                </tbody>
              </table>
        <br>
      </div>

<!--List Bed-->
      <div class="tab-pane fade" id="list-bed" role="tabpanel" aria-labelledby="list-bed-list">

             <div class="col-md-8">

          </div>

                    <table class="table table-hover">
                      <thead>
                        <tr>
                        <th scope="col">Bed ID</th>
                          <th scope="col">Charge per day</th>
                          <th scope="col">Occupancy</th>
                          <th scope="col">RoomId</th>
                        </tr>
                      </thead>
                      <tbody>
                        <?php
                          $con=mysqli_connect("localhost","root","","myhmsdb");
                          global $con;
                          $query = "select * from bed";
                          $result = mysqli_query($con,$query);
                          while ($row = mysqli_fetch_array($result)){
                            $bid = $row['bed_id'];
                            $bcharge = $row['bed_charge'];
                            $bocuup = $row['isoccupied'];
                            $roomid = $row['room_id'];



                            echo "<tr>
                              <td>$bid</td>
                              <td>$bcharge</td>
                              <td>$bocuup</td>
                              <td>$roomid</td>
                            </tr>";
                          }

                        ?>
                      </tbody>
                    </table>
              <br>
            </div>

<div class="tab-pane fade" id="list-messages" role="tabpanel" aria-labelledby="list-messages-list">...</div>

      <div class="tab-pane fade" id="list-settings" role="tabpanel" aria-labelledby="list-settings-list">
        <form class="form-group" method="post" action="admin-panel1.php">
          <div class="row">
                  <div class="col-md-4"><label>Doctor Id:</label></div>
                  <div class="col-md-8"><input type="text" class="form-control" name="doctorid"  required></div><br><br>

                  <div class="col-md-4"><label>Doctor Name:</label></div>
                  <div class="col-md-8"><input type="text" class="form-control" name="doctor" onkeydown="return alphaOnly(event);" required></div><br><br>

                  <div class="col-md-4"><label>Specialization:</label></div>
                  <div class="col-md-8">
                   <select name="special" class="form-control" id="special" required="required">
                      <option value="head" name="spec" disabled selected>Select Specialization</option>
                      <option value="General" name="spec">General</option>
                      <option value="Cardiologist" name="spec">Cardiologist</option>
                      <option value="Neurologist" name="spec">Neurologist</option>
                      <option value="Pediatrician" name="spec">Pediatrician</option>
                    </select>
                    </div><br><br>

                    <div class="col-md-4"><label>Doctor Phone:</label></div>
                    <div class="col-md-8"><input type="text" class="form-control" name="doctorph"  required></div><br><br>

                  <div class="col-md-4"><label>Email ID:</label></div>
                  <div class="col-md-8"><input type="email"  class="form-control" name="demail" required></div><br><br>

                  <div class="col-md-4"><label>Doctor Address:</label></div>
                  <div class="col-md-8"><input type="text" class="form-control" name="doctoradd"  required></div><br><br>

                  <div class="col-md-4"><label>HOSPITAL Id:</label></div>
                  <div class="col-md-8"><input type="text" class="form-control" name="doctorhpid"  required></div><br><br>

                </div>
          <input type="submit" name="docsub" value="Add Doctor" class="btn btn-primary">
        </form>
      </div>

      <!--patient-->
      <div class="tab-pane fade" id="list-settings2" role="tabpanel" aria-labelledby="list-settings2-list">
        <form class="form-group" method="post" action="admin-panel1.php">
          <div class="row">
                  <div class="col-md-4"><label>Patient Id:</label></div>
                  <div class="col-md-8"><input type="text" class="form-control" name="patientid"  required></div><br><br>

                  <div class="col-md-4"><label>Patient Name:</label></div>
                  <div class="col-md-8"><input type="text" class="form-control" name="patient" onkeydown="return alphaOnly(event);" required></div><br><br>


                    <div class="col-md-4"><label>Patient Phone:</label></div>
                    <div class="col-md-8"><input type="text" class="form-control" name="patientph"  required></div><br><br>


                  <div class="col-md-4"><label>Patient Address:</label></div>
                  <div class="col-md-8"><input type="text" class="form-control" name="patientadd"  required></div><br><br>

                  <div class="col-md-4"><label>Doctor Id:</label></div>
                  <div class="col-md-8"><input type="text" class="form-control" name="patientdcid"  required></div><br><br>

                </div>
          <input type="submit" name="patsub" value="Add Patient" class="btn btn-primary">
        </form>
      </div>
      <!--patient-->

      <div class="tab-pane fade" id="list-settings1" role="tabpanel" aria-labelledby="list-settings1-list">
        <form class="form-group" method="post" action="admin-panel1.php">
          <div class="row">

                  <div class="col-md-4"><label>Doctor Id</label></div>
                  <div class="col-md-8"><input  class="form-control" name="doctorid" required></div><br><br>

                </div>
          <input type="submit" name="docsub1" value="Delete Doctor" class="btn btn-primary" onclick="confirm('do you really want to delete?')">
        </form>
      </div>

      <div class="tab-pane fade" id="list-settings3" role="tabpanel" aria-labelledby="list-settings3-list">
              <form class="form-group" method="post" action="admin-panel1.php">
                <div class="row">

                        <div class="col-md-4"><label>Patient Id</label></div>
                        <div class="col-md-8"><input  class="form-control" name="patientid" required></div><br><br>

                      </div>
                <input type="submit" name="patsub1" value="Delete Patient" class="btn btn-primary" onclick="confirm('do you really want to delete?')">
              </form>
            </div>

       <div class="tab-pane fade" id="list-attend" role="tabpanel" aria-labelledby="list-attend-list">...</div>

       <div class="tab-pane fade" id="list-mes" role="tabpanel" aria-labelledby="list-mes-list">

         <div class="col-md-8">
      <form class="form-group" action="messearch.php" method="post">
        <div class="row">
        <div class="col-md-10"><input type="text" name="mes_contact" placeholder="Enter Contact" class = "form-control"></div>
        <div class="col-md-2"><input type="submit" name="mes_search_submit" class="btn btn-primary" value="Search"></div></div>
      </form>
    </div>

              <table class="table table-hover">
                <thead>
                  <tr>
                    <th scope="col">User Name</th>
                    <th scope="col">Email</th>
                    <th scope="col">Contact</th>
                    <th scope="col">Message</th>
                  </tr>
                </thead>
                <tbody>
                  <?php

                    $con=mysqli_connect("localhost","root","","myhmsdb");
                    global $con;

                    $query = "select * from contact;";
                    $result = mysqli_query($con,$query);
                    while ($row = mysqli_fetch_array($result)){

                      #$fname = $row['fname'];
                      #$lname = $row['lname'];
                      #$email = $row['email'];
                      #$contact = $row['contact'];
                  ?>
                      <tr>
                        <td><?php echo $row['name'];?></td>
                        <td><?php echo $row['email'];?></td>
                        <td><?php echo $row['contact'];?></td>
                        <td><?php echo $row['message'];?></td>
                      </tr>
                    <?php } ?>
                </tbody>
              </table>
        <br>
      </div>



    </div>
  </div>
</div>
   </div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.1/sweetalert2.all.min.js"></script>
  </body>
</html>
