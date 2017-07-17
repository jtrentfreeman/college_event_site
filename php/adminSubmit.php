<?php

//Connect To Database

$hostname="127.0.0.1";
$username="root";
$password="matt1";
$dbname="pue";

$conn = mysql_connect($hostname,$username, $password);

if (!$conn)
	die ("<html><script language='JavaScript'>alert('Unable to connect to database! Please try again later.'),history.go(-1)</script></html>");
else
	echo "successful db connection";

mysql_select_db($dbname);

$eName="";
$category="";
$eDescr="";
$eTime="";
$eDate="";
$location="";
$uniId="";
$email="";

if(isset($_POST['name']))
	$eName=$_POST['name'];
if(isset($_POST['category']))
	$category=$_POST['category'];
if(isset($_POST['eDescr']))
	$eDescr=$_POST['eDescr'];
if(isset($_POST['time']))
	$eTime=$_POST['time'];
if(isset($_POST['date']))
	$eDate=$_POST['date'];
if(isset($_POST['location']))
	$location=$_POST['location'];
if(isset($_POST['uniId']))
	$uniId=$_POST['uniId'];
if(isset($_POST['email']))
	$email=$_POST['email'];

echo $eName."<br>";
echo $eDate;

// Add a new record

$sql = "INSERT INTO event (eName, category, eDescr, eTime, eDate, location, uniId, email)
VALUES ($eName, $category, $eDescr, $eTime, $eDate, $location, $uniId, $email)";

if (mysql_query($sql)) {
    echo "New record created successfully";
} else {
    echo "Error: " . $sql . "<br>" . mysql_error($conn);
}

mysql_close($conn);

 ?>