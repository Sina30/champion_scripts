$("body").hide();

window.onload = function(e) {
    window.addEventListener('message', function(event) {
        let data = event.data
        $("body").show();
       //  document.getElementById("title").textContent = data.title;
    })
} 

$( "#einreiselegalbtn" ).click(function() {  
    $("body").hide();    
    $.post('http://champion_einreise/einreiselegalbtn', JSON.stringify({}));
}); 

$( "#einreiseillegalbtn" ).click(function() {      
    $("body").hide();
    $.post('http://champion_einreise/einreiseillegalbtn', JSON.stringify({}));
}); 