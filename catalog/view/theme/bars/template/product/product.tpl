<?php echo $header; ?>
<!-- start content -->
<?php echo $column_left; ?>
<div class="content objects-in"><?php echo $content_top; ?>

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
<?php if ($thumb || $images) { ?>
<div class="galery-block">
<?php if ($thumb) { ?>
<img class="zoom-photo" id="zoom_03" src="<?php echo $thumb; ?>" data-zoom-image="<?php echo $popup; ?>"/>
<?php } ?>
<?php if ($images) { ?>
<div class="small-photo" id="gallery_01">
<?php foreach ($images as $image) { ?>
<a href="#" data-image="<?php echo $image['orig']; ?>" data-zoom-image="<?php echo $image['popup']; ?>">
<img id="img_01" src="<?php echo $image['thumb_popup']; ?>"/>
</a>
<?php } ?>
</div>

<?php } ?>
</div>
<?php } ?>

<div class="info-about-product">
<h6><?php echo $heading_title . '&nbsp;(&nbsp;'. $model . '&nbsp;)'; ?></h6>

<p class="price">Цена:
<?php if ($price) { ?>
<?php if (!$special) { ?>
<?php echo $price; ?>
<?php } else { ?>
<?php echo $special; ?><sup><strike><?php echo $price; ?></strike></sup>
<?php } ?>
<?php } ?>

<p class="price">Количество на складе: <?php echo $stock; ?></p>

<?php if ($discounts) { ?>
<?php foreach ($discounts as $discount) { ?>
<?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?>
<?php } ?>
<?php } ?>

<!--ПРОИЗВОДИТЕЛЬ-->
<?php if ($manufacturer) { ?>
<p class="price">Производитель: <span style="font-weight: bold;"><?php echo $manufacturer; ?></span></p>
<?php } ?>
<!--РАЗМЕР-->

<div id="product">
    
