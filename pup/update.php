
<?php
@ $dbase=new mysqli('localhost', 'root', '', 'pawsitive behaviour');
if (mysqli_connect_error()){
	exit;
}
session_start();
$OwnerID=$_POST['OwnerID'];
$Email=$_POST['Email'];
$FirstName=$_POST['FirstName'];
$AgeRange= $_POST['AgeRange'];
$PostCode=$_POST['PostCode'];
$select_query=$dbase->prepare("UPDATE owner SET Email=?, FirstName=?, AgeRange=?, PostCode=? WHERE OwnerID=?");
$select_query->bind_param("sssii", $Email, $FirstName, $AgeRange, $PostCode, $OwnerID);
$select_query->execute();
exit;
?>