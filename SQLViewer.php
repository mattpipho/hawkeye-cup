<?php

include('Main.php');


$task = $_POST['task'];

$sql = $_POST['sql'];

$sql = str_replace("\\","",$sql);

$res;
if($sql <> ""){

  if(strtoupper(substr($sql,0,6))=='SELECT'){
    $res = getSQLResults($sql);
  } elseif (strtoupper(substr($sql,0,6))=='INSERT' 
              || strtoupper(substr($sql,0,6)) =='UPDATE' 
              || strtoupper(substr($sql,0,6)) =='DELETE'){
              
     executeUpdate($sql);
  }
}


include('SQLViewer.html');

function getSQLResults($sql) {

  $res;

  include('dbconnect.php');
  
  $result = mysql_query($sql) or die(mysql_error());
    if ($result) {
      $y=mysql_num_fields($result);

      $res['NumberOfFields'] = $y;
      for($i=0;$i<$y;$i++){
         $fieldNames[] = mysql_field_name($result, $i);
      }
      $res['FieldNames'] = $fieldNames; 
     
$x = 0;
       while ($row = mysql_fetch_array($result)) {
         
          for($c=0;$c<$y;$c++){
             $res[$x.$fieldNames[$c]] = $row[$fieldNames[$c]]; 
          }
         $x = $x+1;
       }
       $res['NumberOfRows'] = $x;
    }
    mysql_free_result($result);
    return $res;
}

function executeUpdate($sql) {

  include('dbconnect.php');

for($statement= strtok($sql, ';'); 
     $statement !== false; 
     $statement=strtok(";")) {

   $InsertResult = mysql_query($statement) or die(mysql_error());

}





}

?>
















