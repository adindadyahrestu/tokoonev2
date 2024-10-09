<?php
// Menghubungkan ke database
include 'koneksi.php'; // Sesuaikan dengan nama file koneksi Anda

// Periksa apakah id ada di URL
if (isset($_GET['id'])) {
    $id_pesan = $_GET['id'];

    // Buat query untuk menghapus pesan
    $koneksi->query("DELETE FROM pesan WHERE id_pesan='$id_pesan'");

    // Redirect setelah penghapusan
    echo "<script>alert('Pesan berhasil dihapus');</script>";
    echo "<script>location='index.php?halaman=pesan';</script>";
} else {
    // Jika id tidak ada, redirect kembali ke halaman pesan
    echo "<script>alert('ID pesan tidak ditemukan');</script>";
    echo "<script>location='index.php?halaman=pesan';</script>";
}
?>
