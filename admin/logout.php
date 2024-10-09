<?php
    session_destroy();

    echo "<script>alert('Anda Telah Berhasil Logout');</script>";
    echo "<script>location='login.php';</script>";
?>