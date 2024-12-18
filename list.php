<?php
header('Content-Type: application/json');
include "conn.php";

$stmt = $conn->prepare("SELECT id, nis, nama, tplahir, tglahir, kelamin, agama, alamat FROM siswa");
$stmt->execute();
$result = $stmt->fetchAll(PDO::FETCH_ASSOC);

echo json_encode($result);
?>