<?php
require '../belanja/db.php';
// Query untuk mengambil barang dengan status "Menunggu QC"
$stmt = $pdo->query("SELECT * FROM items WHERE qc_status = 'Menunggu QC'");
?>

<!DOCTYPE html>
<html>
<head>
    <title>Dashboard QC</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-4">
        <h2 class="mb-4">Daftar Barang Menunggu QC</h2>
        <table class="table table-striped table-bordered">
            <thead class="thead-dark">
                <tr>
                <th>ID Barang</th>
                <th>Nama Barang</th>
                <th>Type</th>
                <th>Stok</th>
                <th>Satuan</th>
                <th>Nama Toko</th>
                <th>Ekspedisi</th>
                <th>Belanja Via</th>
                <th>Petugas Order</th>
                <th>Tanggal Order</th>
                <th>Tanggal Datang</th>
                    <th>Aksi</th>
                </tr>
            </thead>
            <tbody>
                <?php while ($row = $stmt->fetch()) { ?>
                    <tr>
                    <td><?php echo $row['id_barang']; ?></td>
                    <td><?php echo $row['nama_barang']; ?></td>
                    <td><?php echo $row['tipe_barang']; ?></td>
                    <td><?php echo $row['stok']; ?></td>
                    <td><?php echo $row['satuan_barang']; ?></td>
                    <td><?php echo $row['nama_toko']; ?></td>
                    <td><?php echo $row['ekspedisi']; ?></td>
                    <td><?php echo $row['belanja_via']; ?></td>
                    <td><?php echo $row['siapa_order']; ?></td>
                    <td><?php echo $row['tanggal_order']; ?></td>
                    <td><?php echo $row['tanggal_datang']; ?></td>
                        <td>
                            <a href="proses_qc.php?id=<?php echo $row['id_barang']; ?>&action=accept" class="btn btn-success btn-sm">Accept</a>
                            <a href="proses_qc.php?id=<?php echo $row['id_barang']; ?>&action=reject" class="btn btn-danger btn-sm">Reject</a>
                        </td>
                    </tr>
                <?php } ?>
            </tbody>
        </table>
    </div>
</body>
</html>
