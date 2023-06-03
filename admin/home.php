<h1>Welcome to <?php echo $_settings->info('name') ?></h1>
<hr class="border-info">
<div class="row">
    <div class="col-12 col-sm-12 col-md-6 col-lg-4">
        <div class="info-box bg-light shadow">
            <span class="info-box-icon bg-dark elevation-1"><i class="fas fa-copyright"></i></span>

            <div class="info-box-content">
            <span class="info-box-text">Brands</span>
            <span class="info-box-number text-right">
                <?php 
                    echo $conn->query("SELECT * FROM `brand_list` where status = 1")->num_rows;
                ?>
            </span>
            </div>
            <!-- /.info-box-content -->
        </div>
        <!-- /.info-box -->
    </div>
    <div class="col-12 col-sm-12 col-md-6 col-lg-4">
        <div class="info-box bg-light shadow">
            <span class="info-box-icon bg-primary elevation-1"><i class="fas fa-th-list"></i></span>

            <div class="info-box-content">
            <span class="info-box-text">Categories</span>
            <span class="info-box-number text-right">
                <?php 
                    echo $conn->query("SELECT * FROM `category_list` where `status` = 1")->num_rows;
                ?>
            </span>
            </div>
            <!-- /.info-box-content -->
        </div>
        <!-- /.info-box -->
    </div>
    <div class="col-12 col-sm-12 col-md-6 col-lg-4">
        <div class="info-box bg-light shadow">
            <span class="info-box-icon bg-light-gradient elevation-1">
                <img src="<?= validate_image("dist/img/helmet-icon.png") ?>" alt="">
            </span>

            <div class="info-box-content">
            <span class="info-box-text">Available Helmets</span>
            <span class="info-box-number text-right">
                <?php 
                    echo $conn->query("SELECT * FROM `helmet_list` where `status` = 0 ")->num_rows;
                ?>
            </span>
            </div>
            <!-- /.info-box-content -->
        </div>
        <!-- /.info-box -->
    </div>
</div>