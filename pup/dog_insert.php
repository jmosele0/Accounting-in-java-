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
$VaccinationStatus=$_POST['VaccinationStatus'];
$DogOrigin=$_POST['DogOrigin'];
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
	$select_query=$dbase->prepare("SELECT MAX(DogID) FROM dog WHERE OwnerID=?");
    $select_query->bind_param("s", $OwnerID);
    $select_query->execute();
    $select_query->bind_result($DogID);
    $select_query->fetch();
    echo $DogID;
}

?>

