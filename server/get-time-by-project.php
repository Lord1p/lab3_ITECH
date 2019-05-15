<?php
    include("connect.php");

    $json = file_get_contents('php://input');
    $data = json_decode($json);
    $PROJECT = $data->project-1;

    $Count = $dbh->prepare("SELECT SUM(TIMESTAMPDIFF(DAY,time_start,time_end)) FROM WORK WHERE 
    WORK.FID_PROJECTS =:project");
    $Count->bindValue(':project',$PROJECT);
    $Count->execute();

    $row = $Count->fetch(PDO::FETCH_NUM);
    $res = new R();
    $res->time = $row[0];
    echo json_encode($res);
    
    
?>
