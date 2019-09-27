<?php
@ $dbase=new mysqli('localhost', 'root', '', 'pawsitive behaviour');
if (mysqli_connect_error()){
	exit;
}


$ParentSiblingSighted=$_POST['ParentSiblingSighted'];
$PersonalityConcerns=$_POST['PersonalityConcerns'];
$FirstMet=$_POST['FirstMet'];
$WhyThatName=$_POST['WhyThatName'];
$DogID=$_POST['DogID'];


$update_statement=$dbase->prepare("UPDATE generalinfo SET ParentSiblingSighted=?, PersonalityConcerns=?, 
FirstMet=?, WhyThatName=? WHERE DogID=?");

$update_statement->bind_param("ssssi", $ParentSiblingSighted, $PersonalityConcerns, $FirstMet, $WhyThatName, $DogID);
$update_statement->execute();

if (!$update_statement)
{
    echo '-1';
	exit;
}
else
{
	echo $ParentSiblingSighted;
}
?>