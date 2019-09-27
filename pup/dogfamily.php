<?php
@ $dbase=new mysqli('localhost', 'root', '', 'pawsitive behaviour');
if (mysqli_connect_error()){
	exit;
}

$Adults=$_POST['Adults'];
$Children=$_POST['Children'];
$OtherDogs=$_POST['OtherDogs'];
$OtherAnimals=$_POST['OtherAnimals'];
$DogID=$_POST['DogID'];

$insert_statement=$dbase->prepare("INSERT INTO dogfamily (DogFamilyID, Adults, Children, OtherDogs, OtherAnimals, DogID) VALUES (?, ?, ?, ?, ?, ?)");

$insert_statement->bind_param("issssi", $DogFamilyID, $Adults, $Children, $OtherDogs, $OtherAnimals, $DogID);
$insert_statement->execute();

if (!$insert_statement)
{
    echo '-1';
	exit;
}

?>
