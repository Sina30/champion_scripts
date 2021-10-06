$(document).ready(function () {

    window.addEventListener("message", function (event) {
        if (event.data.action == "open") {
            $('body').show();
        };

        if (event.data.action == "close") {

            $("body").hide();

        };
		$(document).keyup(function (e) {
			if (e.key === "Escape") {
                mouseClick();
            $("body").hide();
				$.post('http:///champion_xmenu3/escape', JSON.stringify({}));
			}
		});
    });
});

let selected = 2;

$( ".id1add" ).hover(function() {
    $(".item_1").addClass("itemhover");
    mouseOver('1');
    selected = 1;
  });

  $( ".id1add" ).mouseleave(function() {
    $(".item_1").removeClass("itemhover");
    mouseOut('1');
    selected = 1;
  });
  
$( ".id2add" ).hover(function() {
    $(".item_2").addClass("itemhover");
    mouseOver('2');
    selected = 2;
  });

  $( ".id2add" ).mouseleave(function() {
    $(".item_2").removeClass("itemhover");
    mouseOut('2');
    selected = 1;
  });

$( ".id3add" ).hover(function() {
    $(".item_3").addClass("itemhover");
    mouseOver('3');
    selected = 3;
  });

  $( ".id3add" ).mouseleave(function() {
    $(".item_3").removeClass("itemhover");
    mouseOut('3');
    selected = 1;
  });
  
$( ".id4add" ).hover(function() {
    $(".item_4").addClass("itemhover");
    mouseOver('4');
    selected = 4;
  });

  $( ".id4add" ).mouseleave(function() {
    $(".item_4").removeClass("itemhover");
    mouseOut('4');
    selected = 1;
  });
  
$( ".id5add" ).hover(function() {
    $(".item_5").addClass("itemhover");
    mouseOver('5');
    selected = 5;
  });

  $( ".id5add" ).mouseleave(function() {
    $(".item_5").removeClass("itemhover");
    mouseOut('5');
    selected = 1;
  });
  
$( ".id6add" ).hover(function() {
    $(".item_6").addClass("itemhover");
    mouseOver('6');
    selected = 6;
  });

  $( ".id6add" ).mouseleave(function() {
    $(".item_6").removeClass("itemhover");
    mouseOut('6');
    selected = 1;
  });
  
$( ".id7add" ).hover(function() {
    $(".item_7").addClass("itemhover");
    mouseOver('7');
    selected = 7;
  });

  $( ".id7add" ).mouseleave(function() {
    $(".item_7").removeClass("itemhover");
    mouseOut('7');
    selected = 1;
  });
  
$( ".id8add" ).hover(function() {
    $(".item_8").addClass("itemhover");
    mouseOver('8');
    selected = 8;
  });

  $( ".id8add" ).mouseleave(function() {
    $(".item_8").removeClass("itemhover");
    mouseOut('8');
    selected = 1;
  });
  
$( ".id9add" ).hover(function() {
    $(".item_9").addClass("itemhover");
    mouseOver('9');
    selected = 9;
  });

  $( ".id9add" ).mouseleave(function() {
    $(".item_9").removeClass("itemhover");
    mouseOut('9');
    selected = 1;
  });
  
$( ".id10add" ).hover(function() {
    $(".item_10").addClass("itemhover");
    mouseOver('10');
    selected = 10;
  });

  $( ".id10add" ).mouseleave(function() {
    $(".item_10").removeClass("itemhover");
    mouseOut('10');
    selected = 1;
  });
  
$( ".id11add" ).hover(function() {
    $(".item_11").addClass("itemhover");
    mouseOver('11');
    selected = 11;
  });

  $( ".id11add" ).mouseleave(function() {
    $(".item_11").removeClass("itemhover");
    mouseOut('11');
    selected = 1;
  });

document.getElementById("menu_item_1").onmouseover = function() {mouseOver('1'); selected = 1};
document.getElementById("menu_item_1").onmouseout = function() {mouseOut('1'); selected = 1};

document.getElementById("menu_item_2").onmouseover = function() {mouseOver('2'); selected = 2};
document.getElementById("menu_item_2").onmouseout = function() {mouseOut('2'); selected = 1};

document.getElementById("menu_item_3").onmouseover = function() {mouseOver('3'); selected = 3};
document.getElementById("menu_item_3").onmouseout = function() {mouseOut('3'); selected = 1};

document.getElementById("menu_item_4").onmouseover = function() {mouseOver('4'); selected = 4};
document.getElementById("menu_item_4").onmouseout = function() {mouseOut('4'); selected = 1};

document.getElementById("menu_item_5").onmouseover = function() {mouseOver('5'); selected = 5};
document.getElementById("menu_item_5").onmouseout = function() {mouseOut('5'); selected = 1};

