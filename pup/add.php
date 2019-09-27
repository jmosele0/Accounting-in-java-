<?php
@ $dbase=new mysqli('localhost', 'root', '', 'pawsitive behaviour');
if (mysqli_connect_error()){
	exit;
}
session_start();
$PrePets=$_POST['PrePets'];
$PrePetsList=$_POST['PrePetsList'];
$ObedientDog=$_POST['ObedientDog'];
$ExpectedOutcomes=$_POST['ExpectedOutcomes'];
$OwnerID=$_POST['OwnerID'];
$update_query=$dbase->prepare("UPDATE owner SET PrePets=?, PrePetsList=?, ObedientDog=?, 
ExpectedOutcomes=? WHERE OwnerID=?");
$update_query->bind_param("ssssi", $PrePets, $PrePetsList, $ObedientDog, $ExpectedOutcomes, $OwnerID );
$update_query->execute();
if (!$update_query)
{
	echo '-1';
}
else
{
	echo $OwnerID;
}
exit;
?>