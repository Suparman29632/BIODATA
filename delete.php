<?php
header('Content-Type: application/json');
include "conn.php";

$id = (int) $_POST['id'];
$stmt = $conn->prepare("DELETE FROM siswa WHERE id = ?");
$result = $stmt->execute([$id]);

echo json_encode([
    'id' => $id,
    'success' => $result
]);
?>