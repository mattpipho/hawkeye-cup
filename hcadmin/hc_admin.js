var username = "";
var rounds;
var active_round;
var courseInfo;
var golfers;
var scores;

$(document).ready(function() {
    
		username = $.cookie("golfer");
		$(".footerUsername").html(username);
		
		if(typeof username != 'undefined' && username != ''){
			initializeAdminPage();
		}

		function initializeAdminPage(){
			console.log("initializeAdminPage");
			loadGolfers();
			loadRounds();
			console.log("End initializeAdminPage");
		}

		function getGolferNameById (golfer_id) {
			
			var k;
			for(k=0; k<golfers.length; k++ ){
					if(golfers[k].id == golfer_id){
						return golfers[k].last_name;
					}	
			}
			
			return "Not Found";
			
		}
		function getGolferInfo (golfer_id) {
			var k;
			for(k=0; k<golfers.length; k++ ){
					if(golfers[k].id == golfer_id){
						return golfers[k];
					}	
			}
			
			return "Not Found";
			
		}
		

		function loadGolfers(){
			console.log("getGolfers");
			$.mobile.loading("show");
			var data = {
				"action": "golfers"
			};
			data = $(this).serialize() + "&" + $.param(data);
			$.ajax({
				type: "POST",
				dataType: "json",
				url: "admin_server.php", //Relative or absolute path to response.php file
				data: data,
				error: function (jqXHR, textStatus, errorThrown) {
        	       console.log("loadGolfers " + textStatus + ":" + errorThrown);
                   alert("loadGolfers " + textStatus + ":" + errorThrown);
				},
				success: function(data) {
					//console.log("Form submitted successfully.\nReturned json: " + data["json"]);
					golfers =  JSON.parse(data["json"])["golfers"]; 	
					
					//console.log("Golfer: " + golfers[1].last_name);
					
					$('#golferTable tbody tr').remove();
					
					html = "";
					for(i=0; i<golfers.length; i++){
						html = "<tr class='golfer-row'>\n";
						html += " <td>" + golfers[i].username + "</td>\n";
						//html += " <td>" + golfers[i].last_name + "</td>\n";
						html += " <td><input type='number' name='handicap-" + golfers[i].id + "' ";
						html += "            data-mini='true'";
						html += "            class='handicap' data-id='" + golfers[i].id + "'";
						html += "            id='handicap-" + golfers[i].id + "' value='" + golfers[i].handicap + "'></td>\n";
						html += " <td><select name='select-golfer-team-" + golfers[i].id + "' ";
						html += "             class='select-golfer-team' ";
						html += "             data-id='" + golfers[i].id + "' ";
						html += "             id='select-golfer-team-" + golfers[i].id + "' ";
						html += "             data-native-menu='false' data-mini='true'> ";
            html += "       <option></option> ";
            html += "       <option value='0' ";
            if(golfers[i].team == 0){ html += "selected";}
            html += ">Black</option> ";
            html += "       <option value='1' ";
            if(golfers[i].team == 1){html += "selected";}
            html += ">Gold</option> ";
            html += "      </select></td>\n";
						html += " <td id='action-button-cell-" + golfers[i].id + "' class='action_button_cell'></td>\n";
						html += "</tr>\n";
						$('#golferTable tbody').append(html);
					}
					
					$('#golferTable').table("refresh").enhanceWithin();
					
													
				}
			});			
			$.mobile.loading("hide");
		}

		function loadRounds(){
			console.log("getRounds");
			$.mobile.loading("show");
			var data = {
				"action": "rounds",
				"usnername": username
			};
			data = $(this).serialize() + "&" + $.param(data);
			$.ajax({
				type: "POST",
				dataType: "json",
				url: "admin_server.php", //Relative or absolute path to response.php file
				data: data,
				error: function (jqXHR, textStatus, errorThrown) {
        	console.log("Get Rounds " + textStatus + ":" + errorThrown);
    		  $("#ajaxMessage").text('Error Loading Rounds');
				},
				success: function(data) {
					//console.log("Form submitted successfully.\nReturned json: " + data["json"]);
					rounds =  JSON.parse(data["json"])["rounds"]; 	
					active_round = JSON.parse(data["json"])["active_round"]; 
					
					$('#select-active-round').find('option').remove().end();
					$('#select-tee-time-round').find('option').remove().end();
					$('#select-score-round').find('option').remove().end();
					$('#select-active-round').append('<option value="0">Select Round</option>');
					$('#select-tee-time-round').append('<option value="0">Select Round</option>');
					$('#select-score-round').append('<option value="0">Select Round</option>');
					
					for(i=0; i<rounds.length; i++){
						$('#select-active-round').append('<option value="' + rounds[i].round_id + '">' + rounds[i].round_name + '</option>');
						$('#select-tee-time-round').append('<option value="' + rounds[i].round_id + '">' + rounds[i].round_name + '</option>');
						$('#select-score-round').append('<option value="' + rounds[i].round_id + '">' + rounds[i].round_name + '</option>');
					}
					
					$("#select-active-round").val(active_round);
					$("#select-active-round").selectmenu('refresh',true);	
					$("#select-tee-time-round").val(active_round);
					$("#select-tee-time-round").selectmenu('refresh',true);
					$("#select-score-round").val(active_round);
					$("#select-score-round").selectmenu('refresh',true);

					refreshTeeTimes();
					refreshScores();
				
				}
			});			
			$.mobile.loading("hide");
		}

		
		$("#select-active-round").on("change",function(){
			
			$.mobile.loading("show");
			active_round = $(this).val();
			var data = {
				"action": "saveActiveRound",
				"round_id" : active_round
			};
			data = $(this).serialize() + "&" + $.param(data);
			$.ajax({
				type: "POST",
				dataType: "json",
				url: "admin_server.php", //Relative or absolute path to response.php file
				data: data,
				error: function (jqXHR, textStatus, errorThrown) {
        	console.log("Save Active Round " + textStatus + ":" + errorThrown);
    		  $("#ajaxMessage").text('Error Saving Active Round');
				},
				success: function(data) {
					//console.log("Form submitted successfully.\nReturned json: " + data["json"]);
					
					$("#select-tee-time-round").val(active_round);
					$("#select-tee-time-round").selectmenu('refresh',true);
					$("#select-score-round").val(active_round);
					$("#select-score-round").selectmenu('refresh',true);
					
					//Refresh Tee Times - Could maybe to an onchange event for the drop down to change tee times
					refreshTeeTimes();
					refreshScores();						
				}
			});			
			
				$.mobile.loading("hide");
		});

		
		function refreshTeeTimes(){
			show_round = $('#select-tee-time-round').val();
			var data = {
				"action": "getTeeTimes",
				"round_id" : show_round
			};
			data = $(this).serialize() + "&" + $.param(data);
			$.ajax({
				type: "POST",
				dataType: "json",
				url: "admin_server.php", //Relative or absolute path to response.php file
				data: data,
				error: function (jqXHR, textStatus, errorThrown) {
        	console.log("Save Active Round " + textStatus + ":" + errorThrown);
    		  $("#ajaxMessage").text('Error Saving Active Round');
				},
				success: function(data) {
					//console.log("Form submitted successfully.\nReturned json: " + data["json"]);
						
					var tee_times = JSON.parse(data["json"])["tee_times"]; 	
					
					var i;
					for(i=0; i<tee_times.length; i++){
						var tee_time_id = tee_times[i].tee_time_id;
						
						$('#tee-time-' + tee_time_id + ' .tee-time-golfer').remove();	
						
						if(tee_times[i].hasOwnProperty('golfers') && tee_times[i].golfers != null){
							var numberOfGolfers = tee_times[i].golfers.length;

							var j;
							for(j=0; j<numberOfGolfers; j++){
								var golfer_id = tee_times[i].golfers[j].golfer_id;
								var golferInfo = getGolferInfo(golfer_id);
								var golfer_name = golferInfo.last_name;
								//console.log("i:" + i + " j: " + j + " golfer_id: " + golfer_id + " name: " + golfer_name);
								//console.log('golfers after: ' + tee_times[i].golfers);
								var li = '<li class="tee-time-golfer" data-golfer-id="' + tee_times[i].golfers[j].golfer_id + '" ' +
								         '    data-icon="delete"><a href="#">' + golfer_name + '</a></li>';
								$('#tee-time-' + tee_time_id).prepend(li);
							}		
						}
						$('#tee-time-' + tee_time_id).listview('refresh');
					}
											
				}
			});						
		}

		$('#score-display-gross').click(function(){
			
			refreshScores();
				
		});
		
		function refreshScores(){
			$.mobile.loading("show");
			show_round = $('#select-score-round').val();

		
			
			var data = {
				"action": "getScores",
				"round_id" : show_round
			};
			data = $(this).serialize() + "&" + $.param(data);
			$.ajax({
				type: "POST",
				dataType: "json",
				url: "admin_server.php", //Relative or absolute path to response.php file
				data: data,
				error: function (jqXHR, textStatus, errorThrown) {
        	console.log("Save Active Round " + textStatus + ":" + errorThrown);
    		  $("#ajaxMessage").text('Error Showing Scores');
    		  $.mobile.loading("hide");
				},
				success: function(data) {
					//console.log("SCORES: Returned json: " + data["json"]);
						
					scores = JSON.parse(data["json"])["scores"]; 	
					
					var i;
						$("#scoresTable").tablesorter();					
					$('#scoresTable tbody tr').remove();						

					html = "";
					for(i=0; i<scores.length; i++){
						var golferInfo = getGolferInfo(scores[i].golfer_id);

						html = "<tr class='score-row'>\n";
						html += " <td>" + scores[i].golfer_id + "</td>\n";
						html += " <td>" + scores[i].tee_time_id + "</td>\n";
						if(golferInfo.team == "0") {
							html += " <td>Black</td>\n";
						} else {
							html += " <td>Gold</td>\n";							
						}
						html += " <td>" + getGolferNameById(scores[i].golfer_id) + "</td>\n";
						var h;
						var s_out = 0;
						var s_in = 0;
						var total = 0;
						for(h=1; h<=18; h++){
							var s = getScoreByHole(scores[i].scores,h);
							html += " <td>" + s + "</td>\n";
							if(h<=9){
								if(s != "") s_out += parseInt(s);
							}else {
								if(s != "") s_in += parseInt(s);
							}
							if(h==9)html += " <td>" + s_out + "</td>\n";
							
						}
						total = s_out + s_in;
						html += " <td>" + s_in + "</td>\n";
						html += " <td>" + total + "</td>\n";
						html += "</tr>\n";
						$('#scoresTable tbody').append(html);
					}
					
					try{
						$('#scoresTable').table("refresh").enhanceWithin();
						$("#scoresTable").trigger('update');
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
		
		$("#select-tee-time-round").on("change",function(){
			
			$.mobile.loading("show");
			refreshTeeTimes();
			$.mobile.loading("hide");
		});
		
		$("#select-score-round").on("change",function(){
			
			$.mobile.loading("show");
			refreshScores();
			$.mobile.loading("hide");
		});


 		$(document).on('click', '.tee-time-golfer', function(e){




				var tee_time_id = $(this).parent().data('tee-time-id');
				var golfer_id = $(this).data('golfer-id');
				var round_id = $('#select-tee-time-round').val();
				var removed = false;
				var elementName = $(this).attr('id');
				
				$.mobile.loading("show");

				var data = {
				"action": "removeTeeTimeGolfer",
				"round_id" : round_id,
				"golfer_id" : golfer_id,
				"tee_time_id" : tee_time_id
				};
				data = $(this).serialize() + "&" + $.param(data);
				$.ajax({
					type: "POST",
					dataType: "json",
					url: "admin_server.php", //Relative or absolute path to response.php file
					data: data,
					error: function (jqXHR, textStatus, errorThrown) {
	        	console.log("removeTeeTimeGolfer " + textStatus + ":" + errorThrown);
	    		  $("#ajaxMessage").text('Error Saving Active Round');
						$.mobile.loading("hide");	
					},
					success: function(data) {
						console.log("removeTeeTimeGolfer Success");
	    		  removed = true;

						$.mobile.loading("hide");	
					}
				});


		    $(this).remove();
				$(this).parent().listview('refresh');		
	

		});
		
		$(".select-tee-time").on("change",function(){
			if($(this).val() != ''){
				var tee_time_id = $(this).data('tee-time-id');
				var golfer_id = $(this).val()
				var golfer_name = getGolferNameById(golfer_id);
				
				$.mobile.loading("show");
				
				round_id = $('#select-tee-time-round').val();
				var data = {
				"action": "addTeeTimeGolfer",
				"round_id" : round_id,
				"golfer_id" : golfer_id,
				"tee_time_id" : tee_time_id
				};
				data = $(this).serialize() + "&" + $.param(data);
				$.ajax({
					type: "POST",
					dataType: "json",
					url: "admin_server.php", //Relative or absolute path to response.php file
					data: data,
					error: function (jqXHR, textStatus, errorThrown) {
	        	console.log("addTeeTimeGolfer " + textStatus + ":" + errorThrown);
	    		  $("#ajaxMessage").text('Error Saving Active Round');
	    		  			$.mobile.loading("hide");	

					},
					success: function(data) {
						var li = '<li class="tee-time-golfer" data-golfer-id="' + golfer_id + '" ' +
										 '    data-icon="delete"><a href="#">' + golfer_name + '</a></li>';
						$('#tee-time-' + tee_time_id).prepend(li);
						$('#tee-time-' + tee_time_id).listview('refresh');		
									$.mobile.loading("hide");						
					}
				});

			}
		
			$(this).val('');
			$(this).selectmenu('refresh',true);
			
	

		});
		
		
		$("#golferTable").on("change",".handicap, .select-golfer-team",function(){
			
			$.mobile.loading("show");
				
			var data = {
				"action": "saveGolfer",
				"golfer_id" : $(this).data("id"),
				"handicap": $('#handicap-' + $(this).data("id")).val(),
				"team": $('#select-golfer-team-' + $(this).data("id")).val()
			};
			data = $(this).serialize() + "&" + $.param(data);
			$.ajax({
				type: "POST",
				dataType: "json",
				url: "admin_server.php", //Relative or absolute path to response.php file
				data: data,
				error: function (jqXHR, textStatus, errorThrown) {
        	console.log("Save Golfer " + textStatus + ":" + errorThrown);
        	$.mobile.loading("hide");
    		  $("#ajaxMessage").text('Error Saving Scores');
				},
				success: function(data) {
					console.log("Form submitted successfully.\nReturned json: " + data["json"]);
												
				}
			});			
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
				url: "admin_server.php", //Relative or absolute path to response.php file
				data: data,
				error: function (jqXHR, textStatus, errorThrown) {
        	       console.log("btnLogin Click " + textStatus + ":" + errorThrown);
    		  
				},
				success: function(data) {
					if(data["message"]=="User Found"){
						$.cookie("golfer",$('#username').val());
						username = $('#username').val();
						$(".footerUsername").html(username);
						initializeAdminPage();
						$("body").pagecontainer("change","#admin", {transition:"flow"});
						
					} else {
						$("#returnMessage").html("User Not Found");
					}

					//html = "<tr>
					//console.log("Form submitted successfully.\nReturned json: " + data["json"]);
					
				}
			});
			
			return false;
		});


});
