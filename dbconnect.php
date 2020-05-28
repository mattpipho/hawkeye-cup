<?php
//dbconnect admin
/*
db_login();

function db_login(){
		if($_SERVER['SERVER_NAME'] == 'hawkeyecup.mattpipho.info'){
			$host = "hawkeyecup.db.3362068.hostedresource.com";
			$username = "hawkeyecup";
			$password = "GoHawks1!";
			
		} else {
			$host = "hawkeyecup.db.3362068.hostedresource.com";
			$username = "hawkeyecup";
			$password = "GoHawks1!";
		}

    if (!($mydb = mysql_pconnect($host,$username,$password)))
    {
            print "<h3>could not connect to database</h3>\n";
            exit;
    }
    mysql_select_db("hawkeyecup");
} */


$mysqli = new mysqli("localhost", "hawkeyecup", "GoHawks1!", "hawkeyecup");
if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}

?>