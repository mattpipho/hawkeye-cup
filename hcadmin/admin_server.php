<?php
define("TOURNAMENT_ID",1);

//if (is_ajax()) {
	if (isset($_POST["action"]) && !empty($_POST["action"])) { //Checks if action value exists
	
		$action = $_POST["action"];
		switch($action) { //Switch case for value of action
			case "login": login(); break;
			case "golfers": getGolfers(); break;
			case "saveGolfer": saveGolfer(); break;
			case "saveActiveRound": saveActiveRound(); break;
			case "rounds": getRounds(); break;
			case "getTeeTimes": getTeeTimes(); break;
			case "addTeeTimeGolfer": addTeeTimeGolfer(); break;
			case "removeTeeTimeGolfer": removeTeeTimeGolfer(); break;
			case "getScores": getScores(); break;
		}
	}
//}

//Function to check if the request is an AJAX request
function is_ajax() {
	return isset($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest';
}
	
function login(){
	
	if(isset($_POST["username"]) && 
	   (strtoupper($_POST["username"]) == 'TROY' || 
	    strtoupper($_POST["username"]) == 'MATT') ){
	    	
		$return["message"] = "User Found";
	} else {
		$return["message"] = "User Not Found";
	}
	$return["json"] = json_encode($return);
	echo json_encode($return);
}

function getRounds(){
  include('dbconnect.php');

  $sql_query = "select * " .
               "from tournament_rounds  " . 
               "where tournament_id = '" . TOURNAMENT_ID . "' order by round_name asc" ;

	$result = $mysqli->query($sql_query);   
	if ($result->num_rows !== 0) {
		while ($row = $result->fetch_assoc()) {
        $round["round_id"] = $row["round_id"];
				$round["round_name"] = $row["round_name"];
				$return["rounds"][]= $round;
			}
    }
    mysqli_free_result($result);	

		$sql_query = "select active_round " .
               "from tournament_information  " . 
               "where tournament_id = '" . TOURNAMENT_ID . "'" ;

	$result = $mysqli->query($sql_query);   
	if ($result->num_rows !== 0) {
		if ($row = $result->fetch_assoc()) {
        $return["active_round"]= $row["active_round"];
			}
    }
    mysqli_free_result($result);	

	
	$return["json"] = json_encode($return);
	echo json_encode($return);
}

function getCourseInfo(){
	
	$round_id = $_POST["round_id"];

	$return["course_id"] = 1;
	$return["course_name"] = "Eagle Creek";

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


function getTeeTimes(){
		
	$round_id = $_POST["round_id"];
			
  include('dbconnect.php');

	$file = 'log_file.txt';
	$content = time() . " getTeeTimes \n";

  $sql_query = "select * " .
               "from round_tee_times " . 
               "where round_id = '" . $round_id . "'" ;

	$result = $mysqli->query($sql_query);   
	if ($result->num_rows !== 0) {
		while ($row = $result->fetch_assoc()) {
        $tee_time["tee_time_id"] = $row["tee_time_id"];
				$tee_time["tee_time"] = $row["tee_time"];
				
				$sql_query_golfers = "select * from tee_time_golfers " .
				                     "where round_id = '" . $round_id . "' " .
				                     "  and tee_time_id = '" . $tee_time["tee_time_id"] . "'";

				$result2 = $mysqli->query($sql_query_golfers);   
				if ($result2->num_rows !== 0) {
				while ($row2 = $result2->fetch_assoc()) {			                   
						$golfer["golfer_id"] = $row2["golfer_id"];
						//file_put_contents($file, 'gid' . $golfer["golfer_id"] . '/n', FILE_APPEND | LOCK_EX);
                
						$golfers[] = $golfer;
					}
				}
				$tee_time["golfers"] = $golfers;
				
				$return["tee_times"][] = $tee_time;
				unset($golfers);
				unset($tee_time);
				
				 mysqli_free_result($result2);	
			}
            
    }
    mysqli_free_result($result);	

	
	$return["json"] = json_encode($return);
	echo json_encode($return);
}


function saveGolfer(){
	
	$golfer_id = $_POST["golfer_id"];
	$team = $_POST["team"];
	$handicap = $_POST["handicap"];
	
	$file = 'log_file.txt';
	$content = time() . " saveHoleScores \n";
	//file_put_contents($file, $content, FILE_APPEND | LOCK_EX);
	
	try{
		include('dbconnect.php');

			$updateString = "update tournament_golfer " .
			                "   set team = '" . $team . "', " .
			                "       handicap = '" . $handicap . "' " .
			                " WHERE golfer_id = '" . $golfer_id . "' " .
			                "   AND tournament_id = '" . TOURNAMENT_ID . "'";
       //file_put_contents($file, time() .  $updateString . "\n", FILE_APPEND | LOCK_EX);
	   $result = $mysqli->query($updateString);   
	
	
	} catch (Exception $e) {
	
	    file_put_contents($file, 'Caught exception: ' . $e->getMessage(), FILE_APPEND | LOCK_EX);
	}

	
	$return["json"] = "Successful";
	echo json_encode($return);

}

function addTeeTimeGolfer(){
	
	$file = 'log_file.txt';
	$content = time() . " addTeeTimeGolfer \n";
	//file_put_contents($file, $content, FILE_APPEND | LOCK_EX);
	
	$golfer_id = $_POST["golfer_id"];
	$round_id = $_POST["round_id"];
	$tee_time_id = $_POST["tee_time_id"];
	
	try{
		
		include('dbconnect.php');

			$insertString = "INSERT INTO tee_time_golfers (tee_time_id, golfer_id, round_id) " .
			                "VALUES('" . $tee_time_id . "', " .
			                "'" . $golfer_id . "', " .
			                "'" . $round_id . "')";
       //file_put_contents($file, time() .  $insertString . "\n", FILE_APPEND | LOCK_EX);
	   $result = $mysqli->query($insertString);   
	
	
	} catch (Exception $e) {
	
	    file_put_contents($file, 'Caught exception: ' . $e->getMessage(), FILE_APPEND | LOCK_EX);
	}


	$return["json"] = "Successful";
	echo json_encode($return);

}

function removeTeeTimeGolfer(){
	
	$file = 'log_file.txt';
	$content = time() . " removeTeeTimeGolfer \n";
	//file_put_contents($file, $content, FILE_APPEND | LOCK_EX);
	
	$golfer_id = $_POST["golfer_id"];
	$round_id = $_POST["round_id"];
	$tee_time_id = $_POST["tee_time_id"];
	
	try{
		
		include('dbconnect.php');

			$deleteString = "DELETE FROM tee_time_golfers " .
			                "WHERE tee_time_id = '" . $tee_time_id . "' AND " .
			                "golfer_id = '" . $golfer_id . "' AND " .
			                "round_id = '" . $round_id . "'";
       //file_put_contents($file, time() .  $deleteString . "\n", FILE_APPEND | LOCK_EX);
	   $result = $mysqli->query($deleteString);   

	
	} catch (Exception $e) {
	
	    file_put_contents($file, 'Caught exception: ' . $e->getMessage(), FILE_APPEND | LOCK_EX);
	}


	$return["json"] = "Successful";
	echo json_encode($return);

}


function saveActiveRound(){
	
	$round_id = $_POST["round_id"];
	
	$file = 'log_file.txt';
	$content = time() . " saveActiveRound \n";
	//file_put_contents($file, $content, FILE_APPEND | LOCK_EX);
	
	try{
		include('dbconnect.php');

			$updateString = "update tournament_information " .
			                "   set active_round = '" . $round_id . "' " .
			                " WHERE tournament_id = '" . TOURNAMENT_ID . "'";
       //file_put_contents($file, time() .  $updateString . "\n", FILE_APPEND | LOCK_EX);
	   $result = $mysqli->query($updateString);   

	
	} catch (Exception $e) {
	
	    file_put_contents($file, 'Caught exception: ' . $e->getMessage(), FILE_APPEND | LOCK_EX);
	}

	
	$return["json"] = "Successful";
	echo json_encode($return);

}

function getScores(){

	try{

	$round_id = $_POST["round_id"];
			
  include('dbconnect.php');

	$file = 'log_file.txt';
	$content = time() . " getScores \n";
	//file_put_contents($file, $content, FILE_APPEND | LOCK_EX);

  $sql_query = "select * " .
               "from tournament_golfer a join tee_time_golfers b  " .
				       " on a.golfer_id = b.golfer_id " . 
               "where tournament_id = '" . TOURNAMENT_ID . "' " . 
               "  and round_id = '" . $round_id . "' " . 
               "order by a.golfer_id" ;
  
file_put_contents($file, $sql_query . '/n', FILE_APPEND | LOCK_EX);

	$result = $mysqli->query($sql_query);   
	if ($result->num_rows !== 0) {
	while ($row = $result->fetch_assoc()) {
        $round["golfer_id"] = $row["golfer_id"];
				$round["round_id"] = $round_id;
				$round["tee_time_id"] = $row["tee_time_id"];
				
				
				$sql_query_scores = "select * " .
				                    " from round_score  " . 
				                     "where round_id = '" . $round_id . "' " .
				                     "  and golfer_id = '" . $round["golfer_id"] . "'";
file_put_contents($file, $sql_query_scores . '/n', FILE_APPEND | LOCK_EX);

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
	
	    file_put_contents($file, 'Caught exception: ' . $e->getMessage(), FILE_APPEND | LOCK_EX);
	}
	$return["json"] = json_encode($return);
	echo json_encode($return);
	
	
}

?>