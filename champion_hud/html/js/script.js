$(function() {
    function setRange(range) {
        switch (range) {
            case 0:
                $('.range-3').addClass('range-on');
                $('.range-8').removeClass('range-on');
                $('.range-15').removeClass('range-on');
                $('.range-32').removeClass('range-on');
                break;

            case 1:
                $('.range-3').addClass('range-on');
                $('.range-8').addClass('range-on');
                $('.range-15').removeClass('range-on');
                $('.range-32').removeClass('range-on');
                break;

            case 2:
                $('.range-3').addClass('range-on');
                $('.range-8').addClass('range-on');
                $('.range-15').addClass('range-on');
                $('.range-32').removeClass('range-on');
                break;

            case 3:
                $('.range-3').addClass('range-on');
                $('.range-8').addClass('range-on');
                $('.range-15').addClass('range-on');
                $('.range-32').addClass('range-on');
                break;
        
            default:
                $('.range-3').removeClass('range-on');
                $('.range-8').removeClass('range-on');
                $('.range-15').removeClass('range-on');
                $('.range-32').removeClass('range-on');
                break;
        }
    }

    window.addEventListener('message', function(event) {
        switch (event.data.type) {
            case 'updateMoney':
                $('#money').text(new Intl.NumberFormat('de-DE').format(event.data.money) + ' $');
                break;
        
            case 'updateSpeaking':
                if(event.data.muted) {
                    $('#speaking').removeClass('fa-microphone');
                    $('#speaking').addClass('fa-microphone-slash');
                    $('#speaking').css('color', '#c0392b');
                } else {
                    $('#speaking').removeClass('fa-microphone-slash');
                    $('#speaking').addClass('fa-microphone');

                    if(event.data.speaking)
                        $('#speaking').css('color', '#2ecc71');
                    else
                        $('#speaking').css('color', '#57565c');
                }
                break;

            case 'updateRange':
                setRange(event.data.range);
                break;

            case 'updateFunk':
                if(event.data.connected) {
                    $('#connected').text('Verbunden');
                    $('#connected').addClass('status-on');
                } else {
                    $('#connected').text('Keine Verbindung');
                    $('#connected').removeClass('status-on');
                }
                break;

            default:
                break;
        }
    });
});

$(function(){
	window.addEventListener('message', function(event) {
		if (event.data.action == "toggle")
		{
			if (event.data.show){
				$('body').show();
			} else{
				$('body').hide();
			}
		} 
	});

});
