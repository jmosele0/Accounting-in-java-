<?php
@ $dbase=new mysqli('localhost', 'root', '', 'pawsitive behaviour');
if (mysqli_connect_error()){
	exit;
}
session_start();
$OwnerID=$_POST['OwnerID'];
$select_query=$dbase->prepare("SELECT DogID, DogName, Age, Breed, Sex, Desexed, DOB, 
HowLongOwned, VaccinationStatus, DogOrigin FROM dog WHERE OwnerID=?");
$select_query->bind_param("i", $OwnerID);
$select_query->execute();
/*if ($select_query->num_rows==0){
	echo '-1';
	echo $select_query->num_rows;
	exit;
}*/

$select_query->bind_result($DogID, $DogName, $Age, $Breed, $Sex, $Desexed, $DOB, 
$HowLongOwned, $VaccinationStatus, $DogOrigin);
echo '[';
while($select_query->fetch()){
echo '{"DogID": "'.$DogID.'", "DogName": "'.$DogName.'", "Age": "'.$Age.'", "Breed": "'.$Breed.'", "Sex": "'.$Sex.
'", "Desexed": "'.$Desexed.'", "DOB": "'.$DOB.'", "HowLongOwned": "'.$HowLongOwned.'", "VaccinationStatus": "'.$VaccinationStatus.'", "DogOrigin": "'.$DogOrigin.'"},';
}
echo ']';
exit;
?>