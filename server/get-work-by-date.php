<?php
    include("connect.php");
    $json = file_get_contents('php://input');
    $data = json_decode($json);
    $PROJECT = $data->project-1;
    $DATE = $data->date;

    $Info = $dbh->prepare("SELECT time_start,time_end,description FROM WORK, project WHERE
                           WORK.FID_PROJECTS = PROJECT.ID_PROJECTS AND time_end < :date AND ID_PROJECTS = :project");
    $Info->bindValue(':date',$DATE);
    $Info->bindValue(':project',$PROJECT);
    $Info->execute();
    $JSONres=array();
    while($row = $Info->fetch(PDO::FETCH_ASSOC)){
    $res = new R();
    $res->startTime = $row['time_start'];
    $res->endTime = $row['time_end'];
    $res->description = $row['description'];
    array_push($JSONres,$res);
    }
    $Res=array('works'=>$JSONres);
    echo json_encode($Res);
?>
