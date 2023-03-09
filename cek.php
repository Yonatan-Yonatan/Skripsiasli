<?php
//jika belom login
session_start();
if(empty($_SESSION['isLoggedin'])){
    header("location: logout.php");
}else{
    
}
?>