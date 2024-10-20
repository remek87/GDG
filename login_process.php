<?php
session_start();
require 'belanja/db.php'; // Koneksi ke database

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = $_POST['username'];
    $password = $_POST['password'];

    // Cek apakah user ada di database
    $stmt = $pdo->prepare("SELECT * FROM users WHERE username = ?");
    $stmt->execute([$username]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    // Jika user ditemukan
    if ($user && password_verify($password, $user['password'])) {
        // Regenerate session ID untuk keamanan
        session_regenerate_id(true);

        // Simpan informasi user di session
        $_SESSION['user_id'] = $user['id'];
        $_SESSION['username'] = $user['username'];
        $_SESSION['role'] = $user['role'];
        $_SESSION['izin_akses'] = json_decode($user['izin_akses'], true);

        // Redirect ke dashboard sesuai role
        if ($user['role'] == 'administrator') {
            header('Location: admin_dashboard.php');
        } elseif ($user['role'] == 'kepala_gudang') {
            header('Location: admin_dashboard.php');
        } else {
            header('Location: admin_dashboard.php');
        }
        exit();
    } else {
        // Jika login gagal
        echo "Username atau password salah!";
    }
}
?>
