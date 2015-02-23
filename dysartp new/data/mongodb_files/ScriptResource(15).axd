﻿Type.registerNamespace("Telerik.Web");
Type.registerNamespace("Telerik.Web.UI");
Telerik.Web.UI.ModalExtender=function(a){this._windowResizeDelegate=null;
this._windowScrollDelegate=null;
this._xCoordinate=-1;
this._yCoordinate=-1;
this._backgroundElement=null;
this._foregroundElement=a;
this._saveTabIndexes=new Array();
this._saveDesableSelect=new Array();
this._tagWithTabIndex=new Array("A","AREA","BUTTON","INPUT","OBJECT","SELECT","TEXTAREA","IFRAME");
};
Telerik.Web.UI.ModalExtender.prototype={dispose:function(){this.hide();
this._backgroundElement=null;
this._foregroundElement=null;
},show:function(){var c=this._getModalOverlay();
if($telerik.getVisible(c)){return;
}this._attachWindowHandlers(true);
var b=this._foregroundElement;
b.parentNode.appendChild(c);
var a=$telerik.getCurrentStyle(b,"zIndex");
if(!isNaN(parseInt(a))){c.style.zIndex=a-1;
}c.style.display="";
this._disableTab();
this._updatePageLayout();
this._updatePageLayout();
},_storeBrowserPosition:function(){var a=document.body;
var b=document.documentElement;
this._browserTop=a.scrollTop>b.scrollTop?a.scrollTop:b.scrollTop;
this._browserLeft=a.scrollLeft>b.scrollLeft?a.scrollTop:b.scrollLeft;
},_restoreBrowserPosition:function(b,d){try{if(null==b){b=this._browserLeft;
}if(null==d){d=this._browserTop;
}var e=document.body;
var c=document.documentElement;
e.scrollTop=d;
e.scrollLeft=b;
c.scrollTop=d;
c.scrollLeft=b;
}catch(a){}},hide:function(){this._restoreTab();
this._attachWindowHandlers(false);
var a=this._backgroundElement;
if(a){if(a.parentNode){a.parentNode.removeChild(a);
}this._backgroundElement=null;
}},_enableScroll:function(a){if(a){document.body.style.overflow=null!=this._overflow?this._overflow:"";
document.documentElement.style.overflow=null!=this._documentOverflow?this._documentOverflow:"";
document.body.style.marginRight="";
}else{this._overflow=document.body.style.overflow;
document.body.style.overflow="hidden";
this._documentOverflow=document.documentElement.style.overflow;
document.documentElement.style.overflow="hidden";
document.body.style.marginRight="18px";
}},_getModalOverlay:function(){if(!this._backgroundElement){var a=document.createElement("div");
a.style.display="none";
a.style.position="absolute";
if($telerik.isRightToLeft(this._foregroundElement)){a.style.right="0px";
}else{a.style.left="0px";
}a.style.top="0px";
a.style.zIndex=10000;
a.style.backgroundColor="#aaaaaa";
a.style.filter="progid:DXImageTransform.Microsoft.Alpha(style=0,opacity=50)";
a.style.opacity=".5";
a.style.MozOpacity=".5";
a.setAttribute("unselectable","on");
a.className="TelerikModalOverlay";
this._backgroundElement=a;
}return this._backgroundElement;
},_attachWindowHandlers:function(b){var a=window;
if(true==b){this._windowResizeDelegate=Function.createDelegate(this,this._updatePageLayout);
$addHandler(a,"resize",this._windowResizeDelegate);
this._windowScrollDelegate=Function.createDelegate(this,this._updatePageLayout);
$addHandler(a,"scroll",this._windowScrollDelegate);
}else{if(this._windowResizeDelegate){$removeHandler(a,"resize",this._windowResizeDelegate);
}this._windowResizeDelegate=null;
if(this._windowScrollDelegate){$removeHandler(a,"scroll",this._windowScrollDelegate);
}this._windowScrollDelegate=null;
}},_updatePageLayout:function(){var f=(document.documentElement.scrollLeft?$telerik.getCorrectScrollLeft(document.documentElement):$telerik.getCorrectScrollLeft(document.body));
var e=(document.documentElement.scrollTop?document.documentElement.scrollTop:document.body.scrollTop);
var c=$telerik.getClientBounds();
var a=c.width;
var d=c.height;
var b=this._getModalOverlay();
b.style.width=Math.max(Math.max(document.documentElement.scrollWidth,document.body.scrollWidth),a)+"px";
b.style.height=Math.max(Math.max(document.documentElement.scrollHeight,document.body.scrollHeight),d)+"px";
},_disableTab:function(){var d=0;
var a;
var f=new Array();
Array.clear(this._saveTabIndexes);
for(var b=0;
b<this._tagWithTabIndex.length;
b++){a=this._foregroundElement.getElementsByTagName(this._tagWithTabIndex[b]);
for(var c=0;
c<a.length;
c++){var g=a[c];
f[d]={tag:g,index:g.tabIndex};
d++;
}}d=0;
for(var b=0;
b<this._tagWithTabIndex.length;
b++){a=document.getElementsByTagName(this._tagWithTabIndex[b]);
for(var c=0;
c<a.length;
c++){var g=a[c];
this._saveTabIndexes[d]={tag:g,index:g.tabIndex};
a[c].tabIndex="-1";
d++;
}}for(var d=0;
d<f.length;
d++){f[d].tag.tabIndex=f[d].index;
}d=0;
if((Sys.Browser.agent===Sys.Browser.InternetExplorer)&&(Sys.Browser.version<7)){var e=new Array();
for(var b=0;
b<this._tagWithTabIndex.length;
b++){a=this._foregroundElement.getElementsByTagName("SELECT");
for(var c=0;
c<a.length;
c++){e[d]=a[c];
d++;
}}d=0;
Array.clear(this._saveDesableSelect);
a=document.getElementsByTagName("SELECT");
for(var c=0;
c<a.length;
c++){if(Array.indexOf(e,a[c])==-1){this._saveDesableSelect[d]={tag:a[c],visib:$telerik.getCurrentStyle(a[c],"visibility")};
a[c].style.visibility="hidden";
d++;
}}}},_restoreTab:function(){for(var b=0;
b<this._saveTabIndexes.length;
b++){this._saveTabIndexes[b].tag.tabIndex=this._saveTabIndexes[b].index;
}if((Sys.Browser.agent===Sys.Browser.InternetExplorer)&&(Sys.Browser.version<7)){for(var a=0;
a<this._saveDesableSelect.length;
a++){this._saveDesableSelect[a].tag.style.visibility=this._saveDesableSelect[a].visib;
}}}};
Telerik.Web.UI.ModalExtender.registerClass("Telerik.Web.UI.ModalExtender",null);
Type.registerNamespace("Telerik.Web");
Telerik.Web.PositioningMode=function(){throw Error.invalidOperation();
};
Telerik.Web.PositioningMode.prototype={Absolute:0,Center:1,BottomLeft:2,BottomRight:3,TopLeft:4,TopRight:5};
Telerik.Web.PositioningMode.registerEnum("Telerik.Web.PositioningMode");
Telerik.Web.PopupBehavior=function(a){Telerik.Web.PopupBehavior.initializeBase(this,[a]);
this._x=0;
this._y=0;
this._positioningMode=Telerik.Web.PositioningMode.Absolute;
this._parentElement=null;
this._parentElementID=null;
this._moveHandler=null;
this._firstPopup=true;
this._originalParent=null;
this._overlay=false;
this._keepInScreenBounds=true;
this._manageVisibility=true;
};
Telerik.Web.PopupBehavior._ie6pinnedList={};
Telerik.Web.PopupBehavior.prototype={getPageOffset:function(){var a={x:($telerik.getCorrectScrollLeft(document.documentElement)||$telerik.getCorrectScrollLeft(document.body)),y:(document.documentElement.scrollTop||document.body.scrollTop)};
return a;
},pin:function(c){var a=this.get_elementToShow();
var d=this.getPageOffset();
if($telerik.isIE6){var e=this.get_id();
if(c){if(Telerik.Web.PopupBehavior._ie6pinnedList[e]){return;
}var b=$telerik.getBounds(a);
Telerik.Web.PopupBehavior._ie6pinnedList[e]=window.setInterval(Function.createDelegate(this,function(){var h=this.getPageOffset();
var j=b.x-d.x+h.x;
var k=b.y-d.y+h.y;
if(this.get_x()==j&&this.get_y()==k){return;
}var i=this.get_parentElement();
this.set_parentElement(document.documentElement);
this.set_x(j);
this.set_y(k);
this.show();
this.set_parentElement(i);
}),130);
}else{var g=Telerik.Web.PopupBehavior._ie6pinnedList[e];
if(g){window.clearInterval(g);
}delete Telerik.Web.PopupBehavior._ie6pinnedList[e];
}}else{var f=c?"fixed":"absolute";
if(a.style.position==f){return;
}var b=$telerik.getBounds(a);
if(c&&(d.x||d.y)){this._x=b.x-d.x;
this._y=b.y-d.y;
$telerik.setLocation(a,{x:this._x,y:this._y});
}a.style.position=f;
}},center:function(){var c=this.get_elementToShow();
if(this._manageVisibility){$telerik.setVisible(c,true);
}var d=$telerik.getClientBounds();
var f=$telerik.getBounds(c);
var a=parseInt((d.width-f.width)/2);
var b=parseInt((d.height-f.height)/2);
var e=this.get_parentElement();
this.set_parentElement(document.documentElement);
this.set_x(a);
this.set_y(b);
this.show();
this.set_parentElement(e);
},get_parentElement:function(){if(!this._parentElement&&this._parentElementID){this.set_parentElement($get(this._parentElementID));
Sys.Debug.assert(this._parentElement!=null,String.format('Couldn\'t find parent element "{0}"',this._parentElementID));
}return this._parentElement;
},set_parentElement:function(a){this._parentElement=a;
},get_parentElementID:function(){if(this._parentElement){return this._parentElement.id;
}return this._parentElementID;
},set_parentElementID:function(a){this._parentElementID=a;
if(this.get_isInitialized()){this.set_parentElement($get(a));
}},get_positioningMode:function(){return this._positioningMode;
},set_positioningMode:function(a){this._positioningMode=a;
},get_x:function(){return this._x;
},set_x:function(a){if(a!=this._x){this._x=a;
if($telerik.getVisible(this.get_elementToShow())&&this._manageVisibility){this.show();
}}},get_y:function(){return this._y;
},set_y:function(a){if(a!=this._y){this._y=a;
if($telerik.getVisible(this.get_elementToShow())&&this._manageVisibility){this.show();
}}},get_overlay:function(){return this._overlay;
},set_overlay:function(a){this._overlay=a;
this._attachWindowHandlers(false);
if(this._overlay){this._attachWindowHandlers(true);
}else{if(!((Sys.Browser.agent===Sys.Browser.InternetExplorer)&&(Sys.Browser.version<7))){var c=this.get_elementToShow();
var b=c._hideWindowedElementsIFrame;
if(b){b.style.display="none";
}}}},get_manageVisibility:function(){return this._manageVisibility;
},set_manageVisibility:function(a){this._manageVisibility=a;
},get_keepInScreenBounds:function(){return this._keepInScreenBounds;
},set_keepInScreenBounds:function(a){this._keepInScreenBounds=a;
},get_elementToShow:function(){return this._elementToShow?this._elementToShow:this.get_element();
},set_elementToShow:function(a){if(this._elementToShow){this._detachElementToShow();
}this._elementToShow=a;
},_detachElementToShow:function(){var c=this.get_elementToShow();
if(this._moveHandler){$telerik.removeExternalHandler(c,"move",this._moveHandler);
this._moveHandler=null;
}var d=c._hideWindowedElementsIFrame;
if(d){var a=d.parentNode;
var b=d.nextSibling;
if(a){a.removeChild(d);
if(b){a.insertBefore(document.createElement("span"),b);
}else{a.appendChild(document.createElement("span"));
}}}},hide:function(){var b=this.get_elementToShow();
if(this._manageVisibility){$telerik.setVisible(b,false);
}if(b.originalWidth){b.style.width=b.originalWidth+"px";
b.originalWidth=null;
}if(Sys.Browser.agent===Sys.Browser.InternetExplorer||this._overlay){var a=b._hideWindowedElementsIFrame;
if(a){a.style.display="none";
}}},show:function(){var a=this.get_elementToShow();
a.style.position="absolute";
var j=document.documentElement;
if($telerik.isFirefox){var l=$telerik.getCurrentStyle(j,"overflow");
if("hidden"==l){a.style.left=j.scrollLeft+"px";
a.style.top=j.scrollLeft+"px";
}}var i=this._manageVisibility;
if(i){$telerik.setVisible(a,true);
}var h=a.offsetParent||j;
if(i){$telerik.setVisible(a,false);
}var f;
var e;
if(this._parentElement){e=$telerik.getBounds(this._parentElement);
var k=this._getOffsetParentLocation(h);
f={x:e.x-k.x,y:e.y-k.y};
}else{e=$telerik.getBounds(h);
f={x:0,y:0};
}if(i){$telerik.setVisible(a,true);
}var c=a.offsetWidth-(a.clientLeft?a.clientLeft*2:0);
var b=a.offsetHeight-(a.clientTop?a.clientTop*2:0);
var g;
switch(this._positioningMode){case Telerik.Web.PositioningMode.Center:g={x:Math.round(e.width/2-c/2),y:Math.round(e.height/2-b/2)};
break;
case Telerik.Web.PositioningMode.BottomLeft:g={x:0,y:e.height};
break;
case Telerik.Web.PositioningMode.BottomRight:g={x:e.width-c,y:e.height};
break;
case Telerik.Web.PositioningMode.TopLeft:g={x:0,y:-a.offsetHeight};
break;
case Telerik.Web.PositioningMode.TopRight:g={x:e.width-c,y:-a.offsetHeight};
break;
default:g={x:0,y:0};
}g.x+=this._x+f.x;
g.y+=this._y+f.y;
$telerik.setLocation(a,g);
if(this._firstPopup){a.style.width=c+"px";
}this._firstPopup=false;
var d=this._fixPositionInBounds();
this._createOverlay(d);
},_getViewportBounds:function(){var c=$telerik.getClientBounds();
var b=document.documentElement;
var a=document.body;
c.scrollLeft=$telerik.isMobileSafari?window.pageXOffset:($telerik.getCorrectScrollLeft(b)||$telerik.getCorrectScrollLeft(a));
c.scrollTop=$telerik.isMobileSafari?window.pageYOffset:(b.scrollTop||a.scrollTop);
return c;
},_getOffsetParentLocation:function(b){if(b&&b.tagName.toUpperCase()!="BODY"&&b.tagName.toUpperCase()!="HTML"){var a=$telerik.getLocation(b);
var c=$telerik.getBorderBox(b);
a.x+=c.top;
a.y+=c.left;
a.x-=$telerik.getCorrectScrollLeft(b);
a.y-=b.scrollTop;
return a;
}return{x:0,y:0};
},_fixPositionInBounds:function(){var c=this.get_elementToShow();
var l=$telerik.getBounds(c);
if(!this._keepInScreenBounds){return l;
}var k=this._getViewportBounds();
var a=false;
var j=(k.width>l.width);
var m=(k.height>l.height);
var d=k.scrollTop;
var i=k.height+d;
var b=k.scrollLeft;
var e=k.width+b;
if(($telerik.isIE8||$telerik.isOpera||$telerik.isSafari)&&$telerik.isRightToLeft(document.body)){var g=c.style.display;
if($telerik.isOpera){c.style.display="none";
}var f=document.documentElement.scrollWidth;
e=f?f:document.body.scrollWidth;
if($telerik.isOpera){c.style.display=g;
}}if(l.x<b||!j){l.x=b;
a=true;
}if(l.y<d||!m){l.y=d;
a=true;
}if(j&&(l.x+l.width>e)){l.x=e-l.width;
a=true;
}if(m&&(i<l.y+l.height)){l.y=i-l.height;
a=true;
}if(a){var h=this._getOffsetParentLocation(c.offsetParent);
l.y-=h.y;
l.x-=h.x;
$telerik.setLocation(c,l);
}return l;
},_createOverlay:function(a){if(!$telerik.isIE6&&!this._overlay){return;
}var d=this.get_elementToShow();
var b=d._hideWindowedElementsIFrame;
if(!b){b=document.createElement("iframe");
b.src="javascript:'<html></html>';";
b.style.position="absolute";
b.style.display="none";
b.scrolling="no";
b.frameBorder="0";
b.tabIndex="-1";
b.style.filter="progid:DXImageTransform.Microsoft.Alpha(style=0,opacity=0)";
d.parentNode.insertBefore(b,d);
d._hideWindowedElementsIFrame=b;
this._moveHandler=Function.createDelegate(this,this._onMove);
$telerik.addExternalHandler(d,"move",this._moveHandler);
}$telerik.setBounds(b,a);
if($telerik.isFirefox){var e=this._getViewportBounds();
b.style.top=parseInt(a.y)-e.scrollTop+"px";
b.style.left=parseInt(a.x)-e.scrollLeft+"px";
b.style.position="fixed";
if($telerik.isFirefox3){b.style.backgroundColor="#fff";
}}if($telerik.quirksMode){return;
}b.style.display=d.style.display;
var c=$telerik.getCurrentStyle(d,"zIndex");
if(c){b.style.zIndex=c;
}},_setCoordinates:function(b,c){var a=false;
if(b!=this._x){this._x=b;
a=true;
}if(c!=this._y){this._y=c;
a=true;
}if($telerik.getVisible(this.get_elementToShow())&&a&&this._manageVisibility){this.show();
}},initialize:function(){Telerik.Web.PopupBehavior.callBaseMethod(this,"initialize");
this.hide();
},dispose:function(){var a=this.get_elementToShow();
if(a){this._attachWindowHandlers(false);
if($telerik.getVisible(a)&&this._manageVisibility){this.hide();
}if(this._originalParent){a.parentNode.removeChild(a);
this._originalParent.appendChild(a);
this._originalParent=null;
}this._detachElementToShow();
}this._parentElement=null;
Telerik.Web.PopupBehavior.callBaseMethod(this,"dispose");
if(a&&a._behaviors&&a._behaviors.length==0){a._behaviors=null;
}a=null;
},_onMove:function(){var a=this.get_elementToShow();
var b=a._hideWindowedElementsIFrame;
if(b){if(Sys.Browser.agent===Sys.Browser.Firefox){var c=this._getViewportBounds();
b.style.top=parseInt(a.style.top)-c.scrollTop+"px";
b.style.left=parseInt(a.style.left)-c.scrollLeft+"px";
b.style.position="fixed";
}else{b.style.top=a.style.top;
b.style.left=a.style.left;
}}},_handleElementResize:function(){var b=this.get_elementToShow();
var c=b._hideWindowedElementsIFrame;
if(c){var a=$telerik.getBounds(b);
$telerik.setBounds(c,a);
}},_attachWindowHandlers:function(b){if(!Sys.Browser.agent===Sys.Browser.Firefox){return;
}var a=window;
if(true==b){this._windowResizeDelegate=Function.createDelegate(this,this._onMove);
$telerik.addExternalHandler(a,"resize",this._windowResizeDelegate);
this._windowScrollDelegate=Function.createDelegate(this,this._onMove);
$telerik.addExternalHandler(a,"scroll",this._windowScrollDelegate);
}else{if(this._windowResizeDelegate){$telerik.removeExternalHandler(a,"resize",this._windowResizeDelegate);
}this._windowResizeDelegate=null;
if(this._windowScrollDelegate){$telerik.removeExternalHandler(a,"scroll",this._windowScrollDelegate);
}this._windowScrollDelegate=null;
}}};
Telerik.Web.PopupBehavior.registerClass("Telerik.Web.PopupBehavior",Sys.UI.Behavior);
Type.registerNamespace("Telerik.Web");
Type.registerNamespace("Telerik.Web.UI");
(function(){var b=$telerik.$;
var a=Telerik.Web.UI;
a.ResizeExtender=function(f,d,e,i,h,c,j,g){this._document=h?h:document;
this._documentMouseMoveDelegate=null;
this._documentMouseUpDelegate=null;
this._jsOwner=null;
this._element=null;
this._tableElement=null;
this._saveDelegates={};
this._moveCursorType="move";
this._moveToMouseLocation=false;
this._hideIframes=true;
this._iframeToSkip=null;
this._enabled=true;
this._startX=0;
this._startY=0;
this._cancelResize=true;
this._startCursorLocation=null;
this._autoScrollEnabled=true;
this.initialize(f,d,e,i,c,j,g);
};
a.ResizeExtender.containsBounds=function(c,d){if(!c||!d){return false;
}var e=$telerik.containsPoint(c,d.x,d.y);
if(e){var f=d.x+d.width;
var g=d.y+d.height;
e=$telerik.containsPoint(c,f,g);
}return e;
};
a.ResizeExtender.prototype={initialize:function(e,f,d,i,c,h,g){if(!f){return;
}if(this._element){alert("Element "+f.getAttribute("id")+" cannot be made resizable, as the resizeExtender already has the element "+this._element.getAttribute("id")+" associated with it. You must create a new extender resizer object");
return;
}this._jsOwner=e;
this._element=f;
this._tableElement=i;
this._handles=d;
if(c){this._moveCursorType=c;
}if(h!=null){this._autoScrollEnabled=h;
}if(g!=null){this._moveToMouseLocation=g;
}this._configureHandleElements(true);
},dispose:function(){this._attachDocumentHandlers(false);
this._configureHandleElements(false);
this._startCursorLocation=null;
this._iframeToSkip=null;
this._jsOwner=null;
this._element=null;
this._handles=null;
this._saveDelegates=null;
this._constraints=null;
},enable:function(c){this._enabled=c;
},set_hideIframes:function(c){this._hideIframes=c;
},get_hideIframes:function(){return this._hideIframes;
},set_iframeToSkip:function(c){this._iframeToSkip=c;
},get_iframeToSkip:function(){return this._iframeToSkip;
},get_constraints:function(){return this._constraints;
},set_constraints:function(c){this._constraints=c;
},_raiseDragEvent:function(f,g,e){var c=this._jsOwner;
if(c&&c["on"+f]){var d=g;
if(!d){d={};
}d.element=this._element;
d.ownerEvent=e;
return c["on"+f](d);
}return true;
},_raiseEvent:function(d,e){var c=this._jsOwner;
if(c&&c["on"+d]){if(!e){e=new Sys.EventArgs();
}else{if(d=="Resize"){e=this._resizeDir;
}else{if(d=="Resizing"){e=this._getProposedBounds(e);
}}}return c["on"+d](e);
}return true;
},_getProposedBounds:function(c){var d=$telerik.getBounds(this._element);
return{x:c.x||d.x,y:c.y||d.y,width:c.width||d.width,height:c.height||d.height};
},getPositionedParent:function(){var c=this._element.parentNode;
while(c&&c!=document){if("static"!=$telerik.getCurrentStyle(c,"position","static")){return c;
}c=c.parentNode;
}return null;
},_storeStartCoords:function(m){if(!this._enabled){return;
}this._cancelResize=false;
var h=($telerik.isMobileSafari||$telerik.isAndroid);
var g=$telerik.getTouchEventLocation(m);
this._startX=h?g.x:m.clientX;
this._startY=h?g.y:m.clientY;
var f=this._element;
var d=$telerik.getBounds(f);
var p=(f.id!=null&&a.RadDock&&a.RadDock.isInstanceOfType($find(f.id)));
if($telerik.isIE&&p!=true){var j=this.getPositionedParent();
if(j){d.x+=j.scrollLeft;
d.y+=j.scrollTop;
}}this._originalBounds=d;
var n=m.target?m.target:m.srcElement;
if(n&&n.type==3){n=n.parentNode;
}this._resizeType=$telerik.getCurrentStyle(n,"cursor");
if(!this._resizeType&&m.currentTarget){this._resizeType=$telerik.getCurrentStyle(m.currentTarget,"cursor");
}this._resizeDir={north:this._resizeType.match(/n.?-/)?1:0,east:this._resizeType.match(/e-/)?1:0,south:this._resizeType.match(/s.?-/)?1:0,west:this._resizeType.match(/w-/)?1:0,move:new RegExp(this._moveCursorType).test(this._resizeType)?1:0};
this._leftHandleMouseDelta=0;
if(this._resizeDir.west){this._leftHandleMouseDelta=Math.abs(d.x-this._startX);
}var c=this._resizeDir.move?this._raiseDragEvent("DragStart",null,m):this._raiseEvent("ResizeStart");
this._cancelResize=(c==false);
var o=$telerik.getCurrentStyle(f.parentNode,"position");
var i=("relative"==o)||("absolute"==o);
this._offsetLocation=i?$telerik.getLocation(f.parentNode):0;
if(this._moveToMouseLocation){var k=h?{left:this._startX,top:this._startY}:$telerik.getDocumentRelativeCursorPosition({clientX:this._startX,clientY:this._startY});
if(i){var l=$telerik.getBorderBox(f.parentNode);
k.left-=l.left;
k.top-=l.top;
}this._startCursorLocation={x:k.left-Math.floor(d.width/2),y:k.top-Math.floor(d.height/2)};
}if(!this._cancelResize){this._clearSelection();
this._setIframesVisible(false);
this._attachDocumentHandlers(false);
this._attachDocumentHandlers(true);
}},_resize:function(n){if(!this._enabled||this._cancelResize){return false;
}var k=this._originalBounds;
var d=new Sys.UI.Bounds(0,0,0,0);
var m=($telerik.isMobileSafari||$telerik.isAndroid)?$telerik.getTouchEventLocation(n):{x:n.clientX,y:n.clientY};
var h=m.x-this._startX;
var i=m.y-this._startY;
var g=this._resizeDir;
var j=g.move;
if(j){var o=this._startCursorLocation;
if(o){k.x=o.x;
k.y=o.y;
this._originalBounds=k;
this._startCursorLocation=null;
}d.x=k.x+h;
d.y=k.y+i;
var c=this._getMoveConstraints(k);
if(c){d.x=this._constrainPosition(d.x,c.x,c.width);
d.y=this._constrainPosition(d.y,c.y,c.height);
}}else{if(g.east){d.x=k.x;
d.width=k.width+h;
}else{if(g.west){d.x=m.x-this._leftHandleMouseDelta;
d.width=k.width-h;
}}if(g.south){d.y=k.y;
d.height=k.height+i;
}else{if(g.north){d.y=k.y+i;
d.height=k.height-i;
}}var p=this._getSizeConstraints(k);
if(p){d.x=this._constrainPosition(d.x,p.x,Math.min(d.x+d.width,p.width-d.width));
d.y=this._constrainPosition(d.y,p.y,Math.min(d.y+d.height,p.height-d.height));
d.width=this._constrainDimension(d.width,p.width-d.x);
d.height=this._constrainDimension(d.height,p.height-d.y);
}}var q=this._offsetLocation;
if(q){d.x-=q.x;
d.y-=q.y;
}var l=j?this._raiseDragEvent("Drag",d,n):this._raiseEvent("Resizing",d);
if(false==l){return true;
}var f=this._element;
if(j||d.x>0){f.style.left=d.x+"px";
}if(j||d.y>0){f.style.top=d.y+"px";
}if(d.width>0){f.style.width=d.width+"px";
}if(d.height>0){f.style.height=d.height+"px";
}if(!j){this._updateInnerTableSize();
}return true;
},_updateInnerTableSize:function(){var c=this._resizeDir;
if(c.south||c.north){var d=this._element.style.height;
var e=this._tableElement;
if(e){e.style.height=d;
this._fixIeHeight(e,d);
}}},_getMoveConstraints:function(d){var c=this._getSizeConstraints();
if(c){c.width-=d.width;
c.height-=d.height;
}return c;
},_getSizeConstraints:function(f){var c=this._constraints;
if(!c){return null;
}var d=c.x+this._offsetLocation.x;
var e=c.y+this._offsetLocation.y;
return new Sys.UI.Bounds(d,e,d+c.width,e+c.height);
},_constrainPosition:function(c,d,e){return Math.max(d,Math.min(e,c));
},_constrainDimension:function(d,c){return this._constrainPosition(d,0,c);
},_fixIeHeight:function(d,c){if("CSS1Compat"==document.compatMode){var e=(d.offsetHeight-parseInt(c));
if(e>0){var f=(parseInt(d.style.height)-e);
if(f>0){d.style.height=f+"px";
}}}},_setIframesVisible:function(e){if(!this.get_hideIframes()){return;
}var g=this._document.getElementsByTagName("iframe");
var h=this.get_iframeToSkip();
for(var c=0,j=g.length;
c<j;
c++){var f=g[c];
if(h&&(h===f||h==f)){h=null;
}else{f.style.visibility=e?"":"hidden";
if($telerik.isIE){try{f.contentWindow.document.body.style.visibility=e?"":"hidden";
}catch(d){}}}}},_configureHandleElements:function(f){var k=this._handles;
var e=["nw","n","ne","w","e","sw","s","se",this._moveCursorType];
for(var c=0,l=e.length;
c<l;
c++){var h=e[c];
var g=k[h];
if(g){if(Object.prototype.toString.call(g)==="[object Array]"){for(var d=0;
d<g.length;
d++){this._configureHandle("id"+c+"_"+d,f,g[d],h);
}}else{this._configureHandle("id"+c,f,g,h);
}}}},_configureHandle:function(f,c,d,g){var i=this._saveDelegates;
var h=i[f]?i[f].delegate:null;
if(c){if(!h){var e=$telerik.addMobileHandler(this,d,"mousedown",this._onHandleMouseDown,null,true);
d.style.cursor=(g==this._moveCursorType)?g:g+"-resize";
i[f]={element:d,delegate:e};
}}else{if(h){$telerik.removeMobileHandler(d,"mousedown",h,null,true);
d.style.cursor="";
delete i[f];
}}},_attachDocumentHandlers:function(f){var c=this._document;
if(f){this._documentMouseMoveDelegate=$telerik.addMobileHandler(this,c,"mousemove",this._onDocumentMouseMove,null,true);
this._documentMouseUpDelegate=$telerik.addMobileHandler(this,c,"mouseup",this._onDocumentMouseUp,null,true);
}else{var d=this._documentMouseMoveDelegate;
if(d){$telerik.removeMobileHandler(c,"mousemove",d,null,true);
}var e=this._documentMouseUpDelegate;
if(e){$telerik.removeMobileHandler(c,"mouseup",e,null,true);
}this._documentMouseMoveDelegate=null;
this._documentMouseUpDelegate=null;
}},_onHandleMouseDown:function(c){if($telerik.isMobileSafari&&c.originalEvent.touches.length>1){return true;
}this._storeStartCoords(c);
if(!$telerik.isMobileSafari&&!$telerik.isAndroid){return $telerik.cancelRawEvent(c);
}},_onDocumentMouseMove:function(d){var c=this._resize(d);
if(this._autoScrollEnabled){this._autoScroll(d);
}if(c){return $telerik.cancelRawEvent(d);
}},_onDocumentMouseUp:function(d){var c=!this._cancelResize;
this._cancelResize=true;
this._startCursorLocation=null;
if(c){this._clearSelection();
this._setIframesVisible(true);
if(this._resizeDir&&this._resizeDir.move){this._raiseDragEvent("DragEnd",null,d);
}else{this._raiseEvent("ResizeEnd");
}this._attachDocumentHandlers(false);
if(this._scroller){this._scroller.set_enabled(false);
}}},_clearSelection:function(){if(this._document.selection&&this._document.selection.empty){try{this._document.selection.empty();
}catch(c){}}},_initializeAutoScroll:function(){if(this._autoScrollInitialized){return;
}this._scrollEdgeConst=40;
this._scrollByConst=10;
this._scroller=null;
this._scrollDeltaX=0;
this._scrollDeltaY=0;
this._scrollerTickHandler=Function.createDelegate(this,this._onScrollerTick);
this._scroller=new Telerik.Web.Timer();
this._scroller.set_interval(10);
this._scroller.add_tick(this._scrollerTickHandler);
this._autoScrollInitialized=true;
},_autoScroll:function(d){this._initializeAutoScroll();
var e=$telerik.getClientBounds();
if(e.width>0){this._scrollDeltaX=this._scrollDeltaY=0;
if(d.clientX<e.x+this._scrollEdgeConst){this._scrollDeltaX=-this._scrollByConst;
}else{if(d.clientX>e.width-this._scrollEdgeConst){this._scrollDeltaX=this._scrollByConst;
}}if(d.clientY<e.y+this._scrollEdgeConst){this._scrollDeltaY=-this._scrollByConst;
}else{if(d.clientY>e.height-this._scrollEdgeConst){this._scrollDeltaY=this._scrollByConst;
}}var c=this._scroller;
if(this._scrollDeltaX!=0||this._scrollDeltaY!=0){this._originalStartX=this._startX;
this._originalStartY=this._startY;
c.set_enabled(true);
}else{if(c.get_enabled()){this._startX=this._originalStartX;
this._startY=this._originalStartY;
}c.set_enabled(false);
}}},_onScrollerTick:function(){var e=document.documentElement.scrollLeft||document.body.scrollLeft;
var i=document.documentElement.scrollTop||document.body.scrollTop;
window.scrollBy(this._scrollDeltaX,this._scrollDeltaY);
var k=document.documentElement.scrollLeft||document.body.scrollLeft;
var j=document.documentElement.scrollTop||document.body.scrollTop;
var h=k-e;
var d=j-i;
var c=this._element;
var f={x:parseInt(c.style.left)+h,y:parseInt(c.style.top)+d};
this._startX-=h;
this._startY-=d;
try{$telerik.setLocation(c,f);
}catch(g){}}};
a.ResizeExtender.registerClass("Telerik.Web.UI.ResizeExtender",null,Sys.IDisposable);
})();
