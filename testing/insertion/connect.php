<?php
    $dbHost = "localhost";
    $dbUser = "root";
    $dbPassword = "";
    $dbName = "nkap";


   try{
     $dsn = "mysql:host=".$dbHost.";dbname=".$dbName ;
     $pdo=new PDO($dsn,$dbUser,$dbPassword );
      

   }
   catch(PDOException $e){
      echo "DB connectionfailed".$e->getMessage();
   }





?>