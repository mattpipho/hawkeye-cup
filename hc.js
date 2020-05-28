var username;
var roundInfo;
var courseInfo;
var golfers;
var allGolfers;
var roundScores
/*
	


*/

var pos = ["A","B","C","D"];
var minHdcp = 100;
var scores;
/*
	scores[golfer_id][hole].score
*/

$(document).ready(function() {
	
		username = $.cookie("golfer");
		$(".footerUsername").html(username);
		
		loadScoreCardPage();
		
		if(typeof username != 'undefined' && username != ''){
			initializeEntryPage();
		}

		function initializeEntryPage(){
			console.log("initializePage");
			loadRoundInfo(1);
			console.log("End initializePage");
		}
		
		function loadScoreCardPage(){
			loadAllGolfers();
		}
		
		function loadRoundInfo($tournament_id){
			//console.log("getRoundInfo");
			var data = {
				"action": "roundinfo",
				"tournament_id": $tournament_id
			};
			data = $(this).serialize() + "&" + $.param(data);
			$.ajax({
				type: "POST",
				dataType: "json",
				url: "server.php", //Relative or absolute path to response.php file
				data: data,
				error: function (jqXHR, textStatus, errorThrown) {
        	console.log("loadRoundInfo " + textStatus + ":" + errorThrown);
				},
				success: function(data) {
					//console.log("Form submitted successfully.\nReturned json: " + data["json"]);
					roundInfo =  data; 
					loadGolfers(roundInfo.round_id);
					loadAllGolfers();
					
					
					$(".round-name").text(roundInfo.round_name);
				}
			});			
			
		}

		function loadCourseInfo($round_id){
			//console.log("getCourseInfo");
			var data = {
				"action": "courseinfo",
				"round_id": $round_id
			};
			data = $(this).serialize() + "&" + $.param(data);
			$.ajax({
				type: "POST",
				dataType: "json",
				url: "server.php", //Relative or absolute path to response.php file
				data: data,
				error: function (jqXHR, textStatus, errorThrown) {
        	console.log("loadCourseInfo " + textStatus + ":" + errorThrown);
				},
				success: function(data) {
					//console.log("Form submitted successfully.\nReturned json: " + data["json"]);
					courseInfo =  JSON.parse(data["json"]); 
					
					var t = findLatestHole();
					//console.log("Display Hole: " + t);
					displayCurrentHole(t);
					$(".course-name").text(courseInfo.course_name);
				}
			});			
			
		}
		
		function findLatestHole(){
			var h = 1;
			 
			for(h=1; h<18; h++){
				if(scores != null ||
				   !scores[golfers["A"].golfer_id].hasOwnProperty(h.toString()) ||
				   !scores[golfers["A"].golfer_id][h.toString()].hasOwnProperty('score') ||
				    scores[golfers["A"].golfer_id][h.toString()].score == ""){
				    	return h;
				}
			}
			
			return h;
		}
		
		function displayCurrentHole($hole){
		//console.log("Start displayCurrentHole " + $hole);
						
			if($hole == 1){
				$('#btnPrevHole').hide();
			} else {
				$('#btnPrevHole').show();
				$(".prevHole").text('' + $hole-1);
				$(".prevPar").text(courseInfo.holes["h"+($hole-1)].par);
			}
			
			
			$(".currentHole").text($hole.toString());
			$(".currentPar").text(courseInfo.holes["h"+$hole].par);
			$(".currentHdcp").text(courseInfo.holes["h"+$hole].handicap);
			
			

			for(i = 0; i<pos.length; i++){
				
				$('.golfer-' + pos[i] + '-bump').html("");
				
				if(parseInt(courseInfo.holes["h"+$hole].handicap) <= 
				   parseInt($('.golfer-' + pos[i] + '-adj-hdcp').text())){
				   $('.golfer-' + pos[i] + '-bump').html("1");
				}
				if((parseInt(courseInfo.holes["h"+$hole].handicap)) <= 
				   parseInt($('.golfer-' + pos[i] + '-adj-hdcp').text()-18)){
				   $('.golfer-' + pos[i] + '-bump').html("2");
				}
				
				
				$('#golfer-' + pos[i] + '-gross_score').find('option').remove().end();
	
				switch(	courseInfo.holes["h"+$hole].par ) {
					case "3":
						$('#golfer-' + pos[i] + '-gross_score')
					    .append('<option value="">Enter Score</option>')
					    .append('<option value="1">1 - Ace</option>')
					    .append('<option value="2">2 - Birdie</option>')
					 	  .append('<option value="3">3 - Par</option>')
					 	  .append('<option value="4">4 - Bogey</option>')
					 	  .append('<option value="5">5 - Double</option>')
					 	  .append('<option value="6">6 - Triple</option>')
					 	  .append('<option value="7">7 - Quad</option>')
					 	  .append('<option value="8">8 - Snowman</option>');
					 	break;
					case "4":
						$('#golfer-' + pos[i] + '-gross_score')
					    .append('<option value="">Enter Score</option>')
					    .append('<option value="1">1 - Ace</option>')
					    .append('<option value="2">2 - Eagle</option>')
					 	  .append('<option value="3">3 - Birdie</option>')
					 	  .append('<option value="4">4 - Par</option>')
					 	  .append('<option value="5">5 - Bogey</option>')
					 	  .append('<option value="6">6 - Double</option>')
					 	  .append('<option value="7">7 - Triple</option>')
					 	  .append('<option value="8">8 - Snowman</option>');
					 	break;
					case "5":
						$('#golfer-' + pos[i] + '-gross_score')
					    .append('<option value="">Enter Score</option>')
					    .append('<option value="1">1 - Ace</option>')
					    .append('<option value="2">2 - Double Eagle</option>')
					 	  .append('<option value="3">3 - Eagle</option>')
					 	  .append('<option value="4">4 - Birdie</option>')
					 	  .append('<option value="5">5 - Par</option>')
					 	  .append('<option value="6">6 - Bogey</option>')
					 	  .append('<option value="7">7 - Double</option>')
					 	  .append('<option value="8">8 - Triple</option>');
					 	break;
				}
				
				//if(!jQuery.isEmptyObject(scores[golfers[pos[i]].golfer_id])){
				try{
				var k = golfers[pos[i]].golfer_id;
					if(scores.hasOwnProperty(k) && 
					   scores[k].hasOwnProperty($hole.toString())){
						var s = scores[golfers[pos[i]].golfer_id][$hole.toString()].score;
		    		$('#golfer-' + pos[i] + '-gross_score').val(s);
		    	} else {
		    		$('#golfer-' + pos[i] + '-gross_score').val('');	
		    	}
	    	} catch(err){
	    		console.log(err.message);
	    	}
    	}	

			if($hole == 18){
				$('#btnNextHole').hide();
				$('#btnSaveRound').show();
			} else {
				$('#btnSaveRound').hide();
				$('#btnNextHole').show();
				$(".nextHole").text('' + ($hole+1));
				$(".nextPar").text(courseInfo.holes["h"+($hole+1)].par);
			}		
	
			$("#golfer-A-gross_score").selectmenu().selectmenu('refresh',true).enhanceWithin();
      $("#golfer-B-gross_score").selectmenu().selectmenu('refresh',true).enhanceWithin();
      $("#golfer-C-gross_score").selectmenu().selectmenu('refresh',true).enhanceWithin();
      $("#golfer-D-gross_score").selectmenu().selectmenu('refresh',true).enhanceWithin();
			
			//console.log("End displayCurrentHole " + $hole);
			
		}
		
		function getGolferNameById (golfer_id) {
			
			var k;
			for(k=0; k<allGolfers.length; k++ ){
					if(allGolfers[k].id == golfer_id){
						return allGolfers[k].last_name;
					}	
			}
			
			return "Not Found";
			
		}
		
		function loadAllGolfers(){
			//console.log("getGolfers");
			$.mobile.loading("show");
			var data = {
				"action": "allGolfers",
				"usnername": username
			};
			data = $(this).serialize() + "&" + $.param(data);
			$.ajax({
				type: "POST",
				dataType: "json",
				url: "server.php", //Relative or absolute path to response.php file
				data: data,
				error: function (jqXHR, textStatus, errorThrown) {
        	console.log("loadCourseInfo " + textStatus + ":" + errorThrown);
				},
				success: function(data) {
					//console.log("Form submitted successfully.\nReturned json: " + data["json"]);
					allGolfers =  JSON.parse(data["json"])["golfers"]; 
					loadRounds();			
				}
			});			
			$.mobile.loading("hide");
		}
		
		function loadGolfers($round_id){
			//console.log("getGolfers");
			
			delete golfers;
			
			var data = {
				"action": "golfers",
				"round_id": $round_id,
				"username": username
			};

			data = $(this).serialize() + "&" + $.param(data);
			$.ajax({
				type: "POST",
				dataType: "json",
				url: "server.php", //Relative or absolute path to response.php file
				data: data,
				error: function (jqXHR, textStatus, errorThrown) {
        	console.log("loadGolfers " + textStatus + ":" + errorThrown);
				},
				success: function(data) {
					//console.log("return: " + data);
					//console.log("Form submitted successfully.\nReturned json: " + data["json"]);
					if(data["message"] == "SUCCESSFUL"){
					
						golfers =  JSON.parse(data["json"]); 
										
						for(i = 0; i<pos.length; i++){
							 if(minHdcp > parseInt(golfers[pos[i]].handicap)){
							 		minHdcp = parseInt(golfers[pos[i]].handicap);
							 }
						}
						//console.log("minHdcp: " + minHdcp);
						
						for(i = 0; i<pos.length; i++){
							$(".golfer-" + pos[i]).html(golfers[pos[i]].last_name);					
							$(".golfer-" + pos[i] + "-hdcp").html(golfers[pos[i]].handicap);	
							var adjHdcp = parseInt(	golfers[pos[i]].handicap) - minHdcp;			
							$(".golfer-" + pos[i] + "-adj-hdcp").html(adjHdcp.toString());					
							$("#golfer-" + pos[i] + "-row").addClass("team-" + golfers[pos[i]].team);	
						}	
					} else {
						alert(data["message"]);
					}
					loadScores(roundInfo.round_id);			
					
									
				}
			});			
			
		}

		function showScores(){
			
				
				for(i = 0; i<pos.length; i++){
					var k = golfers[pos[i]].golfer_id;
					
					for (h = 1; h <= 9; h++) {
						if(scores.hasOwnProperty(k) && scores[k].hasOwnProperty(h.toString())){
						
							$('.'+ pos[i] + h).text(scores[k][h.toString()].score);
						 	//console.log(pos[i] + " s:" + scores[k][h.toString()].score);
						}
					}
				}	
		}

		function loadScores($round_id){
			//console.log("loadScores");
			var data = {
				"action": "scores",
				"round_id": $round_id,
			};

			data = $(this).serialize() + "&" + $.param(data);
			$.ajax({
				type: "POST",
				dataType: "json",
				url: "server.php", //Relative or absolute path to response.php file
				data: data,
				error: function (jqXHR, textStatus, errorThrown) {
        	console.log("loadScores " + textStatus + ":" + errorThrown);
				},
				success: function(data) {
					//console.log("return: " + data);
					//console.log("Form submitted successfully.\nReturned json: " + data["json"]);
					scores =  JSON.parse(data["json"]); 
					if(scores == null){
						scores = {"0":null};
					}
					
					loadCourseInfo(roundInfo.round_id);
				
				}
			});			
			
			
		}


		function loadRounds(){
			//console.log("getRounds");
			$.mobile.loading("show");
			var data = {
				"action": "rounds",
				"usnername": username
			};
			data = $(this).serialize() + "&" + $.param(data);
			$.ajax({
				type: "POST",
				dataType: "json",
				url: "hcadmin/admin_server.php", //Relative or absolute path to response.php file
				data: data,
				error: function (jqXHR, textStatus, errorThrown) {
        	console.log("Get Rounds " + textStatus + ":" + errorThrown);
    		  $("#ajaxMessage").text('Error Loading Rounds');
				},
				success: function(data) {
					//console.log("Form submitted successfully.\nReturned json: " + data["json"]);
					rounds =  JSON.parse(data["json"])["rounds"]; 	
					active_round = JSON.parse(data["json"])["active_round"]; 
					
					$('#select-score-round').find('option').remove().end();
					$('#select-score-round').append('<option value="0">Select Round</option>');
					
					for(i=0; i<rounds.length; i++){
						$('#select-score-round').append('<option value="' + rounds[i].round_id + '">' + rounds[i].round_name + '</option>');
					}
					
					$("#select-score-round").val(active_round);
					$("#select-score-round").selectmenu('refresh',true).enhanceWithin();
					

					refreshScores();
				
				}
			});			
			$.mobile.loading("hide");
		}

		$("#select-score-round").on("change",function(){
			$.mobile.loading("show");
			refreshScores();
			$.mobile.loading("hide");
		});	

		$(".logout").click(function(){
			$.removeCookie("golfer");
			$("#username").val("");
			username = "";
			$(".footerUsername").html(username);
			$("body").pagecontainer("change","#login");
		});

		$("#btnLogin").click(function(){

			var data = {
				"action": "login",
				"username": $('#username').val()
			};
			data = $(this).serialize() + "&" + $.param(data);
			$.ajax({
				type: "POST",
				dataType: "json",
				url: "server.php", //Relative or absolute path to response.php file
				data: data,
				error: function (jqXHR, textStatus, errorThrown) {
        	console.log("btnLogin:  " + textStatus + ":" + errorThrown);
				},
				success: function(data) {
					if(data["message"]=="User Found"){
						$.cookie("golfer",$('#username').val());
						username = $('#username').val();
						$(".footerUsername").html(username);
						initializeEntryPage();
						$("body").pagecontainer("change","#entry", {transition:"flow"});
						
					} else {
						$("#returnMessage").html("User Not Found");
					}
					
					//console.log("Form submitted successfully.\nReturned json: " + data["json"]);
					
				}
			});
			
			return false;
		});

		$(".scorecardLink").click(function(){
				loadScoreCardPage();
				/*alert($('#select-score-round').val());
				if($('#select-score-round').val() == null){
					loadRounds();
				} else {
					refreshScores();	
				}	
				*/
				//showScores();
	
		});

    $( "#btnNextHole, #btnSaveRound" ).click(function() {
 
    	  var hole = parseInt($(".currentHole").text());
        var nextHole = hole + 1;
        var h1 = "1";
        
        for(i = 0; i<pos.length; i++){
        	
        	//if(jQuery.isEmptyObject(scores[golfers[pos[i]])){
        	//console.log("scores "  + JSON.stringify(scores));
    			var k = golfers[pos[i]].golfer_id;
    			var pScore = $("#golfer-" + pos[i] + "-gross_score").val();					

					if(pScore != ""){
	        	if(!scores.hasOwnProperty(k)){
	        		var obj = {};
	        		obj[hole.toString()] = {score:pScore};
	        		scores[k] = obj;
	        		//scores["2"]["1"].score = 3;
	        	} else {
	       			if(!scores[k].hasOwnProperty(hole.toString())){
		       			var obj = {score:pScore};
		        		scores[k][hole.toString()] = obj;
	        		} else {
	        			scores[k][hole.toString()].score = pScore;
	        		}
	        	}
        	}
        }

				$.mobile.loading("show");
    		
				saveHole(hole);
    		

    });
    
    $( "#btnPrevHole" ).click(function() {
    		
    		$('#entry').animate({left:'-2000px'},"slow");
    		$("#ajaxMessage").text('');
        var hole = parseInt($(".currentHole").text());
        var prevHole = hole - 1;
        displayCurrentHole(prevHole);
        
       
        $('#entry').animate({left:'0px'});
        
    });
    
		function saveHole(hole) {
			
			console.log("Save Hole " + hole);
			
			var holeScores = [];
			
			for(i = 0; i<pos.length; i++){
				var k = golfers[pos[i]].golfer_id;
				if(scores.hasOwnProperty(k) && 
				   scores[k].hasOwnProperty(hole.toString())){
				   	var s = {id:k,score:scores[k][hole.toString()].score};
				   	
					holeScores.push(s);
				}
			}
			//console.log("Stringify " + JSON.stringify(holeScores));
			
			var data = {
				"action": "savescores",
				"round_id": roundInfo.round_id,
				"hole": hole,
				"scores": holeScores
			};
			
			data = $(this).serialize() + "&" + $.param(data);
			console.log('data: ' + hole);
			$.ajax({
				type: "POST",
				dataType: "json",
				url: "server.php", //Relative or absolute path to response.php file
				data: data,
				error: function (jqXHR, textStatus, errorThrown) {
        	//console.log("Save Scores " + textStatus + ":" + errorThrown);
        	$.mobile.loading("hide");
    		  $("#ajaxMessage").text('Error Saving Scores');
				},
				success: function(data) {
					//console.log("Save Successful for hole " + hole);
					$.mobile.loading("hide");
    		  if(hole != "18"){
    		   $('#entry').animate({left:'2000px'},"slow");
       		 displayCurrentHole(parseInt(hole) + 1);
         	 $('#entry').animate({left:'0px'});
         	 $("#ajaxMessage").text('');
        	} else {
        	 $("#ajaxMessage").text('Round Saved');
        	}

				
        }
			});
			
		}

		function refreshScores(){
			$.mobile.loading("show");
			show_round = $('#select-score-round').val();

			var data = {
				"action": "getRoundScores",
				"round_id" : show_round
			};
			data = $(this).serialize() + "&" + $.param(data);
			$.ajax({
				type: "POST",
				dataType: "json",
				url: "server.php", //Relative or absolute path to response.php file
				data: data,
				error: function (jqXHR, textStatus, errorThrown) {
        	//console.log("Save Active Round " + textStatus + ":" + errorThrown);
    		  $("#ajaxMessage").text('Error Showing Scores');
    		  $.mobile.loading("hide");
				},
				success: function(data) {
					//console.log("SCORES: Returned json: " + data["json"]);
						
					roundScores = JSON.parse(data["json"])["scores"]; 	
					var courseDetail = JSON.parse(data["json"])["course_detail"]; 	
					
					$("#scoresTable").tablesorter();					

					$('#scoresTable thead .course-detail-row').remove();
						html = "<tr class='course-detail-row par-row'>\n";
						html += " <th class='course-detail-cell'>Par</th>\n";
						var h;
						var p_out = 0;
						var p_in = 0;
						var p_total = 0;						
						for(h=1; h<=18; h++){
							html += " <th class='course-detail-cell'>" + courseDetail["h" + h].par + "</th>\n";
							if(h<=9){
								if(courseDetail["h" + h].par != "") p_out += parseInt(courseDetail["h" + h].par);
							}else {
								if(courseDetail["h" + h].par != "") p_in += parseInt(courseDetail["h" + h].par);
							}
						}
						p_total = p_out + p_in;
						html += " <th class='course-detail-cell'>" + p_out + "</th>\n";
						html += " <th class='course-detail-cell'>" + p_in + "</th>\n";
						html += " <th class='course-detail-cell'>" + p_total + "</th>\n";
						html += " <th class='course-detail-cell'></th>\n";
						html += "</tr>\n";
					$('#scoresTable thead').append(html);
					
						html = "<tr class='course-detail-row handicap-row'>\n";
						html += " <th class='course-detail-cell'>HDCP</th>\n";
						var h;
						for(h=1; h<=18; h++){
							html += " <th class='course-detail-cell'>" + courseDetail["h" + h].handicap + "</th>\n";
						}
						total = s_out + s_in;
						html += " <th class='course-detail-cell'></th>\n";
						html += " <th class='course-detail-cell'></th>\n";
						html += " <th class='course-detail-cell'></th>\n";
						html += " <th class='course-detail-cell'></th>\n";
						html += "</tr>\n";
					$('#scoresTable thead').append(html);

					$('#scoresTable tbody tr').remove();						

					html = "";
					for(i=0; i<roundScores.length; i++){
						html = "<tr class='score-row'>\n";
						html += " <td>" + getGolferNameById(roundScores[i].golfer_id) + "</td>\n";
						var h;
						var s_out = 0;
						var s_in = 0;
						var total = 0;
						var thru = 0;
						var over_under = 0;
						for(h=1; h<=18; h++){
							var s = getScoreByHole(roundScores[i].scores,h);
							html += " <td>" + s + "</td>\n";
							if(s != ""){
								 thru++;
								over_under += s - parseInt(courseDetail["h" + h].par);
							} 
							if(h<=9){
								if(s != "") s_out += parseInt(s);
							}else {
								if(s != "") s_in += parseInt(s);
							}
						}
						total = s_out + s_in;
						
						html += " <td>" + s_out + "</td>\n";
						html += " <td>" + s_in + "</td>\n";
						html += " <td>" + total +"</td>\n";
						html += " <td>" + over_under + "</td>\n";
						if(thru == 0){
							html += " <td></td>\n";
						} else if(thru == 18) {
							html += " <td>F</td>\n";
						} else {
							html += " <td>" + thru + "</td>\n";
						}
						html += "</tr>\n";
						$('#scoresTable tbody').append(html);
					}
					
					try{
						$("#select-score-round").selectmenu('refresh',true).enhanceWithin();
					
						$('#scoresTable').table().table("refresh").enhanceWithin();
						//$("#scoresTable").tablesorter( {sortList: [[22,0], [23,0]]} );
						$("#scoresTable").trigger("update"); 
					}catch(err) {
						console.log(err);
					}
					
					
					$.mobile.loading("hide");						
				}
			});						
		}

		function getScoreByHole(golferScores, hole){
			score = "";
			
			if(golferScores != null){
				var h
				for(h=0; h<golferScores.length; h++){
					if(golferScores[h].hole == hole){
						return golferScores[h].score;
					}
				}
			}
			return score;
		}


});


