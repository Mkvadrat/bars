<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title; if (isset($_GET['page'])) { echo " - ". ((int) $_GET['page'])." ".$text_page;} ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; if (isset($_GET['page'])) { echo " - ". ((int) $_GET['page'])." ".$text_page;} ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<meta property="og:title" content="<?php echo $title; if (isset($_GET['page'])) { echo " - ". ((int) $_GET['page'])." ".$text_page;} ?>" />
<meta property="og:type" content="website" />
<meta property="og:url" content="<?php echo $og_url; ?>" />
<?php if ($og_image) { ?>
<meta property="og:image" content="<?php echo $og_image; ?>" />
<?php } else { ?>
<meta property="og:image" content="<?php echo $logo; ?>" />
<?php } ?>
<meta property="og:site_name" content="<?php echo $name; ?>" />

<!-- Bootstrap -->
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="catalog/view/theme/bars/css/reset.css">
<link rel="stylesheet" href="catalog/view/theme/bars/css/fonts.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

<link rel="stylesheet" href="catalog/view/theme/bars/css/main.css">
<link rel="stylesheet" href="catalog/view/theme/bars/css/object.css">


<link rel="stylesheet" href="catalog/view/theme/bars/css/object-in.css">
<link rel="stylesheet" href="catalog/view/theme/bars/css/about-product.css">
<link rel="stylesheet" href="catalog/view/theme/bars/css/404.css">
<link rel="stylesheet" href="catalog/view/theme/bars/css/registration.css">
<link rel="stylesheet" href="catalog/view/theme/bars/css/log-in.css">
<link rel="stylesheet" href="catalog/view/theme/bars/css/order.css">

<script src="catalog/view/theme/bars/js/scripts.js"></script>
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->

<!-- Gallery -->
<script type="text/javascript" src="/catalog/view/theme/bars/js/ezPlus.min.js"></script>

<!-- Fancyapps -->
<!-- Add mousewheel plugin (this is optional) -->
<script type="text/javascript" src="/catalog/view/javascript/fancyapps/lib/jquery.mousewheel-3.0.6.pack.js"></script>

<!-- Add fancyBox main JS and CSS files -->
<script type="text/javascript" src="/catalog/view/javascript/fancyapps/source/jquery.fancybox.js?v=2.1.5"></script>
<link rel="stylesheet" type="text/css" href="/catalog/view/javascript/fancyapps/source/jquery.fancybox.css?v=2.1.5" media="screen" />

<!-- Add Button helper (this is optional) -->
<link rel="stylesheet" type="text/css" href="/catalog/view/javascript/fancyapps/source/helpers/jquery.fancybox-buttons.css?v=1.0.5" />
<script type="text/javascript" src="/catalog/view/javascript/fancyapps/source/helpers/jquery.fancybox-buttons.js?v=1.0.5"></script>

<!-- Add Thumbnail helper (this is optional) -->
<link rel="stylesheet" type="text/css" href="/catalog/view/javascript/fancyapps/source/helpers/jquery.fancybox-thumbs.css?v=1.0.7" />
<script type="text/javascript" src="/catalog/view/javascript/fancyapps/source/helpers/jquery.fancybox-thumbs.js?v=1.0.7"></script>

<!-- Add Media helper (this is optional) -->
<script type="text/javascript" src="/catalog/view/javascript/fancyapps/source/helpers/jquery.fancybox-media.js?v=1.0.6"></script>
  
<script type="text/javascript" src="/catalog/view/javascript/fancy+/src/jquery.fancybox-plus.js"></script>
<link rel="stylesheet" type="text/css" href="/catalog/view/javascript/fancy+/css/jquery.fancybox-plus.css" media="screen" />
<link rel="stylesheet" type="text/css" href="/catalog/view/javascript/fancy+/css/style.css" media="screen" />
<script type="text/javascript" src="/catalog/view/javascript/fancy+/js/web.js?m=20100203"></script>

