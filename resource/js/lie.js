var body=document.body;
var div=document.getElementById("app");
var video=document.getElementById("video1");
function set_size(){
	let width=window.innerWidth;
	let height=window.innerHeight;
	if((width*3/4)>height){
		let temp=width;
		width=Math.floor(height*4/3);
		temp=Math.floor((temp-width)/2);
		div.style.padding="0px "+temp+"px 0px "+temp+"px";
	}else{
		let temp=height;
		height=Math.floor(width*3/4);
		temp=Math.floor((temp-height)/2);
		div.style.padding=temp+"px"+"0px "+temp+"px 0px ";
	}
	div.style.width=width+"px";
	div.style.height=height+"px";
	video.style.width=width+"px";
	video.style.height=height+"px";
}
function f(){
	if(video.paused){
		try{
			video.play();
			return;
		}catch(err){
			return;
		}
	}
}
var interval=setInterval("try{f();}catch(err){}",200);
set_size();
