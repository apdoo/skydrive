/**
##
#	Project: ColaFile v3.1
#	This is NOT a freeware, use is subject to license terms.
#
#
#   Site: http://www.colafile.com
#	
#
#	Copyright (C) 2013 - 2014 Suike Tech. All Rights Reserved.
#
#   Time：2014.8.13 22:35
##
*/

var audio1="http://static.colafile.com/index/gxfc.mp3"
var audio2="http://static.colafile.com/index/ggzs.mp3"
var audio3="http://static.colafile.com/index/msyq.mp3"
var i=0;
var start=true;
function music(){
if (i==0) x=audio1
else if (i==1) x=audio2
else if (i==2) x=audio3
else x=audio1	
	if (start) {
var audio = document.createElement('audio');
audio.src = x;
audio.autoplay = 'autoplay';
document.body.appendChild(audio);
start=false;
i=i+1;
setTimeout(delay,200000)
}
}
function delay(){
	start=true;
}