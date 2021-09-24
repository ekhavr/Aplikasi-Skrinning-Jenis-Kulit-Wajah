<title>Riwayat Konsultasi</title>
<h2 class='text text-primary'>Riwayat Konsultasi</h2>
<hr>
<?php
session_start();
include "config/fungsi_alert.php";
$aksi = "modul/riwayat/aksi_hasil.php";
switch ($_GET[act]) {
// Tampil hasil
    default:
        $offset = $_GET['offset'];
//jumlah data yang ditampilkan perpage
        $limit = 10;
        if (empty($offset)) {
            $offset = 0;
        }

         $sqluser = mysql_query("SELECT * FROM tb_user order by id_user+0");
        while ($ruser = mysql_fetch_array($sqluser)) {
            $aruser[$ruser['id_user']] = $ruser['nama'];
        }

        $sqlgjl = mysql_query("SELECT * FROM tb_gejala order by kd_gejala+0");
        while ($rgjl = mysql_fetch_array($sqlgjl)) {
            $argjl[$rgjl['kd_gejala']] = $rgjl['nama_gejala'];
        }

        $sqlpkt = mysql_query("SELECT * FROM tb_jeniskulit order by kd_jeniskulit+0");
        while ($rpkt = mysql_fetch_array($sqlpkt)) {
            $arpkt[$rpkt['kd_jeniskulit']] = $rpkt['jenis_kulit'];
            $ardpkt[$rpkt['kd_jeniskulit']] = $rpkt['deskripsi'];
            $arspkt[$rpkt['kd_jeniskulit']] = $rpkt['solusi'];
        }

        $tampil = mysql_query("SELECT * FROM tb_diagnosa ORDER BY id_diagnosa");
     
        $baris = mysql_num_rows($tampil);
        if ($baris > 0) {
            echo"<div class='row'><div class='col-md-8'><table class='table table-bordered table-striped riwayat' style='overflow-x=auto' cellpadding='0' cellspacing='0'>
          <thead>
            <tr>
              <th>No</th>
              <th>Tanggal</th>
              <th>Nama</th>
              <th>Jenis Kulit</th>
              <th nowrap>Nilai CF</th>
              <th width='21%' class='text-center'>Aksi</th>
            </tr>
          </thead>
      <tbody>
      ";
            $hasil = mysql_query("SELECT * FROM tb_diagnosa ORDER BY id_diagnosa limit $offset,$limit");
            $no = 1;
            $no = 1 + $offset;
            $counter = 1;
            while ($r = mysql_fetch_array($hasil)) {
              if ($r[hasil_id]>0){
                if ($counter % 2 == 0)
                    $warna = "dark";
                else
                    $warna = "light";
                echo "<tr class='" . $warna . "'>
       <td align=center>$no</td>
       <td>$r[tanggal]</td>
       <td>" . $aruser[$r[user_id]] . "</td>
       <td>" . $arpkt[$r[hasil_id]] . "</td>
       <td><span class='label label-default'>" . $r[hasil_nilai] . "</span></td>
       <td align=center>
       <a type='button' class='btn btn-default btn-xs' target='_blank' href=riwayat-detail/$r[id_diagnosa]><i class='fa fa-eye' aria-hidden='true'></i> Detail </a> &nbsp;
           </td></tr>";
                $no++;
                $counter++;
            }
            }
            echo "</tbody></table></div>";
            ?>

            <div class="col-md-4">
              <div class="box box-success box-solid">
                <div class="box-header with-border">
                  <i class="fa fa-pie-chart"></i>

                  <h3 class="box-title">Grafik</h3>

                  <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                    </button>
                    <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                  </div>
                </div>
                <div class="box-body">
                  <div id="donut-chart" class="chart" style="width:100%;height:250px;"></div>
                  <hr>
                  <div id="legend-container"></div>
                </div>
                <!-- /.box-body-->
              </div>
            </div>


            <?php
            echo "</div><div class='col-md-12'><div class='row'><div class=paging>";

            if ($offset != 0) {
                $prevoffset = $offset - $limit;
                echo "<span class=prevnext> <a href=index.php?module=riwayat&offset=$prevoffset>Back</a></span>";
            } else {
                echo "<span class=disabled>Back</span>"; //cetak halaman tanpa link
            }
//hitung jumlah halaman
            $halaman = intval($baris / $limit); //Pembulatan

            if ($baris % $limit) {
                $halaman++;
            }
            for ($i = 1; $i <= $halaman; $i++) {
                $newoffset = $limit * ($i - 1);
                if ($offset != $newoffset) {
                    echo "<a href=index.php?module=riwayat&offset=$newoffset>$i</a>";
//cetak halaman
                } else {
                    echo "<span class=current>" . $i . "</span>"; //cetak halaman tanpa link
                }
            }

//cek halaman akhir
            if (!(($offset / $limit) + 1 == $halaman) && $halaman != 1) {

//jika bukan halaman terakhir maka berikan next
                $newoffset = $offset + $limit;
                echo "<span class=prevnext><a href=index.php?module=riwayat&offset=$newoffset>Next</a>";
            } else {
                echo "<span class=disabled>Next</span>"; //cetak halaman tanpa link
            }

            echo "</div></div></div>";
        } else {
            echo "<br><b>Data Kosong !</b>";
        }
}
?>

<script>
    $(function () {

<?php
//$arr[] = array();

$hasilg = mysql_query("SELECT hasil_id, count(hasil_id) jlh_id FROM tb_diagnosa group by hasil_id ORDER BY jlh_id desc");
while ($rg = mysql_fetch_array($hasilg)) {
  if ($rg[hasil_id] > 0) {
    $arr[] = array('label' => '&nbsp;' . $arpkt[$rg['hasil_id']], 'data' => array(array('Penyakit ' . $rg['hasil_id'], $rg['jlh_id'])));
  }
}
?>
      var donutData = <?php echo json_encode($arr); ?>
//      var donutData = [
//        {label: 'Series2', data: 30, color: '#3c8dbc'},
//        {label: 'Series3', data: 20, color: '#0073b7'},
//        {label: 'Series4', data: 50, color: '#00c0ef'}
//      ]

      function legendFormatter(label, series) {
        return '<div class="text text-primary margin4">' + label + ' ' + Math.round(series.percent) + '%';
      };

      $.plot('#donut-chart', donutData, {
        series: {
          pie: {
            show: true,
            radius: 1,
            innerRadius: 0.3,
            label: {
              show: true,
              radius: 2/3,
              formatter: function (label, series) {
                return '<div class="badge bg-navy color-pallete">' + Math.round(series.percent) + '%</div>';
              },
              threshold: 0.01
            }

          }
        },
        legend: {
          show: true,
          container: $("#legend-container"),
          labelFormatter: legendFormatter,
        }
      })
      /*
       * END DONUT CHART
       */

    })

    /*
     * Custom Label formatter
     * ----------------------
     */
    function labelFormatter(label, series) {
      return '<div style="font-size:13px; text-align:center; padding:2px; color: #fff; font-weight: 600;">'
              + label
              + '<br>'
              + Math.round(series.percent) + '%</div>'
    }
</script>




