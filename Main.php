<?php

//Used in following files (ViewLineup,SetLineup,scheduleresults)
function getCurrentWeek() {

  global $team_setup;
  $CurrentWeek;

  include('dbconnect.php');

  
  $sql_query = "select ParameterValue from configuration " .
               "where ParameterName = 'CURRENT_WEEK'";
  
  $result = mysql_query($sql_query) or die(mysql_error());
    if ($result) {
      if ($row = mysql_fetch_array($result)) {
        $CurrentWeek = $row["ParameterValue"];
      }
    }
    mysql_free_result($result);
    return $CurrentWeek;
}


function getESPNGameNumbers($year,$week){
    
   include('dbconnect.php');

  
  $sql_query = "select EspnGameId from scheduleresults " .
                      "where Year = '" . $year ."' " .
                      "and Week = '" . $week ."' ORDER BY Date";

  $result = mysql_query($sql_query) or die(mysql_error());
    if ($result) {
      while ($row = mysql_fetch_array($result)) {
        $games[] = $row["EspnGameId"];
      }
    }
    mysql_free_result($result);
    return $games;   
    
    
}

function getPlayerByName($name, $year = null){
    
    $player = null;
    if($year == null) $year = getCurrentYear();
    
    
    $name = str_replace("'","",$name);
  include('dbconnect.php');
    
  $sql_query = "select * " .
                      "from playerinfo  " .
                      "where concat(firstname,' ',lastname) = '$name' and Year = '".$year."'";      

  $result = mysql_query($sql_query) or die(mysql_error());
    if ($result) {
      if ($row = mysql_fetch_array($result)) {
        $player['id'] = $row["CBSID"];
        $player['team'] = $row["Team"];
      }
    }
    mysql_free_result($result);    
    return $player;
    
}

function updatePoints($year,$week){

    if($year == '') $year = getCurrentYear();
    if($week == '') $week = getCurrentWeek();
    
        $update = "update playerstats " . 
                  "   set points = (Truncate(PassingYards/25,0) + " . 
                  "                Truncate(RushingYards/10,0) + " . 
                  "                Truncate(RecievingYards/15,0) + " . 
                  "                ((PassingTDs + RushingTDs + RecievingTDs)*5) + " .
                  "                ((PassingInt)*-3) + " .
                  "                ((Passing2PC + Rushing2PC + Recieving2PC)*2) + " .
                  "                (Receptions) + " .
                  "                (PAT*2) + " .
                  "                (`FG1-39`*4) + " .
                  "                (`FG40-49`*5) + " .
                  "                (FG50*6) + " .
                  "                (Other)) " .
                  " WHERE year = '" . $year . "' " . 
                  "   AND week = '" . $week . "'";
       $result = mysql_query($update) or die(mysql_error()); 
    
}

function displayPlayerStats($year) {

  include('dbconnect.php');

  
  $sql       = "select a.Year,a.Week,a.PlayerID,b.cbsid,concat(b.FirstName, ' ', b.LastName, ' ',b.Team, '-',b.Position) as LongName, " .
               "b.FirstName,b.LastName,b.Team,b.Position," . 
               "PassingYards,PassingTDs, PassingInt,Passing2PC,RushingYards,RushingTDs," . 
               "Rushing2PC,Receptions,RecievingYards,RecievingTDs,Recieving2PC,PAT,`FG1-39`,".
               "`FG40-49`,`FG50`,Other,Points " .
               "from playerstats a join playerinfo b on a.playerid = b.playerid and a.year = b.year " .
               "where a.year = $year";

  $result = mysql_query($sql) or die(mysql_error());
    if ($result) {
      $y=mysql_num_fields($result);

      $res['NumberOfFields'] = $y;
      echo '<table id="stats" class="dispaly"><thead><tr>';
      for($i=0;$i<$y;$i++){
         $fieldName = mysql_field_name($result, $i);
         $fieldNames[] = $fieldName;
         echo '<th>' . $fieldName . '</th>';
      }
      echo '</tr></thead>';
      $res['FieldNames'] = $fieldNames; 
     
      $x = 0;
       while ($row = mysql_fetch_array($result)) {
         
          echo '<tr>';
          for($c=0;$c<$y;$c++){
              
             $res[$x.$fieldNames[$c]] = $row[$fieldNames[$c]]; 
             echo '<td>' . $row[$fieldNames[$c]] . '</td>';
          }

          
          echo '</tr>';
         $x = $x+1;
       }
       echo '</table>';
       $res['NumberOfRows'] = $x;
    }
    mysql_free_result($result);
    
}

function saveTrafficLog($uname,$page){
	  include('dbconnect.php');
	  $timestamp = date("Y-n-j G:i:s");               
    $Insert_String = "INSERT INTO traffic_log " .
       "VALUES ( '$uname', '$timestamp', '$page') ";
$result = mysql_query($Insert_String) or die(mysql_error());
}

//Used in following files (ViewLineup,SetLineup,scheduleresults)
function getCurrentYear() {

  global $team_setup;
  $CurrentWeek;

  include('dbconnect.php');

  
  $sql_query = "select ParameterValue from configuration " .
               "where ParameterName = 'CURRENT_YEAR'";
  
  $result = mysql_query($sql_query) or die(mysql_error());
    if ($result) {
      if ($row = mysql_fetch_array($result)) {
        $CurrentYear = $row["ParameterValue"];
      }
    }
    mysql_free_result($result);
    return $CurrentYear;
}

//Used in following files (ViewLineup,SetLineup)
function getCurrentLineup($lineup) {


  include('dbconnect.php');

  $sql_query = "select UserName,FirstName, LastName,Team,Position,Week,a.PlayerID " .
                      "from playerinfo a, playerselection b " .
                      "where a.PlayerID = b.PlayerID " .
                      "and b.UserName = '" . $lineup['UserName'] . "' ".
                      "and b.Year = '".getCurrentYear()."'";

  $result = mysql_query($sql_query) or die(mysql_error());
    if ($result) {
      while ($row = mysql_fetch_array($result)) {
        $pos = $row["Position"];
        $week = $row["Week"];
        $user = $row["UserName"];
        if($pos == 'RB' || $pos=='WR'){
           if($lineup[$week.$user.$pos.'1Name']==''){
              $pos = $pos . '1';
           } else {
              $pos = $pos . '2';
           }
        } 
        $lineup[$week.$user.$pos.'Name'] = $row["LastName"];
        $lineup[$week.$user.$pos.'Team'] = $row["Team"];
        $lineup[$week.$user.$pos.'ID'] = $row["PlayerID"];
      }
    }
    mysql_free_result($result);

  $sql_query = "select UserName,Team,Week " .
                      "from defenseselection " .
                      "where UserName = '" . $lineup['UserName'] . "' ".
                      "and Year = '".getCurrentYear()."'";
  
  $result = mysql_query($sql_query) or die(mysql_error());
    if ($result) {
      while ($row = mysql_fetch_array($result)) {
        $team = $row["Team"];
        $user = $row["UserName"];
        $week = $row["Week"];

        if($lineup[$week.$user.'DEF1']==''){
            $lineup[$week.$user.'DEF1'] = $team;
        } else {
            $lineup[$week.$user.'DEF2'] = $team;
        }
      }
    }
    mysql_free_result($result);

  $sql_query = "select UserName,Team,Week " .
                      "from winselection " .
                      "where UserName = '" . $lineup['UserName'] . "' ".
                      "and Year = '".getCurrentYear()."'";
  
  $result = mysql_query($sql_query) or die(mysql_error());
    if ($result) {
      while ($row = mysql_fetch_array($result)) {
        $team = $row["Team"];
        $user = $row["UserName"];
        $week = $row["Week"];

        if($lineup[$week.$user.'WIN1']==''){
            $lineup[$week.$user.'WIN1'] = $team;
        } else {
            $lineup[$week.$user.'WIN2'] = $team;
        }
      }
    }
    mysql_free_result($result);

    return $lineup;
}

//Used in following files (SetLineup,scheduleresults)
function getCurrentStatus() {

  $status;

  include('dbconnect.php');

  
  $sql_query = "select ParameterValue from configuration " .
               "where ParameterName = 'CURRENT_STATUS'";
  
  $result = mysql_query($sql_query) or die(mysql_error());
    if ($result) {
      if ($row = mysql_fetch_array($result)) {
        $status = $row["ParameterValue"];
      }
    }
    mysql_free_result($result);
    return $status;
}

//Used in following files (SetLineup)
function getPlayers($pos) {

  $players;
  global $currentYear;

  include('dbconnect.php');

  
  $sql_query = "select * from playerinfo " .
                      "where Position = '" . $pos ."' " .
                      "and Year = '" . $currentYear . "' " .
                      "order by Team,LastName";

  $result = mysql_query($sql_query) or die(mysql_error());
    if ($result) {
      while ($row = mysql_fetch_array($result)) {
        $player['PlayerID'] = $row["PlayerID"];
        $player['FirstName'] = $row["FirstName"];
        $player['LastName'] = $row["LastName"];
        $player['Team'] = $row["Team"];
        $players[] = $player;
      }
    }
    mysql_free_result($result);
    return $players;
}

