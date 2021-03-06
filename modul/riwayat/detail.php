<title>Detail Hasil Konsultasi</title>
<?php
session_start();
if ($_GET['id']) {
  $arcolor = array('#ffffff', '#cc66ff', '#019AFF', '#00CBFD', '#00FEFE', '#A4F804', '#FFFC00', '#FDCD01', '#FD9A01', '#FB6700');
  date_default_timezone_set("Asia/Jakarta");
  $inptanggal = date('Y-m-d H:i:s');

  $idUser = 51;
  $arbobot = array('0', '1', '0.8', '0.6', '0.4', '-0.2', '-0.4', '-0.6', '-0.8', '-1');
  $argejala = array();

  for ($i = 0; $i < count($_POST['kondisi']); $i++) {
    $arkondisi = explode("_", $_POST['kondisi'][$i]);
    if (strlen($_POST['kondisi'][$i]) > 1) {
      $argejala += array($arkondisi[0] => $arkondisi[1]);
    }
  }

  $sqlkondisi = mysql_query("SELECT * FROM tb_kondisi order by kd_kondisi+0");
  while ($rkondisi = mysql_fetch_array($sqlkondisi)) {
    $arkondisitext[$rkondisi['kd_kondisi']] = $rkondisi['nama_kondisi'];
  }

  $sqlpkt = mysql_query("SELECT * FROM tb_jeniskulit order by kd_jeniskulit+0");
  while ($rpkt = mysql_fetch_array($sqlpkt)) {
    $arpkt[$rpkt['kd_jeniskulit']] = $rpkt['jenis_kulit'];
    $ardpkt[$rpkt['kd_jeniskulit']] = $rpkt['deskripsi'];
    $arspkt[$rpkt['kd_jeniskulit']] = $rpkt['solusi'];
    $argpkt[$rpkt['kd_jeniskulit']] = $rpkt['gambar'];
  }

  $sqlhasil = mysql_query("SELECT * FROM tb_diagnosa where id_diagnosa=" . $_GET['id']);
  while ($rhasil = mysql_fetch_array($sqlhasil)) {
    //Ambil User Id dari tb_diagnosa
    $idUser = $rhasil['user_id'];

    $arjeniskulit = unserialize($rhasil['jenis_kulit']);
    $argejala = unserialize($rhasil['nama_gejala']);
  }

  // Ambil data tb_user dari hasil tb_diagnosa
  $sqluser = mysql_query("SELECT * FROM tb_user where id_user=" . $idUser);
  while ($ruser = mysql_fetch_array($sqluser)) {
    $arnama = $ruser['nama'];
    $arusia = $ruser['usia'];
    $arjeniskelamin = $ruser['jenis_kelamin'];
  } 

  $np1 = 0;
  foreach ($arjeniskulit as $key1 => $value1) {
    $np1++;
    $idpkt1[$np1] = $key1;
    $vlpkt1[$np1] = $value1;
  }

  // Kode Usang do nothing bisa di buang
  // $iduser_ok = $_SESSION['pkuser'];
  // $sqlambilNamaUser = mysql_query("SELECT * FROM `tb_user` where id_user = $iduser_ok");
  // $row=mysql_fetch_array($sqlambilNamaUser);
  //     // Edited by Septian (02122020)
      
  //     mysql_query("INSERT INTO tb_user(
  //                 nama,
  //                 usia,
  //                 jenis_kelamin,
  //                 id_user
  //         ) 
  //         VALUES(
  //               '$inpnama',
  //               '$inpusia',
  //               '$inpjeniskelamin',
  //               $iduser_ok
  //       )");
  // hapus sampai sini

// --------------------- END -------------------------

  // variable diubah
  echo "<div class='content'>
  <h2 class='text text-primary'>Hasil Konsultasi &nbsp;&nbsp;</h2>
      <h4 class='text text-primary'>Nama : ".$arnama."</h4>
      <h4 class='text text-primary'>Usia : ".$arusia." tahun </h4>
      <h4 class='text text-primary'>Jenis Kelamin : ".$arjeniskelamin."</h4>
      <hr><table class='table table-bordered table-striped diagnosa'> 
          <th width=8%>No</th>
          <th width=10%>Kode</th>
          <th>Gejala yang timbul</th>
          <th width=20%>Pilihan</th>
          </tr>";

  $ig = 0;
  foreach ($argejala as $key => $value) {
    $kondisi = $value;
    $ig++;
    $gejala = $key;
    $sql4 = mysql_query("SELECT * FROM tb_gejala where kd_gejala = '$key'");
    $r4 = mysql_fetch_array($sql4);
    echo '<tr><td>' . $ig . '</td>';
    echo '<td>G' . str_pad($r4[kd_gejala], 3, '0', STR_PAD_LEFT) . '</td>';
    echo '<td><span class="hasil text text-primary">' . $r4[nama_gejala] . "</span></td>";
    echo '<td><span class="kondisipilih" style="color:' . $arcolor[$kondisi] . '">' . $arkondisitext[$kondisi] . "</span></td></tr>";
  }
  $np = 0;
  foreach ($arjeniskulit as $key => $value) {
    $np++;
    $idpkt[$np] = $key;
    $nmpkt[$np] = $arpkt[$key];
    $vlpkt[$np] = $value;
  }
  if ($argpkt[$idpkt[1]]) {
    $gambar = 'gambar/penyakit/' . $argpkt[$idpkt[1]];
  } else {
    $gambar = 'gambar/noimage.png';
  }
  echo "</table><div class='well well-small'><img class='card-img-top img-bordered-sm' style='float:right; margin-left:15px;' src='" . $gambar . "' height=200><h3>Hasil Konsultasi</h3>";
  echo "<div class='callout callout-default'>Jenis kulit Anda adalah <b><h3 class='text text-success'>" . $nmpkt[1] . "</b> / " . round($vlpkt[1], 2) . " % (" . $vlpkt[1] . ")<br></h3>";
  echo "</div></div><div class='box box-info box-solid'><div class='box-header with-border'><h3 class='box-title'>Deskripsi Jenis Kulit</h3></div><div class='box-body'><h4>";
  echo $ardpkt[$idpkt[1]];
  echo "</h4></div></div>
          <div class='box box-warning box-solid'><div class='box-header with-border'><h3 class='box-title'>Solusi</h3></div><div class='box-body'><h4>";
  echo $arspkt[$idpkt[1]];
  echo "</h4></div></div>
          <div class='box box-danger box-solid'><div class='box-header with-border'><h3 class='box-title'>Kemungkinan lain:</h3></div><div class='box-body'><h4>";
  for ($ipl = 2; $ipl < count($idpkt); $ipl++) {
    echo " <h4><i class='fa fa-caret-square-o-right'></i> " . $nmpkt[$ipl] . "</b> / " . round($vlpkt[$ipl], 2) . " % (" . $vlpkt[$ipl] . ")<br></h4>";
  }
  echo "</div></div>
      </div>";
}
?>