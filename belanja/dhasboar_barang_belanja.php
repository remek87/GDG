<?php
require 'db.php'; // Koneksi ke database

// Fungsi untuk Ekspor Data ke XML
function exportToXML($stmt) {
    // Buat objek XML
    $xml = new SimpleXMLElement('<data/>');

    // Menambahkan data dari database
    while ($row = $stmt->fetch()) {
        $item = $xml->addChild('item');
        $item->addChild('id_barang', $row['id_barang']);
        $item->addChild('nama_barang', $row['nama_barang']);
        $item->addChild('tipe_barang', $row['tipe_barang']);
        $item->addChild('stok', $row['stok']);
        $item->addChild('satuan_barang', $row['satuan_barang']);
        $item->addChild('nama_toko', $row['nama_toko']);
        $item->addChild('ekspedisi', $row['ekspedisi']);
        $item->addChild('belanja_via', $row['belanja_via']);
        $item->addChild('siapa_order', $row['siapa_order']);
        $item->addChild('tanggal_order', $row['tanggal_order']);
        $item->addChild('tanggal_datang', $row['tanggal_datang']);
    }

    // Set header untuk download file XML
    header('Content-Disposition: attachment; filename="data_barang.xml"');
    header('Content-Type: text/xml');
    echo $xml->asXML();
}

// Filter berdasarkan bulan dan tahun
$bulan = $_GET['bulan'] ?? '';
$tahun = $_GET['tahun'] ?? '';
$search = $_GET['search'] ?? '';

// Cek apakah ada ekspor yang dilakukan
if (isset($_GET['export']) && $_GET['export'] === 'xml') {
    $stmt = $pdo->prepare("SELECT * FROM items WHERE (MONTH(tanggal_order) = ? OR ? = '') AND (YEAR(tanggal_order) = ? OR ? = '') AND (nama_barang LIKE ? OR id_barang LIKE ?)");
    $stmt->execute([$bulan, $bulan, $tahun, $tahun, "%$search%", "%$search%"]);
    exportToXML($stmt);
    exit;
}

// Query dengan filter pencarian, bulan, dan tahun
$stmt = $pdo->prepare("SELECT * FROM items WHERE (MONTH(tanggal_order) = ? OR ? = '') AND (YEAR(tanggal_order) = ? OR ? = '') AND (nama_barang LIKE ? OR id_barang LIKE ?)");
$stmt->execute([$bulan, $bulan, $tahun, $tahun, "%$search%", "%$search%"]);
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard Barang Belanja</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
    <h2 class="mb-4 text-center">Dashboard Barang Belanja</h2>

    <!-- Form untuk Filter Bulan, Tahun, dan Pencarian -->
    <form class="form-inline mb-3" method="GET" action="">
        <select name="bulan" class="form-control mr-2">
        <option value="">Semua Bulan</option>
            <option value="01">Januari</option>
            <option value="02">Februari</option>
            <option value="03">Maret</option>
            <option value="04">April</option>
            <option value="05">Mei</option>
            <option value="06">Juni</option>
            <option value="07">July</option>
            <option value="08">Agustus</option>
            <option value="09">September</option>
            <option value="10">Oktober</option>
            <option value="11">November</option>
            <option value="12">Desember</option>
        </select>

        <label for="tahun" class="mr-2">Tahun:</label>
        <select name="tahun" id="tahun" class="form-control mr-2">
            <option value="">Semua Tahun</option>
            <?php
            $tahun_sekarang = date("Y");
            for ($i = $tahun_sekarang; $i >= 2020; $i--) {
                echo "<option value='$i'>$i</option>";
            }
            ?>
        </select>

        <input type="text" name="search" class="form-control mr-2" placeholder="Cari Barang" value="<?php echo htmlspecialchars($search); ?>">
        <button type="submit" class="btn btn-primary">Cari & Filter</button>
    </form>

    <!-- Tabel Barang -->
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
                <th>Petugas</th>
                <th>Tanggal Order</th>
                <th>Tanggal Datang</th>
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
                </tr>
            <?php } ?>
        </tbody>
    </table>

    <!-- Tombol Ekspor -->
    <a href="?export=xml&bulan=<?php echo $bulan; ?>&tahun=<?php echo $tahun; ?>&search=<?php echo $search; ?>" class="btn btn-success mt-3">Ekspor ke XML</a>
</div>

</body>
</html>