<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/bars.js" type="text/javascript"></script>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>
</head>

<body>
<div class="wrapper">

  <!-- start header -->
  <header>
      <!-- start Верхнее меню для нерегистированных -->

      <div class="top-line">
        <?php if ($logged) { ?>
        
          <ul class="enter-registr">
              <li>
                  <p>Здравствуйте,  <span><?php echo $first_name; ?></span></p>
              </li>
              <li>
                  <a href="<?php echo $account; ?>">Мой кабинет</a>
              </li>
              <li>
                  <a href="<?php echo $wishlist; ?>">Закладки</a>
              </li>
              <li>
                  <a href="<?php echo $logout; ?>">Выйти</a>
              </li>
              <li>
                  <?php echo $cart; ?>
                  
                  <a href="<?php echo $shopping_cart; ?>">Оформить заказ</a>
              </li>
          </ul>

          <ul>
              <li>
                  <a href="<?php echo $about_us; ?>">О нас</a>
              </li>
              <li>
                  <a href="<?php echo $delivery; ?>">Доставка</a>
              </li>
              <li>
                  <a href="<?php echo $payment; ?>">Оплата</a>
              </li>
              <li>
                  <a href="<?php echo $waranty; ?>">Гарантии</a>
              </li>
              <li>
                  <a href="<?php echo $contact; ?>">Контакты</a>
              </li>
          </ul>

        <?php }else{ ?>
        
          <ul class="enter-registr">
              <li>
                  <a href="<?php echo $login; ?>">Вход</a>
              </li>
              <li>
                  <a href="<?php echo $register; ?>">Регистрация</a>
              </li>
              <li>
                  <?php echo $cart; ?>
                  
                  <a href="<?php echo $shopping_cart; ?>">Оформить заказ</a>
              </li>
          </ul>

          <ul>
              <li>
                  <a href="<?php echo $about_us; ?>">О нас</a>
              </li>
              <li>
                  <a href="<?php echo $delivery; ?>">Доставка</a>
              </li>
              <li>
                  <a href="<?php echo $payment; ?>">Оплата</a>
              </li>
              <li>
                  <a href="<?php echo $waranty; ?>">Гарантии</a>
              </li>
              <li>
                  <a href="<?php echo $contact; ?>">Контакты</a>
              </li>
          </ul>
          
        <?php } ?>
      </div>

      <div class="banner-header">
            <p>
              <?php if ($logo) { ?>
                  <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a>
              <?php } else { ?>
                  <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
              <?php } ?>
              
              <img class="header-banner" src="catalog/view/theme/bars/images/header-banner.jpg" alt="">
            </p>
      </div>

      <div class="bottom-line">
          <ul>
              <li>
                  <a href="<?php echo $home; ?>"></a>
              </li>
              <li>
                  <a href="<?php echo $mans; ?>">Мужчинам</a>
              </li>
              <li>
                  <a href="<?php echo $womans; ?>">Женщинам</a>
              </li>
              <li>
                  <a href="<?php echo $special; ?>">Акции</a>
              </li>
              <li>
                  <div id="search" class="box-search">
      
                      <input type="search" value="" name="search" placeholder="Поиск">
  
                      <input class="but-search" type="submit" name="submit_value" value="">
        
                      <button type="button" style="display:none;"></button>
                  </div>
<script>
    $(function(){
        $('.but-search').click(function(){
            $('.box-search').addClass('slide-left');
            $('.but-search').replaceWith('<input type="submit" onclick="submit();" value="">');	
        });
    });
    
    function submit(){
        url = $('base').attr('href') + 'index.php?route=product/search';
        var value = $('header input[name=\'search\']').val();
        if (value) {
            url += '&search=' + encodeURIComponent(value);
        }
        location = url;
    }
</script>	
              </li>
          </ul>
      </div>
  </header>
  <!-- end header -->
