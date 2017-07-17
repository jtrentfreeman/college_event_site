<?php

	//Sample Database Connection Syntax for PHP and MySQL.
	
	//Connect To Database
	
	$hostname="127.0.0.1";
	$username="root";
	$password="matt1";
	$dbname="pue";
	$usertable="university";
	$yourfield = "uDescr";
	
	$conn = mysql_connect($hostname,$username, $password);
	
	if (!$conn)
		die ("<html><script language='JavaScript'>alert('Unable to connect to database! Please try again later.'),history.go(-1)</script></html>");
	mysql_select_db($dbname);
	
	// Add a new record
	/*
	$sql = "INSERT INTO university (uniName, location, uDescr, numStud, photo)
	VALUES ('USF', 'Tampa, FL', 'University of South Florida', '20000', null)";

	if (mysql_query($sql)) {
	    echo "New record created successfully";
	} else {
	    echo "Error: " . $sql . "<br>" . mysql_error($conn);
	}

	mysql_close($conn);*/
	
	# Check If Record Exists
	
	$query = "SELECT * FROM $usertable";
	
	$result = mysql_query($query);
	
	if($result){
		while($row = mysql_fetch_array($result)){
			$name = $row["$yourfield"];
			echo "Name: ".$name."<br/>";
		}
	} 
?>