//Used in following files (SetLineup)
function getLastWeekPlayers($year, $week) {


  $selections;

  include('dbconnect.php');

  $sql_query = "select UserName,LastName,Team,Position " .
                      "from playerinfo a, playerselection b " .
                      "where a.PlayerID = b.PlayerID " .
                      "and b.Week = " . $week . " " .
                      "and b.Year = " . $year;
  
  $result = mysql_query($sql_query) or die(mysql_error());
    if ($result) {
      while ($row = mysql_fetch_array($result)) {
        $pos = $row["Position"];
        $user = $row["UserName"];
        if($pos == 'RB' || $pos=='WR'){
           if($selections[$user.$pos.'1Name']==''){
              $pos = $pos . '1';
           } else {
              $pos = $pos . '2';
           }
        } 
        $selections[$user.$pos.'Name'] = $row["LastName"];
        $selections[$user.$pos.'Team'] = $row["Team"];
      }
    }
    mysql_free_result($result);

  $sql_query = "select UserName,Team " .
                      "from defenseselection " .
                      "where Week = " . $week . " " .
                      "and Year = " . $year;
  
  $result = mysql_query($sql_query) or die(mysql_error());
    if ($result) {
      while ($row = mysql_fetch_array($result)) {
        $team = $row["Team"];
        $user = $row["UserName"];

        if($selections[$user.'DEF1']==''){
            $selections[$user.'DEF1'] = $team;
        } else {
            $selections[$user.'DEF2'] = $team;
        }
      }
    }
    mysql_free_result($result);

  $sql_query = "select UserName,Team " .
                      "from winselection " .
                      "where Week = " . $week . " " .
                      "and Year = " . $year;
  
  $result = mysql_query($sql_query) or die(mysql_error());
    if ($result) {
      while ($row = mysql_fetch_array($result)) {
        $team = $row["Team"];
        $user = $row["UserName"];

        if($selections[$user.'WIN1']==''){
            $selections[$user.'WIN1'] = $team;
        } else {
            $selections[$user.'WIN2'] = $team;
        }
      }
    }
    mysql_free_result($result);

    return $selections;
}

//Used in following files (SetLineup)
function getLastWeekSelections($uname,$year, $week) {


  $selections;

  include('dbconnect.php');

  $sql_query = "select UserName,LastName,Team,Position,a.PlayerID " .
                      "from playerinfo a, playerselection b " .
                      "where a.PlayerID = b.PlayerID " .
                      "and b.Week = " . $week . " " .
                      "and b.Year = " . $year. " " .
                      "and b.Username = '" . $uname . "'";

  $result = mysql_query($sql_query) or die(mysql_error());
    if ($result) {
      while ($row = mysql_fetch_array($result)) {
        $pos = $row["Position"];
        $user = $row["UserName"];
        if($pos == 'RB' || $pos=='WR'){
           if($selections[$user.$pos.'1Name']==''){
              $pos = $pos . '1';
           } else {
              $pos = $pos . '2';
           }
        } 
        $selections[$user.$pos.'Name'] = $row["LastName"];
        $selections[$user.$pos.'Team'] = $row["Team"];
        $selections[$user.$pos.'ID'] = $row["PlayerID"];
      }
    }
    mysql_free_result($result);

  $sql_query = "select UserName,Team " .
                      "from defenseselection " .
                      "where Week = " . $week . " " .
                      "and Year = " . $year. " " .
                      "and Username = '" . $uname . "'";
  
  $result = mysql_query($sql_query) or die(mysql_error());
    if ($result) {
      while ($row = mysql_fetch_array($result)) {
        $team = $row["Team"];
        $user = $row["UserName"];

        if($selections[$user.'DEF1']==''){
            $selections[$user.'DEF1'] = $team;
        } else {
            $selections[$user.'DEF2'] = $team;
        }
      }
    }
    mysql_free_result($result);

  $sql_query = "select UserName,Team " .
                      "from winselection " .
                      "where Week = " . $week . " " .
                      "and Year = " . $year. " " .
                      "and Username = '" . $uname . "'";
  
  $result = mysql_query($sql_query) or die(mysql_error());
    if ($result) {
      while ($row = mysql_fetch_array($result)) {
        $team = $row["Team"];
        $user = $row["UserName"];

        if($selections[$user.'WIN1']==''){
            $selections[$user.'WIN1'] = $team;
        } else {
            $selections[$user.'WIN2'] = $team;
        }
      }
    }
    mysql_free_result($result);

    return $selections;
}

//Used in following files (SetLineup)
function setLineup($lineup){

 global $lineupmessage;
 global $currentYear;
$retVal = 0;
  include('dbconnect.php');


  $sql_query = "select * from users " .
               "where UserName = '" . $lineup['UserName'] ."'";
  
  $result = mysql_query($sql_query) or die(mysql_error());
    if ($result) {
      if ($row = mysql_fetch_array($result)) {
    
         $DeleteQuery = "DELETE FROM playerselection " .
                                 "WHERE UserName = '" . $lineup['UserName'] . "' " .
                                 "AND Week = " . $lineup['Week'] . " " .
                                 "AND Year = " . $currentYear;
         $DeleteResult = mysql_query($DeleteQuery) or die(mysql_error());


         $InsertQuery ="INSERT INTO playerselection " .
                               "VALUES (1,'".$currentYear."'," . $lineup['Week'] . ", '" .
                               $lineup['UserName'] . "', " . $lineup['QB'] . ") ";
         $InsertResult = mysql_query($InsertQuery ) or die(mysql_error());

         $InsertQuery ="INSERT INTO playerselection " .
                               "VALUES (1,'".$currentYear."'," . $lineup['Week'] . ", '" .
                               $lineup['UserName'] . "', " . $lineup['RB1'] . ") ";
         $InsertResult = mysql_query($InsertQuery ) or die(mysql_error());

         $InsertQuery ="INSERT INTO playerselection " .
                               "VALUES (1,'".$currentYear."'," . $lineup['Week'] . ", '" .
                               $lineup['UserName'] . "', " . $lineup['RB2'] . ") ";
         $InsertResult = mysql_query($InsertQuery ) or die(mysql_error());

         $InsertQuery ="INSERT INTO playerselection " .
                               "VALUES (1,'".$currentYear."'," . $lineup['Week'] . ", '" .
                               $lineup['UserName'] . "', " . $lineup['WR1'] . ") ";
         $InsertResult = mysql_query($InsertQuery ) or die(mysql_error());


         $InsertQuery ="INSERT INTO playerselection " .
                               "VALUES (1,'".$currentYear."'," . $lineup['Week'] . ", '" .
                               $lineup['UserName'] . "', " . $lineup['WR2'] . ") ";
         $InsertResult = mysql_query($InsertQuery ) or die(mysql_error());

         $InsertQuery ="INSERT INTO playerselection " .
                               "VALUES (1,'".$currentYear."'," . $lineup['Week'] . ", '" .
                               $lineup['UserName'] . "', " . $lineup['K'] . ") ";
         $InsertResult = mysql_query($InsertQuery ) or die(mysql_error());

         $DeleteQuery = "DELETE FROM defenseselection " .
                                 "WHERE UserName = '" . $lineup['UserName'] . "' " .
                                 "AND Week = " . $lineup['Week'] . " " .
                                 "AND Year = " . $currentYear;
         $DeleteResult = mysql_query($DeleteQuery) or die(mysql_error());

         $InsertQuery ="INSERT INTO defenseselection " .
                               "VALUES (1,'".$currentYear."'," . $lineup['Week'] . ", '" .
                               $lineup['UserName'] . "', '" . $lineup['DEF1'] . "') ";
         $InsertResult = mysql_query($InsertQuery ) or die(mysql_error());

         $InsertQuery ="INSERT INTO defenseselection " .
                               "VALUES (1,'".$currentYear."'," . $lineup['Week'] . ", '" .
                               $lineup['UserName'] . "', '" . $lineup['DEF2'] . "') ";
         $InsertResult = mysql_query($InsertQuery ) or die(mysql_error());


         $DeleteQuery = "DELETE FROM winselection " .
                                 "WHERE UserName = '" . $lineup['UserName'] . "' " .
                                 "AND Week = " . $lineup['Week'] . " " .
                                 "AND Year = " . $currentYear;
         $DeleteResult = mysql_query($DeleteQuery) or die(mysql_error());

         $InsertQuery ="INSERT INTO winselection " .
                               "VALUES (1,'".$currentYear."'," . $lineup['Week'] . ", '" .
                               $lineup['UserName'] . "', '" . $lineup['WIN1'] . "') ";
         $InsertResult = mysql_query($InsertQuery ) or die(mysql_error());

         $InsertQuery ="INSERT INTO winselection " .
                               "VALUES (1,'".$currentYear."'," . $lineup['Week'] . ", '" .
                               $lineup['UserName'] . "', '" . $lineup['WIN2'] . "') ";
         $InsertResult = mysql_query($InsertQuery ) or die(mysql_error());

         $retVal = 1;
         $lineupmessage = "<font color=009900><b>Lineup Successfully Added.</b></font>";

      } else {
        $lineupmessage = "<font color=RED><b>INCORRECT PASSWORD.</b></font>";
      }
    }
    mysql_free_result($result);

mail('PiphoMatthewJ@JohnDeere.com','Big10: SetLineup ','from: '.$lineup['UserName'], 'From: MessageBoard@piphofamily.com');

   return $retVal;
}

