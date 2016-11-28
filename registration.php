<?php 
require_once("include/db_connect.php");
require_once("functions/functions.php");

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
    <script type="text/javascript" src="js/jquery.form.js"></script>
    <script type="text/javascript" src="js/jquery.validate.js"></script>

<script type="text/javascript">
$(document).ready(function() {	
      $('#form_reg').validate(
				{	
					// reguli de control
					rules:{
						"reg_login":{
							required:true,
							minlength:5,
                            maxlength:15,
                            remote: {
                            type: "post",    
		                    url: "/reg/check_login.php"
		                            }
						},
						"reg_pass":{
							required:true,
							minlength:7,
                            maxlength:15
						},
						"reg_surname":{
							required:true,
                            minlength:3,
                            maxlength:15
						},
						"reg_name":{
							required:true,
                            minlength:3,
                            maxlength:15
						},
                        "reg_patronymic":{
							required:true,
                            minlength:3,
                            maxlength:25
						},						
						"reg_email":{
						    required:true,
							email:true
						},
						"reg_phone":{
							required:true
						},
						"reg_address":{
							required:true
						},
						"reg_captcha":{
							required:true,
                            remote: {
                            type: "post",    
		                    url: "/reg/check_captcha.php"
		                    
		                            }
                            
						}
					},

					// Mesaj
					messages:{
						"reg_login":{
							required:"Introduceti loginul!",
                            minlength:"De la 5 la 15 simboluri!",
                            maxlength:"De la 5 la 15 simboluri!",
                            remote: "Login ocupat!"
						},
						"reg_pass":{
							required:"Introduceti parola!",
                            minlength:"De la 7 la 15 simboluri!",
                            maxlength:"De la 7 la 15 simboluri!"
						},
						"reg_surname":{
							required:"Introduceti numele!",
                            minlength:"De la 3 la 20 simboluri!",
                            maxlength:"De la 3 la 20 simboluri!!"                            
						},
						"reg_name":{
							required:"Introduceti prenumele!",
                            minlength:"De la 3 la 15 simboluri!",
                            maxlength:"De la 3 la 15 simboluri!"                               
						},
                        "reg_patronymic":{
							required:"Introduceti patronimicul dvs.!",
                            minlength:"De la 3 la 25 simboluri!",
                            maxlength:"De la 3 la 25 simboluri!"  
						},
						
						"reg_email":{
						    required:"Introduceti Email",
							email:"Email incorect!"
						},
						"reg_phone":{
							required:"Indicati numarul de telefon!"
						},
						"reg_address":{
							required:"Indicati adresa dvs.!"
						},
						"reg_captcha":{
							required:"Introduceti codul din imagine!",
                            remote: "Cod incorect!"
						}
					},
					
	submitHandler: function(form){
	$(form).ajaxSubmit({
	success: function(data) { 
								 
        if (data == 'true')
    {
       $("#block-form-registration").fadeOut(300,function() {
        
        $("#reg_message").addClass("reg_message_good").fadeIn(400).html("V-ați înregistrat cu succes!");
        $("#form_submit").hide();
        
       });
         
    }
    else
    {
       $("#reg_message").addClass("reg_message_error").fadeIn(400).html(data); 
    }
		} 
			}); 
			}
			});
    	});
     
</script>   
    
	<title>Inregistrare</title>
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
<h2 class="h2-title">Inregistrare</h2>

<form method="post" id="form_reg" action="/reg/handler_reg.php">
<p id="reg_message"> </p>
<div id="block-form-registration">
<ul id="form-registration">

<li>
    <label>Login</label>
    <span class="star">*</span>
    <input type="text" name="reg_login" id="reg_login"/>
</li>
<li>
    <label>Parola</label>
    <span class="star">*</span>
    <input type="text" name="reg_pass" id="reg_pass"/>
    <span id="genpass">Genereaza</span>
</li>
<li>
    <label>Nume</label>
    <span class="star">*</span>
    <input type="text" name="reg_surname" id="reg_surname"/>
</li>
<li>
    <label>Prenume</label>
    <span class="star">*</span>
    <input type="text" name="reg_name" id="reg_name"/>
</li>
<li>
<label>Patronimic</label>
<span class="star" >*</span>
<input type="text" name="reg_patronymic" id="reg_patronymic" />
</li>
<li>
    <label>Email</label>
    <span class="star">*</span>
    <input type="text" name="reg_email" id="reg_email"/>
</li>
<li>
    <label>Numarul de telefon</label>
    <span class="star">*</span>
    <input type="text" name="reg_phone" id="reg_phone"/>
</li>
<li>
    <label>Adresa</label>
    <span class="star">*</span>
    <input type="text" name="reg_address" id="reg_address"/>
</li>
<li>
    <div id="block-captcha">
        <img src="/reg/reg_captcha.php" />
        <input type="text" name="reg_captcha" id="reg_captcha" />
        <p id="reloadcaptcha">Reload</p>
    </div>
</li>
</ul>
</div>
<p align="right"><input type="submit" name="reg_submit" id="form_submit" value="Inregistrare" /></p>
</form>
</div>
<?php
    
    include("include/block-footer.php");
    ?> 
</div>
</body>
</html>