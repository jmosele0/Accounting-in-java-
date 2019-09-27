<?php
@ $dbase=new mysqli('localhost', 'root', '', 'pawsitive behaviour');
if (mysqli_connect_error()){
	exit;
}
session_start();
$Email=$_POST['Email'];
$password=$_POST['password'];
$select_query=$dbase->prepare("SELECT OwnerID, Email, password FROM owner WHERE Email=? AND password=?");
$select_query->bind_param("ss", $Email, $password);
$select_query->execute();
$select_query->bind_result($OwnerID, $Email, $password );
$select_query->fetch();
echo $OwnerID;
exit;
?>