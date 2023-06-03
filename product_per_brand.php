<style>
    .helmet-cover{
        width:10em;
    }
    .helmet-item .col-auto{
        max-width: calc(100% - 12em) !important;
    }
    .helmet-item:hover{
        background:#a5a5a521;
        background: #a5a5a521;
        box-shadow: 1px 2px 8px #00000029;
    }
    .banner-img-holder{
        height:25vh !important;
        width: calc(100%);
        overflow: hidden;
    }
    .banner-img{
        object-fit:scale-down;
        height: calc(100%);
        width: calc(100%);
        transition:transform .3s ease-in;
    }
    .helmet-item:hover .banner-img{
        transform:scale(1.3)
    }
    #brand-img{
        height: 2em;
        width: 3.5em;
    }
</style>
<?php 
if(isset($_GET['bid'])){
    $qry = $conn->query("SELECT * FROM brand_list where id = '{$_GET['bid']}' and `status` = 1");
    if($qry->num_rows > 0){
        $res = $qry->fetch_array();
        foreach($res as $k => $v){
            if(!is_numeric($k))
            $$k = $v;
        }
        if(is_null($date_updated)){
            $date_updated = strtotime($date_created);
        }else{
            $date_updated = strtotime($date_updated);
        }
    }else{
        echo "<script>alert('Unknown brand ID.');location.href='./';</script>";
    }
}else{
    echo "<script>alert('Unknown brand ID.');location.href='./';</script>";
}
?>
<h1 class="text-center">
    <img src="<?= validate_image("uploads/brands/brand-{$id}.png?v={$date_updated}") ?>" alt="" class="mr-3" id="brand-img">
    <br>
    <?= ucwords($name) ?>
</h1>
<hr>
<div class="card card-outline card-primary shadow">
    <div class="card-body">
        <div class="container-fluid">
            <div class="row row-cols-sm-1 row-cols-md-2 row-cols-xl-4">
            <?php 
               
               $cars = $conn->query("SELECT h.*,b.name as brand, b.image_path as brand_img, c.name as cat_name, c.description as car_desc FROM `helmet_list` h inner join brand_list b on b.id = h.brand_id inner join category_list c on c.id = h.category_id where h.`status` = 0 and h.brand_id = '{$id}' order by unix_timestamp(h.date_created) desc");
                while($row = $cars->fetch_assoc()):
                    $row['description'] = strip_tags(html_entity_decode($row['description']));
                    if(is_null($row['date_updated'])){
                        $row['date_updated'] = strtotime($row['date_created']);
                    }else{
                        $row['date_updated'] = strtotime($row['date_updated']);
                    }
            ?>
            <a href="./?page=view_product&id=<?= $row['id'] ?>" class="text-decoration-none text-dark">
                <div class="card  helmet-item m-2">
                    <div class="banner-img-holder">
                        <img src="<?= validate_image("uploads/banners/helmet-{$row['id']}.png?v={$row['date_updated']}") ?>" alt="" class="img-top banner-img bg-wight">
                    </div>
                    <div class="card-body border-top">
                        <div class="col-12">
                            <h5 class="text-dark"><?= $row['product_title'] ?></h5>
                            <hr class="border-primary mb-0">
                                <div>
                                    <span class="text-muted">Brand: <?= ucwords($row['brand']) ?></span><br>
                                    <span class="text-muted">Category: <?= ucwords($row['cat_name']) ?></span><br>
                                    <span class="text-muted"><i class="fa fa-tags">$ </i> <?= number_format($row['price'],2) ?></span>
                                </div>
                            <p class='truncate-3'>
                                <?= substr($row['description'],0,500) ?>
                            </p>
                        </div>
                    </div>
                </div>
            </a>
            <?php endwhile; ?>
            <?php if($cars->num_rows < 1): ?>
                <center><span class="text-muted">No Cars Listed Yet.</span></center>
            <?php endif; ?>
            </div>
        </div>
    </div>
</div>
