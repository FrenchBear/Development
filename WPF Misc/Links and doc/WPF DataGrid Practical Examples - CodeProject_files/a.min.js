if(typeof DMAds==="undefined"){var SendSearchTermsToServer=window.location.protocol==="http:";
var OnlySendForCodeProject=false;
var CodeProjectPublisherId="lqm.codeproject.site";
var adServer=adServer||(window.location.protocol+"//ads.DeveloperMedia.com/");
var SearchTermUrl=window.location.protocol+"//apps.developermedia.com/Ads/PageTerms/GetTerms";
var DMAds={GetQueryTerms:function(){var d=[{d:"www.google.",q:"q="},{d:"www.bing.com",q:"q="},{d:"search.live.com",q:"q="},{d:"search.yahoo.com",q:"p="},{d:"codeproject.com",q:"q="},{d:"msdn.microsoft.com",q:"query="},{d:"www.ask.com",q:"q="},{d:"yandex.com",q:"text="},{d:"yandex.ru",q:"text="},{d:"www.baidu.com",q:"wd="},{d:"localhost",q:"q="}];
function c(m){var l="";
for(var j=0;
j<d.length;
j++){var k=d[j];
if(m.indexOf(k.d)>=0){l=k.q;
break
}}return l
}function b(m,l){var n=l.toLowerCase().indexOf(m);
if((n<0)||(n+m.length>=l.length)){return""
}var j=l.indexOf("&",n);
if(j<0){j=l.length
}var k=l.substring(n+m.length,j);
k=k.replace(/\+/gi," ");
k=decodeURIComponent(k);
k=k.replace(/\"/gi,"");
return k
}function a(l){if(l===undefined){return""
}var k=/\bAND\b|\bNOT\b|^NOT\b|\bOR\b|[^A-Z0-9\+\-\#\._\s]+|\b[A-Z0-9]+:/gi;
var j=l.replace(/^\s+|\s+$/gi,"");
if(j){j=j.replace(k," ");
j=j.replace(/\s+/g," ");
return j
}else{return""
}}var h=document.URL;
var g="";
var f=c(h);
if(f!==""){g=a(b(f,h))
}if(g==""){h=document.referrer.toLocaleLowerCase();
if(!h){return""
}f=c(h);
if(f!=""){g=a(b(f,h))
}}return g
},GetRandom:function(d,a){var f,b,c;
f="";
for(c=0;
c<d;
c++){b=Math.floor(Math.random()*a).toString(a).toUpperCase();
f=f+b
}return f
},PageRandomNumber:null,PageSearchTerms:null,Tile:1,CurrentDocument:null,BuildIFrameTag:function(a){var b='<iframe id="dmad{tile}" allowtransparency="false" style="z-index:10" ';
if(a&&a.width&&a.width>1){b=b+'width="{width}" '
}else{b=b+'width="100%" '
}if(a&&a.height&&a.height>0){b=b+'height="{height}" '
}else{b=b+'height="0" '
}b=b+'marginwidth="0" marginheight="0" frameborder="0" scrolling="no"></iframe>';
return this.ReplacePlaceholders(b,a)
},BuildJavaScriptTag:function(a){var b='<script language="JavaScript" src="'+window.location.protocol+'//ad.doubleclick.net/N6839/adj/{sitename}/{zonename};{searchterm}sz={format};{type}tile={tile};ord={timestamp}?" type="text/javascript"></script>';
return this.ReplacePlaceholders(b,a)
},ReplacePlaceholders:function(b,a){b=b.replace(/\{sitename\}/g,a.sitename);
b=b.replace(/\{zonename\}/g,a.zonename);
if(a.tags){b=b.replace(/\{searchterm\}/g,"kw="+encodeURIComponent(this.EscapeSpecialCharacters(a))+";")
}else{b=b.replace(/\{searchterm\}/g,"")
}b=b.replace(/\{tile\}/g,a.tile.toString());
b=b.replace(/\{format\}/g,a.format);
b=b.replace(/\{width\}/g,a.width);
b=b.replace(/\{height\}/g,a.height);
b=b.replace(/\{target\}/g,a.target);
b=b.replace(/\{timestamp\}/g,this.PageRandomNumber);
if(a.type){b=b.replace(/\{type\}/g,"type="+encodeURIComponent(a.type)+";")
}else{b=b.replace(/\{type\}/g,"")
}return b
},EscapeSpecialCharacters:function(b){var c=b.tags;
c=c.replace(/\+/gi,"{plus}");
c=c.replace(/\#/gi,"{sharp}");
c=c.replace(/\./gi,"{dot}");
c=c.replace(/[\#\*\.\(\)\+\<\>\[\]]/gi,"");
var f=c.split(",");
var g=/[^\u0020-\u007f]/;
var a=new Array();
while(f.length>0){var d=f.shift();
if(!g.test(d)){a.push(d)
}}return a.join(",")
},tagInfo:[{id:1,n:"Standard Banner",h:60,w:468},{id:2,n:"Product Spotlight",h:2,w:1},{id:3,n:"Hosting Spotlight",h:2,w:1},{id:4,n:"Skyscraper",h:600,w:120},{id:5,n:"Square",h:125,w:125},{id:6,n:"Medium Rectangle",h:250,w:300},{id:7,n:"Large Rectangle",h:280,w:336},{id:8,n:"Leaderboard",h:90,w:728},{id:9,n:"HTML Ad",h:0,w:0},{id:10,n:"Fixed Square",h:125,w:125},{id:11,n:"Fixed Banner",h:60,w:468},{id:12,n:"Half Skyscraper",h:300,w:120},{id:13,n:"IAB Button",h:90,w:120},{id:14,n:"Rectangle",h:120,w:150},{id:15,n:"Thin Horizontal",h:27,w:408},{id:16,n:"Button",h:30,w:100},{id:17,n:"DogEar",h:0,w:0},{id:18,n:"Wide Skyscraper",h:600,w:160},{id:19,n:"Tracking Only",h:1,w:1},{id:20,n:"Mixed 120x90-Text",h:5,w:1},{id:21,n:"Home page top left (150 X 80)",h:80,w:150},{id:22,n:"SponsorEmail",h:0,w:0},{id:23,n:"Email",h:60,w:60},{id:24,n:"TextLinks",h:0,w:0},{id:25,n:"Zone",h:0,w:0},{id:26,n:"Goal group",h:0,w:0},{id:27,n:"Article",h:0,w:0},{id:28,n:"Search Sponsor Box",h:30,w:120},{id:29,n:"Microbar",h:31,w:88},{id:30,n:"Sponsor Link",h:1,w:0}],DetermineTagSize:function(f){if(f.format){if(isNaN(f.format)){var b=f.format.split("x");
if(b.length==2){if(isFinite(b[0])){f.width=b[0]
}if(isFinite(b[1])){f.height=b[1]
}}}else{var c=false;
var d=0;
while(d<this.tagInfo.length&&!c){var a=this.tagInfo[d];
if(a.id==f.format){if(a.w!=0){f.width=a.w
}if(a.h!=0){f.height=a.h
}f.type=a.name;
c=true;
f.format=""+a.w+"x"+a.h
}d++
}}}},MapDmIdsToDart:function(a){var b="lqm.";
var c=".site";
if(a.publisher){if(isNaN(a.publisher)){a.sitename=a.publisher
}else{a.sitename=b+"pub"+a.publisher+c
}this.MapDmZoneToDartZone(a)
}else{if(a.site){a.sitename=b+"codeplex"+c;
if(a.charity){a.zonename="donated2charity"
}else{a.zonename=a.site.toLowerCase()
}}}},zoneInfo:[{id:1,n:"ron"},{id:51,n:"it"},{id:52,n:"designer"},{id:2,n:"above_the_fold"},{id:9,n:"wpf"},{id:14,n:"silverlight"},{id:3,n:"reportingservices"},{id:4,n:"sql"},{id:5,n:"whitepaper"},{id:6,n:"featuredwhitepaper"},{id:7,n:"crystalreports"},{id:10,n:"vs2005video"},{id:11,n:"ros_dogear"},{id:12,n:"homepage_dogear"},{id:13,n:"excludehomepage_dogear"},{id:15,n:"lqm_dogear"},{id:17,n:"mvc"},{id:18,n:"ajax"},{id:38,n:"devexpress_video"},{id:39,n:"devmavens_sidebar"},{id:40,n:"devmavens_offer"},{id:44,n:"silverlight"},{id:45,n:"wpf"},{id:54,n:"csharp_articles"}],MapDmZoneToDartZone:function(c){if(c.zone){var a=false;
var b=0;
while(b<this.zoneInfo.length&&!a){if(this.zoneInfo[b].id==c.zone){c.zonename=this.zoneInfo[b].n;
a=true
}b++
}if(!a){if(isNaN(c.zone)){c.zonename=c.zone.toLowerCase()
}else{c.zonename="ron"
}}}else{c.zonename="ron"
}},GetDocHeight:function(a){return a.height||a.body&&a.body.scrollHeight
},HideRefs:function(b,j,g){var h=this;
var a;
if(g.format.indexOf("1x")===0){j.innerHTML=b.body.innerHTML;
a=j
}else{a=b
}var d=a.getElementsByTagName("a");
var f=function(m){var l=m.href;
var p=adServer+h.GetRandom(4,16)+"-"+h.GetRandom(7,16);
m.href=p;
var n=function(){m.href=l
};
var o=function(){m.href=p
};
if(m.addEventListener){m.addEventListener("mousedown",n,false);
m.addEventListener("mouseover",o,false)
}else{try{m.attachEvent("onmousedown",n);
m.attachEvent("onmouseover",o)
}catch(k){}}};
for(var c=0;
c<d.length;
c++){f(d[c])
}}};
if(typeof DMAds.CreateAds!=="function"){DMAds.CreateAds=function(){var self=this;
var TIMEOUT_PERIOD=1000;
this.PageRandomNumber=this.GetRandom(32,16);
var getElementsByAttr=function(attrName,attrValue,node,tag){var found=new Array();
if(node==null){node=document
}if(tag==null){tag="*"
}var elms=node.getElementsByTagName(tag);
var length=elms.length;
var pattern=new RegExp("(^|\\s)"+attrValue+"(\\s|$)");
for(var i=0,j=0;
i<length;
i++){if(pattern.test(elms[i].getAttribute(attrName))){found[j]=elms[i];
j++
}}return found
};
var getElementsByClass=function(className,node,tag){var found=new Array();
if(node==null){node=document
}if(tag==null){tag="*"
}var elms=node.getElementsByTagName(tag);
var length=elms.length;
var pattern=new RegExp("(^|\\s)"+className+"(\\s|$)");
for(var i=0,j=0;
i<length;
i++){if(pattern.test(elms[i].className)){found[j]=elms[i];
j++
}}return found
};
var checkIframeHeight=function(doc,requestData,elem,theAdDiv){var counter=50;
var oldHeight=0;
var timerID=window.setInterval(function(){var height=self.GetDocHeight(doc);
if(height>0){if(--counter==0||height===oldHeight){window.clearInterval(timerID);
self.HideRefs(doc,theAdDiv,requestData)
}oldHeight=height
}},100)
};
var signalSuccess=function(doc){setTimeout(function(){if(doc&&doc.body){top.postMessage(doc.body.innerHTML?"DM-enabled":"DM-disabled","*")
}},1000)
};
var RenderAd=function(index){var theAdDiv=ads[index];
var requestData={height:0,width:0,publisher:undefined,zone:undefined,site:undefined,tags:undefined,sitename:undefined,zonename:undefined,target:undefined,format:undefined,tile:undefined,type:undefined};
var attrs=theAdDiv.attributes;
var numAttrs=attrs.length;
var adProperties={};
for(var i=0;
i<(numAttrs);
i++){var attr=attrs.item(i);
if(attr.nodeName.indexOf("lqm_")==0){var propName=attr.nodeName.slice(4);
adProperties[propName]=attr.nodeValue
}if(attr.nodeName.indexOf("data-")==0){propName=attr.nodeName.slice(5);
adProperties[propName]=attr.nodeValue
}}requestData.publisher=adProperties.publisher;
requestData.zone=adProperties.zone;
requestData.site=adProperties.site;
requestData.tags=adProperties.tags;
requestData.format=adProperties.format;
requestData.tile=index+1;
requestData.target="_blank";
if(requestData.tags){requestData.tags=decodeURIComponent(requestData.tags)
}if(queryTerms&&queryTerms!=""){if(requestData.tags){requestData.tags=requestData.tags+","+queryTerms
}else{requestData.tags=queryTerms
}}self.DetermineTagSize(requestData);
self.MapDmIdsToDart(requestData);
theAdDiv.innerHTML=self.BuildIFrameTag(requestData);
var elem=theAdDiv.getElementsByTagName("iframe")[0];
elem.onerror=function(){return true
};
var doc=elem.contentDocument||elem.contentWindow.document||elem.contentWindow.window.document;
var iframeOnLoad=function(){if(requestData.height<=1){this.height=self.GetDocHeight(doc)
}self.HideRefs(doc,theAdDiv,requestData)
};
if(elem.addEventListener){elem.addEventListener("load",iframeOnLoad,false)
}else{try{elem.attachEvent("onload",iframeOnLoad)
}catch(e){}}var isMSIE=navigator.userAgent&&navigator.userAgent.indexOf("MSIE")>=0;
var isOpera=navigator.userAgent&&navigator.userAgent.indexOf("Opera")>=0;
doc.write(self.BuildJavaScriptTag(requestData));
if(!isMSIE&&!isOpera&&doc.close){doc.close()
}if(isMSIE){checkIframeHeight(doc,requestData,elem,theAdDiv)
}signalSuccess(doc)
};
var elementInViewport=function(el){var rect=el.getBoundingClientRect();
var clientWidth=0,clientHeight=0;
if(typeof(window.innerWidth)=="number"){clientWidth=window.innerWidth;
clientHeight=window.innerHeight
}else{if(document.documentElement&&(document.documentElement.clientWidth||document.documentElement.clientHeight)){clientWidth=document.documentElement.clientWidth;
clientHeight=document.documentElement.clientHeight
}else{if(document.body&&(document.body.clientWidth||document.body.clientHeight)){clientWidth=document.body.clientWidth;
clientHeight=document.body.clientHeight
}}}return(rect.top<=clientHeight&&rect.bottom>=0)
};
var RenderAdsInView=function(){for(var i=0;
i<ads.length;
i++){if(adRendered[i]===false&&elementInViewport(ads[i])){adRendered[i]=true;
RenderAd(i)
}if(adRendered[i]===true){if(!adStickySettings[i]){adStickySettings[i]=CreateAdStickySettings(i)
}ToggleAdSticky(i)
}}};
var GetSearchTagsAndRenderAllAds=function(search_tags,publisher,rendering_function){var server_write_timeout;
var http=window.XMLHttpRequest?new XMLHttpRequest():new ActiveXObject("MSXML2.XMLHTTP");
if(!http){return rendering_function(publisher===CodeProjectPublisherId)
}var stripped_url=document.URL;
if(stripped_url.indexOf("?")>0){stripped_url=stripped_url.substring(0,stripped_url.indexOf("?"))
}var documentTitle;
try{documentTitle=top.document.title
}catch(err){documentTitle="FAILED TO GET DOCUMENT TITLE"
}var param_string='{"terms":"'+search_tags+'","title":"'+documentTitle+'","url":"'+stripped_url+'","publisher":"'+publisher+'"}';
server_write_timeout=setTimeout(function(){http.abort()
},TIMEOUT_PERIOD);
var callback=function(responseText){clearTimeout(server_write_timeout);
if(responseText){var returnedObject=eval("("+responseText+")");
if(returnedObject&&returnedObject.terms){queryTerms=returnedObject.terms
}else{queryTerms=search_tags
}}rendering_function(publisher===CodeProjectPublisherId)
};
http.onreadystatechange=function(){try{if(http.readyState==4){if(http.status==200){callback(http.responseText)
}else{callback(null)
}}}catch(e){callback(null)
}};
http.open("POST",SearchTermUrl,true);
http.setRequestHeader("Content-Type","application/json");
http.send(param_string)
};
var RenderAllAds=function(displayOnScrollDefault){for(var i=0;
i<ads.length;
i++){adRendered[i]=false;
var renderOnView=displayOnScrollDefault;
var displayOverride=ads[i].getAttribute("data-display")||ads[i].getAttribute("lqm_loadOnView");
if(displayOverride==="onscroll"||displayOverride==="true"){renderOnView=true
}else{if(displayOverride==="always"||displayOverride==="false"){renderOnView=false
}}if(renderOnView){}else{RenderAd(i);
adRendered[i]=true
}}RenderAdsInView();
if(window.addEventListener){window.addEventListener("resize",ResetAdStickySettings,false);
window.addEventListener("scroll",RenderAdsInView,false)
}else{try{window.attachEvent("onresize",ResetAdStickySettings);
window.attachEvent("onscroll",RenderAdsInView)
}catch(e){}}};
var CreateAdStickySettings=function(index){if(ads[index].children[0]){var position=getElementAbsolutePos(ads[index].children[0]);
var stickySetting=new Object();
stickySetting.isStickyRequired=ads[index].getAttribute("data-sticky")&&ads[index].getAttribute("data-sticky").toLowerCase()==="top";
stickySetting.absoluteTop=position.y;
stickySetting.absoluteLeft=position.x;
if(stickySetting.absoluteTop===-1){return null
}stickySetting.originalPosition=ads[index].style.position;
return stickySetting
}};
var ResetAdStickySettings=function(){for(i=0;
i<adStickySettings.length;
i++){if(adStickySettings[i]){ads[i].children[0].style.position=adStickySettings[i].originalPosition;
adStickySettings[i]=CreateAdStickySettings(i);
ToggleAdSticky(i)
}}};
var ToggleAdSticky=function(index){var stickySetting=adStickySettings[index];
if(stickySetting&&stickySetting.isStickyRequired&&window.pageYOffset+10>=stickySetting.absoluteTop){ads[index].children[0].style.position="fixed";
ads[index].children[0].style.top="10px";
ads[index].children[0].style.left=(stickySetting.absoluteLeft-window.pageXOffset)+"px";
if(ads[index].clientHeight===0){ads[index].style.height=ads[index].children[0].clientHeight+"px"
}if(ads[index].clientWidth===0){ads[index].style.width=ads[index].children[0].clientWidth+"px"
}}else{if(stickySetting&&stickySetting.isStickyRequired){ads[index].children[0].style.position=stickySetting.originalPosition
}}};
var getElementAbsolutePos=function(element){var res=new Object();
res.x=-1;
res.y=-1;
if(element.getBoundingClientRect){var elementRectangle=element.getBoundingClientRect();
var rootElement=document.documentElement;
var scrollOffsetTop=window.pageYOffset||rootElement.scrollTop||document.body.scrollTop||0;
var scrollOffsetLeft=window.pageXOffset||rootElement.scrollLeft||document.body.scrollLeft||0;
var clientOffesetTop=rootElement.clientTop||document.body.clientTop||0;
var clientOffsetLeft=rootElement.clientLeft||document.body.clientLeft||0;
res.y=elementRectangle.top+scrollOffsetTop-clientOffesetTop;
res.x=elementRectangle.left+scrollOffsetLeft-clientOffsetLeft
}return res
};
var adRendered=new Array();
var adStickySettings=new Array();
if(this.PageSearchTerms==null){this.PageSearchTerms=this.GetQueryTerms()
}var queryTerms=this.PageSearchTerms;
var ads=getElementsByClass("lqm_ad",document,"div");
if(ads==null||ads.length<=0){ads=getElementsByAttr("data-type","ad",document,"div")
}if(ads!=null&&ads.length>0){var publisher=ads[0].getAttribute("lqm_publisher")||ads[0].getAttribute("data-publisher");
if(SendSearchTermsToServer&&(!OnlySendForCodeProject||publisher===CodeProjectPublisherId)){try{GetSearchTagsAndRenderAllAds(queryTerms,publisher,RenderAllAds)
}catch(e){RenderAllAds(publisher===CodeProjectPublisherId)
}}else{RenderAllAds(publisher===CodeProjectPublisherId)
}}}
}if(document.readyState==="complete"){DMAds.CreateAds()
}else{if(window.addEventListener){window.addEventListener("load",function(){DMAds.CreateAds()
},false)
}else{try{window.attachEvent("onload",function(){DMAds.CreateAds()
})
}catch(e){}}}var _qevents=_qevents||[];
_qevents.push({qacct:"p-g6uZkrDA2nB2y"});
(function(){var a=document.createElement("script");
a.src=(document.location.protocol=="https:"?"https://secure":"http://edge")+".quantserve.com/quant.js";
a.async=true;
a.type="text/javascript";
var b=document.getElementsByTagName("script")[0];
b.parentNode.insertBefore(a,b)
})()
};