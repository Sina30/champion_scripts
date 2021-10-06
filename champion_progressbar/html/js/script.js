$('document').ready(function() {
    ChampionProgBar = {};
									$("#Progressbar").hide();

    ChampionProgBar.Progress = function(data) {

		
		   $("#Progressbar").show();
							var start = new Date();
							var maxTime = data.duration;
							var percentage = percentage;
							var timeoutVal = Math.floor(1000);
							animateUpdate();

							
							

							function updateProgress(percentage) {
							    $('.progress-bar-fill').css("width", percentage + "%");
								$('.text').text(percentage + "%");
							}


							function animateUpdate() {
								var now = new Date();
								var timeDiff = now.getTime() - start.getTime();
								var perc = Math.round((timeDiff/maxTime)*100);
								if (perc <= 100) {
									updateProgress(perc);
									setTimeout(animateUpdate, timeoutVal);
								} else {
									
									$("#Progressbar").hide();
																		    $('.progress-bar-fill').css("width", "0%");

									            $.post('http://champion_progressbar/actionFinish', JSON.stringify({
                })
            );
								}
							}


    };

    ChampionProgBar.ProgressCancel = function() {


        setTimeout(function () {
									$("#Progressbar").hide();



            $.post('http://champion_progressbar/actionCancel', JSON.stringify({
                })
            );
        }, 1000);
    };

    ChampionProgBar.CloseUI = function() {
        $('.main-container').css({"display":"none"});
        $(".character-box").removeClass('active-char');
        $(".character-box").attr("data-ischar", "false")
        $("#delete").css({"display":"none"});
    };
    
    window.addEventListener('message', function(event) {
        switch(event.data.action) {
            case 'champion_progress':
                ChampionProgBar.Progress(event.data);
                break;
            case 'champion_progress_cancel':
                ChampionProgBar.ProgressCancel();
                break;
        }
    })
});
