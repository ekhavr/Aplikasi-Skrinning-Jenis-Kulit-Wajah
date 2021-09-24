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

$module=$_GET[module];
$act=$_GET[act];

// Hapus pengetahuan
if ($module=='pengetahuan' AND $act=='hapus'){
  mysql_query("DELETE FROM tb_basispengetahuan WHERE kd_pengetahuan='$_GET[id]'");
  header('location:../../index.php?module='.$module);
}

// Input pengetahuan
elseif ($module=='pengetahuan' AND $act=='input'){
$kd_jeniskulit=$_POST[kd_jeniskulit];
$kd_gejala=$_POST[kd_gejala];
$nilai_mb=$_POST[nilai_mb];
$nilai_md=$_POST[nilai_md];
mysql_query("INSERT INTO tb_basispengetahuan(
			      kd_jeniskulit,kd_gejala,nilai_mb,nilai_md) 
	                       VALUES(
				'$kd_jeniskulit','$kd_gejala','$nilai_mb','$nilai_md')");
header('location:../../index.php?module='.$module);
}

// Update pengetahuan
elseif ($module=='pengetahuan' AND $act=='update'){
$kd_jeniskulit=$_POST[kd_jeniskulit];
$kd_gejala=$_POST[kd_gejala];
$nilai_mb=$_POST[nilai_mb];
$nilai_md=$_POST[nilai_md];
  mysql_query("UPDATE tb_basispengetahuan SET
					kd_jeniskulit   = '$kd_jeniskulit',
					kd_gejala   = '$kd_gejala',
					nilai_mb   = '$nilai_mb',
					nilai_md   = '$nilai_md'
               WHERE kd_pengetahuan       = '$_POST[id]'");
  header('location:../../index.php?module='.$module);
 }
 
?>
<?php } ?>