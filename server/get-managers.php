<?php
    include("connect.php");
    $projects = $dbh->prepare("SELECT id_department,chief FROM department");
    $projects->execute();
    $JSONres=array();
    
    while($row = $projects->fetch(PDO::FETCH_ASSOC)){
    $res = new R();
    $res->id = $row['id_department']+1;
    $res->name = $row['chief'];
    array_push($JSONres,$res);
    }
    $Res=array('managers'=>$JSONres);
    echo json_encode($Res);
?>