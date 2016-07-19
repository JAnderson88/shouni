$(".home.index").ready(function(){
	$(document).mousemove(function(event){

	});
});

$(".home.search").ready(function(){
	var title = $(".home.search .title")
	title.fadeOut(4000);
	$(".home.search .trigger").width(title.width());
	$(".home.search .trigger").height(title.height());
	$(".home.search .trigger").hover(function(){
		$(".home.search .title").fadeIn(100, function(){
			$(".home.search .trigger").mouseleave(function(){
				$(".home.search .title").fadeOut(2500);
			});
		});
	});
	$(".home.search .side").width("24%");
	$(".home.search .side").height($(document).height() * 0.999);
	$(".home.search .side").offset({top: "0", left: "0"});
	$(".home.search .sidebar").width("50%");
	$(".home.search .sidebar").height($(".home.search .side").height());
	$(".home.search .sidebar").css("background-color", "rgba(228, 228, 206, 0.8)");
	setTimeout(function(){
	 	$(".home.search .side").transition({x: '-180px'}, 800, 'ease');
	}, 1500);
	$(".home.search .side").hover(function(){
		$(this).transition({x: '+0px'}, 300, 'ease', function(){
			$(this).mouseleave(function(){
				$(this).transition({x: '-180px'}, 800, 'ease');
			});
		});
	});
	$(".home.search .forward").click(function(event){
		event.preventDefault();
	});
	$("#synp").hover(function(){
		$(this).switchClass("syn_hid", "synopsis", 700, "easeInOutQuad", function(){
			$(this).mouseleave(function(){
				$(this).switchClass("synopsis", "syn_hid", 700, "easeInOutQuad");
			});
		});
	});
});

function setDivAnimation(x){
	var div_pos = $(x).offset();
	var div_width = $(x).width();
	var div_height = $(x).height();
	var div_left = div_pos.left;
	var div_right = div_pos.left + div_width;
	var div_top = div_pos.top;
	var div_bottom = div_top + div_height;

	var arr = [Math.round(div_left), Math.round(div_right), Math.round(div_top), Math.round(div_bottom)];
	return arr;
}

