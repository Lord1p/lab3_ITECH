<?php
    header("Content-type","application/x-www-form-urlencoded");
    $db_driver = "mysql";
    $host = "localhost";
    $database = "it_labs";
    $dsn = "$db_driver:host=$host;dbname=$database";
    $username = "root";
    $password = "";

    try{
        $dbh = new PDO($dsn,$username,$password);
        //echo "Connected to database<br>";
    }
    catch(PDOException $e){
        echo "Error!:". $e->getMessage()."<br/>";
        die();
    }
    class R{};
    $res = new R();
