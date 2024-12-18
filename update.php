<?php
header('Content-Type: application/json');
include "conn.php";

$id = $_POST['id'];
$nama = $_POST['nama'];
$nis = $_POST['nis'];
$tplahir = $_POST['tplahir'];
$tglahir = $_POST['tglahir'];
$kelamin = $_POST['kelamin'];
$agama = $_POST['agama'];
$alamat = $_POST['alamat'];

$stmt = $conn->prepare("UPDATE siswa SET nis = ?, nama = ?, 
tplahir = ?, tglahir = ?, kelamin = ?, agama = ?, alamat = ? WHERE id = ?");
$result = $stmt->execute([$nis, $nama, $tplahir, $tglahir, $kelamin, $agama, $alamat, $id]);

echo json_encode([
    'success' => $result
]);
?>  