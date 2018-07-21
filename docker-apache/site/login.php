<?php

include("config.php"); 

// connect to the mysql server
$link = mysql_connect($db_host, $db_user, $db_pass)
or die ("Could not connect to mysql because ".mysql_error());

// select the database
mysql_select_db($db_name)
or die ("Could not select database because ".mysql_error());

$match = "select id from $db_table where username = '".$_POST['username']."'
and password = '".$_POST['password']."';"; 

$qry = mysql_query($match)
or die ("Could not match data because ".mysql_error());
$num_rows = mysql_num_rows($qry); 

if ($num_rows <= 0) { 
echo "Sorry, there is no username $username with the specified password.<br>";
echo "<a href=login.html>Try again</a>";
exit; 
} else {

setcookie("loggedin", "TRUE", time()+(3600 * 24));
setcookie("site_username", "$username");
echo "You are now logged in!<br>"; 
echo "Welcome to Group A";
}
?>