//Used in following files (messageboard)
function saveMessage($name, $message) {
include('dbconnect.php');

$timestamp = date("Y-n-j G:i:s");               
    $Insert_String = "INSERT INTO messageboard" .
       "(message_name, message_text, message_date) " .
       "VALUES ( '$name', '$message', '$timestamp') ";
$result = mysql_query($Insert_String) or die(mysql_error());
mail('PiphoMatthewJ@JohnDeere.com,Big10Fantasy@egroups.com','Big10: New Message Board Post','from: '.$name.' - '.$message, 'From: Big10Fantasy@egroups.com');
}

//Used in following files (messageboard)
function getMessages() {

  $messages;

  include('dbconnect.php');

  $sql_query = "SELECT * FROM messageboard " .
      "ORDER BY message_date DESC LIMIT 0,25";
 
  $result = mysql_query($sql_query) or die(mysql_error());
    if ($result) {
      while ($row = mysql_fetch_array($result)) {
        $message['id'] = $row["message_id"];
        $message['date'] = $row["message_date"];
        $message['name'] = $row["message_name"];
        $message['text'] = $row["message_text"];
        $messages[] = $message;
      }
    }
    mysql_free_result($result);
    return $messages;
}

//Used in following files (scheduleresults)
function getLeagueType() {

  $type;

  include('dbconnect.php');

  
  $sql_query = "select ParameterValue from configuration " .
               "where ParameterName = 'LEAGUE_TYPE'";
  
  $result = mysql_query($sql_query) or die(mysql_error());
    if ($result) {
      if ($row = mysql_fetch_array($result)) {
        $type= $row["ParameterValue"];
      }
    }
    mysql_free_result($result);
    return $type;
}


//Used in following files (scheduleresults)
function getFantasyGames($year = null,$week = null) {

  if($year == null){
  	$ViewYear = getCurrentYear();
  } else {
  	$ViewYear = $year;
  }
  
  if($week == null){
  	$ViewWeek = getCurrentWeek();
  } else {
  	$ViewWeek = $week;
  }
  
  $games;
  $numGames=0;
  include('dbconnect.php');

  
  $sql_query = "SELECT distinct a.Week,a.GameNum, " .
                      "b.TeamNumber as Visitor, " .
                      "b.UserName as VisitorUser, " .
                      "d.TeamName as VisitorTeamName, " .
                      "d.FirstName as VisitorFirstName, " .
                      "d.LastName as VisitorLastName, " .
                      "c.TeamNumber as Home, " .
                      "c.UserName as HomeUser, " .
                      "e.TeamName as HomeTeamName, " .
                      "e.FirstName as HomeFirstName, " .
                      "e.LastName as HomeLastName " .
                      "FROM genericschedule a, " .
                      "leaguesetup b, " .
                      "leaguesetup c, " .
                      "users d, " .
                      "users e " .
                      "WHERE a.LeagueType = ". getLeagueType() . " " .
                      "and a.Visitor = b.TeamNumber " .
                      "and a.Home = c.TeamNumber " .
                      "and b.UserName = d.UserName " .
                      "and c.UserName = e.UserName " .
                      "and a.Week = ".$ViewWeek." ".
                      "and a.Year = ".$ViewYear." ".
                      "and b.Year = ".$ViewYear." ".
                      "and c.Year = ".$ViewYear." ".
                      "order by GameNum";

  $result = mysql_query($sql_query) or die(mysql_error());
    if ($result) {
      while ($row = mysql_fetch_array($result)) {
        $game['GameNum'] = $row["GameNum"];
        $game['Visitor'] = $row["Visitor"];
        $game['VisitorUser'] = $row["VisitorUser"];
        $game['VisitorTeamName'] = $row["VisitorTeamName"];
        $game['VisitorFirstName'] = $row["VisitorFirstName"];
        $game['VisitorLastName'] = $row["VisitorLastName"];
        $game['Home'] = $row["Home"];
        $game['HomeUser'] = $row["HomeUser"];
        $game['HomeTeamName'] = $row["HomeTeamName"];
        $game['HomeFirstName'] = $row["HomeFirstName"];
        $game['HomeLastName'] = $row["HomeLastName"];
        $game['VisitorScore'] = getResults($game['VisitorUser'],$ViewYear,$ViewWeek);
        $game['HomeScore'] = getResults($game['HomeUser'],$ViewYear,$ViewWeek);
        $numGames=$numGames+1;
        $games[] = $game;
      }
    }
    mysql_free_result($result);
    $games['NumberOfGames']=$numGames;
    return $games;
}

//Used in following files (scheduleresults)
function getFantasyGamesT() {
  global $ViewWeek;
  global $ViewYear;

  $games;
$numGames=0;
  include('dbconnect.php');

  
  $sql_query = "SELECT a.Week,a.GameNum, " .
                      "b.UserName as VisitorUser, " .
                      "d.TeamName as VisitorTeamName, " .
                      "d.FirstName as VisitorFirstName, " .
                      "d.LastName as VisitorLastName, " .
                      "c.UserName as HomeUser, " .
                      "e.TeamName as HomeTeamName, " .
                      "e.FirstName as HomeFirstName, " .
                      "e.LastName as HomeLastName " .
                      "FROM genericschedule a, " .
                      "leaguesetup b, " .
                      "leaguesetup c, " .
                      "users d, " .
                      "users e " .
                      "WHERE a.LeagueType = ". getLeagueType() . " " .
                      "and a.Visitor = b.TeamNumber " .
                      "and a.Home = c.TeamNumber " .
                      "and b.UserName = d.UserName " .
                      "and c.UserName = e.UserName " .
                      "and a.Week = ".$ViewWeek." ".
                      "and a.Year = ".$ViewYear;
  
  $result = mysql_query($sql_query) or die(mysql_error());
    if ($result) {
      while ($row = mysql_fetch_array($result)) {
        $game['GameNum'] = $row["GameNum"];
        $game['VisitorUser'] = $row["VisitorUser"];
        $game['VisitorTeamName'] = $row["VisitorTeamName"];
        $game['VisitorFirstName'] = $row["VisitorFirstName"];
        $game['VisitorLastName'] = $row["VisitorLastName"];
        $game['HomeUser'] = $row["HomeUser"];
        $game['HomeTeamName'] = $row["HomeTeamName"];
        $game['HomeFirstName'] = $row["HomeFirstName"];
        $game['HomeLastName'] = $row["HomeLastName"];
        $game['VisitorScore'] = getResults($game['VisitorUser'],$ViewYear,$ViewWeek);
        $game['HomeScore'] = getResults($game['HomeUser'],$ViewYear,$ViewWeek);
        $numGames=$numGames+1;
        $games[] = $game;
      }
    }
    mysql_free_result($result);
    $games['NumberOfGames']=$numGames;
    return $games;
}


//Used in following files (scheduleresults)
function getGames() {
  global $ViewWeek;
  global $ViewYear;

  $games;
$numGames=0;
  include('dbconnect.php');

  
  $sql_query = "select Date, b.School As VisitorTeam, c.School As HomeTeam, " .
               "VisitorScore, HomeScore,EspnGameId,Status, a.VisitorTeam as VisShort, a.HomeTeam as HomeShort " .
               "from scheduleresults a,teams b, teams c " .
               "where week = " . $ViewWeek . " " .
               "and  year = " . $ViewYear . " " .
               "and a.VisitorTeam = b.Abriviation " .
               "and a.HomeTeam = c.Abriviation order by date";
  
  $result = mysql_query($sql_query) or die(mysql_error());
    if ($result) {
      while ($row = mysql_fetch_array($result)) {
        $game['Date'] = $row["Date"];
        $game['VisitorTeam'] = $row["VisitorTeam"];
        $game['HomeTeam'] = $row["HomeTeam"];
        $game['VisitorScore'] = $row["VisitorScore"];
        $game['HomeScore'] = $row["HomeScore"];
        $game['espnid'] = $row["EspnGameId"];
        $game['status'] = $row["Status"];
        $game['Visitor'] = $row['VisShort'];
        $game['Home'] = $row['HomeShort'];
        $numGames=$numGames+1;
        $games[] = $game;
      }
    }
    mysql_free_result($result);
    $games['NumberOfGames']=$numGames;
    return $games;
}

