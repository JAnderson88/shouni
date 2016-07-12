$(".home.index").ready(function(){
	
});

$(".home.search").ready(function(){
	fadeTitle();
})(jQuery);

function fadeTitle(){
	$(".home.search .title").fadeOut(4000, function(){
		$(this).mouseenter(function(){
			$(this).fadeIn(10);
		});
	});
}

