<?php

session_start();
include "../../config/koneksi.php";

$module = $_GET[module];
$act = $_GET[act];

// Hapus post
if ($module == 'post' AND $act == 'hapus') {
    mysql_query("DELETE FROM tb_posting WHERE kd_posting='$_GET[id]'");
    header('location:../../index.php?module=' . $module);
}

// Input post
elseif ($module == 'post' AND $act == 'input') {
    $nama_post = $_POST[nama_post];
    $des_post = $_POST[des_post];
    $saran_post = $_POST[saran_post];
    $fileName = $_FILES['gambar']['name'];
    move_uploaded_file($_FILES['gambar']['tmp_name'], "../../gambar/" . $_FILES['gambar']['name']);
    mysql_query("INSERT INTO tb_posting(
			      nama_post,des_post,saran_post,gambar) 
	                       VALUES(
				'$nama_post','$des_post','$saran_post','$fileName')");

    header("location:../../index.php?module=" . $module);
}

// Update post
elseif ($module == 'post' AND $act == 'update') {
    $nama_post = $_POST[nama_post];
    $des_post = $_POST[des_post];
    $saran_post = $_POST[saran_post];

    $fileName = $_FILES['gambar']['name'];
    if ($fileName){
    move_uploaded_file($_FILES['gambar']['tmp_name'], "../../gambar/" . $_FILES['gambar']['name']);

    mysql_query("UPDATE tb_posting SET
					nama_post    = '$nama_post',
					des_post     = '$des_post',
					saran_post   = '$saran_post',
					gambar   = '$fileName'
               WHERE kd_posting       = '$_POST[id]'");
    } else {
        mysql_query("UPDATE tb_posting SET
					nama_post    = '$nama_post',
					des_post     = '$des_post',
					saran_post   = '$saran_post'
               WHERE kd_posting       = '$_POST[id]'");
    }
    header('location:../../index.php?module=' . $module);
}
?>