function getGameNumber($teamNumber,$year,$week){
    
	$gameNumber = 0 ;
	
	include('dbconnect.php');
	
	  $sql_query = "select GameNum " .
                      "from genericschedule " .
                      "where (Visitor = $teamNumber OR Home = $teamNumber) and " .
                      "Year = $year  AND " .
                      "Week = $week";

	  $result = mysql_query($sql_query) or die(mysql_error());
    if ($result) {
      if ($row = mysql_fetch_array($result)) {
      	$gameNumber = $row['GameNum'];
      }
    }
    mysql_free_result($result);
    return $gameNumber;
	
}

function getFullResults($year,$week){
	
	$fullResults;
	
	include('dbconnect.php');
	
	  $sql_query = "select a.UserName,Division, b.FirstName, b.LastName,TeamNumber " .
                      "from leaguesetup a, users b " .
                      "where a.Username = b.username and Year = " . $year . " " .
                      "order by division, a.username";
                
	  $result = mysql_query($sql_query) or die(mysql_error());
    if ($result) {
      while ($row = mysql_fetch_array($result)) {
          if($row['UserName'] <> 'Bye'){
          	$user['username'] = $row['UserName'];
          	$user['division'] = $row['Division'];
            $user['number'] = $row['TeamNumber'];
            $user['displayName'] = $row['FirstName'] . ' ' . substr($row['LastName'],0,1). '.';
            $fullResults[$user['username']] = $user;
          }
      }
    }

    mysql_free_result($result);
		
           $sql_query = "SELECT VisitorTeam as Team, status " .
                      "FROM scheduleresults " .
                      "WHERE Week = " . $week .
                      " and Year = " . $year . " UNION " .
                      "SELECT HomeTeam as Team, status " .
                      "FROM scheduleresults " .
                      "WHERE Week = " . $week .
                      " and Year = " . $year ;



  $result = mysql_query($sql_query) or die(mysql_error());
    if ($result) {
      while ($row = mysql_fetch_array($result)) {
            $gameStatus[$row['Team']] = $row['status'];  
      }
    }
    mysql_free_result($result);
 
        
        
        
        
	
		foreach($fullResults as $user){
			
				$user['result'] = getBreakdownResults($user['username'],$week,$year,$gameStatus);
                $user['gameNumber'] = getGameNumber($user['number'],$year,$week);
            //if($user['result']['DEF1Team']!=''){
				$fullResults[$user['username']] = $user;
            //}
            unset($user);
				
		}
		
		$sortedList;
		
		$c = count($fullResults);
		for($i=0;$i<$c;$i++){
			$score = -99;
			$username = "";
			
			foreach($fullResults as $key => $r){
			
				if($r['result']['TotalPoints'] > $score){
					$score = $r['result']['TotalPoints'];
					$username = $key;
				}
			}
                if($username != '')	$sortedList[$username] = $fullResults[$username];
			
			unset($fullResults[$username]);
			
		}
	
	return $sortedList;

}

//Used in following files (scheduleresults)
function getResults($userName,$year,$week) {

  $totPts=0;

  include('dbconnect.php');
  
  $sql_query = "select Sum(Points) as PlayerPoints " .
                      "from playerselection a, playerstats b " .
                      "where a.PlayerId = b.PlayerId " .
                      "and a.UserName = '".$userName."' " .
                      "and a.Week = " . $week . " " .
                      "and a.Year = " . $year . " " .
                      "and b.Week = " . $week . " " .
                      "and b.Year = " . $year;  

  $result = mysql_query($sql_query) or die(mysql_error());
    if ($result) {
      if ($row = mysql_fetch_array($result)) {
        $totPts = $totPts + $row['PlayerPoints'];
      }
    }
    mysql_free_result($result);

 $sql_query = "Select School,Abriviation " .
                     "from teams a,defenseselection b ".
                     "where a.Abriviation = b.Team " .
                     "and UserName = '" .$userName."' " .
                     "and Week = ".$week." ".
                     "and Year = ".$year ; 

  $result = mysql_query($sql_query) or die(mysql_error());
    if ($result) {
      while ($row = mysql_fetch_array($result)) {
        $gameResult = getGameResult($row['Abriviation'],$year,$week);
           $totPts = $totPts - $gameResult['OppScore']; 
      }
    }
    mysql_free_result($result);


 $sql_query = "Select School,Abriviation " .
                     "from teams a,winselection b ".
                     "where a.Abriviation = b.Team " .
                     "and UserName = '" .$userName."' " .
                     "and Week = ".$week." ".
                     "and Year = ".$year  ; 

  $result = mysql_query($sql_query) or die(mysql_error());
    if ($result) {
      while ($row = mysql_fetch_array($result)) {
        $gameResult = getGameResult($row['Abriviation'],$year,$week);
        if($gameResult['Score']>$gameResult['OppScore']){
              $totPts = $totPts + 15;
        } 
      }
    }
    mysql_free_result($result);


    return $totPts;
}

//Used in following files (scheduleresults)
function getGameResult ($team,$year,$week){

$gameResult;

 $sql_query = "select School,VisitorScore,HomeScore ".
"from scheduleresults a, teams b ".
"where a.VisitorTeam = b.Abriviation ". 
"and HomeTeam = '".$team."' ".
"and Week = ".$week." ".
"and Year = ".$year ; 

  $result = mysql_query($sql_query) or die(mysql_error());
    if ($result) {
      if ($row = mysql_fetch_array($result)) {
         $gameResult['Opp'] = $row['School'];
         $gameResult['Score'] = $row['HomeScore'];
         $gameResult['OppScore'] = $row['VisitorScore'];
      } else {

         $sql_query = "select School,VisitorScore,HomeScore ".
            "from scheduleresults a, teams b ".
            "where a.HomeTeam = b.Abriviation ". 
            "and VisitorTeam = '".$team."' ".
            "and Week = ".$week." ".
            "and Year = ".$year ; 
         $result2 = mysql_query($sql_query) or die(mysql_error());
         if($result2){
           if ($row2 = mysql_fetch_array($result2)) {
             $gameResult['Opp'] = $row2['School'];
             $gameResult['Score'] = $row2['VisitorScore'];
             $gameResult['OppScore'] = $row2['HomeScore'];
           }
         }
         mysql_free_result($result2);
       }
    }
    mysql_free_result($result);


   return $gameResult;
}


function getAccountInfo($u) {
  
  include('dbconnect.php');

	$info = '';
	
  $sql_query = "SELECT * FROM users " .
               "WHERE UserName = '$u'";

  $result = mysql_query($sql_query) or die(mysql_error());
  
  if ($result) {
    $i=0;
    if($row = mysql_fetch_array($result)) {
      $info['username'] = $row["UserName"];
      $info['password'] = $row["Password"];
      $info['firstname'] = $row["FirstName"];
      $info['lastname'] = $row["LastName"];
      $info['teamname'] = $row["TeamName"];
      $info['email'] = $row["Email"];
      $info['phone1'] = $row["Phone1"];
      $info['phone2'] = $row["Phone2"];
      $info['address'] = $row["Address"];
      $info['city'] = $row["City"];
      $info['state'] = $row["State"];
      $info['zip'] = $row["Zip"];
      $info['paid'] = $row["Paid"];
      $info['status'] = $row["Status"];
    } 
  }
  mysql_free_result($result);
  
  
  return $info;
}

//Used in following files (messageboard)
function getEntryInfo($uname) {

  $entryInfo;

  include('dbconnect.php');

  $sql_query = "SELECT * FROM transactions " .
      "WHERE type = 'ENTRY' " .
      "AND username = '" .$uname . "' " .
      "AND show_line = 'Y' " .
      "ORDER BY tran_date";
 
  $result = mysql_query($sql_query) or die(mysql_error());
    if ($result) {
      while ($row = mysql_fetch_array($result)) {
        $entry['tran_date'] = $row["tran_date"];
        $entry['description'] = $row["description"];
        $entry['amount'] = $row["amount"];
        $entryInfo[] = $entry;
      }
    }
    mysql_free_result($result);
    return $entryInfo;
}

//Used in following files (messageboard)
function getWinnings($uname) {

  $entryInfo;

  include('dbconnect.php');

  $sql_query = "SELECT * FROM transactions " .
      "WHERE type = 'WINNINGS' " .
      "AND username = '" .$uname . "' " .
      "AND show_line = 'Y' " .
      "ORDER BY tran_date";
 
  $result = mysql_query($sql_query) or die(mysql_error());
    if ($result) {
      while ($row = mysql_fetch_array($result)) {
        $entry['tran_date'] = $row["tran_date"];
        $entry['description'] = $row["description"];
        $entry['amount'] = $row["amount"];
        $entryInfo[] = $entry;
      }
    }
    mysql_free_result($result);
    return $entryInfo;
}

