var body=document.body;
var div=document.getElementById("div");
var video=document.getElementById("video");
function set_size(){
	let width=window.innerWidth;
	let height=window.innerHeight;
	if((width*3/4)>height){
		let temp=width;
		width=Math.floor(height*4/3);
		temp=Math.floor((temp-width)/2);
		body.style.padding="0px "+temp+"px";
	}else{
		let temp=height;
		height=Math.floor(width*3/4);
		temp=Math.floor((temp-height)/2);
		body.style.padding=temp+"px 0px";
	}
	div.style.width=width+"px";
	div.style.height=height+"px";
	video.style.width=width+"px";
	video.style.height=height+"px";
}
function try_play(){
	try{
		video.play();
		return;
	}catch(err){
		setTimeout(try_play,100);
	}
}
body.onresize=set_size;
video.onpause=function(){
	if(video.duration!=video.currentTime){
		try_play();
	}
}
video.onended=function(){
	if(video.src=="https://github.com/0-00000/0-00000.github.io/releases/download/Big_datas/Never_Gonna_Give_You_Up-Rick_Astley.mp4"){
		video.src="../resource/video/IndiHome Paket Phoenix.mp4";
	}else{
		video.src="https://github.com/0-00000/0-00000.github.io/releases/download/Big_datas/Never_Gonna_Give_You_Up-Rick_Astley.mp4";
	}
	try_play();
}
set_size();
try_play();
