<title>Masukan Identitas</title>
<h2 class='text text-primary'>Silahkan Masukan Identitas Anda</h2>

<hr>
<div class="row">
  <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12" data-aos="fade-right">
      <form method="POST" action="mulaidiagnosa" name="input_data_user">
          <div class="form-group row">
            <label for="inputEmail3" class="col-sm-2 col-form-label">Nama</label>
            <div class="col-sm-10">
              <input type="text" name="nama" class="form-control" id="inputEmail3" placeholder="Nama" required>
            </div>
          </div>
          <div class="form-group row">
            <label for="inputPassword3" class="col-sm-2 col-form-label">Usia</label>
            <div class="col-sm-10">
              <input type="text" name="usia" class="form-control" id="inputPassword3" placeholder="Usia" required>
            </div>
          </div>
          <div class="form-group row">
            <label for="inputKelamin3" class="col-sm-2 col-form-label">Jenis Kelamin</label>
            <div class="col-sm-10">
              <input  type="radio" name="jenis_kelamin" value="L"  /> Laki-laki 
              <input  type="radio" name="jenis_kelamin" value="P"  /> Perempuan
            </div>
          </div>
          
          <div class="form-group row">
            <div class="col-sm-10">
            <button type="submit" name="btn_simpan" class="btn btn-primary">Mulai Konsultasi</button>
              <!-- <a type="submit" name="btn_simpan" href="mulaidiagnosa" class="btn btn-primary">Konsultasi</a>s -->
            </div>
          </div>
      </form>
  </div>
</div>
<?php
//Session di halaman diagnosa.php di hilangkan disini, supaya keisi lagi dgn data Session baru
unset($_SESSION['pkuser']);
?>