//Used in following files (messageboard)
function getPayoutInfo($uname) {

  $entryInfo;

  include('dbconnect.php');

  $sql_query = "SELECT * FROM transactions " .
      "WHERE type = 'PAYOUT' " .
      "AND username = '" .$uname . "' " .
      "AND show_line = 'Y' " .
      "ORDER BY tran_date";
      
 
  $result = mysql_query($sql_query) or die(mysql_error());
    if ($result) {
      while ($row = mysql_fetch_array($result)) {
        $entry['tran_date'] = $row["tran_date"];
        $entry['description'] = $row["description"];
        $entry['amount'] = $row["amount"];
        $entryInfo[] = $entry;
      }
    }
    mysql_free_result($result);
    return $entryInfo;
}

//Used in following files (messageboard)
function getPreviousBalance($uname) {

  $balance;

  include('dbconnect.php');

  $sql_query = "SELECT sum(amount) as prev_balance FROM transactions " .
      "WHERE username = '" .$uname . "' " .
      "AND show_line = 'N'";
      
  $result = mysql_query($sql_query) or die(mysql_error());
    if ($result) {
      if ($row = mysql_fetch_array($result)) {
        $balance = $row["prev_balance"];
      }
    }
    mysql_free_result($result);
    return $balance;
}

function getCurrentBalance($uname){
  $balance;

  include('dbconnect.php');

  $sql_query = "SELECT sum(amount) as current_balance FROM transactions " .
      "WHERE username = '" .$uname . "'";
      
  $result = mysql_query($sql_query) or die(mysql_error());
    if ($result) {
      if ($row = mysql_fetch_array($result)) {
        $balance = $row["current_balance"];
      }
    }
    mysql_free_result($result);
    return $balance;
}
//Used in following files (messageboard)
function saveAccountInfo($acct) {
include('dbconnect.php');

    $Insert_String = "update users " .
       "set TeamName = '".$acct['teamname']."'," .
       "Password = '".$acct['password']."'," .
       "FirstName = '".$acct['firstname']."'," .
       "LastName = '".$acct['lastname']."'," .
       "Email = '".$acct['email']."'," .
       "Phone1 = '".$acct['phone1']."'," .
       "Phone2 = '".$acct['phone2']."'," .
       "Address = '".$acct['address']."'," .
       "City = '".$acct['city']."'," .
       "State = '".$acct['state']."'," .
       "Zip = '".$acct['zip']."' " .
       "WHERE UserName = '".$acct['username']."'";
       
$result = mysql_query($Insert_String) or die(mysql_error());

}

//Used in following Files (Standings)
function getStandings($year){
	$standings;

  include('dbconnect.php');

  $sql_query = "Select a.TeamNumber,a.UserName,a.Division,b.TeamName,b.FirstName, b.LastName " .
               "from leaguesetup a , users b " .
               "where a.Year = ".$year." ".
               "and a.UserName = b.UserName";
 
  $result = mysql_query($sql_query) or die(mysql_error());
    if ($result) {
      while ($row = mysql_fetch_array($result)) {
      	$u = $row["TeamNumber"];
      	$user['username'] = $u;
        $user['division'] = $row["Division"];
        $user[$u.'-teamnumber'] = $row["TeamNumber"];
        $user[$u.'-teamname'] = $row["TeamName"];
        $user[$u.'-firstname'] = $row["FirstName"];
        $user[$u.'-lastname'] = $row["LastName"];
        $user[$u.'-w'] = 0;
        $user[$u.'-l'] = 0;
        $user[$u.'-t'] = 0;
        $user[$u.'-gb'] = 0;
        $user[$u.'-pf'] = 0;
        $user[$u.'-pb'] = 0;
        $user[$u.'-pa'] = 0;
        
        $sql2 = "select count(*) as OWH from transactions " .
                "where type = 'WINNINGS' " .
                "and year = '". $year. "' " .
                "and code = 'OWH' " .
                "and username = '".$row["UserName"]."'";
                
        $r2 = mysql_query($sql2) or die(mysql_error());
        if ($r2) {
          if ($row2 = mysql_fetch_array($r2)) {
             $user[$u.'-ohw'] = $row2["OWH"];
          }
        }
        
        $sql2 = "select count(*) as DWH from transactions " .
                "where type = 'WINNINGS' " .
                "and year = '". $year. "' " .
                "and (code = 'EWH' or code = 'WWH') " .
                "and username = '".$row["UserName"]."'";
        $r2 = mysql_query($sql2) or die(mysql_error());
        if ($r2) {
          if ($row2 = mysql_fetch_array($r2)) {
             $user[$u.'-dhw'] = $row2["DWH"];
          }
        }
        $standings[$u] = $user;
      }
    }
    mysql_free_result($result);
    
    //Find Wins
    $sql_query = "select Visitor,count(*) as wins " .
                 "from fantasyschedule " .
                 "where VisitorScore > '-999' " .
                 "and VisitorScore > HomeScore " .
                 "and Year = ".$year." " .
                 "group by Visitor";
    
    $result = mysql_query($sql_query) or die(mysql_error());
    if ($result) {
      while ($row = mysql_fetch_array($result)) {
      	$u = $row['Visitor'];
      	$standings[$u][$u.'-w'] += $row['wins'];
      }
    }
    mysql_free_result($result);
    $sql_query = "select Home,count(*) as wins " .
                 "from fantasyschedule " .
                 "where HomeScore > '-999' " .
                 "and VisitorScore < HomeScore " .
                 "and Year = ".$year." " .
                 "group by Home";
    
    $result = mysql_query($sql_query) or die(mysql_error());
    if ($result) {
      while ($row = mysql_fetch_array($result)) {
      	$u = $row['Home'];
      	$standings[$u][$u.'-w'] += $row['wins'];
      }
    }
    mysql_free_result($result);
    
    //Find Losses
    $sql_query = "select Visitor,count(*) as l " .
                 "from fantasyschedule " .
                 "where VisitorScore > '-999' " .
                 "and VisitorScore < HomeScore " .
                 "and Year = ".$year." " .
                 "group by Visitor";
    
    $result = mysql_query($sql_query) or die(mysql_error());
    if ($result) {
      while ($row = mysql_fetch_array($result)) {
      	$u = $row['Visitor'];
      	$standings[$u][$u.'-l'] += $row['l'];
      }
    }
    mysql_free_result($result);
    $sql_query = "select Home,count(*) as l " .
                 "from fantasyschedule " .
                 "where HomeScore > '-999' " .
                 "and VisitorScore > HomeScore " .
                 "and Year = ".$year." " .
                 "group by Home";
    
    $result = mysql_query($sql_query) or die(mysql_error());
    if ($result) {
      while ($row = mysql_fetch_array($result)) {
      	$u = $row['Home'];
      	$standings[$u][$u.'-l'] += $row['l'];
      }
    }
    mysql_free_result($result);
    
    
    //Find Ties
    $sql_query = "select Visitor,count(*) as t " .
                 "from fantasyschedule " .
                 "where VisitorScore > '-999' " .
                 "and VisitorScore = HomeScore " .
                 "and Year = ".$year." " .
                 "group by Visitor";
    
    $result = mysql_query($sql_query) or die(mysql_error());
    if ($result) {
      while ($row = mysql_fetch_array($result)) {
      	$u = $row['Visitor'];
      	$standings[$u][$u.'-t'] += $row['t'];
      }
    }
    mysql_free_result($result);
    $sql_query = "select Home,count(*) as t " .
                 "from fantasyschedule " .
                 "where HomeScore > '-999' " .
                 "and VisitorScore = HomeScore " .
                 "and Year = ".$year." " .
                 "group by Home";
    
    $result = mysql_query($sql_query) or die(mysql_error());
    if ($result) {
      while ($row = mysql_fetch_array($result)) {
      	$u = $row['Home'];
      	$standings[$u][$u.'-t'] += $row['t'];
      }
    }
    mysql_free_result($result);
 
     //Find PF
    $sql_query = "select Visitor,sum(VisitorScore) as pf " .
                 "from fantasyschedule " .
                 "where VisitorScore > '-999' " .
                 "and Year = ".$year." " .
                 "group by Visitor";
    $result = mysql_query($sql_query) or die(mysql_error());
    if ($result) {
      while ($row = mysql_fetch_array($result)) {
      	$u = $row['Visitor'];
      	$standings[$u][$u.'-pf'] += $row['pf'];
      }
    }
    mysql_free_result($result);
    $sql_query = "select Home,sum(HomeScore) as pf " .
                 "from fantasyschedule " .
                 "where HomeScore > '-999' " .
                 "and Year = ".$year." " .
                 "group by Home";
    
    $result = mysql_query($sql_query) or die(mysql_error());
    if ($result) {
      while ($row = mysql_fetch_array($result)) {
      	$u = $row['Home'];
      	$standings[$u][$u.'-pf'] += $row['pf'];
      }
    }
    mysql_free_result($result);  	

    //Find PA
    $sql_query = "select Visitor,sum(HomeScore) as pa " .
                 "from fantasyschedule " .
                 "where VisitorScore > '-999' " .
                 "and Year = ".$year." " .
                 "group by Visitor";
    $result = mysql_query($sql_query) or die(mysql_error());
    if ($result) {
      while ($row = mysql_fetch_array($result)) {
      	$u = $row['Visitor'];
      	$standings[$u][$u.'-pa'] += $row['pa'];
      }
    }
    mysql_free_result($result);
    $sql_query = "select Home,sum(VisitorScore) as pa " .
                 "from fantasyschedule " .
                 "where HomeScore > '-999' " .
                 "and Year = ".$year." " .
                 "group by Home";
    
    $result = mysql_query($sql_query) or die(mysql_error());
    if ($result) {
      while ($row = mysql_fetch_array($result)) {
      	$u = $row['Home'];
      	$standings[$u][$u.'-pa'] += $row['pa'];
      }
    }
    mysql_free_result($result);   	 
   	
   	$standings = sortStandings($standings);
   	   
    return $standings;
	
	
}


