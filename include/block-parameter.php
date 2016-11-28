<script type="text/javascript">
$(document).ready(function(){
    $('#blocktrackbar').trackbar({
        onMove: function(){
            document.getElementById("start-price").value = this.leftValue;
            document.getElementById("end-price").value = this.rightValue;
        },
        width: 160,
        leftLimit: 500,
        leftValue: <?php 
            if((int)$_GET["start_price"] >= 500 AND (int)$_GET["start_price"] <= 50000){
                echo (int) $_GET["start_price"];
            }else{
                echo "500";
            }
        ?>
        ,
        rightLimit: 30000,
        rightValue: <?php 
            if((int)$_GET["end_price"] >= 1000 AND (int)$_GET["end_price"] <= 50000){
                echo (int) $_GET["end_price"];
            }else{
                echo "30000";
            }
        ?>,
        roundUp: 100
    });
});
</script>

<div id="block-parameter">
<p class="header-title"> Cautare parametrizata</p>
<p class="title-filter">Pret</p>

<form method="GET" action="search_filter.php">
<div id="block-input-price">
    <ul>
        <li>De la </li>
        <li> <input type="text" id="start-price" name="start_price" value="500" /></li>
        <li>Pana</li>
        <li> <input type="text" id="end-price" name="end_price" value="30000" /></li>
       <!-- <li>lei</li> -->
    </ul>

</div>
<div id="blocktrackbar"></div>
<p class="title-filter">Producatori</p>

<ul class="checkboxbrand">
    
    <?php
        $result = mysql_query("SELECT * FROM category WHERE type='mobile'",$link);
        if(mysql_num_rows($result) > 0){
            $row = mysql_fetch_array($result);
            do{
                $checked_brand = "";
                if($_GET["brand"]){
                    if(in_array($row["id"],$_GET["brand"]))
                    $checked_brand = "checked";
                }
                echo '                
                <li><input '.$checked_brand.' type="checkbox" name="brand[]" value="'.$row["id"].'" id="checkbrend'.$row["id"].'" /><label for="'.$row["id"].'">'.$row["brand"].'</label></li>
                                
                ';
                
            }while($row = mysql_fetch_array($result));
        }
    ?>
</ul>
<center><input type="submit" name="submit" id="button-param-search" value=""  /></center>
</form>
</div>