<?php echo $header; ?>

<?php echo $column_left; ?>
<div class="content objects"><?php echo $content_top; ?>
<div id="content" class="bread-crumbs">
<p class="bread-crumbs-numbers">
<?php echo $pagination; ?>
</p>

<p>
<?php
$count = count($breadcrumbs);
$i=1;
foreach ($breadcrumbs as $breadcrumb) {
if($i!=$count){

?>
<a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a><?php echo ' ' . $breadcrumb['separator']; ?>
<?php
}else{
echo '<i class="active"> '.$breadcrumb['text'] . '</i>';
}
$i++;
}
?>
</p>
</div>
<?php if ($categories) { ?>
<!-- start content -->
<div class="content">
<ul>
<?php foreach ($categories as $category) { ?>
<li>
<a href="<?php echo $category['href']?>">
<img src="<?php echo $category['image']?>" alt="">
<h6><?php echo $category['name']?></h6>
</a>
</li>
<?php } ?>
</ul>
</div>
<!-- end content -->
<?php } ?>

<?php if ($products) { ?>
<ul>
<?php foreach ($products as $product) { ?>
<li class="box-object">
<img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>">
<h6><?php echo $product['name']; ?></h6>

<p class="price">Цена:
<?php if ($product['price']) { ?>
<?php if (!$product['special']) { ?>
<?php echo $product['price']; ?>
<?php } else { ?>
<?php echo $product['special']; ?><sup><strike><?php echo $product['price']; ?></strike></sup>
<?php } ?>
<?php } ?>

<p class="more-buy"><a href="<?php echo $product['href']; ?>">Подробнее</a>
<a class="in-bascet" id="cart_category" onclick="cart.category('<?php echo $product['product_id']; ?>', '1');"><i class="fa fa-shopping-cart" aria-hidden="true"></i>В корзину</a></p>
<a class="add-to-bookmarks" onclick="wishlist.add('<?php echo $product['product_id']; ?>');">Добавить в закладки</a>

</li>
<?php } ?>
</ul>

<p class="bread-crumbs-numbers-bottom">
<?php echo $pagination; ?>
</p>
<?php } ?>
<?php if (!$categories && !$products) { ?>
<p class="no-product"><?php echo $text_empty; ?></p>
<div class="buttons">
<div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
</div>
<?php } ?>

<?php echo $content_bottom; ?>
<?php echo $column_right; ?></div>

<?php echo $footer; ?>
