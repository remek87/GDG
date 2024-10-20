<?php
require '../belanja/db.php'; // Koneksi ke database

// Cek apakah ada update untuk keterangan, mac_address, petugas_qc, atau tanggal_qc
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['update'])) {
    $id_barang = $_POST['id_barang'];
    $mac_address = $_POST['mac_address'];
    $keterangan = $_POST['keterangan'];
    $petugas_qc = $_POST['petugas_qc']; 
    $tanggal_qc = $_POST['tanggal_qc']; // Input untuk Tanggal QC

    // Update Mac Address, Keterangan, Petugas QC, dan Tanggal QC
    $stmt = $pdo->prepare("UPDATE items SET mac_address = ?, keterangan = ?, petugas_qc = ?, tanggal_qc = ? WHERE id_barang = ?");
    $stmt->execute([$mac_address, $keterangan, $petugas_qc, $tanggal_qc, $id_barang]);

    echo "Data barang berhasil diperbarui!";
}

// Cek apakah tombol "Selesai QC" ditekan
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['selesai_qc'])) {
    $id_barang = $_POST['id_barang'];

    // Update status QC menjadi 'Selesai QC'
    $stmt = $pdo->prepare("UPDATE items SET qc_status = 'Selesai QC' WHERE id_barang = ?");
    $stmt->execute([$id_barang]);

    echo "Barang berhasil ditandai sebagai selesai QC!";
}

// Cek apakah ada request untuk delete
if (isset($_GET['delete'])) {
    $id_barang = $_GET['delete'];

    // Update status QC menjadi 'Menunggu QC' atau hapus item dari database
    $stmt = $pdo->prepare("UPDATE items SET qc_status = 'Menunggu QC' WHERE id_barang = ?");
    $stmt->execute([$id_barang]);

    echo "Barang berhasil dikembalikan ke status Menunggu QC!";
    header("Location: qc_lolos.php");
    exit();
}

// Cek apakah ada pencarian yang dilakukan
$search = '';
if (isset($_GET['search'])) {
    $search = $_GET['search'];
    $stmt = $pdo->prepare("SELECT * FROM items WHERE qc_status = 'Lolos QC' AND (id_barang LIKE ? OR nama_barang LIKE ? OR mac_address LIKE ? OR nama_toko LIKE ?)");
    $stmt->execute(["%$search%", "%$search%", "%$search%", "%$search%"]);
} else {
    // Query untuk mengambil barang dengan status Lolos QC jika tidak ada pencarian
    $stmt = $pdo->query("SELECT * FROM items WHERE qc_status = 'Lolos QC'");
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Barang Lolos QC</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .form-control-inline {
            display: inline-block;
            width: auto;
            vertical-align: middle;
        }
    </style>

</head>
<body>
    <div class="container mt-5">
        <h2 class="mb-4 text-center">Daftar Barang Lolos QC</h2>
        <form class="form-inline mb-3" method="get" action="">
            <input type="text" name="search" class="form-control mr-2" placeholder="Cari Barang" value="<?php echo htmlspecialchars($search); ?>">
            <button type="submit" class="btn btn-primary">Cari</button>
        </form>
        <div class="table-responsive">
            <table class="table table-striped table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th>ID Barang</th>
                        <th>Nama Barang</th>
                        <th>Tipe</th>
                        <th>Mac Address</th>
                        <th>Stok</th>
                        <th>Satuan</th>
                        <th>Nama Toko</th>
                        <th>Ekspedisi</th>
                        <th>Belanja Via</th>
                        <th>Petugas Order</th>
                        <th>Petugas QC</th> <!-- Kolom baru Petugas QC -->
                        <th>Tanggal Order</th>
                        <th>Tanggal Datang</th>
                        <th>Tanggal QC</th> <!-- Kolom Tanggal QC -->
                        <th>Keterangan</th>
                        <th>Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    <?php while ($row = $stmt->fetch()) { ?>
                        <tr>
                            <td><?php echo $row['id_barang']; ?></td>
                            <td><?php echo $row['nama_barang']; ?></td>
                            <td><?php echo $row['tipe_barang']; ?></td>
                            <td>
                                <form method="post" action="">
                                    <input type="hidden" name="id_barang" value="<?php echo $row['id_barang']; ?>">
                                    <input type="text" class="form-control form-control-inline" name="mac_address" value="<?php echo $row['mac_address']; ?>" placeholder="Masukkan Mac Address" style="width: 180px;">
                            </td>
                            <td><?php echo $row['stok']; ?></td>
                            <td><?php echo $row['satuan_barang']; ?></td>
                            <td><?php echo $row['nama_toko']; ?></td>
                            <td><?php echo $row['ekspedisi']; ?></td>
                            <td><?php echo $row['belanja_via']; ?></td>
                            <td><?php echo $row['siapa_order']; ?></td>
                            <td>
                                <!-- Input Petugas QC -->
                                <input type="text" class="form-control form-control-inline" name="petugas_qc" value="<?php echo $row['petugas_qc']; ?>" placeholder="Masukkan Petugas QC" style="width: 180px;">
                            </td>
                            <td><?php echo $row['tanggal_order']; ?></td>
                            <td><?php echo $row['tanggal_datang']; ?></td>
                            <td>
                                <!-- Input untuk Tanggal QC -->
                                <input type="date" class="form-control form-control-inline" name="tanggal_qc" value="<?php echo $row['tanggal_qc']; ?>" style="width: 150px;">
                            </td>
                            <td>
                                <input type="text" class="form-control form-control-inline" name="keterangan" value="<?php echo $row['keterangan']; ?>" placeholder="Masukkan Keterangan" style="width: 250px;">
                            </td>
                            <td>
                                <button type="submit" name="update" class="btn btn-success btn-sm">Update</button>
                                <button type="submit" name="selesai_qc" class="btn btn-primary btn-sm mt-2">Selesai QC</button>
                                </form>
                                <a href="?delete=<?php echo $row['id_barang']; ?>" class="btn btn-danger btn-sm mt-2">Delete</a>
                            </td>
                        </tr>
                    <?php } ?>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