function sortStandings($standings){
	$sortedStandings;
	$record['east']['w']=0;
	$record['east']['l']=0;
	$record['east']['t']=0;
	$record['west']['w']=0;
	$record['west']['l']=0;
	$record['west']['t']=0;
	
	for($i=15;$i>=0;$i=$i - .5){
		foreach($standings as $user){	
			if($user[$user['username'].'-w']+ $user[$user['username'].'-t']*.5 == $i){
				if($record[$user['division']]['w']==0){
					$record[$user['division']]['w']=$user[$user['username'].'-w'];
					$record[$user['division']]['l']=$user[$user['username'].'-l'];
					$record[$user['division']]['t']=$user[$user['username'].'-t'];
					$user[$user['username'].'-gb']=0;
				}else{
					$user[$user['username'].'-gb']=$record[$user['division']]['w'] - $user[$user['username'].'-w'] - ($user[$user['username'].'-t'] * .5) + ($record[$user['division']]['t'] * .5);
				}
				$sortedStandings[] = $user;
			}		
		}
	}
	
	return $sortedStandings;
}

function getTeamList(){
	
  $teams;
  
  include('dbconnect.php');

  
  $sql_query = "select * from users " .
               "order by teamname";
  
  $result = mysql_query($sql_query) or die(mysql_error());
    if ($result) {
      while ($row = mysql_fetch_array($result)) {
        $team['username'] = $row["UserName"];
        $team['teamname'] = $row["TeamName"];
        $team['firstname'] = $row["FirstName"];
        $team['lastname'] = $row["LastName"];
        $teams[] = $team;
      }
    }
    mysql_free_result($result);
    return $teams;
}

function getTeamInfo($uname,$year){
	$info;
	$sql_query = "select * from users " .
               "where UserName = '".$uname."'";
  
  $result = mysql_query($sql_query) or die(mysql_error());
    if ($result) {
      if ($row = mysql_fetch_array($result)) {
        $info['teamname'] = $row["TeamName"];
        $info['firstname'] = $row["FirstName"];
        $info['lastname'] = $row["LastName"];
      }
    }
    mysql_free_result($result);
  
	
	$sql_query = "select a.year,a.week,b.username as VisitorUser,d.teamname as VisitorTeam,VisitorScore,c.username as HomeUser,e.TeamName as HomeTeam,HomeScore ".
               "from fantasyschedule a, leaguesetup b, leaguesetup c, users d, users e ".
               "where a.year = '". $year ."' ".
               "and (b.username = '". $uname ."' ".
               "or c.username = '". $uname ."') ".
               "and a.year = b.year  ".
               "and a.year = c.year ".
               "and b.username = d.username ".
               "and c.username = e.username ".
               "and a.visitor = b.teamnumber ".
               "and a.home = c.teamnumber ".
               "order by week";

  $result = mysql_query($sql_query) or die(mysql_error());
  $currentschedule;
  $info['wins']=0;
  $info['losses']=0;
  $info['ties']=0;
    if ($result) {
      while ($row = mysql_fetch_array($result)) {
      	$game['week']=$row['week'];
      	if($row['VisitorUser'] == $uname){
					$game['opponent'] = $row['HomeTeam'];
					$game['teamscore'] = $row['VisitorScore'];
					$game['visitorscore'] = $row['HomeScore'];
				} else {
					$game['opponent'] = $row['VisitorTeam'];
					$game['teamscore'] = $row['HomeScore'];
					$game['visitorscore'] = $row['VisitorScore'];
				}
				
				if($game['teamscore']=='-999'){
					$game['outcome'] = '-';
				} elseif ($game['teamscore']>$game['visitorscore']){
					$game['outcome'] = 'W';
					$info['wins']++;
				} elseif ($game['teamscore']<$game['visitorscore']){
					$game['outcome'] = 'L';
					$info['losses']++;
				} else { 
			  	$game['outcome'] = 'T';
			  	$info['ties']++;
			  }

			  $schedule[] = $game;
      }
    }
    mysql_free_result($result);
  
	$info['schedule'] = $schedule;
	$info['accomplishments'] = getAccomplishments($uname,$year);
	$list = $info['accomplishments'];
	return $info;
	
}

function getAccomplishments($uname,$year){
	
	$list;
  
  include('dbconnect.php');

  
  $sql_query = "select * " .
               "from transactions " .
               "where username='".$uname."' " .
               "and Year='".$year."' " .
               "and type='WINNINGS' " .
               "order by tran_date ";
               
  $result = mysql_query($sql_query) or die(mysql_error());
    if ($result) {
      while ($row = mysql_fetch_array($result)) {
        $acc['description'] = $row["description"];
        $list[] = $acc;
      }
    }
    mysql_free_result($result);
    return $list;
	
}


function getBreakdownResults($userName,$week,$year,&$gameStatus) {

  $results;
  $totPts=0;

  include('dbconnect.php');
  
 

 
  
  $sql_query = "Select * " .
                      "from playerinfo b, playerselection a left join playerstats c " .
                      "on a.PlayerID = c.PlayerID and a.Week = c.Week " .
                      "where a.PlayerID = b.PlayerID " .
                      " and a.UserName = '" . $userName . "' " .
                      " and a.Week = " . $week .
                      " and a.Year = " . $year; 


  $result = mysql_query($sql_query) or die(mysql_error());
    if ($result) {
      $y=mysql_num_fields($result);
      while ($row = mysql_fetch_array($result)) {
        $pos = $row["Position"];
        $totPts = $totPts + $row['Points'];
        if($pos == 'RB' || $pos=='WR'){
           if($results[$pos.'1UserName']==''){
              $pos = $pos . '1';
           } else {
              $pos = $pos . '2';
           }
        } 
     
        for($i=0;$i<$y;$i++){
          $field = mysql_field_name($result, $i);
           $results[$pos.$field] = $row[$field];  
        }
        $results[$pos.'status'] = $gameStatus[$row['Team']];
      }
    }
    mysql_free_result($result);

 $sql_query = "Select School,Abriviation " .
                     "from teams a,defenseselection b ".
                     "where a.Abriviation = b.Team " .
                     "and UserName = '" .$userName."' " .
                     "and Week = ".$week. 
                     " and Year = ".$year ; 

  $result = mysql_query($sql_query) or die(mysql_error());
    if ($result) {
      while ($row = mysql_fetch_array($result)) {
        $gameResult = getGameResult($row['Abriviation'],$year,$week);
        if($results['DEF1Team'] == ''){
           $results['DEF1Team'] = $row['School'];
           $results['DEF1Ab'] = $row['Abriviation'];
           $results['DEF1Opp'] = $gameResult['Opp'];
           $results['DEF1Opp'] = $gameResult['Opp'];
           $results['DEF1Score'] = $gameResult['Score'];
           $results['DEF1OppScore'] = $gameResult['OppScore'];
           $results['DEF1status'] = $gameStatus[$row['Abriviation']];
           $totPts = $totPts - $results['DEF1OppScore']; 
        } else {
           $results['DEF2Team'] = $row['School'];
           $results['DEF2Ab'] = $row['Abriviation'];
           $results['DEF2Opp'] = $gameResult['Opp'];
           $results['DEF2Opp'] = $gameResult['Opp'];
           $results['DEF2Score'] = $gameResult['Score'];
           $results['DEF2OppScore'] = $gameResult['OppScore'];
           $results['DEF2status'] = $gameStatus[$row['Abriviation']];
           $totPts = $totPts - $results['DEF2OppScore'];
        }
      }
    }
    mysql_free_result($result);


 $sql_query = "Select School,Abriviation " .
                     "from teams a,winselection b ".
                     "where a.Abriviation = b.Team " .
                     "and UserName = '" .$userName."' " .
                     "and Week = ".$week.
                     " and Year = ".$year ; 

  $result = mysql_query($sql_query) or die(mysql_error());
    if ($result) {
      while ($row = mysql_fetch_array($result)) {
        $gameResult = getGameResult($row['Abriviation'],$year,$week);
        if($results['WIN1Team'] == ''){
           $results['WIN1Team'] = $row['School'];
           $results['WIN1Ab'] = $row['Abriviation'];
           $results['WIN1Opp'] = $gameResult['Opp'];
           $results['WIN1Score'] = $gameResult['Score'];
           $results['WIN1OppScore'] = $gameResult['OppScore'];
           $results['WIN1status'] = $gameStatus[$row['Abriviation']];
           if($results['WIN1Score']>$results['WIN1OppScore']){
              $results['WIN1Points'] = 15;
              $totPts = $totPts + 15;
           } else {
              $results['WIN1Points'] = 0;
           }
        } else {
           $results['WIN2Team'] = $row['School'];
           $results['WIN2Ab'] = $row['Abriviation'];
           $results['WIN2Opp'] = $gameResult['Opp'];
           $results['WIN2Opp'] = $gameResult['Opp'];
           $results['WIN2Score'] = $gameResult['Score'];
           $results['WIN2OppScore'] = $gameResult['OppScore'];
           $results['WIN2status'] = $gameStatus[$row['Abriviation']];
           if($results['WIN2Score']>$results['WIN2OppScore']){
              $results['WIN2Points'] = 15;
              $totPts = $totPts + 15;
           } else {
              $results['WIN2Points'] = 0;
           }
        }
      }
    }
    mysql_free_result($result);





    $results['TotalPoints'] = $totPts;
    return $results;
}


