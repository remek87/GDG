<?php
// Pengaturan koneksi database
$host = 'localhost'; // Sesuaikan dengan host database Anda
$dbname = 'gudangv1'; // Nama database Anda
$username = 'root'; // Username database Anda
$password = ''; // Password database Anda (kosongkan jika default XAMPP)

// Membuat koneksi dengan menggunakan PDO
try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    // Setel mode error PDO ke Exception untuk penanganan kesalahan yang lebih baik
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    // Setel encoding karakter agar mendukung UTF-8
    $pdo->exec("set names utf8");
} catch (PDOException $e) {
    // Jika terjadi kesalahan, tampilkan pesan error
    echo "Koneksi ke database gagal: " . $e->getMessage();
    die();
}
?>
