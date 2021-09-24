<?php
$server = "localhost";
$username = "root";
$password = "ekni0920";
$database = "jeniskulit";

mysql_connect($server,$username,$password) or die("Koneksi gagal");
mysql_select_db($database) or die("Maaf, Database tidak bisa dibuka");
?>