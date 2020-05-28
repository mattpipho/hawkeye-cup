<?php
//header('Content-type: application/json');
define("TOURNAMENT_ID",1);

//if (is_ajax()) {
	if (isset($_POST["action"]) && !empty($_POST["action"])) { //Checks if action value exists
	
		$action = $_POST["action"];
		switch($action) { //Switch case for value of action
			case "login": login(); break;
			case "roundinfo": getRoundInfo(); break;
			case "courseinfo": getCourseInfo(); break;
			case "golfers": getGolfers(); break;
			case "allGolfers": getAllGolfers(); break;
			case "scores": getScores(); break;
			case "savescores": saveHoleScores(); break;
			case "getRoundScores": getRoundScores(); break;
		}
	}
//} 


//Function to check if the request is an AJAX request
function is_ajax() {
	return isset($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest';
}
	
function login(){
	
	$username;
	$username = $_POST["username"];

  include('dbconnect.php');

  $return['userfound']=0;
  $return['message'] = "User Not Found";
 

  $sql_query = "select username from golfer where upper(username) = '" . strtoupper($username) . "'"; 

  $result = $mysqli->query($sql_query);   
  if ($result->num_rows !== 0) {
	if ($row = $result->fetch_assoc()) {
        $return['userfound'] = 1;
        $return['message'] = "User Found";
      } 
    }
	mysqli_free_result($result);

	$return["json"] = json_encode($return);
	echo json_encode($return);
}

function getRoundInfo(){
	  include('dbconnect.php');
	  
		$file = 'log_file.txt';
//	$content = time() . " saveHoleScores \n";
//	file_put_contents($file, $content, FILE_APPEND | LOCK_EX);
	
	 $sql_query = "select * from tournament_rounds " . 
	              "where round_id = (select active_round " .
	              "                    from tournament_information " . 
	              "                   where tournament_id = '" . TOURNAMENT_ID  . "')";
	              
//file_put_contents($file, $sql_query, FILE_APPEND | LOCK_EX);
	
$result = $mysqli->query($sql_query);   
if ($result->num_rows !== 0) {
  if ($row = $result->fetch_assoc()) {
        $return["round_id"] = $row["round_id"];
        $return["round_name"] = $row["round_name"];
      }
    }
    mysqli_free_result($result);
	
	$return["json"] = json_encode($return);
	echo json_encode($return);
}



function getCourseInfo(){
	
	$round_id = $_POST["round_id"];

	//$return["course_id"] = 1;
	//$return["course_name"] = "Eagle Creek";

  include('dbconnect.php');

  $sql_query = "select hole, par, handicap " .
               "from round_course a join course_detail b on a.course_id = b.course_id " . 
               "where a.round_id = " . $round_id;

	$result = $mysqli->query($sql_query);   
	if ($result->num_rows !== 0) {
		while ($row = $result->fetch_assoc()) {
        $holes["h" . $row["hole"]]["number"] = $row["hole"];
        $holes["h" . $row["hole"]]["par"] = $row["par"];
        $holes["h" . $row["hole"]]["handicap"] = $row["handicap"];
      }
    }
    mysqli_free_result($result);
	
	$return["holes"] = $holes;
	
	$return["json"] = json_encode($return);
	echo json_encode($return);
}
function getGolfers(){
	
	$scorekeeper = $_POST["username"];
	$round_id = $_POST["round_id"];
  
	include('dbconnect.php');
	
	//get tee time id
	$sql_query = "select tee_time_id from tee_time_golfers " . 
               "where golfer_id = (select golfer_id from golfer where username = '" . $scorekeeper . "') 
                  AND round_id = '" . $round_id . "'";

		$file = 'log_file.txt';
		$content = time() . " saveHoleScores \n";
		//file_put_contents($file, $content . " " . $sql_query, FILE_APPEND | LOCK_EX);
  
	$result = $mysqli->query($sql_query);   
	if ($result->num_rows !== 0) {
		if ($row = $result->fetch_assoc()) {
        $tee_time_id = $row["tee_time_id"];
      } else {
      	$return["message"] = "TEE TIME ID NOT FOUND";
      }
    }
 
  mysqli_free_result($result);
	
	if($tee_time_id != ""){
	  $sql_query = 
	   "select a.golfer_id, a.first_name, a.last_name, " . 
	   "  c.team, c.handicap, c.level, c.seed " .              
	   " from golfer a join tee_time_golfers b on a.golfer_id = b.golfer_id " . 
	   "    join tournament_golfer c on a.golfer_id = c.golfer_id " . 
	   " WHERE tee_time_id = '" . $tee_time_id . "' " . 
	   "   and round_id = '" . $round_id . "' " . 
	   " ORDER BY c.team";
	
			//file_put_contents($file, $sql_query, FILE_APPEND | LOCK_EX);
	  $position_number = 0;
	  $scorecardPosition = array("A","B","C","D");
      $result = $mysqli->query($sql_query);   
      if ($result->num_rows !== 0) {
        while ($row = $result->fetch_assoc()) {
					$golfer["golfer_id"] = $row['golfer_id'];
					$golfer["first_name"] =  $row['first_name'];
					$golfer["last_name"] =  $row['last_name'];
					$golfer["team"] =  $row['team'];
					$golfer["handicap"] =  $row['handicap'];
					$return[$scorecardPosition[$position_number]] = $golfer;
					$position_number++;
	      }
	      if($position_number < 3){
	      	$return["message"] = "TEE TIME HAS LESS THAN 4 GOLFERS";
	      } else {
	      	$return["message"] = "SUCCESSFUL";
	      }
	    }
	    mysqli_free_result($result);
	}
	
	$return["json"] = json_encode($return);
	echo json_encode($return);
}

function getAllGolfers(){
		
  include('dbconnect.php');

  $sql_query = "select * " .
               "from golfer a join tournament_golfer b " . 
               "     on a.golfer_id = b.golfer_id " . 
               "where tournament_id = '" . TOURNAMENT_ID . "'" ;

	$result = $mysqli->query($sql_query);   
	if ($result->num_rows !== 0) {
		while ($row = $result->fetch_assoc()) {
        $golfer["id"] = $row["golfer_id"];
				$golfer["username"] = $row["username"];
				$golfer["last_name"] = $row["last_name"];
				$golfer["team"] = isset($row["team"])? $row["team"] : "";
				$golfer["handicap"] = isset($row["handicap"])? $row["handicap"] : "";
				$golfer["level"] = isset($row["level"])? $row["level"] : "";
				$golfer["seed"] = isset($row["seed"])? $row["seed"] : "";
				$return["golfers"][]= $golfer;
			}
    }
    mysqli_free_result($result);	

	
	$return["json"] = json_encode($return);
	echo json_encode($return);
}

function getRoundScores(){

	try{
	$round_id = $_POST["round_id"];
			
  include('dbconnect.php');

	$file = 'log_file.txt';
	$content = time() . " getAllScores \n";
	//file_put_contents($file, $content, FILE_APPEND | LOCK_EX);

			  $sql_query_course = "select hole, par, handicap " .
			               "from round_course a join course_detail b on a.course_id = b.course_id " . 
						   "where a.round_id = " . $round_id;
						   
			$result_hole = $mysqli->query($sql_query_course);   
			if ($result_hole->num_rows !== 0) {
				while ($row_hole = $result_hole->fetch_assoc()) {						   
			
			        $holes["h" . $row_hole["hole"]]["number"] = $row_hole["hole"];
			        $holes["h" . $row_hole["hole"]]["par"] = $row_hole["par"];
			        $holes["h" . $row_hole["hole"]]["handicap"] = $row_hole["handicap"];
			      }
			    }
			    mysqli_free_result($result_hole);
				
				$return["course_detail"] = $holes;


  $sql_query = "select * " .
               "from tournament_golfer " . 
               "where tournament_id = '" . TOURNAMENT_ID . "'" ;
               
//file_put_contents($file, $sql_query . '/n', FILE_APPEND | LOCK_EX);

		$result = $mysqli->query($sql_query);   
		if ($result->num_rows !== 0) {
		while ($row = $result->fetch_assoc()) {
        $round["golfer_id"] = $row["golfer_id"];
				$round["round_id"] = $round_id;
				
				$sql_query_scores = "select * from round_score " .
				                     "where round_id = '" . $round_id . "' " .
				                     "  and golfer_id = '" . $round["golfer_id"] . "'";
//file_put_contents($file, $sql_query_scores . '/n', FILE_APPEND | LOCK_EX);

				$result2 = $mysqli->query($sql_query_scores);   
				if ($result2->num_rows !== 0) {
				while ($row2 = $result2->fetch_assoc()) {		                   
						$score["hole"] = $row2["hole"];
						$score["score"] = $row2["score"];
						//file_put_contents($file, 'gid' . $golfer["golfer_id"] . '/n', FILE_APPEND | LOCK_EX);
                
						$scores[] = $score;
					}
				}
				$round["scores"] = $scores;
				
				$return["scores"][] = $round;
				unset($scores);
				unset($round);
				
				 mysqli_free_result($result2);	
			}
    }
    mysqli_free_result($result);	

	} catch (Exception $e) {
	
	    //file_put_contents($file, 'Caught exception: ' . $e->getMessage(), FILE_APPEND | LOCK_EX);
	}
	$return["json"] = json_encode($return);
	echo json_encode($return);
	
	
}

function getScores(){
	
	$round_id = $_POST["round_id"];

	include('dbconnect.php');
	
	//get tee time id
	$sql_query = "select golfer_id,hole,score from round_score " . 
               "where round_id = " . $round_id;
  
	$result = $mysqli->query($sql_query);   
	if ($result->num_rows !== 0) {
		while ($row = $result->fetch_assoc()) {
				//$score["golfer_id"] = $row['golfer_id'];
				//$score["hole"] =  $row['hole'];
				//$score["score"] =  $row['score'];
				$return[$row["golfer_id"]][$row["hole"]]["score"] = $row['score'];
      }
    }
    mysqli_free_result($result);
	
	$return["json"] = json_encode($return);
	echo json_encode($return);
}

function saveHoleScores(){
	
	$round_id = $_POST["round_id"];
	$hole = $_POST["hole"];
	//$holeScore = json_decode($_POST["scores"]);
	$holeScore = $_POST["scores"];
	
	$file = 'log_file.txt';
	$content = time() . " saveHoleScores \n";
	file_put_contents($file, $content, FILE_APPEND | LOCK_EX);
	
	try{
	include('dbconnect.php');
		
	foreach($holeScore as $hs){
			$insertString = "INSERT INTO round_score (round_id,hole,golfer_id,score)  " .
       "VALUES ('" . $round_id . "','" . $hole . "', '" . $hs['id'] . "', '" . $hs['score'] . "') " . 
       "ON DUPLICATE KEY UPDATE score = '" . $hs['score'] . "'";
       file_put_contents($file, time() .  $insertString . "\n", FILE_APPEND | LOCK_EX);
	
	   $result = $mysqli->query($insertString);   

	}
	
} catch (Exception $e) {

    file_put_contents($file, 'Caught exception: ' . $e->getMessage(), FILE_APPEND | LOCK_EX);
}

	
	$return["json"] = "Successful";
	echo json_encode($return);

}

?>