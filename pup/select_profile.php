<?php
@ $dbase=new mysqli('localhost', 'root', '', 'pawsitive behaviour');
if (mysqli_connect_error()){
	exit;
}
session_start();
$OwnerID=$_POST['OwnerID'];
$select_query=$dbase->prepare("SELECT Email, FirstName, Gender, AgeRange, PostCode FROM owner WHERE OwnerID=?");
$select_query->bind_param("i", $OwnerID);
$select_query->execute();
$select_query->bind_result($Email, $FirstName, $Gender, $AgeRange, $PostCode);
$select_query->fetch();
echo '{"Email": "'.$Email.'", "FirstName": "'.$FirstName.'", "Gender": "'.$Gender.'", "AgeRange": "'.$AgeRange.'", "PostCode": "'.$PostCode.'"}';
exit;
?>