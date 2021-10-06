$(document).ready(function(){
    window.addEventListener('message', function( event ) {             
      if (event.data.action == 'open') {
        $('.container').css('display', 'block');
        $('.container2').css('display', 'block');
        $('.inv-head-btn p').text('');
        $('.inv-head-btn p2').text('');

      } else if (event.data.action == 'close') {
        $('.container').css('display', 'none');
        $('.container2').css('display', 'none');
      } else if (event.data.action == 'add') {       
        AddItem(event.data.identifier, event.data.item, event.data.limit, event.data.count, event.data.name, event.data.label, event.data.rare, event.data.can_remove, event.data.url, event.data.useable);
      } else if (event.data.action == 'addw') {       
        AddWeapon(event.data.identifier, event.data.item, event.data.limit, event.data.count, event.data.name, event.data.label, event.data.rare, event.data.can_remove, event.data.url, event.data.useable);
      } else if (event.data.action == 'reset') {
        const inv = document.getElementById("invcontainer");
        const inv2 = document.getElementById("invcontainer2");
        inv.innerHTML = '';
        $('.inv-head-btn p').text('');

      } else if (event.data.action == 'updatemax') {        
        $("#amount").attr('max', (parseInt($('.selected').attr('data-count')) - event.data.max));
        $('.selected').attr('data-count', (parseInt($('.selected').attr('data-count')) - event.data.max))
        
        $('.inv-head-btn p').text((parseInt($('.selected').attr('data-count')) - event.data.max) + 'x');

        if ((parseInt($('.selected').attr('data-count')) - event.data.max) <= 0) {
          $('.selected').remove();
        }
      } else if (event.data.action == 'update') {
        $('.inv-head-btn p').text(event.data.nmoney + '$');
      }
    });

    function AddItem(identifier, item, limit, count, name, label, rare, can_remove, url, useable) { 
      if (count <= 0) {
        return
      }
                   
      $('#invcontainer').append(
        `
        <div class="inv-cont-elem" onclick="select(this);" style="background-image: url(` + url + `);" data-itype="item" data-identifier="` + identifier + `" data-limit="` + limit + `" data-item="` + item + `" data-count="` + count + `" data-name="` + name + `" data-label="` + label + `" data-rare="` + rare + `" data-can_remove="` + can_remove + `" data-url="` + url + `" data-useable=` + useable + `>

        </div>      
        `
      );
    }
 
    $( "#close" ).click(function() {
      $('.container').css('display', 'none');
      $.post('http://champion_inventory/escape', JSON.stringify({}));
    });

    $( "#refresh" ).click(function() {      
      $.post('http://champion_inventory/refresh', JSON.stringify({}));
    }); 

    $('#use').click(function() {
      var count = $('.selected').attr('data-count'); 
      var amount = $("#amount").val(); 
      var type = $('.selected').attr('data-itype');
      
      if (count >= amount) {
        if (type == 'item') {
          $('.selected').attr('data-count', (count - amount))
          $("#amount").attr('max', (count - amount));           

          $.post('http://champion_inventory/use', JSON.stringify(
            {
              item: $('.selected').attr('data-name'),
              amount: $("#amount").val(),
              label: $('.selected').attr('data-label'),
            }
          ));

          $('.inv-head-btn p').text($('.selected').attr('data-count') + 'x');
          if ($('.selected').attr('data-count') <= 0) {
            $('.selected').remove();
          } 
        }
      }
    });

    $('#throw').click(function() {
      var count = $('.selected').attr('data-count'); 
      var amount = $("#amount").val(); 
      var type = $('.selected').attr('data-itype');
      
      if (count >= amount) {
        if (type == 'item') {
          $('.selected').attr('data-count', (count - amount))
          $("#amount").attr('max', (count - amount));           

          $.post('http://champion_inventory/throw', JSON.stringify(
            {
              item: $('.selected').attr('data-name'),
              amount: $("#amount").val(),
              label: $('.selected').attr('data-label'),
            }
          ));

          $('.inv-head-btn p').text($('.selected').attr('data-count') + 'x');

          if ($('.selected').attr('data-count') <= 0) {
            $('.selected').remove();
          } 
        } else if (type == 'cash') {
          $('.selected2').attr('data-count', (count - amount))
          $("#amount").attr('max', (count - amount));           
          
          $.post('http://champion_inventory/throwCash', JSON.stringify(
            {
              amount: $("#amount").val(),
            }
          ));

          $('.inv-head-btn p').text($('.selected2').attr('data-count') + '$');

          if ($('.selected2').attr('data-count') <= 0) {
            $('.selected2').remove();
          } 
        } else if (type == 'weapon') {
          $('.selected2').attr('data-count', (count - amount))
          $("#amount").attr('max', (count - amount));           
          
          $.post('http://champion_inventory/throwweapon', JSON.stringify(
            {
              item: $('.selected').attr('data-name'),
              amount: $("#amount").val(),
              label: $('.selected').attr('data-label'),
            }
          ));

          $('.inv-head-btn p').text($('.selected2').attr('data-count') + 'x');

          if ($('.selected2').attr('data-count') <= 0) {
            $('.selected2').remove();
          } 
        }
      }
    });

    $('#give').click(function() {
      var count = $('.selected').attr('data-count'); 
      var amount = $("#amount").val(); 
      var type = $('.selected').attr('data-itype');

      if (count >= amount) {
        if (type == 'item') {
          $.post('http://champion_inventory/give', JSON.stringify(
            {
              item: $('.selected').attr('data-name'),
              amount: $("#amount").val(),
              label: $('.selected').attr('data-label'),
            }
          ));
        } else if (type == 'cash') {
          $.post('http://champion_inventory/givecash', JSON.stringify(
            {
              amount: $("#amount").val(),
            }
          ));
        }  else if (type == 'weapon') {
            $.post('http://champion_inventory/giveweapon', JSON.stringify(
              {
                item: $('.selected').attr('data-name'),
                amount: $("#amount").val(),
                label: $('.selected').attr('data-label'),
            }
          ));
        }
      }
    });
});

function select(elem) {
  $('.inv-cont-elem').removeClass('selected');
  $(elem).addClass('selected');
  $('.sub-container').css('display', 'block');

  $('.inv-head-btn p').text($(elem).attr('data-count') + '/' + $(elem).attr('data-limit') +  ' | '+ $(elem).attr('data-label'));
  $('.inv-item-name').text($(elem).attr('data-label'));

  $('#amount').attr('max', $(elem).attr('data-count'));
  $("#amount").val(1);
  
  if ($(elem).attr('data-useable') == 'true' && $(elem).attr('data-itype') == 'item') {
    $('#use').show();
  }
}

function select2(elem) {
  $('.inv-cont-elem').removeClass('selected');
  $(elem).addClass('selected');
  $('.sub-container').css('display', 'block');

  $('.inv-head-btn p').text($(elem).attr('data-count') + '$');

  $('#amount').attr('max', $(elem).attr('data-count'));
  $("#amount").val(1);
  
  if ($(elem).attr('data-useable') == 'true' && $(elem).attr('data-itype') == 'item') {
    $('#use').show();
  }
}

function select3(elem) {
  $('.inv-cont-elem').removeClass('selected');
  $(elem).addClass('selected');
  $('.sub-container').css('display', 'block');

  $('.inv-head-btn p').text($(elem).attr('data-label') + '');

  $('#amount').attr('max', $(elem).attr('data-label'));
  $("#amount").val(1);
  
  if ($(elem).attr('data-useable') == 'false' && $(elem).attr('data-itype') == 'weapon') {
    $('#use').show();
  }
}
