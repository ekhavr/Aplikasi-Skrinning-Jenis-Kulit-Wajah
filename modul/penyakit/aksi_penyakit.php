<?php

session_start();
if (!(isset($_SESSION['username']) && isset($_SESSION['password']))) {
  header('location:index.php');
  exit();
} else {
?>
  <?php

  session_start();
  include "../../config/koneksi.php";

  $module = $_GET[module];
  $act = $_GET[act];

// Hapus penyakit
  if ($module == 'penyakit' AND $act == 'hapus') {
    mysql_query("DELETE FROM tb_jeniskulit WHERE kd_jeniskulit='$_GET[id]'");
    header('location:../../index.php?module=' . $module);
  }

// Input penyakit
  elseif ($module == 'penyakit' AND $act == 'input') {
    $jenis_kulit = $_POST[jenis_kulit];
    $deskripsi = $_POST[deskripsi];
    $solusi = $_POST[solusi];
    $fileName = $_FILES['gambar']['name'];
    move_uploaded_file($_FILES['gambar']['tmp_name'], "../../gambar/penyakit/" . $_FILES['gambar']['name']);
    mysql_query("INSERT INTO tb_jeniskulit(
            jenis_kulit,deskripsi,solusi,gambar) 
                         VALUES(
        '$jenis_kulit','$deskripsi','$solusi','$fileName')");

    header('location:../../index.php?module=' . $module);
  }

// Update penyakit
  elseif ($module == 'penyakit' AND $act == 'update') {
    $jenis_kulit = $_POST[jenis_kulit];
    $deskripsi = $_POST[deskripsi];
    $solusi = $_POST[solusi];

    $fileName = $_FILES['gambar']['name'];
    if ($fileName) {
      move_uploaded_file($_FILES['gambar']['tmp_name'], "../../gambar/penyakit/" . $_FILES['gambar']['name']);

      mysql_query("UPDATE tb_jeniskulit SET
          jenis_kulit   = '$jenis_kulit',
          deskripsi     = '$deskripsi',
          solusi        = '$solusi',
          gambar        = '$fileName'
               WHERE kd_jeniskulit       = '$_POST[id]'");
    } else {
      mysql_query("UPDATE tb_jeniskulit SET
          jenis_kulit   = '$jenis_kulit',
          deskripsi     = '$deskripsi',
          solusi        = '$solusi'
               WHERE kd_jeniskulit       = '$_POST[id]'");
    }
    header('location:../../index.php?module=' . $module);
  }
  ?>
<?php } ?>