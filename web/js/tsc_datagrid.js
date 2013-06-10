var TINY={};

function T$(i){return document.getElementById(i)}
function T$$(e,p){return p.getElementsByTagName(e)}

TINY.table=function(){
	function sorter(n,t,p){this.n=n; this.id=t; this.p=p; if(this.p.init){this.init()}}
	sorter.prototype.init=function(){
		this.set(); var t=this.t, i=d=0; t.h=T$$('tr',t)[0];
		t.l=t.r.length; t.w=t.r[0].cells.length; t.a=[]; t.c=[]; this.p.is=this.p.size;
		if(this.p.colddid){
			d=T$(this.p.colddid);
			var o=document.createElement('option'); o.value=-1; o.innerHTML='All Columns'; d.appendChild(o)
		}
		for(i;i<t.w;i++){
			var c=t.h.cells[i]; t.c[i]={};
			if(c.className!='nosort'){
				c.className=this.p.headclass; c.onclick=new Function(this.n+'.sort('+i+')');
				c.onmousedown=function(){return false};
			}
			if(this.p.columns){
				var l=this.p.columns.length, x=0;
				for(x;x<l;x++){
					if(this.p.columns[x].index==i){
						var g=this.p.columns[x];
						t.c[i].format=g.format==null?1:g.format; t.c[i].decimals=g.decimals==null?2:g.decimals
					}
				}
			}
			if(d){
				var o=document.createElement('option'); o.value=i; o.innerHTML=T$$('h3',c)[0].innerHTML; d.appendChild(o)
			}
		}
		this.reset()
	};
	sorter.prototype.reset=function(){
		var t=this.t; t.t=t.l;
		for(var i=0;i<t.l;i++){t.a[i]={}; t.a[i].s=1}
		if(this.p.sortcolumn!=undefined){
			this.sort(this.p.sortcolumn,1,this.p.is)
		}else{
			if(this.p.paginate){this.size()} this.alt(); this.sethover()
		}
		this.calc()
	};
	sorter.prototype.sort=function(x,f,z){
		var t=this.t; t.y=x; var x=t.h.cells[t.y], i=0, n=document.createElement('tbody');
		for(i;i<t.l;i++){
			t.a[i].o=i; var v=t.r[i].cells[t.y]; t.r[i].style.display='';
			while(v.hasChildNodes()){v=v.firstChild}
			t.a[i].v=v.nodeValue?v.nodeValue:''
		}
		for(i=0;i<t.w;i++){var c=t.h.cells[i]; if(c.className!='nosort'){c.className=this.p.headclass}}
		if(t.p==t.y&&!f){t.a.reverse(); x.className=t.d?this.p.ascclass:this.p.descclass; t.d=t.d?0:1}
		else{t.p=t.y; f&&this.p.sortdir==-1?t.a.sort(cp).reverse():t.a.sort(cp); t.d=0; x.className=this.p.ascclass}
		for(i=0;i<t.l;i++){var r=t.r[t.a[i].o].cloneNode(true); n.appendChild(r)}
		t.replaceChild(n,t.b); this.set(); this.alt(); if(this.p.paginate){this.size(z)} this.sethover()
	};
	sorter.prototype.sethover=function(){
		if(this.p.hoverid){
			for(var i=0;i<this.t.l;i++){
				var r=this.t.r[i];
				r.setAttribute('onmouseover',this.n+'.hover('+i+',1)');
				r.setAttribute('onmouseout',this.n+'.hover('+i+',0)')
			}
		}
	};
	sorter.prototype.calc=function(){
		if(this.p.sum||this.p.avg){
			var t=this.t, i=x=0, f,r;
			if(!T$$('tfoot',t)[0]){
				f=document.createElement('tfoot'); t.appendChild(f)
			}else{
				f=T$$('tfoot',t)[0]; while(f.hasChildNodes()){f.removeChild(f.firstChild)}
			}
			if(this.p.sum){
				r=this.newrow(f);
				for(i;i<t.w;i++){
					var j=r.cells[i];
					if(this.p.sum.exists(i)){
						var s=0, m=t.c[i].format||'';
						for(x=0;x<this.t.l;x++){
							if(t.a[x].s){s+=parseFloat(t.r[x].cells[i].innerHTML.replace(/(\$|\,)/g,''))}
						}
						s=decimals(s,t.c[i].decimals?t.c[i].decimals:2);
						s=isNaN(s)?'n/a':m=='$'?s=s.currency(t.c[i].decimals):s+m;
						r.cells[i].innerHTML=s
					}else{r.cells[i].innerHTML='&nbsp;'}
				}
			}
			if(this.p.avg){
				r=this.newrow(f);
				for(i=0;i<t.w;i++){
					var j=r.cells[i];
					if(this.p.avg.exists(i)){
						var s=c=0, m=t.c[i].format||'';
						for(x=0;x<this.t.l;x++){
							if(t.a[x].s){s+=parseFloat(t.r[x].cells[i].innerHTML.replace(/(\$|\,)/g,'')); c++}
						}
						s=decimals(s/c,t.c[i].decimals?t.c[i].decimals:2);
						s=isNaN(s)?'n/a':m=='$'?s=s.currency(t.c[i].decimals):s+m;
						j.innerHTML=s
					}else{j.innerHTML='&nbsp;'}
				}
			}
		}
	};
	sorter.prototype.newrow=function(p){
		var r=document.createElement('tr'), i=0; p.appendChild(r);
		for(i;i<this.t.w;i++){r.appendChild(document.createElement('td'))}
		return r
	};
	sorter.prototype.alt=function(){
		var t=this.t, i=x=0;
		for(i;i<t.l;i++){
			var r=t.r[i];
			if(t.a[i].s){
				r.className=x%2==0?this.p.evenclass:this.p.oddclass; var cells=T$$('td',r);
				for(var z=0;z<t.w;z++){cells[z].className=t.y==z?x%2==0?this.p.evenselclass:this.p.oddselclass:''}
				x++
			}
			if(!t.a[i].s){r.style.display='none'}
		}
	};
	sorter.prototype.page=function(s){
		var t=this.t, i=x=0, l=s+parseInt(this.p.size);
		if(this.p.totalrecid){T$(this.p.totalrecid).innerHTML=t.t}
		if(this.p.currentid){T$(this.p.currentid).innerHTML=this.g}
		if(this.p.startingrecid){
			var b=((this.g-1)*this.p.size)+1, m=b+(this.p.size-1); m=m<t.l?m:t.t; m=m<t.t?m:t.t;
			T$(this.p.startingrecid).innerHTML=t.t==0?0:b;; T$(this.p.endingrecid).innerHTML=m
		}
		for(i;i<t.l;i++){var r=t.r[i]; if(t.a[i].s){r.style.display=x>=s&&x<l?'':'none'; x++}else{r.style.display='none'}}
	};
	sorter.prototype.move=function(d,m){
		this.goto(d==1?(m?this.d:this.g+1):(m?1:this.g-1))
	};
	sorter.prototype.goto=function(s){
		if(s<=this.d&&s>0){this.g=s; this.page((s-1)*this.p.size)}
	};
	sorter.prototype.size=function(s){
		var t=this.t;
		if(s){this.p.size=s}
		this.g=1; this.d=Math.ceil(this.t.t/this.p.size);
		if(this.p.navid){T$(this.p.navid).style.display=this.d<2?'none':'block'}
		this.page(0);
		if(this.p.totalid){T$(this.p.totalid).innerHTML=t.t==0?1:this.d}
		if(this.p.pageddid){
			var d=T$(this.p.pageddid), l=this.d+1;
			d.setAttribute('onchange',this.n+'.goto(this.value)');
			while(d.hasChildNodes()){d.removeChild(d.firstChild)}
			for(var i=1;i<=this.d;i++){
				var o=document.createElement('option');
				o.value=i; o.innerHTML=i; d.appendChild(o)
			}
		}
	};
	sorter.prototype.showall=function(){
		this.size(this.t.t)
	};
	sorter.prototype.search=function(f){
		var i=x=n=0, k=-1, q=T$(f).value.toLowerCase();
		if(this.p.colddid){k=T$(this.p.colddid).value}
		var s=(k==-1)?0:k, e=(k==-1)?this.t.w:parseInt(s)+1;
		for(i;i<this.t.l;i++){
			var r=this.t.r[i], v;
			if(q==''){
				v=1
			}else{
				for(x=s;x<e;x++){
					var b=r.cells[x].innerHTML.toLowerCase();
					if(b.indexOf(q)==-1){v=0}else{v=1; break}
				}
			}
			if(v){n++}
			this.t.a[i].s=v
		}
		this.t.t=n;
		if(this.p.paginate){this.size()}
		this.calc(); this.alt()
	};
	sorter.prototype.hover=function(i,d){
		this.t.r[i].id=d?this.p.hoverid:''
	};
	sorter.prototype.set=function(){
		var t=T$(this.id); t.b=T$$('tbody',t)[0]; t.r=t.b.rows; this.t=t
	};
	Array.prototype.exists=function(v){
		for(var i=0;i<this.length;i++){if(this[i]==v){return 1}} return 0
	};
	Number.prototype.currency=function(c){
		var n=this, d=n.toFixed(c).split('.');
		d[0]=d[0].split('').reverse().join('').replace(/(\d{3})(?=\d)/g,'$1,').split('').reverse().join('');
		return '$'+d.join('.')
	};
	function decimals(n,d){return Math.round(n*Math.pow(10,d))/Math.pow(10,d)};
	function cp(f,c){
		var g,h; f=g=f.v.toLowerCase(); c=h=c.v.toLowerCase();
		var i=parseFloat(f.replace(/(\$|\,)/g,'')), n=parseFloat(c.replace(/(\$|\,)/g,''));
		if(!isNaN(i)&&!isNaN(n)){g=i,h=n}
		i=Date.parse(f); n=Date.parse(c);
		if(!isNaN(i)&&!isNaN(n)){g=i; h=n}
		return g>h?1:(g<h?-1:0)
	};
	return{sorter:sorter}
}();







