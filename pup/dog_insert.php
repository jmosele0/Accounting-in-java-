<?php
@ $dbase=new mysqli('localhost', 'root', '', 'pawsitive behaviour');
if (mysqli_connect_error()){
	exit;
}

$DogID=NULL;
$DogName=$_POST['DogName'];
$Age=$_POST['Age'];
$Breed=$_POST['Breed'];
$Sex=$_POST['Sex'];
$Desexed=$_POST['Desexed'];
$DOB=$_POST['DOB'];
$HowLongOwned=$_POST['HowLongOwned'];
$VaccinationStatus=NULL;
$DogOrigin=NULL;
$OwnerID=$_POST['OwnerID'];



$insert_statement=$dbase->prepare("INSERT INTO dog (DogID, DogName, Age, Breed, Sex, Desexed, DOB, HowLongOwned, VaccinationStatus, DogOrigin, OwnerID) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

$insert_statement->bind_param("isisssssssi", $DogID, $DogName, $Age, $Breed, $Sex, $Desexed, $DOB, $HowLongOwned, $VaccinationStatus, $DogOrigin, $OwnerID);
$insert_statement->execute();

if (!$insert_statement)
{
    echo '-1';
	exit;
}
else
{
    echo $OwnerID;
}

?>

