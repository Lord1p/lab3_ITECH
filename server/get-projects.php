<?php
    include("connect.php");
    $projects = $dbh->prepare("SELECT id_projects,name FROM PROJECT");
    $projects->execute();
    $JSONres=array();

    while($row = $projects->fetch(PDO::FETCH_ASSOC)){
    $res = new R();
    $res->id = $row['id_projects']+1;
    $res->name = $row['name'];
    array_push($JSONres,$res);
    }
    $Res=array('projects'=>$JSONres);
    echo json_encode($Res);
?>