<?php 
    $id_pelanggan = $_SESSION['pelanggan']['id_pelanggan'];

?>
<!-- <pre><?php //echo print_r($pecah);?></pre> -->

<div class="shadow p-3 mb-3 rounded">
    <h4>Update Password</h4>
</div>

<div class="shadow p-3 mb-3 rounded">
    <form method="post" >
          
      <div class="form-group row">
            <label class="col-sm-3 col-form-label">Password Lama :</label>
            <div class="col-sm-9">
                <input type="password" name="pass_lama" class="form-control" placeholder="Masukan Password lama Anda">                
            </div>
      </div>           

      <div class="form-group row">
            <label class="col-sm-3 col-form-label">Password Baru :</label>
            <div class="col-sm-9">
                <input type="password" name="pass_baru" class="form-control" placeholder="Masukan Password baru Anda">                
            </div>
      </div>        

      <div class="form-group row">
            <label class="col-sm-3 col-form-label"></label>
            <div class="col-sm-9">
                <button name="update" class="btn btn-primary">Update</button>
            </div>
      </div>

    </form>
</div>

<?php
if(isset($_POST['update'])){
    // Mengambil id pelanggan dari session
    $id_pelanggan = $_SESSION['pelanggan']['id_pelanggan']; 
    
    // Hash password lama dan password baru
    $pass_lama = sha1($_POST['pass_lama']);
    $pass_baru = sha1($_POST['pass_baru']);

    // Query SQL untuk memeriksa password lama berdasarkan id_pelanggan
    $ambil = $koneksi->query("SELECT * FROM pelanggan WHERE id_pelanggan='$id_pelanggan' AND password_pelanggan='$pass_lama'");
    $pass = $ambil->num_rows;

    // Jika password lama cocok dengan yang ada di database
    if($pass == 1){
        // Lakukan update password baru
        $koneksi->query("UPDATE pelanggan SET password_pelanggan='$pass_baru' WHERE id_pelanggan='$id_pelanggan'");
        echo "<script>alert('Password berhasil diupdate')</script>";
        echo "<script>location='../login.php'</script>";
    } else {
        // Jika password lama salah
        echo "<script>alert('Password lama salah')</script>";
        echo "<script>location='index.php?page=ubah_password'</script>";
    }
}
?>
