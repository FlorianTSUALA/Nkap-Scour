function text2pixel(str){
  var canvas = document.createElement('canvas');
  var ctx = canvas.getContext("2d");
  //https://www.w3schools.com/tags/canvas_font.asp
  ctx.font = "message-box";        
  var width = ctx.measureText(str).width;
	return width;
}

$("#getp").click(function () {
	 $('p').text( text2pixel($("#my_text").val() ))
});
