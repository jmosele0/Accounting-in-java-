<?php
@ $dbase=new mysqli('localhost', 'root', '', 'pawsitive behaviour');
if (mysqli_connect_error()){
	exit;
}

$InfoID=NULL;
$KnowledgeOfBreed=$_POST['KnowledgeOfBreed'];
$ParentSiblingSighted=NULL;
$PersonalityConcerns=NULL;
$FirstMet=NULL;
$WhyThatName=NULL;
$DogID=$_POST['DogID'];




$insert_statement=$dbase->prepare("INSERT INTO generalinfo (InfoID, KnowledgeOfBreed, ParentSiblingSighted, PersonalityConcerns, FirstMet, WhyThatName, DogID) VALUES (?, ?, ?, ?, ?, ?, ?)");

$insert_statement->bind_param("isssssi", $InfoID, $KnowledgeOfBreed, $ParentSiblingSighted, $PersonalityConcerns, $FirstMet, $WhyThatName, $DogID);
$insert_statement->execute();

if (!$insert_statement)
{
    echo '-1';
	exit;
}
else
{
    echo $DogID;
}

?>