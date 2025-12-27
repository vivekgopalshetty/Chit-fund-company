<?php

ob_start();
session_start();
require 'conn.inc.php';
$current_file = $_SERVER['SCRIPT_NAME'];

function loggedin(){
  if(isset($_SESSION['user_id']) && !empty($_SESSION['user_id'])){
    return True;
  }
  else{
    return False;
  }
}

function userlevel($exp){
  global $connection;
  if (!isset($_SESSION['user_id']) || empty($_SESSION['user_id'])){
    return False;
  }
  $user = (string) $_SESSION['user_id'];
  if (!isset($connection)){
    require 'conn.inc.php';
  }
  $query = "SELECT `user_level` FROM `user_master` WHERE `id`='" . $connection->real_escape_string($user) . "'";
  if($query_result = $connection->query($query)){
    if($query_result->num_rows == 1){
      $row = $query_result->fetch_assoc();
      $level = $row['user_level'];
      if($level == $exp){
        //echo 'Yes';
        return True;

      }
      else{
        //echo 'No!';
        return False;
      }
    }
  }
}

?>