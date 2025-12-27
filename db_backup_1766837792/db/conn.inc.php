<?php

$host = "localhost";
$user = "root";
$pass = 'root';  // Change from empty to 'root'
$db = "chit_fund_company";

$error_msg = "Sorry, Couldn't connect to MySQL DB";

// Use MySQLi instead of deprecated mysql_connect
$connection = @mysqli_connect($host, $user, $pass, $db);

if (!$connection) {
  die($error_msg);
}

?>