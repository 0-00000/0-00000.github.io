var body=document.body;
var div=document.getElementById("div");
var video=document.getElementById("video");
var w_h={
	width:4,
	height:3
};
function set_size(){
	let width=window.innerWidth;
	let height=window.innerHeight;
	if((width*(w_h.height)/(w_h.width))>height){
		let temp=width;
		width=Math.floor(height*(w_h.width)/(w_h.height));
		temp=Math.floor((temp-width)/2);
		body.style.padding="0px "+temp+"px";
	}else{
		let temp=height;
		height=Math.floor(width*(w_h.height)/(w_h.width));
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
	if(video.currentSrc=="https://github.com/0-00000/0-00000.github.io/releases/download/Big_datas/Never_Gonna_Give_You_Up-Rick_Astley.mp4"){
		video.currentSrc="../resource/video/IndiHome Paket Phoenix.mp4";
		video.load();
		video.currentTime=60;
		w_h.width=1;
		w_h.height=1;
	}else{
		video.currentSrc="https://github.com/0-00000/0-00000.github.io/releases/download/Big_datas/Never_Gonna_Give_You_Up-Rick_Astley.mp4";
		video.load();
		video.currentTime=0;
		w_h.width=4;
		w_h.height=3;
	}
	set_size();
	try_play();
}
video.onabort=function(){
	video.load();
}
set_size();
try_play();
