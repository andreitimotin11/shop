<?php
 if($_SERVER["REQUEST_METHOD"] == "POST")
{ 
 session_start();
 define('myeshop', true);
 include("../include/db_connect.php");
 include("../functions/functions.php");
 
     $error = array();
         
        $login = iconv("UTF-8", "cp1251",strtolower(clear_string($_POST['reg_login']))); 
        $pass = iconv("UTF-8", "cp1251",strtolower(clear_string($_POST['reg_pass']))); 
        $surname = iconv("UTF-8", "cp1251",clear_string($_POST['reg_surname'])); 
        
        $name = iconv("UTF-8", "cp1251",clear_string($_POST['reg_name'])); 
        $patronymic = iconv("UTF-8", "cp1251",clear_string($_POST['reg_patronymic'])); 
        $email = iconv("UTF-8", "cp1251",clear_string($_POST['reg_email'])); 
        
        $phone = iconv("UTF-8", "cp1251",clear_string($_POST['reg_phone'])); 
        $address = iconv("UTF-8", "cp1251",clear_string($_POST['reg_address'])); 
 
 
    if (strlen($login) < 5 or strlen($login) > 15)
    {
       $error[] = "Loginul trebuie să aibă lungimea 5-15 caractere!"; 
    }
    else
    {   
     $result = mysql_query("SELECT login FROM reg_user WHERE login = '$login'",$link);
    If (mysql_num_rows($result) > 0)
    {
       $error[] = "Login-ul este ocupat!";
    }
            
    }
     
    if (strlen($pass) < 7 or strlen($pass) > 15) $error[] = "Introduceti parola din 7-15 caractere!";
    if (strlen($surname) < 3 or strlen($surname) > 20) $error[] = "Introduceti prenumele(3-20 caractere)!";
    if (strlen($name) < 3 or strlen($name) > 15) $error[] = "Introduceti numele(3-15 caractere)!";
    if (strlen($patronymic) < 3 or strlen($patronymic) > 25) $error[] = "Introduceti patronimicul(3-15 caractere)!";
    if (!preg_match("/^(?:[a-z0-9]+(?:[-_.]?[a-z0-9]+)?@[a-z0-9_.-]+(?:\.?[a-z0-9]+)?\.[a-z]{2,5})$/i",trim($email))) $error[] = "Укажите корректный email!";
    if (!$phone) $error[] = "Introduceti numarul de telefon!";
    if (!$address) $error[] = "Trebuie introdusa adresa!";
    
    if($_SESSION['img_captcha'] != strtolower($_POST['reg_captcha'])) $error[] = "Cod incorect!";
    unset($_SESSION['img_captcha']);
    
   if (count($error))
   {
    
 echo implode('<br />',$error);
     
   }else
   {   
        $pass   = md5($pass);
        $pass   = strrev($pass);
        $pass   = "9nm2rv8q".$pass."2yo6z";
        
        $ip = $_SERVER['REMOTE_ADDR'];
		
		mysql_query("	INSERT INTO reg_user(login,pass,surname,name,patronymic,email,phone,address,datetime,ip)
						VALUES(
						
							'".$login."',
							'".$pass."',
							'".$surname."',
							'".$name."',
							'".$patronymic."',
                            '".$email."',
                            '".$phone."',
                            '".$address."',
                            NOW(),
                            '".$ip."'							
						)",$link);

 echo 'true';
 }        


}
?>