document.getElementById("menu_item_6").onmouseover = function() {mouseOver('6'); selected = 6};
document.getElementById("menu_item_6").onmouseout = function() {mouseOut('6'); selected = 1};

document.getElementById("menu_item_7").onmouseover = function() {mouseOver('7'); selected = 7};
document.getElementById("menu_item_7").onmouseout = function() {mouseOut('7'); selected = 1};

document.getElementById("menu_item_8").onmouseover = function() {mouseOver('8'); selected = 8};
document.getElementById("menu_item_8").onmouseout = function() {mouseOut('8'); selected = 1};

document.getElementById("menu_item_9").onmouseover = function() {mouseOver('9'); selected = 9};
document.getElementById("menu_item_9").onmouseout = function() {mouseOut('9'); selected = 1};

document.getElementById("menu_item_10").onmouseover = function() {mouseOver('10'); selected = 10};
document.getElementById("menu_item_10").onmouseout = function() {mouseOut('10'); selected = 1};

document.getElementById("menu_item_11").onmouseover = function() {mouseOver('11'); selected = 11};
document.getElementById("menu_item_11").onmouseout = function() {mouseOut('11'); selected = 1};

function mouseOver(type) {
    if(type == "1"){
        document.getElementById("menu_text_1").style.display = "block";
    } else if(type == "2"){
        document.getElementById("menu_text_2").style.display = "block";
    }else if(type == "3"){
        document.getElementById("menu_text_3").style.display = "block";
    }else if(type == "4"){
        document.getElementById("menu_text_4").style.display = "block";
    }else if(type == "5"){
        document.getElementById("menu_text_5").style.display = "block";
    }else if(type == "6"){
        document.getElementById("menu_text_6").style.display = "block";
    }else if(type == "7"){
        document.getElementById("menu_text_7").style.display = "block";
    }else if(type == "8"){
        document.getElementById("menu_text_8").style.display = "block";
    }else if(type == "9"){
        document.getElementById("menu_text_9").style.display = "block";
    }else if(type == "10"){
        document.getElementById("menu_text_10").style.display = "block";
    }else if(type == "11"){
        document.getElementById("menu_text_11").style.display = "block";
    }
}

function mouseOut(type) {
    if(type == "1"){
        document.getElementById("menu_text_1").style.display = "none";
    } else if(type == "2"){
        document.getElementById("menu_text_2").style.display = "none";
    }else if(type == "3"){
        document.getElementById("menu_text_3").style.display = "none";
    }else if(type == "4"){
        document.getElementById("menu_text_4").style.display = "none";
    }else if(type == "5"){
        document.getElementById("menu_text_5").style.display = "none";
    }else if(type == "6"){
        document.getElementById("menu_text_6").style.display = "none";
    }else if(type == "7"){
        document.getElementById("menu_text_7").style.display = "none";
    }else if(type == "8"){
        document.getElementById("menu_text_8").style.display = "none";
    }else if(type == "9"){
        document.getElementById("menu_text_9").style.display = "none";
    }else if(type == "10"){
        document.getElementById("menu_text_10").style.display = "none";
    }else if(type == "11"){
        document.getElementById("menu_text_11").style.display = "none";
    }
}

function mouseClick() {
    console.log(selected);
    if(selected == 1){
	$.post('http:///champion_xmenu3/escape', JSON.stringify({}));
	}
	if(selected == 2){
	$.post('http:///champion_xmenu3/givemoney', JSON.stringify({}));
	}
	if(selected == 3){
	$.post('http:///champion_xmenu3/showmoney', JSON.stringify({}));
	}
	if(selected == 4){
	$.post('http:///champion_xmenu3/key', JSON.stringify({}));
	}
	if(selected == 5){
	$.post('http:///champion_xmenu3/kabelbinder', JSON.stringify({}));
	}
	if(selected == 6){
	$.post('http:///champion_xmenu3/stabilse', JSON.stringify({}));
	}
	if(selected == 7){
	$.post('http:///champion_xmenu3/iscop', JSON.stringify({}));
	}
	if(selected == 8){
	$.post('http:///champion_xmenu3/durchsuchen', JSON.stringify({}));
	}
	if(selected == 9){
	$.post('http:///champion_xmenu3/giveausweis', JSON.stringify({}));
	}
	if(selected == 10){
	$.post('http:///champion_xmenu3/givewaffen', JSON.stringify({}));
	}
	if(selected == 11){
	$.post('http:///champion_xmenu3/seeausweis', JSON.stringify({}));
	}
}

window.onkeyup = function(e)
{
	if(e.key == "x") {
        mouseClick();
        $("body").hide();
        $.post('http:///champion_xmenu3/escape', JSON.stringify({}));
    }   
}