function getFinalResult($viewyear,$res) {

  $results = "-";
  $totPts=0;

  include('dbconnect.php');
  
  $sql_query = "Select * " .
                      "from transactions a, users b " .
                      "where a.username = b.username and Year = " . $viewyear . 
                      " and code = '" . $res . "' and type = 'WINNINGS'"; 


  $result = mysql_query($sql_query) or die(mysql_error());
    if ($result) {
      if($row = mysql_fetch_array($result)) {
        $results = $row["TeamName"] . " (" . $row["FirstName"] . " " . $row["LastName"] . ")";
     
      }
    }
    mysql_free_result($result);

    return $results;
}

function getTopLineup($year,$week){
	
	//YEAR: 2010
	//WEEK:    4
	$top['QB'] = array('Name' => 'Pryor','Points' =>50);
	$top['RB1'] = array('Name' => 'Schmidt','Points' =>19);
	$top['RB2'] = array('Name' => 'White','Points' =>35);
	$top['WR1'] = array('Name' => 'Gray','Points' =>20);
	$top['WR2'] = array('Name' => 'Dierking','Points' =>16);
	$top['K'] = array('Name' => 'Wagner','Points' =>24);
	$top['DEF1'] = array('Name' => 'MSU','Points' =>7);
	$top['DEF2'] = array('Name' => 'IA','Points' =>0);
	$top['WIN1'] = array('Name' => 'MICH','Points' =>15);
	$top['WIN2'] = array('Name' => 'IND','Points' =>15);
	$top['TotalPoints'] = 179;
	
	$topLineup['2010']['4'] = $top;
	
	//YEAR: 2011
	//WEEK:    1
	$top['QB'] = array('Name' => 'Martinez','Points' =>32);
	$top['RB1'] = array('Name' => 'Ball','Points' =>32);
	$top['RB2'] = array('Name' => 'Redd','Points' =>20);
	$top['WR1'] = array('Name' => 'McNutt','Points' =>25);
	$top['WR2'] = array('Name' => 'Jenkins','Points' =>25);
	$top['K'] = array('Name' => 'Wiggs','Points' =>21);
	$top['DEF1'] = array('Name' => 'MSU','Points' =>6);
	$top['DEF2'] = array('Name' => 'OSU','Points' =>0);
	$top['WIN1'] = array('Name' => 'MICH','Points' =>15);
	$top['WIN2'] = array('Name' => 'NW','Points' =>15);
	$top['TotalPoints'] = 179;
	
	$topLineup['2011']['1'] = $top;
	
	//YEAR: 2011
	//WEEK:    2
	//QB: MICH-RB: IA-RB: OSU-WR: IND-WR: MINN-K: MSU-
	//DEF: ILL-DEF: WISC-WIN: NEB-WIN: NW
	$top['QB'] = array('Name' => 'Robinson','Points' =>39);
	$top['RB1'] = array('Name' => 'Coker','Points' =>32);
	$top['RB2'] = array('Name' => 'Hyde','Points' =>22);
	$top['WR1'] = array('Name' => 'Wilson','Points' =>14);
	$top['WR2'] = array('Name' => 'McKnight','Points' =>23);
	$top['K'] = array('Name' => 'Conroy','Points' =>25);
	$top['DEF1'] = array('Name' => 'ILL','Points' =>3);
	$top['DEF2'] = array('Name' => 'WISC','Points' =>0);
	$top['WIN1'] = array('Name' => 'NEB','Points' =>15);
	$top['WIN2'] = array('Name' => 'NW','Points' =>15);
	$top['TotalPoints'] = 176;
	$topLineup['2011']['2'] = $top;
	//YEAR: 2011

	//WEEK:    3
	//QB: IA-RB: IND-RB: WISC-WR: MSU-WR: NW-K: NEB
	//DEF: MICH-DEF: PUR-WIN: ILL-WIN: MINN
	$top['QB'] = array('Name' => 'Vandenberg','Points' =>32);
	$top['RB1'] = array('Name' => 'Roberts','Points' =>22);
	$top['RB2'] = array('Name' => 'Ball','Points' =>23);
	$top['WR1'] = array('Name' => 'Cunningham','Points' =>22);
	$top['WR2'] = array('Name' => 'Ebert','Points' =>23);
	$top['K'] = array('Name' => 'Maher','Points' =>25);
	$top['DEF1'] = array('Name' => 'MICH','Points' =>3);
	$top['DEF2'] = array('Name' => 'PUR','Points' =>0);
	$top['WIN1'] = array('Name' => 'ILL','Points' =>15);
	$top['WIN2'] = array('Name' => 'MINN','Points' =>15);
	$top['TotalPoints'] = 185;

	$topLineup['2011']['3'] = $top;	
	//YEAR: 2011
	//WEEK:    4
	//QB: MICH-RB: MINN-RB: NEB-WR: IND-WR: WISC
	//K: OSU-DEF: MSU-DEF: PSU-WIN: IA-WIN: ILL
	
	$top['QB'] = array('Name' => 'Robinson','Points' =>32);
	$top['RB1'] = array('Name' => 'Kirkwood','Points' =>17);
	$top['RB2'] = array('Name' => 'Burkhead','Points' =>28);
	$top['WR1'] = array('Name' => 'Chester','Points' =>14);
	$top['WR2'] = array('Name' => 'Toon','Points' =>27);
	$top['K'] = array('Name' => 'Basil','Points' =>21);
	$top['DEF1'] = array('Name' => 'MSU','Points' =>7);
	$top['DEF2'] = array('Name' => 'PSU','Points' =>6);
	$top['WIN1'] = array('Name' => 'ILL','Points' =>15);
	$top['WIN2'] = array('Name' => 'IA','Points' =>15);
	$top['TotalPoints'] = 188;

	$topLineup['2011']['4'] = $top;	
	
	//YEAR: 2011
	//WEEK:    5
	//QB: NW-RB: NEB-RB: WISC-WR: ILL-WR: PUR-K: MICH
	//DEF: IND-DEF: OSU-WIN: MSU-WIN: PSU

	
	$top['QB'] = array('Name' => 'Persa','Points' =>24);
	$top['RB1'] = array('Name' => 'Ball','Points' =>35);
	$top['RB2'] = array('Name' => 'Burkhead','Points' =>15);
	$top['WR1'] = array('Name' => 'Jenkins','Points' =>44);
	$top['WR2'] = array('Name' => 'Edison','Points' =>20);
	$top['K'] = array('Name' => 'Gibbons','Points' =>26);
	$top['DEF1'] = array('Name' => 'IND','Points' =>16);
	$top['DEF2'] = array('Name' => 'OSU','Points' =>10);
	$top['WIN1'] = array('Name' => 'MSU','Points' =>15);
	$top['WIN2'] = array('Name' => 'PSU','Points' =>15);
	$top['TotalPoints'] = 168;

	$topLineup['2011']['5'] = $top;		
	
	//YEAR: 2011
	//WEEK:    6
	//QB: NW-RB: NEB-RB: WISC-WR: ILL-WR: PUR-K: MICH
	//DEF: IND-DEF: OSU-WIN: MSU-WIN: PSU

	
	$top['QB'] = array('Name' => 'Robinson','Points' =>33);
	$top['RB1'] = array('Name' => 'Hyde','Points' =>20);
	$top['RB2'] = array('Name' => 'Burkhead','Points' =>29);
	$top['WR1'] = array('Name' => 'Jenkins','Points' =>28);
	$top['WR2'] = array('Name' => 'Ebert','Points' =>16);
	$top['K'] = array('Name' => 'Ewald','Points' =>13);
	$top['DEF1'] = array('Name' => 'PSU','Points' =>3);
	$top['DEF2'] = array('Name' => 'IA','Points' =>13);
	$top['WIN1'] = array('Name' => 'PUR','Points' =>15);
	$top['WIN2'] = array('Name' => 'MINN','Points' =>0);
	$top['TotalPoints'] = 138;

	$topLineup['2011']['6'] = $top;			
	
	//YEAR: 2011
	//WEEK:    6
	//QB: NW-RB: NEB-RB: WISC-WR: ILL-WR: PUR-K: MICH
	//DEF: IND-DEF: OSU-WIN: MSU-WIN: PSU

	
	$top['QB'] = array('Name' => 'Robinson','Points' =>15);
	$top['RB1'] = array('Name' => 'Houston','Points' =>18);
	$top['RB2'] = array('Name' => 'Ball','Points' =>39);
	$top['WR1'] = array('Name' => 'Ebert','Points' =>25);
	$top['WR2'] = array('Name' => 'Siller','Points' =>9);
	$top['K'] = array('Name' => 'Meyer','Points' =>19);
	$top['DEF1'] = array('Name' => 'ILL','Points' =>17);
	$top['DEF2'] = array('Name' => 'OSU','Points' =>7);
	$top['WIN1'] = array('Name' => 'MSU','Points' =>15);
	$top['WIN2'] = array('Name' => 'PSU','Points' =>15);
	$top['TotalPoints'] = 131;

	$topLineup['2011']['7'] = $top;		
	
	return $topLineup[$year][$week];
	
	
}

