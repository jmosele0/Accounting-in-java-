<?php
@ $dbase=new mysqli('localhost', 'root', '', 'pawsitive behaviour');
if (mysqli_connect_error()){
	exit;
}
session_start();
$OwnerID=NULL;
$Email=$_POST['Email'];
$FirstName=$_POST['FirstName'];
$Gender=$_POST['Gender'];
$Couple=NULL;
$AgeRange=$_POST['AgeRange'];
$PostCode=$_POST['PostCode'];
$PrePets=NULL;
$PrePetsList=NULL;
$ObedientDog=NULL;
$ExpectedOutcomes=NULL;
$password=$_POST['password'];
$insert_statement=$dbase->prepare("INSERT INTO owner (OwnerID, Email, FirstName, Gender, Couple, AgeRange, PostCode, PrePets, PrePetsList, ObedientDog, ExpectedOutcomes, password) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
$insert_statement->bind_param("isssssisssss", $OwnerID, $Email, $FirstName, $Gender, $Couple, $AgeRange, $PostCode, $PrePets,
$PrePetsList, $ObedientDog, $ExpectedOutcomes, $password);

$insert_statement->execute();

if (!$insert_statement)
{
	echo '-1';
}

else
{
	$select_statement=$dbase->prepare("SELECT OwnerID FROM owner WHERE Email=?");
	$select_statement->bind_param("s", $Email);
	$select_statement->execute();
    $select_statement->bind_result($OwnerID);
    $select_statement->fetch();
    echo $OwnerID;
    exit;
}
	

?>
