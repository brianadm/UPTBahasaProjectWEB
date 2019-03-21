<div id="page-wrapper">
    <div class ="container-fluid">
        <div class="row">
        <div class="col-lg-12">
        <h1 class="page-header" > Form Pendaftaran</h1>
            </div>
            <div class="row">
            <div class="col-lg-12">
            <div class="panel panel-primary">
            <div class="panel-heading"> Silahkan mengisi formulir pendaftaran </div>
            <div class="panel-body">
            <!-- <?php echo form_open_multipart('user/welcome/daftar_peserta');?> -->
            <div class="form-group">
            <table class="table" border=1>
            <div class="table-responsive">

                <table class="table table-striped table-bordered table-hover">
                    <thead>

                      <tr class="info">
                          <th>Nama </th>
                          <th>:</th>
                          <th><input type="text" size=50 name=""></th>
                      </tr>

                        <tr class="info">
                            <th>NIM</th>
                            <th>:</th>
                            <th><input type="number" size=50 name=""></th>
                        </tr>

                        <tr class="info">
                            <th>Program Studi</th>
                            <th>:</th>
                            <th>
                            <select name="" ">
                              <!-- value="<?php echo $pengguna->jurusan;?> -->
                                <option value="Prodi Arsitektur Lanskap">Prodi Arsitektur Lanskap</option>
                                <option value="Prodi Biologi">Prodi Biologi</option>
                                <option value="Prodi Desain Komunikasi Visual">Prodi Desain Komunikasi Visual</option>
                                <option value="Prodi Farmasi">Prodi Farmasi</option>
                                <option value="Prodi Fisika">Prodi Fisika</option>
                                <option value="Prodi Kimia">Prodi Kimia</option>
                                <option value="Prodi Matematika">Prodi Matematika</option>
                                <option value="Prodi Perencanaan Wilayah Kota">Prodi Perencanaan Wilayah Kota</option>
                                <option value="Prodi Sains Atmosfer dan Keplanetan">Prodi Sains Atmosfer dan Keplanetan</option>
                                <option value="Prodi Sistem Energi">Prodi Sistem Energi</option>
                                <option value="Prodi Teknik Arsitektur">Prodi Teknik Arsitektur</option>
                                <option value="Prodi Teknik Biosistem">Prodi Teknik Biosistem</option>
                                <option value="Prodi Teknik Elektro">Prodi Teknik Elektro</option>
                                <option value="Prodi Teknik Geofisika">Prodi Teknik Geofisika</option>
                                <option value="Prodi Teknik Geologi">Prodi Teknik Geologi</option>
                                <option value="Prodi Teknik Geomatika">Prodi Teknik Geomatika</option>
                                <option value="Prodi Teknik Industri">Prodi Teknik Industri</option>
                                <option value="Prodi Teknik Industri Pertanian">Prodi Teknik Industri Pertanian</option>
                                <option value="Prodi Teknik Informatika">Prodi Teknik Informatika</option>
                                <option value="Prodi Teknik Kelautan">Prodi Teknik Kelautan </option>
                                <option value="Prodi Teknik Kimia">Prodi Teknik Kimia</option>
                                <option value="Prodi Teknik Lingkungan">Prodi Teknik Lingkungan</option>
                                <option value="Prodi Teknik Material">Prodi Teknik Material</option>
                                <option value="Prodi Teknik Mesin">Prodi Teknik Mesin</option>
                                <option value="Prodi Teknik Pertambangan">Prodi Teknik Pertambangan</option>
                                <option value="Prodi Teknik Sipil">Prodi Teknik Sipil</option>
                                <option value="Prodi Teknologi Pangan">Prodi Teknologi Pangan</option>
                            </select>
                            </th>
                        </tr>
                        <tr>
                            <th>Tempat Lahir</th>
                            <th>:</th>
                            <th><input type="text" name="" size=50 ></th>
                        </tr>
                        <tr>
                            <th>Tanggal Lahir (dd/mm/yy)</th>
                            <th>:</th>
                            <th><input type="date" name="" size=50 ></th>
                        </tr>
                        <tr class="info">
                            <th>No. HP</th>
                            <th>:</th>
                            <th><input type="number" size=50 name="" ></th>
                        </tr>
                        <tr class="info">
                            <th>email</th>
                            <th>:</th>
                            <th><input type="email" size=50 name="" ></th>
                        </tr>

                        <input type="hidden" name="kuota" value="1">
                        </thead>
                    </table>

            </div><hr>
                     <input type="submit" class="btn btn-primary" value="Daftar" name="submit"/>
                    <!-- <?php echo form_close();?> -->
            </div>
            </div>
            </div>
            </div>
            </div>
        </div>
        </div>
    </div>
</div>