/*
 * File:        chromatable.js
 * Version:     1.3.0
 * CVS:         $Id$
 * Description: Make a "sticky" header at the top of the table, so it stays put while the table scrolls
 * Author:      Zachary Siswick
 * Created:     Thursday 19 November 2009 8:53pm 
 * Language:    Javascript
 *
 */
(function($){
    
    $.chromatable = {
        // Default options
        defaults: {
						//specify a pixel dimension, auto, or 100%
            width: "900px", 
						height: "300px",
						scrolling: "yes" 
        }
				
		};
		
		$.fn.chromatable = function(options){
		 
		// Extend default options
		var options = $.extend({}, $.chromatable.defaults, options);

		return this.each(function(){
															
				// Add jQuery methods to the element
				var $this = $(this);
				var $uniqueID = $(this).attr("ID") + ("wrapper");
				
				
				//Add dimentsions from user or default parameters to the DOM elements
				$(this).css('width', options.width).addClass("_scrolling");
				
				$(this).wrap('<div class="scrolling_outer"><div id="'+$uniqueID+'" class="scrolling_inner"></div></div>');
								
				$(".scrolling_outer").css({'position':'relative'});
				$("#"+$uniqueID).css(
																	
					 {'border':'1px solid #CCCCCC',
						'overflow-x':'hidden',
						'overflow-y':'auto',
						'padding-right':'17px'						
						});
				
				$("#"+$uniqueID).css('height', options.height);
				$("#"+$uniqueID).css('width', options.width);
				
				// clone an exact copy of the scrolling table and add to DOM before the original table
				// replace old class with new to differentiate between the two
				$(this).before($(this).clone().attr("id", "").addClass("_thead").css(
																																															 
						{'width' : 'auto',
						 'display' : 'block', 
						 'position':'absolute', 
						 'border':'none', 
						 'border-bottom':'1px solid #CCC',
						 'top':'1px'
							}));
	
				
				// remove all children within the cloned table after the thead element
				$('._thead').children('tbody').remove();
				
				
				$(this).each(function( $this ){
															
					// if the width is auto, we need to remove padding-right on scrolling container	
					
					if (options.width == "100%" || options.width == "auto") {
						
						$("#"+$uniqueID).css({'padding-right':'0px'});
					}
					
				
					if (options.scrolling == "no") {
												
						$("#"+$uniqueID).before('<a href="#" class="expander" style="width:100%;">Expand table</a>');
						
						$("#"+$uniqueID).css({'padding-right':'0px'});
						
						$(".expander").each(
	
							
							function(int){
								
								$(this).attr("ID", int);
								
								$( this ).bind ("click",function(){
																								 
										$("#"+$uniqueID).css({'height':'auto'});
										
										$("#"+$uniqueID+" ._thead").remove();
										
										$(this).remove();
						
									});
								});


						//this is dependant on the jQuery resizable UI plugin
						$("#"+$uniqueID).resizable({ handles: 's' }).css("overflow-y", "hidden");
	
					}
				
				});
				
				
				// Get a relative reference to the "sticky header"
				$curr = $this.prev();
				
				// Copy the cell widths across from the original table
				$("thead:eq(0)>tr th",this).each( function (i) {
																							 
					$("thead:eq(0)>tr th:eq("+i+")", $curr).width( $(this).width());
					
				});

				
				//check to see if the width is set to auto, if not, we don't need to call the resizer function
				if (options.width == "100%" || "auto"){
					
											
						// call the resizer function whenever the table width has been adjusted
						$(window).resize(function(){
																			
									resizer($this);										
						});
					}
				});
				
    };
		
		// private function to temporarily hide the header when the browser is resized
		
		function resizer($this) {
				
				// Need a relative reference to the "sticky header"
				$curr = $this.prev();
				
				$("thead:eq(0)>tr th", $this).each( function (i) {
																														 
					$("thead:eq(0)>tr th:eq("+i+")", $curr).width( $(this).width());
					
				});

  	};
		
})(jQuery);
