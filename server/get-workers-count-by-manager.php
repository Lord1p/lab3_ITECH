<?php
    include("connect.php");
    
    $json = file_get_contents('php://input');
    $data = json_decode($json);
    $MANAGER = $data->manager-1;

    $Count = $dbh->prepare("SELECT Count(ID_Worker) FROM WORKER 
    WHERE WORKER.FID_DEPARTMENT =:manager");
    $Count->bindParam(':manager',$MANAGER);
    $Count->execute();

    
    $res = new R();
    $row = $Count->fetchAll(PDO::FETCH_NUM);
    $res->workersCount = (int)$row[0][0];
    echo json_encode($res);
    
?>

