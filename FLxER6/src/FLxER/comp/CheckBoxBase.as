﻿package FLxER.comp{	import flash.display.Sprite;	import flash.events.*;	import FLxER.main.Txt;	import FLxER.main.Rett;	public class CheckBoxBase extends Sprite {		public var lab:Txt;		private var puls:Rett;		private var w:uint;		public var h:uint;		public var txt:String;		public var fnz:Function		private var alt:String		///////		public var myStatus:Boolean;		public var myTxt:String		public var exp:Boolean;		private var myStatusStart:Boolean;				public function CheckBoxBase(xx:Number,yy:Number,ww:uint,hh:uint,t:String,f:Function,a:String,myStat:Boolean):void {			lab = new Txt(0,0,0,hh,t,Preferences.th,"puls");			this.addChild(lab);			x = xx;			y = yy;			w = ww;			h = hh;			txt = t			fnz = f			alt = a			myStatusStart=myStatus=myStat;			//lab.width = lab.textWidth+5			if (lab.textWidth > ww+5) {				lab.text="";				exp = true			}			lab.width = ww;			puls = new Rett(0,0,w,h,Preferences.pref.myCol.bkgCol,-1,0);			this.addChild(puls);			myEnable()			if (myStatus) {				myTxt=" ON";				lab.backgroundColor=Preferences.pref.myCol.bkgColOver;			} else {				myTxt=" OFF";				lab.backgroundColor=Preferences.pref.myCol.bkgCol;			}		}		public function resetta():void {			if (myStatusStart!=myStatus){				mouseDownHandler(null);			}		}		private function mouseOverHandler(event:Event):void {			this.lab.backgroundColor = Preferences.pref.myCol.bkgColOver;			if (exp) {				lab.text=txt + myTxt;				lab.width=lab.textWidth + 6;				this.parent.swapChildren(this, this.parent.getChildAt(this.parent.numChildren-1))			}			if (Preferences.pref.vKS && alt) {				Preferences.myAlt.avvia(alt);			}		}		public function mouseOutHandler(event:Event):void {			if (exp) {				lab.text=(this is CheckBoxSeq ? (txt=="NULL" ? "" : txt.substring(0,1)) : "");				lab.width=w;			}			if (!myStatus || this is CheckBoxSeq) {				this.lab.backgroundColor = Preferences.pref.myCol.bkgCol;			}			if (Preferences.pref.vKS && alt) {				Preferences.myAlt.stoppa();			}		}		public function mouseDownHandler(event:Event):void {			if (Preferences.pref.vKS && alt) {				Preferences.myAlt.stoppa();			}			myStatus_swap();			fnz(myStatus);			if (exp && event) {				lab.text=txt + myTxt;				lab.width=lab.textWidth + 6;			}		}		public function myStatus_swap():void {			if (myStatus) {				myStatus=false;				myTxt=" OFF";				lab.backgroundColor=Preferences.pref.myCol.bkgCol;			} else {				myStatus=true;				myTxt=" ON";				lab.backgroundColor=Preferences.pref.myCol.bkgColOver;			}		}		public function myDisable():void {			this.puls.removeEventListener(MouseEvent.MOUSE_OVER,mouseOverHandler);			this.puls.removeEventListener(MouseEvent.MOUSE_OUT,mouseOutHandler);			this.puls.removeEventListener(MouseEvent.MOUSE_DOWN,mouseDownHandler);			this.puls.buttonMode = false;			lab.alpha = .5;			//lab.backgroundColor=Preferences.pref.myCol.bkgColOver;		}		public function myEnable():void {			this.puls.addEventListener(MouseEvent.MOUSE_OVER,mouseOverHandler);			this.puls.addEventListener(MouseEvent.MOUSE_OUT,mouseOutHandler);			this.puls.addEventListener(MouseEvent.MOUSE_DOWN,mouseDownHandler);			this.puls.buttonMode = true;			lab.alpha = 1;			//lab.backgroundColor=Preferences.pref.myCol.bkgCol;		}	}}