<?php if ($options) { ?>
<?php foreach ($options as $option) { ?>

<?php if ($option['type'] == 'select') { ?>
<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
<p class="price"><label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label></p>
<select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
<option value=""><?php echo $text_select; ?></option>
<?php foreach ($option['product_option_value'] as $option_value) { ?>
<option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
<?php if ($option_value['price']) { ?>
(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
<?php } ?>
</option>
<?php } ?>
</select>
</div>
<?php } ?>

<?php if ($option['type'] == 'text') { ?>
<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
<p class="price"><?php echo $option['name'] . ': ' . $option['value']; ?></p>
</div>
<?php } ?>

<?php } ?>
<?php } ?>

<div class="add-to-basket">
<?php if ($recurrings) { ?>
<hr>
<h3><?php echo $text_payment_recurring ?></h3>
<div class="form-group required">
<select name="recurring_id" class="form-control">
<option value=""><?php echo $text_select; ?></option>
<?php foreach ($recurrings as $recurring) { ?>
<option value="<?php echo $recurring['recurring_id'] ?>"><?php echo $recurring['name'] ?></option>
<?php } ?>
</select>
<div class="help-block" id="recurring-description"></div>
</div>
<?php } ?>

<div class="adults">
Кол-во: <input name="quantity" type="text" size="4" value="<?php echo $minimum; ?>" class="counter-adults"><br>

<input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
</div>

<button id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="basket"><i class="fa fa-shopping-cart" aria-hidden="true"></i> Добавить в корзину</button>

<a onclick="wishlist.add('<?php echo $product_id; ?>');">Добавить в закладки</a><br>

<a href="<?php echo $information_delivery; ?>">Информация о доставке</a>

<div class="product-cart"></div>

</div>
<br>
<?php if ($minimum > 1) { ?>
<div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?></div>
<?php } ?>
<div class="description-title">Описание:</div>
<div class="description"><?php echo $description; ?></div>

</div>
</div>

<?php echo $content_bottom; ?>
<?php echo $column_right; ?></div>

<!-- end content -->

<script type="text/javascript">
$('#zoom_03').ezPlus({
gallery: 'gallery_01', cursor: 'pointer', galleryActiveClass: 'active',
imageCrossfade: true, loadingIcon: 'http://www.elevateweb.co.uk/spinner.gif'
});

//pass the images to Fancybox
$('#zoom_03').bind('click', function (e) {
var ez = $('#zoom_03').data('ezPlus');
//$.fancyboxPlus(ez.getGalleryList());
$.fancybox.open(ez.getGalleryList());
return false;
});


var $button_inc_adults = $('.increment-btn-inc-adults');
var $button_dec_adults = $('.increment-btn-dec-adults');
var $counter_adults = $('.counter-adults');
var $input_quantity = $('.adults input[name=\'quantity\']');

/*$button_inc_adults.click(function(){
if($counter_adults.val()>=0 && $counter_adults.val()<=99){
$counter_adults.val( parseInt($counter_adults.val()) + 1 );
}
$('.counter-adults').replaceWith('<input name="quantity" type="text" size="4" value="'+$counter_adults.val()+'" class="counter-adults">');
});

$button_dec_adults.click(function(){
if($counter_adults.val()>=1 && $counter_adults.val()<=100){
$counter_adults.val( parseInt($counter_adults.val()) - 1 );
}
$('.counter-adults').replaceWith('<input name="quantity" type="text" size="4" value="'+$counter_adults.val()+'" class="counter-adults">');
});

$input_quantity.click(function(){
$('.counter-adults').replaceWith('<input name="quantity" type="text" size="4" value="" class="counter-adults">');
});	*/

</script>

<script type="text/javascript"><!--
$('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
$.ajax({
url: 'index.php?route=product/product/getRecurringDescription',
type: 'post',
data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
dataType: 'json',
beforeSend: function() {
$('#recurring-description').html('');
},
success: function(json) {
$('.alert, .text-danger').remove();

if (json['success']) {
$('#recurring-description').html(json['success']);
}
}
});
});
//--></script>
<script type="text/javascript"><!--
$('#button-cart').on('click', function() {
$.ajax({
url: 'index.php?route=checkout/cart/addToCartStreetModa',
type: 'post',
data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
dataType: 'json',
beforeSend: function() {
$('#button-cart').button('loading');
},
complete: function() {
$('#button-cart').button('reset');
},
success: function(json) {
$('.alert, .text-danger').remove();
$('.form-group').removeClass('has-error');

if (json['error']) {
if (json['error']['option']) {
for (i in json['error']['option']) {
var element = $('#input-option' + i.replace('_', '-'));

if (element.parent().hasClass('input-group')) {
element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
} else {
element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
}
}
}

if (json['error']['recurring']) {
$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
}

// Highlight any found errors
$('.text-danger').parent().addClass('has-error');
}

if (json['success']) {
$('#content').append('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');

$('#cart-total').html('<p id="cart-total">' + json['total'] + '</p>');

$('html, body').animate({ scrollTop: 0 }, 'slow');

$('#cart > ul').load('index.php?route=common/cart/info ul li');
}
},
error: function(xhr, ajaxOptions, thrownError) {
alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
}
});
});
//--></script>
<script type="text/javascript"><!--
$('button[id^=\'button-upload\']').on('click', function() {
var node = this;

$('#form-upload').remove();

$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

$('#form-upload input[name=\'file\']').trigger('click');

if (typeof timer != 'undefined') {
clearInterval(timer);
}

timer = setInterval(function() {
if ($('#form-upload input[name=\'file\']').val() != '') {
clearInterval(timer);

$.ajax({
url: 'index.php?route=tool/upload',
type: 'post',
dataType: 'json',
data: new FormData($('#form-upload')[0]),
cache: false,
contentType: false,
processData: false,
beforeSend: function() {
$(node).button('loading');
},
complete: function() {
$(node).button('reset');
},
success: function(json) {
$('.text-danger').remove();

if (json['error']) {
$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
}

if (json['success']) {
alert(json['success']);

$(node).parent().find('input').attr('value', json['code']);
}
},
error: function(xhr, ajaxOptions, thrownError) {
alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
}
});
}
}, 500);
});
//--></script>

<?php echo $footer; ?>
