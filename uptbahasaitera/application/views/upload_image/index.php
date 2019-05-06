<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <i class="fa fa-tachometer" aria-hidden="true"></i> Register Number
        <small>Control panel</small>
      </h1>
    </section>

    <section class="content">
        <div class="row">

    <div class="container">
      <h2>Upload Image Using CodeIgniter 3.x and Jquery Upload Preview</h2>
      <a href="<?php echo base_url('uploadimage/create'); ?>" class="btn btn-primary">Add Image</a>
      <br><br>
      <strong style="margin-top: 4px;" id="message">
          <?php echo $this->session->userdata('message'); ?>
      </strong>
      <?php foreach($images as $image) : ?>
        <div class="row">
          <div class="col-md-8">
            <img src="<?php echo base_url('images/'.$image->filefoto); ?>" alt="<?php echo $image->nama_file; ?>" width="300" height="300" />
          </div>
          <div class="col-md-4">
            <h3><?php echo $image->nama_file; ?></h3>
            <br>
            <a href="<?php echo base_url('uploadimage/edit/'.$image->id); ?>" class="btn btn-warning">Edit</a>
            <?php
            $hapus = array(
                'class' => 'btn btn-danger',
                'onclick' => 'javascript: return confirm(\'Anda yakin menghapus ' . $image->nama_file . '?\')'
            );
            echo anchor(site_url('uploadimage/delete/' . $image->id), 'Hapus', $hapus);
            ?>
          </div>
        </div>
        <hr>
      <?php endforeach; ?>
    </div>
  </section>
  </div>
