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
          <?php foreach($images as $image) : ?>


          <div class="col-lg-3 col-xs-6">
            <!-- small box -->
            <div class="small-box bg-aqua">
              <div class="inner">
                <h3> <?php echo $image->regNum; ?> </h3>
              </div>
              <a href="<?php echo base_url('user/penerima_bantuan/'); ?>" class="small-box-footer">Get It </i></a>
            </div>
          </div><!-- ./col -->
  <?php endforeach; ?>


          </div>
    </section>
</div>
