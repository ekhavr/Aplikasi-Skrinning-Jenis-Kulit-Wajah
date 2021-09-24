<title>Basis Pengetahuan</title>
<?php

session_start();
if (!(isset($_SESSION['username']) && isset($_SESSION['password']))) {
    header('location:index.php');
    exit();
} else {
    ?>
<script type="text/javascript">
function Blank_TextField_Validator()
{
if (text_form.kd_jeniskulit.value == "")
{
   alert("Pilih dulu jenis kulit !");
   text_form.kd_jeniskulit.focus();
   return (false);
}
if (text_form.kd_gejala.value == "")
{
   alert("Pilih dulu gejala !");
   text_form.kd_gejala.focus();
   return (false);
}
if (text_form.nilai_mb.value == "")
{
   alert("Isi dulu Nilai MB !");
   text_form.nilai_mb.focus();
   return (false);
}
if (text_form.nilai_md.value == "")
{
   alert("Isi dulu Nilai MD !");
   text_form.nilai_md.focus();
   return (false);
}
return (true);
}
function Blank_TextField_Validator_Cari()
{
if (text_form.keyword.value == "")
{
   alert("Isi dulu keyword pencarian !");
   text_form.keyword.focus();
   return (false);
}
return (true);
}
-->
</script>
<?php
include "config/fungsi_alert.php";
$aksi="modul/pengetahuan/aksi_pengetahuan.php";
switch($_GET[act]){
	// Tampil pengetahuan
  default:
  $offset=$_GET['offset'];
	//jumlah data yang ditampilkan perpage
	$limit = 2;
	if (empty ($offset)) {
		$offset = 0;
	}
  $tampil=mysql_query("SELECT * FROM tb_basispengetahuan ORDER BY kd_pengetahuan");
	echo "<form method=POST action='?module=pengetahuan' name=text_form onsubmit='return Blank_TextField_Validator_Cari()'>
          <br><br><table class='table table-bordered'>
		  <tr><td><input class='btn bg-olive margin' type=button name=tambah value='Tambah Basis Pengetahuan' onclick=\"window.location.href='pengetahuan/tambahpengetahuan';\"><input type=text name='keyword' style='margin-left: 10px;' placeholder='Ketik dan tekan cari...' class='form-control' value='$_POST[keyword]' /> <input class='btn bg-olive margin' type=submit value='   Cari   ' name=Go></td> </tr>
          </table></form>";
		  	$baris=mysql_num_rows($tampil);
	if ($_POST[Go]){
			$numrows = mysql_num_rows(mysql_query("SELECT * FROM tb_basispengetahuan b,tb_jeniskulit p where b.kd_jeniskulit=p.kd_jeniskulit AND p.jenis_kulit like '%$_POST[keyword]%'"));
			if ($numrows > 0){
				echo "<div class='alert alert-success alert-dismissible'>
                <h4><i class='icon fa fa-check'></i> Sukses!</h4>
                Pengetahuan yang anda cari di temukan.
              </div>";
				$i = 1;
	echo" <table class='table table-bordered' style='overflow-x=auto' cellpadding='0' cellspacing='0'>
          <thead>
            <tr>
              <th>No</th>
              <th>Jenis Kulit</th>
              <th>Gejala</th>
              <th>Nilai MB</th>
              <th>Nilai MD</th>
              <th width='21%'>Aksi</th>
            </tr>
          </thead>
		  <tbody>"; 
	$hasil = mysql_query("SELECT * FROM tb_basispengetahuan b,tb_jeniskulit p where b.kd_jeniskulit=p.kd_jeniskulit AND p.jenis_kulit like '%$_POST[keyword]%'");
	$no = 1;
	$counter = 1;
    while ($r=mysql_fetch_array($hasil)){
	if ($counter % 2 == 0) $warna = "dark";
	else $warna = "light";
	$sql = mysql_query("SELECT * FROM tb_gejala where kd_gejala = '$r[kd_gejala]'");
	$rgejala=mysql_fetch_array($sql);
       echo "<tr class='".$warna."'>
			 <td align=center>$no</td>
			 <td>$r[jenis_kulit]</td>
			 <td>$rgejala[nama_gejala]</td>
			 <td align=center>$r[nilai_mb]</td>
			 <td align=center>$r[nilai_md]</td>
			 <td align=center><a type='button' class='btn btn-success margin' href=pengetahuan/editpengetahuan/$r[kd_pengetahuan]><i class='fa fa-pencil-square-o' aria-hidden='true'></i> Ubah </a> &nbsp;
	          <a type='button' class='btn btn-danger margin' href=\"JavaScript: confirmIt('Anda yakin akan menghapusnya ?','$aksi?module=pengetahuan&act=hapus&id=$r[kd_pengetahuan]','','','','u','n','Self','Self')\" onMouseOver=\"self.status=''; return true\" onMouseOut=\"self.status=''; return true\"><i class='fa fa-trash-o' aria-hidden='true'></i> Hapus</a>
             </td></tr>";
      $no++;
	  $counter++;
    }
    echo "</tbody></table>";
			}
			else{
				echo "<div class='alert alert-danger alert-dismissible'>
                <h4><i class='icon fa fa-ban'></i> Gagal!</h4>
                Maaf, Pengetahuan yang anda cari tidak ditemukan , silahkan inputkan dengan benar dan cari kembali.
              </div>";
			}
		}else{
	
	if($baris>0){
	echo" <table class='table table-bordered' style='overflow-x=auto' cellpadding='0' cellspacing='0'>
          <thead>
            <tr>
              <th>No</th>
              <th>Jenis Kulit</th>
              <th>Gejala</th>
              <th>Nilai MB</th>
              <th>Nilai MD</th>
              <th width='21%'>Aksi</th>
            </tr>
          </thead>
		  <tbody>
		  "; 
	$hasil = mysql_query("SELECT * FROM tb_basispengetahuan ORDER BY kd_pengetahuan limit $offset,$limit");
	$no = 1;
	$no = 1 + $offset;
	$counter = 1;
    while ($r=mysql_fetch_array($hasil)){
	if ($counter % 2 == 0) $warna = "dark";
	else $warna = "light";
	$sql = mysql_query("SELECT * FROM tb_gejala where kd_gejala = '$r[kd_gejala]'");
	$rgejala=mysql_fetch_array($sql);
	$sql2 = mysql_query("SELECT * FROM tb_jeniskulit where kd_jeniskulit = '$r[kd_jeniskulit]'");
	$rpenyakit=mysql_fetch_array($sql2);
       echo "<tr class='".$warna."'>
			 <td align=center>$no</td>
			 <td>$rpenyakit[jenis_kulit]</td>
			 <td>$rgejala[nama_gejala]</td>
			 <td align=center>$r[nilai_mb]</td>
			 <td align=center>$r[nilai_md]</td>
			 <td align=center>
			 <a type='button' class='btn btn-success margin' href=pengetahuan/editpengetahuan/$r[kd_pengetahuan]><i class='fa fa-pencil-square-o' aria-hidden='true'></i> Ubah </a> &nbsp;
	          <a type='button' class='btn btn-danger margin' href=\"JavaScript: confirmIt('Anda yakin akan menghapusnya ?','$aksi?module=pengetahuan&act=hapus&id=$r[kd_pengetahuan]','','','','u','n','Self','Self')\" onMouseOver=\"self.status=''; return true\" onMouseOut=\"self.status=''; return true\">
			  <i class='fa fa-trash-o' aria-hidden='true'></i> Hapus</a>
             </td></tr>";
      $no++;
	  $counter++;
    }
    echo "</tbody></table>";
	echo "<div class=paging>";

	if ($offset!=0) {
		$prevoffset = $offset-10;
		echo "<span class=prevnext> <a href=index.php?module=pengetahuan&offset=$prevoffset>Back</a></span>";
	}
	else {
		echo "<span class=disabled>Back</span>";//cetak halaman tanpa link
	}
	//hitung jumlah halaman
	$halaman = intval($baris/$limit);//Pembulatan

	if ($baris%$limit){
		$halaman++;
	}
	for($i=1;$i<=$halaman;$i++){
		$newoffset = $limit * ($i-1);
		if($offset!=$newoffset){
			echo "<a href=index.php?module=pengetahuan&offset=$newoffset>$i</a>";
			//cetak halaman
		}
		else {
			echo "<span class=current>".$i."</span>";//cetak halaman tanpa link
		}
	}

	//cek halaman akhir
	if(!(($offset/$limit)+1==$halaman) && $halaman !=1){

		//jika bukan halaman terakhir maka berikan next
		$newoffset = $offset + $limit;
		echo "<span class=prevnext><a href=index.php?module=pengetahuan&offset=$newoffset>Next</a>";
	}
	else {
		echo "<span class=disabled>Next</span>";//cetak halaman tanpa link
	}
	
	echo "</div>";
	}else{
	echo "<br><b>Data Kosong !</b>";
	}
	}
    break;
  
  case "tambahpengetahuan":
	echo "	<div class='alert alert-success alert-dismissible'>
                <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>×</button>
                <h4><i class='icon fa fa-exclamation-triangle'></i>Petunjuk Pengisian Pakar !</h4>
                Silahkan pilih gejala yang sesuai dengan jenis kulit yang ada, dan berikan <b>nilai kepastian (MB & MB)</b> dengan cakupan sebagai berikut:<br><br>
				<b>1.0</b> (Pasti Ya)&nbsp;&nbsp;|&nbsp;&nbsp;<b>0.8</b> (Hampir Pasti)&nbsp;&nbsp;|<br>
				<b>0.6</b> (Kemungkinan Besar)&nbsp;&nbsp;|&nbsp;&nbsp;<b>0.4</b> (Mungkin)&nbsp;&nbsp;|<br>
				<b>0.2</b> (Hampir Mungkin)&nbsp;&nbsp;|&nbsp;&nbsp;<b>0.0</b> (Tidak Tahu atau Tidak Yakin)&nbsp;&nbsp;|<br><br>
				<b>CF(Pakar) = MB – MD</b><br>
				MB : Ukuran kenaikan kepercayaan (measure of increased belief) MD : Ukuran kenaikan ketidakpercayaan (measure of increased disbelief) <br> <br>
				<b>Contoh:</b><br>
				Jika kepercayaan <b>(MB)</b> anda terhadap gejala Mencret keputih-putihan untuk penyakit Berak Kapur adalah <b>0.8 (Hampir Pasti)</b><br>
				Dan ketidakpercayaan <b>(MD)</b> anda terhadap gejala Mencret keputih-putihan untuk penyakit Berak Kapur adalah <b>0.2 (Hampir Mungkin)</b><br><br>
				<b>Maka:</b> CF(Pakar) = MB – MD (0.8 - 0.2) = <b>0.6</b> <br>
				Dimana nilai kepastian anda terhadap gejala Mencret keputih-putihan untuk penyakit Berak Kapur adalah <b>0.6 (Kemungkinan Besar)</b>
              </div>
          <form name=text_form method=POST action='$aksi?module=pengetahuan&act=input' onsubmit='return Blank_TextField_Validator()'>
          <br><br><table class='table table-bordered'>
		  <tr><td width=120>Jenis Kulit</td><td><select class='form-control' name='kd_jeniskulit'  id='kd_jeniskulit'><option value=''>- Pilih Jenis Kulit -</option>";
		$hasil4 = mysql_query("SELECT * FROM tb_jeniskulit order by jenis_kulit");
		while($r4=mysql_fetch_array($hasil4)){
			echo "<option value='$r4[kd_jeniskulit]'>$r4[jenis_kulit]</option>";
		}
		echo	"</select></td></tr>
		<tr><td>Gejala</td><td><select class='form-control' name='kd_gejala' id='kd_gejala'><option value=''>- Pilih Gejala -</option>";
		$hasil4 = mysql_query("SELECT * FROM tb_gejala order by nama_gejala");
		while($r4=mysql_fetch_array($hasil4)){
			echo "<option value='$r4[kd_gejala]'>$r4[nama_gejala]</option>";
		}
		echo	"</select></td></tr>
		<tr><td>Nilai MB</td><td><input autocomplete='off' placeholder='Masukkan Nilai MB' type=text class='form-control' name='nilai_mb' size=15 ></td></tr>
		<tr><td>Nilai MD</td><td><input autocomplete='off' placeholder='Masukkan Nilai MD' type=text class='form-control' name='nilai_md' size=15 ></td></tr>
		  <tr><td></td><td><input class='btn btn-success' type=submit name=submit value='Simpan' >
		  <input class='btn btn-danger' type=button name=batal value='Batal' onclick=\"window.location.href='?module=pengetahuan';\"></td></tr>
          </table></form>";
     break;
    
  case "editpengetahuan":
    $edit=mysql_query("SELECT * FROM tb_basispengetahuan WHERE kd_pengetahuan='$_GET[id]'");
    $r=mysql_fetch_array($edit);
	
    echo "<br>
	<br>
	<form name=text_form method=POST action='$aksi?module=pengetahuan&act=update' onsubmit='return Blank_TextField_Validator()'>
          <input type=hidden name=id value='$r[kd_pengetahuan]'>
          <br><br><table class='table table-bordered'>
		  <tr><td width=120>Jenis Kulit</td><td><select class='form-control' name='kd_jeniskulit' id='kd_jeniskulit'>";
		$hasil4 = mysql_query("SELECT * FROM tb_jeniskulit order by jenis_kulit");
		while($r4=mysql_fetch_array($hasil4)){
			echo "<option value='$r4[kd_jeniskulit]'"; if($r[kd_jeniskulit]==$r4[kd_jeniskulit]) echo "selected";
			echo ">$r4[jenis_kulit]</option>";
		}
		echo	"</select></td></tr>
		<tr><td>Gejala</td><td><select class='form-control' name='kd_gejala' id='kd_gejala'>";
		$hasil4 = mysql_query("SELECT * FROM tb_gejala order by nama_gejala");
		while($r4=mysql_fetch_array($hasil4)){
			echo "<option value='$r4[kd_gejala]'"; if($r[kd_gejala]==$r4[kd_gejala]) echo "selected";
			echo ">$r4[nama_gejala]</option>";
		}
		echo	"</select></td></tr>
		<tr><td>Nilai MB</td><td><input autocomplete='off' placeholder='Masukkan NIlai MB' type=text class='form-control' name='nilai_mb' size=15 value='$r[nilai_mb]'></td></tr>
		<tr><td>Nilai MD</td><td><input autocomplete='off' placeholder='Masukkan Nilai MD' type=text class='form-control' name='nilai_md' size=15 value='$r[nilai_md]'></td></tr>
          <tr><td></td><td><input class='btn btn-success' type=submit name=submit value='Simpan' >
		  <input class='btn btn-danger' type=button name=batal value='Batal' onclick=\"window.location.href='?module=pengetahuan';\"></td></tr>
          </table></form>";
    break;  
}
?>
<?php } ?>
