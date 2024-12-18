<?php
    header('Access-Control-Allow-Origin: *');

    $db_name = "school";
    $db_server = "localhost";
    $db_username = "root";
    $db_password = "";

    $conn = new PDO("mysql:host={$db_server};dbname={$db_name};charset=utf8", $db_username, $db_password);
    $conn->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

?>