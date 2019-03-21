<div id="page-wrapper">
    <div class ="container-fluid">
        <div class="row">
        <div class="col-lg-12">
        <h1 class="page-header" >Validasi Sertifikat</h1>
            </div>
            <div class="row">
            <div class="col-lg-12">
            <div class="panel panel-primary">
            <div class="panel-heading"> Silahkan masukkan nomor Sertifikat</div>
            <div class="panel-body">
            <!-- <?php echo form_open_multipart('user/welcome/daftar_peserta');?> -->
            <div class="form-group">
            <table class="table" border=1>
            <div class="table-responsive">

                <table class="table table-striped table-bordered table-hover">
                    <thead>

                      <tr class="info">
                          <th>Nomor sertifikat </th>
                          <th>:</th>
                          <th><input type="text" size=50 name=""></th>
                      </tr>
                      <tr class="info">
                          <th> </th>
                          <th></th>
                          <th> Terdaftar Pada Sistem UPT Bahasa ITERA</th>
                      </tr>

                        <input type="hidden" name="kuota" value="1">
                        </thead>
                    </table>

            </div><hr>


            </div>
                        <a href="<?php echo base_url(); ?>welcome/validasiSetifikatNextFail"><span data-hover="">validasiSetifikatNextFail</span></a>
                        <a href="<?php echo base_url(); ?>welcome/validasiSetifikatNextSuccess"><span data-hover="">validasiSetifikatNextSuccess</span></a>
            </div>


            </div>
            </div>
            </div>
        </div>
        </div>
    </div>
</div>
