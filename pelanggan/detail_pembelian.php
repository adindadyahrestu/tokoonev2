<div class="shadow p-3 mb-4 bg-white rounded">
    <h5><b>Halaman Detail Pembelian</b></h5>
</div>

<?php
    $id_pembelian = $_GET['id'];
    $ambil = $koneksi->query("SELECT * FROM pembelian JOIN pelanggan ON pembelian.id_pelanggan=pelanggan.id_pelanggan WHERE pembelian.id_pembelian='$id_pembelian'");
    $detail = $ambil->fetch_assoc();

    $idpembelian = $detail['id_pelanggan'];
    $idpelanggan =$_SESSION['pelanggan']['id_pelanggan'];

    if($idpembelian!==$idpelanggan){
        echo "<script>alert('sesi tidak ditemukan');</script>";
        echo "<script>location='index.php?page=pesanan';</script>";
    }
?>
<!-- <pre><?php// print_r($detail); ?></pre> -->

<div class="row">
    <div class="col-md-4">
        <h5>Data pelanggan</h5>
       <div class="table-responsive">
        <table class="table">
            <tr>
                <th>Nama :</th>
                <td><?php echo $detail['nama_pelanggan'];?></td>
            </tr>
            <tr>
                <th>Email :</th>
                <td><?php echo $detail['email_pelanggan'];?></td>
            </tr>
            <tr>
                <th>Telepon :</th>
                <td><?php echo $detail['telepon_pelanggan'];?></td>
            </tr>
        </table>
       </div>
    </div>

    <div class="col-md-4">
    <h5>Data pembelian</h5>
       <div class="table-responsive">
        <table class="table">
            <tr>
                <th>No. Pembelian :</th>
                <td><?php echo $detail['id_pembelian'];?></td>
            </tr>
            <tr>
                <th>tanggal :</th>
                <td><?php echo $detail['tanggal_pembelian'];?></td>
            </tr>
            <tr>
                <th>Total :</th>
                <td>Rp. <?php echo number_format($detail['total_pembelian']);?></td>
            </tr>
        </table>
       </div>
    </div>
    <div class="col-md-4">
    <h5>Data pengiriman</h5>
       <div class="table-responsive">
        <table class="table">
            <tr>
                <th>Alamat :</th>
                <td><?php echo $detail['alamat'];?></td>
            </tr>
            <tr>
                <th>Ekspedisi :</th>
                <td><?php echo $detail['ekspedisi'];?></td>
            </tr>
            <tr>
                <th>Ongkir :</th>
                <td>Rp. <?php echo number_format($detail['ongkir']);?></td>
            </tr>
        </table>
       </div>
    </div>

</div>

<?php
        $pp = array();
        $ambil = $koneksi->query("SELECT * FROM pembelian_produk WHERE pembelian_produk.id_pembelian='$id_pembelian'");
        while($pecah = $ambil->fetch_assoc()){
        $pp[] = $pecah;
    }
?>

<div class="card shadow bg-white mt-3">
    <div class="card-body">
    <table class="table table-bordered table-hover table-striped">
        <thead>
            <tr>
                <th>No</th>
                <th>Nama</th>
                <th>Harga</th>
                <th>Jumlah</th>
                <th>SubHarga</th>
            </tr>
        </thead>
        <tbody>
        <?php foreach ($pp as $key => $value): ?>       
            <tr>
                <td width="50"><?php echo $key+1; ?></td>
                <td><?php echo $value['nama']; ?></td>
                <td>Rp. <?php echo number_format($value['harga']); ?></td>
                <td><?php echo $value['jumlah']; ?></td>
                <td>Rp. <?php echo number_format($value['subharga']); ?></td>
            </tr>
            <?php endforeach ?>
        </tbody>
    </table>
    </div>
</div>

<div class="alert alert-primary shadow mt-3">
    <p>
        Silahkan Melakukan Pembayaran: Rp. <?php echo number_format($detail['total_pembelian']); ?><br>
        <strong>BANK MANDIRI: 123-12345-1234 AN. Kelompok ONE</strong>
    </p>
</div>