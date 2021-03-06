<?php require_once("include/db_connect.php");
$sorting = $_GET["sort"];

switch($sorting){
    case 'price-asc' :
        $sorting = 'price ASC';
        $sort_name = "De la ieftin la scump";
    break;
    case 'price-desc' :
        $sorting = 'price DESC';
        $sort_name = "De la scump la ieftin";
    break;
    case 'popular' :
        $sorting = 'count DESC';
        $sort_name = "Popular";
    break;
    case 'news' :
        $sorting = 'datetime DESC';
        $sort_name = "Nou";
    break;
    case 'brand' :
        $sorting = 'brand';
        $sort_name = "Nou";
    break;
    default:
        $sorting = 'products_id DESC';
        $sort_name = "Fara sortare";
    break;
    error_reporting(E_ALL);
}
?>
<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="content-type" content="text/html" />
	<meta name="author" content="phpdesigner" />
    
    <link href="css/reset.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="trackbar/trackbar.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="js/jcarousellite_1.0.1.js"></script>
    <script type="text/javascript" src="js/shop-script.js"></script>
    <script type="text/javascript" src="js/jquery.cookie.min.js"></script>
    <script type="text/javascript" src="trackbar/jquery.trackbar.js"></script>
	<title>Internet Magazin de Tehnica</title>
</head>

<body>
<div id="block-body">
    <?php
    
    include("include/block-header.php");
    ?>
<div id="block-right">
<?php
    
    include("include/block-category.php");
    include("include/block-parameter.php");
    include("include/block-news.php");
    ?>
    </div>
<div id="block-content">
<div id="block-sorting">
<p id="nav-breadcrumbs">
<a href="index.php">Pagina principala</a> \ <span>Toate produsele</span>
</p>
<ul id="options-list">
    <li>View:</li>
    <li><img id="style-grid" src="/images/icon-grid.png"></li>
    <li><img id="style-list" src="/images/icon-list.png"></li>
    <li>Sortare:</li>
    <li><a id="select-sort"><?php echo $sort_name;?></a>
    <ul id="sorting-list">
        <li><a href="index.php?sort=price-asc">De la ieftin la scump</a></li>
        <li><a href="index.php?sort=price-desc">De la scump la ieftin</a></li>
        <li><a href="index.php?sort=popular">Popular</a></li>
        <li><a href="index.php?sort=news">Nou</a></li>
        <li><a href="index.php?sort=brand">De la A la Z</a></li>
    </ul>
    </li>
</ul>
</div>
<ul id="block-tovar-grid">
<?php
$num = 6;
$page = (int)$_GET['page'];

$count = mysql_query("SELECT COUNT(*) FROM table_products WHERE visible = '1'",$link);
$temp = mysql_fetch_array($count);
if($temp[0] > 0){
    $tempcount = $temp[0];
}
// Calculam numarul total de pagini
$total = (($tempcount -1) / $num) + 1;
$total = intval($total);

$page =  intval($page);

if(empty($page) or $page < 0)$page = 1;
if($page>$total) $page = $total;

// Calculam cu care numar incepem afisarea produselor
$start = $page * $num - $num;

$qury_start_num = " LIMIT $start, $num";

 $result = mysql_query("SELECT * FROM table_products WHERE visible='1' ORDER BY $sorting $qury_start_num",$link);
 if(mysql_num_rows($result) > 0){
    $row = mysql_fetch_array($result);
        
 
do
{
    if($row["image"] != "" && file_exists("./uploads_images/".$row["image"]))
    {
        $img_path = "./uploads_images/". $row["image"];
        $max_width = 200;
        $max_height = 200;
        list($width, $height) = getimagesize($img_path);
        $ratioh = $max_height/$height;
        $ratiow = $max_width/$width;
        $ratio = min($ratioh,$ratiow);
        $width = intval($ratio * $width);
        $height = intval($ratio * $height);
    }else{
        $img_path = "/images/no-image.png";
        $width = 110;
        $height = 200;
    }
    echo '
    <li>
    <div class="block-images-grid"> 
    <img src="'.$img_path.'"width ="'.$width.'" height="'.$height.'" />
    </div>
    
    <p class="style-title-grid"><a href="#">'.$row["title"].' </a></p>
    <ul class="reviews-and-counts-grid">
    <li><img src="/images/eye-icon.png"><p>0</p></li>
    <li><img src="/images/comment-icon.png"></li>    
    </ul>
    <a class="add-cart-style-grid"></a>
    <p class="style-price-grid"><strong>'.$row["price"].'</strong>lei</p>
    <div class="mini-features">
    '.$row["mini_features"].'
    </div>
    </li>
    ';
}while($row = mysql_fetch_array($result));
}
?>
</ul>