function getTopPoints($year,$week){
	
	  include('dbconnect.php');
  
  $sql_query = "Select points 
                from playerinfo a join playerstats b on a.playerid = b.playerid
								where a.year = $year
								and b.week = $week
								and a.position = 'QB'
								order by points desc";
 


  $result = mysql_query($sql_query) or die(mysql_error());
    if ($result) {
      if($row = mysql_fetch_array($result)) {
        $top["QB"] =  $row["points"];
     
      }
    }
    mysql_free_result($result);
    
      $sql_query = "Select points 
                from playerinfo a join playerstats b on a.playerid = b.playerid
								where a.year = $year
								and b.week = $week
								and a.position = 'RB'
								order by points desc";
 


  $result = mysql_query($sql_query) or die(mysql_error());
    if ($result) {
      if($row = mysql_fetch_array($result)) {
      	if($row = mysql_fetch_array($result)) {
        	$top["RB"] =  $row["points"];
     		}
      }
    }
    mysql_free_result($result);
	
	
      $sql_query = "Select points 
                from playerinfo a join playerstats b on a.playerid = b.playerid
								where a.year = $year
								and b.week = $week
								and a.position = 'WR'
								order by points desc";
 


  $result = mysql_query($sql_query) or die(mysql_error());
    if ($result) {
      if($row = mysql_fetch_array($result)) {
      	if($row = mysql_fetch_array($result)) {
        	$top["WR"] =  $row["points"];
     		}
      }
    }
    mysql_free_result($result);
	
	  $sql_query = "Select points 
                from playerinfo a join playerstats b on a.playerid = b.playerid
								where a.year = $year
								and b.week = $week
								and a.position = 'K'
								order by points desc";
 


  $result = mysql_query($sql_query) or die(mysql_error());
    if ($result) {
      if($row = mysql_fetch_array($result)) {
        $top["K"] =  $row["points"];
     
      }
    }
    mysql_free_result($result);
    
    
    $teams = array('IA','ILL','IND','MLD','MICH','MSU','MINN','NEB','NW','OSU','PSU','PUR','RUT','WISC');
    $def1 = 99;
    $def2 = 99;
    
    foreach($teams as $t){
    	
		  $sql_query = "Select VisitorTeam,HomeTeam,VisitorScore,HomeScore 
	                from scheduleresults
									where year = $year
									and week = $week
									and (visitorteam = '$t' or hometeam = '$t')";    	
	  	$result = mysql_query($sql_query) or die(mysql_error());
	    if ($result) {
	      if($row = mysql_fetch_array($result)) {
	      	if($row["VisitorTeam"] == $t){
	      		$score = $row["HomeScore"];
	      	} else {
	      		$score = $row["VisitorScore"];
	      	}
	        
	        if($score < $def1){
	        	$def2 = $def1;
	        	$def1 = $score;
	        } else if($score < $def2) {
	        	$def2 = $score;
	        }
	     
	      }
	    }
	    mysql_free_result($result);    	
    	
    }
    
    $top["DEF"] = $def2;
	
	
	return $top;
}

function getTopPointsByWeek($year,$week){
    
    
    
    $list;
  
    include('dbconnect.php');

  
    $sql_query = "select a.firstname, a.lastname, a.team, a.position, b.points, selectedcount " . 
                 " from playerinfo a join playerstats b on a.playerid = b.playerid " .
                 " left join (select d.playerid, d.week, count(*) as selectedcount " . 
                 "              from playerselection d group by d.playerid, d.week) c " . 
                 "                   on b.playerid = c.playerid and b.week = c.week " . 
                 "where a.year = " . $year . " and " . 
                 " b.week = " . $week . " and " . 
                 " position = 'QB' " . 
                 " order by points desc Limit 15 ";
                 echo $sql;
    $result = mysql_query($sql_query) or die(mysql_error());
    if ($result) {
      while ($row = mysql_fetch_array($result)) {
        $p['firstname'] = $row['firstname'];
        $p['lastname'] = $row['lastname'];
        $p['team'] = $row['team'];
        $p['points'] = $row['points'];
        $p['count'] = $row['selectedcount'];
        $list['QB'][] = $p;
      }
    }
    mysql_free_result($result);
 
     $sql_query = "select a.firstname, a.lastname, a.team, a.position, b.points, selectedcount " . 
                 " from playerinfo a join playerstats b on a.playerid = b.playerid " .
                 " left join (select d.playerid, d.week, count(*) as selectedcount " . 
                 "              from playerselection d group by d.playerid, d.week) c " . 
                 "                   on b.playerid = c.playerid and b.week = c.week " .
                 "where a.year = " . $year . " and " . 
                 " b.week = " . $week . " and " . 
                 " position = 'RB' " . 
                 " order by points desc Limit 15 ";
               
    $result = mysql_query($sql_query) or die(mysql_error());
    if ($result) {
      while ($row = mysql_fetch_array($result)) {
        $p['firstname'] = $row['firstname'];
        $p['lastname'] = $row['lastname'];
        $p['team'] = $row['team'];
        $p['points'] = $row['points'];
        $p['count'] = $row['selectedcount'];
        $list['RB'][] = $p;
      }
    }
    mysql_free_result($result);
    
    $sql_query = "select a.firstname, a.lastname, a.team, a.position, b.points, selectedcount " . 
                 " from playerinfo a join playerstats b on a.playerid = b.playerid " .
                 " left join (select d.playerid, d.week, count(*) as selectedcount " . 
                 "              from playerselection d group by d.playerid, d.week) c " . 
                 "                   on b.playerid = c.playerid and b.week = c.week  " .
                 "where a.year = " . $year . " and " . 
                 " b.week = " . $week . " and " . 
                 " position = 'WR' " . 
                 " order by points desc Limit 15 ";
               
    $result = mysql_query($sql_query) or die(mysql_error());
    if ($result) {
      while ($row = mysql_fetch_array($result)) {
        $p['firstname'] = $row['firstname'];
        $p['lastname'] = $row['lastname'];
        $p['team'] = $row['team'];
        $p['points'] = $row['points'];
        $p['count'] = $row['selectedcount'];
        $list['WR'][] = $p;
      }
    }
    mysql_free_result($result);   
    
    $sql_query = "select a.firstname, a.lastname, a.team, a.position, b.points, selectedcount " . 
                 " from playerinfo a join playerstats b on a.playerid = b.playerid " .
                 " left join (select d.playerid, d.week, count(*) as selectedcount " . 
                 "              from playerselection d group by d.playerid, d.week) c " . 
                 "                   on b.playerid = c.playerid and b.week = c.week " .
                 "where a.year = " . $year . " and " . 
                 " b.week = " . $week . " and " . 
                 " position = 'K' " . 
                 " order by points desc Limit 15 ";
               
    $result = mysql_query($sql_query) or die(mysql_error());
    if ($result) {
      while ($row = mysql_fetch_array($result)) {
        $p['firstname'] = $row['firstname'];
        $p['lastname'] = $row['lastname'];
        $p['team'] = $row['team'];
        $p['points'] = $row['points'];
        $p['count'] = $row['selectedcount'];
        $list['K'][] = $p;
      }
    }
    mysql_free_result($result); 
    
    return $list;    
    
    
}

?>