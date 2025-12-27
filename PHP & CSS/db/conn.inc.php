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

// Helper to emulate mysql_result behaviour: result_get($result, $row, $field)
if (!function_exists('result_get')){
  function result_get($result, $row, $field=0){
    if ($result === false) return false;
    // ensure numeric row
    $row_index = intval($row);
    if(!$result->data_seek($row_index)) return false;
    $d = $result->fetch_assoc();
    if ($d === null) return false;
    if (is_numeric($field)){
      $vals = array_values($d);
      return isset($vals[intval($field)]) ? $vals[intval($field)] : false;
    }
    return isset($d[$field]) ? $d[$field] : false;
  }
}

?>