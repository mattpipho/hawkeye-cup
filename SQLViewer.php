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

 
  $result = $mysqli->query($sql); 
  
  while ($property = mysqli_fetch_field($result)) {
    $fieldNames[] = $property->name;
  }
  $res['NumberOfFields'] = count($fieldNames);
  $res['FieldNames'] = $fieldNames;
  
  if ($result->num_rows !== 0) {
    $x = 0;

    while ($row = $result->fetch_assoc()) {
      for($c=0;$c<count($fieldNames);$c++){
        $res[$x.$fieldNames[$c]] = $row[$fieldNames[$c]]; 

     }

    $x = $x+1;
    }

     $res['NumberOfRows'] = $x;
  }
  
    mysqli_free_result($result);

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
