<ul id="block-tovar-list">
<?php
 $result = mysql_query("SELECT * FROM table_products WHERE visible='1' ORDER BY $sorting $query_start_num",$link);
 if(mysql_num_rows($result) > 0)
 {
    $row = mysql_fetch_array($result);
        
 
do
{
    if($row["image"] != "" && file_exists("./uploads_images/".$row["image"]))
    {
        $img_path = "./uploads_images/". $row["image"];
        $max_width = 150;
        $max_height = 150;
        list($width, $height) = getimagesize($img_path);
        $ratioh = $max_height/$height;
        $ratiow = $max_width/$width;
        $ratio = min($ratioh,$ratiow);
        $width = intval($ratio * $width);
        $height = intval($ratio * $height);
    }else{
        $img_path = "/images/noimages80x70.png";
        $width = 80;
        $height = 70;
    }
    //$query_reviews = mysql_query("SELECT * FROM table_products WHERE products_id = '".$row["products_id"]."' AND moderat='1'",$link);  
    //$count_reviews = mysql_num_rows($query_reviews);
    echo '
    <li>
    <div class="block-images-list"> 
    <img src="'.$img_path.'"width ="'.$width.'" height="'.$height.'" />
    </div>
    
    
    
    <ul class="reviews-and-counts-list">    
    <li><img src="/images/eye-icon.png"><p>'.$row["count"].'</p></li>
    <li><img src="/images/comment-icon.png"><p>'.$count_reviews.'</p></li>    
    </ul>
    <p class="style-title-list"><a href="#">'.$row["title"].' </a></p>
    
    <a class="add-cart-style-list"></a>
    <p class="style-price-list"><strong>'.$row["price"].'</strong>lei</p>
    <div class="style-text-list">
    '.$row["mini_description"].'
    </div>
    </li>
    ';
}while($row = mysql_fetch_array($result));
}

echo '</ul>';

if ($page != 1){ $pstr_prev = '<li><a class="pstr-prev" href="index.php?page='.($page - 1).'">&lt;</a></li>';}
if ($page != $total) $pstr_next = '<li><a class="pstr-next" href="index.php?page='.($page + 1).'">&gt;</a></li>';


// Формируем ссылки со страницами
if($page - 5 > 0) $page5left = '<li><a href="index.php?page='.($page - 5).'">'.($page - 5).'</a></li>';
if($page - 4 > 0) $page4left = '<li><a href="index.php?page='.($page - 4).'">'.($page - 4).'</a></li>';
if($page - 3 > 0) $page3left = '<li><a href="index.php?page='.($page - 3).'">'.($page - 3).'</a></li>';
if($page - 2 > 0) $page2left = '<li><a href="index.php?page='.($page - 2).'">'.($page - 2).'</a></li>';
if($page - 1 > 0) $page1left = '<li><a href="index.php?page='.($page - 1).'">'.($page - 1).'</a></li>';

if($page + 5 <= $total) $page5right = '<li><a href="index.php?page='.($page + 5).'">'.($page + 5).'</a></li>';
if($page + 4 <= $total) $page4right = '<li><a href="index.php?page='.($page + 4).'">'.($page + 4).'</a></li>';
if($page + 3 <= $total) $page3right = '<li><a href="index.php?page='.($page + 3).'">'.($page + 3).'</a></li>';
if($page + 2 <= $total) $page2right = '<li><a href="index.php?page='.($page + 2).'">'.($page + 2).'</a></li>';
if($page + 1 <= $total) $page1right = '<li><a href="index.php?page='.($page + 1).'">'.($page + 1).'</a></li>';


if ($page+5 < $total)
{
    $strtotal = '<li><p class="nav-point">...</p></li><li><a href="index.php?page='.$total.'">'.$total.'</a></li>';
}else
{
    $strtotal = ""; 
}

if ($total > 1)
{
    echo '
    <div class="pstrnav">
    <ul>
    ';
    echo $pstr_prev.$page5left.$page4left.$page3left.$page2left.$page1left."<li><a class='pstr-active' href='index.php?page=".$page."'>".$page."</a></li>".$page1right.$page2right.$page3right.$page4right.$page5right.$strtotal.$pstr_next;
    echo '
    </ul>
    </div>
    ';
}
?>


</div>
<?php
    
    include("include/block-footer.php");
    ?> 
</div>
</body>
</html>