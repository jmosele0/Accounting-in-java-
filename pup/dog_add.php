<?php
@ $dbase=new mysqli('localhost', 'root', '', 'pawsitive behaviour');
if (mysqli_connect_error()){
	exit;
}
$VaccinationStatus=$_POST['VaccinationStatus'];
$DogOrigin=$_POST['DogOrigin'];
$OwnerID=$_POST['OwnerID'];
$update_query=$dbase->prepare("UPDATE dog SET VaccinationStatus=?, DogOrigin=? WHERE OwnerID=?");
$update_query->bind_param("ssi", $VaccinationStatus, $DogOrigin, $OwnerID );
$update_query->execute();
if (!$update_query)
{
	echo '-1';
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
exit;
?>