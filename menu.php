<?php
$module = $_GET['module'];
?>
<li><a <?php if ($module == "") echo 'class="active"'; ?> href="./"><i class="fa fa-home"></i> <span>Beranda</span></a><li>
  <div class="container"></div>
    <?php
    if (isset($_SESSION['username']) && isset($_SESSION['password'])) {
        ?>
      <li><a <?php if ($module == "admin") echo 'class="active"'; ?> href="admin"><i class="fa fa-users"></i> <span>Admin</span></a><li>
        <div class="container"></div>	
      <li><a <?php if ($module == "penyakit") echo 'class="active"'; ?> href="penyakit"><i class="fa fa-smile-o"></i> <span>Jenis Kulit</span></a><li>
        <div class="container"></div>	
      <li><a <?php if ($module == "gejala") echo 'class="active"'; ?> href="gejala"><i class="fa fa-stethoscope"></i> <span>Gejala</span></a><li>
        <div class="container"></div>
      <li><a <?php if ($module == "pengetahuan") echo 'class="active"'; ?> href="pengetahuan"><i class="fa fa-user-md"></i> <span>Basis Pengetahuan</span></a><li>
        <div class="container"></div>
      <li><a <?php if ($module == "post") echo 'class="active"'; ?> href="post"><i class="fa fa-file-text"></i> <span>Info Jenis Kulit</span></a><li>
        <div class="container"></div>
      <li><a <?php if ($module == "password") echo 'class="active"'; ?> href="password"><i class="fa fa-edit"></i> <span>Ubah Password</span></a><li>
        <div class="container"></div>
      <li><a <?php if ($module == "riwayat") echo 'class="active"'; ?> href="riwayat"><i class="fa fa-history"></i> <span>Riwayat</span></a><li>
        <div class="container"></div>
        <?php
    }else {
    ?>
      
      <li><a <?php if ($module == "sebelumdiagnosa") echo 'class="active"'; ?> href="sebelumdiagnosa"><i class="fa fa-stethoscope"></i> <span>Konsultasi</span></a><li>
        <div class="container"></div>
      <li><a <?php if ($module == "keterangan") echo 'class="active"'; ?> href="keterangan"><i class="fa fa-smile-o"></i> <span>Info Jenis Kulit</span></a><li>
        <div class="container"></div>

    <?php
    }
    ?>
      <li><a <?php if ($module == "tentang") echo 'class="active"'; ?> href="tentang"><i class="fa fa-info-circle"></i> <span>Tentang</span></a><li>
  