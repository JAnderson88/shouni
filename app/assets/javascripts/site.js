$(".home.index").ready(function(){
	$(document).mousemove(function(event){

	});
});

$(".home.search").ready(function(){
	fadeTitle(".home.search .title", 4000);
	var eng_div = setDivAnimation($(".home.search #eng"));
	//var side_div = setDivAnimation($(".home.search .sidebar"));
	fadeTitle(".home.search .sidebar", 1200);
	$(document).mousemove(function(event){
		if(event.pageX > 110 && event.pageX <= eng_div[1] && event.pageY > eng_div[2] && event.pageY <= eng_div[3]){
			$(".home.search .title").show();
			fadeTitle($(".home.search .title",4000));
		} 
		if(event.pageX > side_div[0] && event.pageX <= side_div[1] && event.pageY > side_div[2] && event.pageY <= side_div[3]){
			//titleFadeIn($(".home.search .sidebar"), 10, 1200);
		}
	});
});

function fadeTitle(x, time){
	$(x).fadeOut(time, function(){

	});
}

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
function titleFadeIn(divv, time, fadeTime){
	$(divv).fadeIn(time, function(){
		$(divv).fadeOut(fadeTime);
	});
}

