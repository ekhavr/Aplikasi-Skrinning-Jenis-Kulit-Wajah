<title>Konsultasi</title>
<?php

// Added by Septian (02122020)
if (isset($_POST['btn_simpan'])){
  $nm_user = $_POST['nama'];
  $usia_user = $_POST['usia'];
  $jenis_kelamin = $_POST['jenis_kelamin'];

  if(!empty($nm_user) && !empty($usia_user)){
    // Masukin data User ke Tabel
    mysql_query("INSERT INTO tb_user (nama, usia, jenis_kelamin) VALUES('$nm_user','$usia_user','$jenis_kelamin')");

    // Ambil ID user yg terakhir baru dimasukin
    $sqlambilIDUser = mysql_query("select MAX(id_user) as id_user from tb_user");
    $row=mysql_fetch_array($sqlambilIDUser);
    $iduser = $row['id_user'];

    // simpan data ID ke Session (Sementara saja data session ini, session bakal dihilangkan saat user mulai konsul dari awal) 
    session_start();
    $_SESSION['pkuser'] = $iduser;

  } else {
    echo "Tidak dapat menyimpan, data belum lengkap!";
  }
}
// echo $_SESSION['pkuser'];
// Added by Septian (02122020)

switch ($_GET['act']) {

  default:
    if ($_POST['submit']) {
      $arcolor = array('#ffffff', '#cc66ff', '#019AFF', '#00CBFD', '#00FEFE', '#A4F804', '#FFFC00', '#FDCD01', '#FD9A01', '#FB6700');
      date_default_timezone_set("Asia/Jakarta");
      $inptanggal = date('Y-m-d H:i:s');

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

      //print_r($arkondisitext);
      // -------- perhitungan certainty factor (CF) ---------
      // --------------------- START ------------------------
      $sqljeniskulit = mysql_query("SELECT * FROM tb_jeniskulit order by kd_jeniskulit");
      $arjeniskulit = array();
      while ($rjeniskulit = mysql_fetch_array($sqljeniskulit)) {
        $cftotal_temp = 0;
        $cf = 0;
        $sqlgejala = mysql_query("SELECT * FROM tb_basispengetahuan where kd_jeniskulit=$rjeniskulit[kd_jeniskulit]");
        $cflama = 0;
        while ($rgejala = mysql_fetch_array($sqlgejala)) {
          $arkondisi = explode("_", $_POST['kondisi'][0]);
          $gejala = $arkondisi[0];

          for ($i = 0; $i < count($_POST['kondisi']); $i++) {
            $arkondisi = explode("_", $_POST['kondisi'][$i]);
            $gejala = $arkondisi[0];
            if ($rgejala['kd_gejala'] == $gejala) {
              $cf = ($rgejala['nilai_mb'] - $rgejala['nilai_md']) * $arbobot[$arkondisi[1]];
              if (($cf >= 0) && ($cf * $cflama >= 0)) {
                $cflama = $cflama + ($cf * (1 - $cflama));
              }
              if ($cf * $cflama < 0) {
                $cflama = ($cflama + $cf) / (1 - Math . Min(Math . abs($cflama), Math . abs($cf)));
              }
              if (($cf < 0) && ($cf * $cflama >= 0)) {
                $cflama = $cflama + ($cf * (1 + $cflama));
              }
            }
          }
        }
        if ($cflama > 0) {
          $arjeniskulit += array($rjeniskulit[kd_jeniskulit] => number_format($cflama, 4));
        }
      }

      arsort($arjeniskulit);

      $inpgejala = serialize($argejala);
      $inpjeniskulit = serialize($arjeniskulit);

      $np1 = 0;
      foreach ($arjeniskulit as $key1 => $value1) {
        $np1++;
        $idpkt1[$np1] = $key1;
        $vlpkt1[$np1] = $value1;
      }

      // Edited by Septian (02122020)
      // Ini untuk ambil data User nya berdasarkan ID_User yg dari Session
      // echo $_SESSION['pkuser'];
      $iduser_ok = $_SESSION['pkuser'];
      $sqlambilNamaUser = mysql_query("SELECT * FROM `tb_user` where id_user = $iduser_ok");
      $row=mysql_fetch_array($sqlambilNamaUser);
      // Edited by Septian (02122020)
      
      mysql_query("INSERT INTO tb_diagnosa(
                  tanggal,
                  nama_gejala,
                  jenis_kulit,
                  hasil_id,
                  hasil_nilai,
                  user_id
          ) 
          VALUES(
                '$inptanggal',
                '$inpgejala',
                '$inpjeniskulit',
                '$idpkt1[1]',
                '$vlpkt1[1]',
                $iduser_ok
        )");
      // --------------------- END -------------------------
      
      // Edited by Septian (02122020)
      echo "<div class='content'>
      <h2 class='text text-primary'>Hasil Konsultasi  &nbsp;</h2>
      <h4 class='text text-primary'>Nama : ".$row['nama']."</h4>
      <h4 class='text text-primary'>Usia : ".$row['usia']." tahun </h4>
      <h4 class='text text-primary'>Jenis Kelamin : ".$row['jenis_kelamin']."</h4> 
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
      echo "<div class='callout callout-default'>Jenis kulit anda termasuk <b><h3 class='text text-success'>" . $nmpkt[1] . "</b> / " . round($vlpkt[1], 2) . " % (" . $vlpkt[1] . ")<br></h3>";
      echo "</div></div><div class='box box-info box-solid'><div class='box-header with-border'><h3 class='box-title'>Deskripsi</h3></div><div class='box-body'><h4>";
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
    } else {
      echo "
          <h2 class='text text-primary'>Konsultasi Jenis Kulit</h2>  <hr>
          <div class='alert alert-success alert-dismissible'>
                        <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>×</button>
                        <h4><i class='icon fa fa-exclamation-triangle'></i>Perhatian !</h4>
                        Silahkan memilih gejala sesuai dengan kondisi kulit anda, anda dapat memilih kepastian kondisi kulit dari pasti tidak sampai pasti ya, jika sudah tekan tombol proses    <i class=' fa fa-arrow-right'></i>    di bawah untuk melihat hasil.
                      </div>
            <form name=text_form method=POST action='mulaidiagnosa' >
                  <table class='table table-bordered table-striped konsultasi'><tbody class='pilihkondisi'>
                  <tr><th>No</th><th>Kode</th><th>Gejala</th><th width='20%'>Pilih Kondisi</th></tr>";

      $sql3 = mysql_query("SELECT * FROM tb_gejala order by kd_gejala");
      $i = 0;
      while ($r3 = mysql_fetch_array($sql3)) {
        $i++;
        echo "<tr><td class=opsi>$i</td>";
        echo "<td class=opsi>G" . str_pad($r3[kd_gejala], 3, '0', STR_PAD_LEFT) . "</td>";
        echo "<td class=gejala>$r3[nama_gejala]</td>";
        echo '<td class="opsi"><select name="kondisi[]" id="sl' . $i . '" class="opsikondisi"/><option data-id="0" value="0">Pilih jika sesuai</option>';
        $s = "select * from tb_kondisi order by kd_kondisi";
        $q = mysql_query($s) or die($s);
        while ($rw = mysql_fetch_array($q)) {
          ?>
          <option data-id="<?php echo $rw['kd_kondisi']; ?>" value="<?php echo $r3['kd_gejala'] . '_' . $rw['kd_kondisi']; ?>"><?php echo $rw['nama_kondisi']; ?></option>
          <?php
        }
        echo '</select></td>';
        ?>
        <script type="text/javascript">
          $(document).ready(function () {
            var arcolor = new Array('#ffffff', '#cc66ff', '#019AFF', '#00CBFD', '#00FEFE', '#A4F804', '#FFFC00', '#FDCD01', '#FD9A01', '#FB6700');
            setColor();
            $('.pilihkondisi').on('change', 'tr td select#sl<?php echo $i; ?>', function () {
              setColor();
            });
            function setColor()
            {
              var selectedItem = $('tr td select#sl<?php echo $i; ?> :selected');
              var color = arcolor[selectedItem.data("id")];
              $('tr td select#sl<?php echo $i; ?>.opsikondisi').css('background-color', color);
              console.log(color);
            }
          });
        </script>
        <?php
        echo "</tr>";
      }
      echo "
      <input class='float' type=submit data-toggle='tooltip' data-placement='top' title='Klik disini untuk melihat hasil diagnosa' name=submit value='&#xf061;' style='font-family:Arial, FontAwesome'>
          </tbody></table></form>";
    }
    break;

}
?>
