var warenkorb = []

$(document).ready(function(){
    window.addEventListener('message', function( event ) {      
      if (event.data.action == 'open') {

        const warenkorb2 = document.getElementById("warenkorb-list");
        warenkorb2.innerHTML = '';

        warenkorb = []

        $('#warenkorb-1').text('$0.0');
        $('#warenkorb-2').text('$0.0');

        $('.container').css('display', 'block');        

      } else if (event.data.action == 'add') {
                
        AddItem(event.data.name, event.data.display, event.data.price);       

      } else {
        $('.container').css('display', 'none');
      }
    });

    $( "#close" ).click(function() {
      $('.container').css('display', 'none');
      $.post('http://champion_waffenshops/escape', JSON.stringify({}));
    });
				$(document).keyup(function (e) {
			if (e.key === "Escape") {
				$.post('http://champion_waffenshops/escape', JSON.stringify({}));
			}
		});
});

function AddWarenkorb(name, display, price) {
  warenkorb.push({name: name, display: display, price: price});

  $(".warenkorb-list").append
  (`
    <div class="warenkorb-list-elem">
        <p>1x | `+ display +` | $`+ price +`</p>
        <i class="fas fa-trash-alt"></i>
    </div>
  `);

  var current = $('#warenkorb-1').text();
  var current2 = current.replace("$", "");
  var int = parseFloat(current2)
  
  $('#warenkorb-1').text('$' + (int + parseFloat(price)));

  var xcurrent = $('#warenkorb-1').text();
  var xcurrent2 = xcurrent.replace("$", "");
  var xint = parseFloat(xcurrent2)

  $('#warenkorb-2').text('$' + (xint + (xint * 0.07)));
}

function buy() {
  $.post('http://champion_waffenshops/buy', JSON.stringify({warenkorb: warenkorb}));
  $('.container').css('display', 'none');
  $.post('http://champion_waffenshops/escape', JSON.stringify({}));
}



function AddItem(name, display, price) {
  $("#items-content").append
      (`
      
      <div class="items-element">
          <div class="items-element-inner" style="background-image: url(items/`+name+`.png);">

          </div>
          <div class="items-element-sub" onclick="AddWarenkorb('`+name+`', '`+display+`', '`+price+`')">
              $`+price+`
          </div>
      </div>
      `);
}