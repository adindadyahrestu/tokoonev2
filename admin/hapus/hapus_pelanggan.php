<?php
// Menghubungkan ke database
include 'koneksi.php'; // Sesuaikan dengan nama file koneksi Anda

// Periksa apakah id ada di URL
if (isset($_GET['id'])) {
    $id_pelanggan = $_GET['id'];

    // Buat query untuk menghapus pelanggan
    $koneksi->query("DELETE FROM pelanggan WHERE id_pelanggan='$id_pelanggan'");

    // Redirect setelah penghapusan
    echo "<script>alert('Pelanggan berhasil dihapus');</script>";
    echo "<script>location='index.php?halaman=pelanggan';</script>";
} else {
    // Jika id tidak ada, redirect kembali ke halaman pelanggan
    echo "<script>alert('ID pelanggan tidak ditemukan');</script>";
    echo "<script>location='index.php?halaman=pelanggan';</script>";
}
?>
