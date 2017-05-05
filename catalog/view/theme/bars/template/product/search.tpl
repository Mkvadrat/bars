<?php echo $header; ?>

<?php echo $column_left; ?>
<div class="content objects"><?php echo $content_top; ?>
<div id="content" class="bread-crumbs">
  
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

<h1><?php echo $heading_title; ?></h1>
<label class="control-label" for="input-search"><?php echo $entry_search; ?></label>

<input type="text" name="search" value="<?php echo $search; ?>" placeholder="<?php echo $text_keyword; ?>" id="input-search" class="form-control" />

<select name="category_id" class="form-control">
<option value="0"><?php echo $text_category; ?></option>
<?php foreach ($categories as $category_1) { ?>
<?php if ($category_1['category_id'] == $category_id) { ?>
<option value="<?php echo $category_1['category_id']; ?>" selected="selected"><?php echo $category_1['name']; ?></option>
<?php } else { ?>
<option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
<?php } ?>
<?php foreach ($category_1['children'] as $category_2) { ?>
<?php if ($category_2['category_id'] == $category_id) { ?>
<option value="<?php echo $category_2['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
<?php } else { ?>
<option value="<?php echo $category_2['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
<?php } ?>
<?php foreach ($category_2['children'] as $category_3) { ?>
<?php if ($category_3['category_id'] == $category_id) { ?>
<option value="<?php echo $category_3['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
<?php } else { ?>
<option value="<?php echo $category_3['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
<?php } ?>
<?php } ?>
<?php } ?>
<?php } ?>
</select>

<?php if ($sub_category) { ?>
<input type="checkbox" name="sub_category" value="1" checked="checked" />
<?php } else { ?>
<input type="checkbox" name="sub_category" value="1" />
<?php } ?>
<?php echo $text_sub_category; ?>

<?php if ($description) { ?>
<input type="checkbox" name="description" value="1" id="description" checked="checked" />
<?php } else { ?>
<input type="checkbox" name="description" value="1" id="description" />
<?php } ?>
<?php echo $entry_description; ?>

<input type="button" value="<?php echo $button_search; ?>" id="button-search" class="btn btn-primary" />
<h2><?php echo $text_search; ?></h2>

<label class="control-label" for="input-sort"><?php echo $text_sort; ?></label>

<select id="input-sort" class="form-control col-sm-3" onchange="location = this.value;">
<?php foreach ($sorts as $sorts) { ?>
<?php if ($sorts['value'] == $sort . '-' . $order) { ?>
<option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
<?php } else { ?>
<option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
<?php } ?>
<?php } ?>
</select>

<label class="control-label" for="input-limit"><?php echo $text_limit; ?></label>

<select id="input-limit" class="form-control" onchange="location = this.value;">
<?php foreach ($limits as $limits) { ?>
<?php if ($limits['value'] == $limit) { ?>
<option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
<?php } else { ?>
<option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
<?php } ?>
<?php } ?>
</select>

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
<?php if (!$products) { ?>
<p class="no-product"><?php echo $text_empty; ?></p>
<?php } ?>

<?php echo $content_bottom; ?>
<?php echo $column_right; ?></div>

<script type="text/javascript"><!--
$('#button-search').bind('click', function() {
	url = 'index.php?route=product/search';

	var search = $('#content input[name=\'search\']').prop('value');

	if (search) {
		url += '&search=' + encodeURIComponent(search);
	}

	var category_id = $('#content select[name=\'category_id\']').prop('value');

	if (category_id > 0) {
		url += '&category_id=' + encodeURIComponent(category_id);
	}

	var sub_category = $('#content input[name=\'sub_category\']:checked').prop('value');

	if (sub_category) {
		url += '&sub_category=true';
	}

	var filter_description = $('#content input[name=\'description\']:checked').prop('value');

	if (filter_description) {
		url += '&description=true';
	}

	location = url;
});

$('#content input[name=\'search\']').bind('keydown', function(e) {
	if (e.keyCode == 13) {
		$('#button-search').trigger('click');
	}
});

$('select[name=\'category_id\']').on('change', function() {
	if (this.value == '0') {
		$('input[name=\'sub_category\']').prop('disabled', true);
	} else {
		$('input[name=\'sub_category\']').prop('disabled', false);
	}
});

$('select[name=\'category_id\']').trigger('change');
--></script>

<?php echo $footer; ?>
