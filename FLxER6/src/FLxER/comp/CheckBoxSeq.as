﻿package FLxER.comp{	import flash.events.*;	public class CheckBoxSeq extends CheckBoxBase {		///////		public var myList:Array;		public var myStatusSeq:Number;		private var param:String;		public function CheckBoxSeq(xx:Number,yy:Number,ww:uint,hh:uint,f:Function,list:Array,p:String):void {			param = p;			myList = list;			super(xx,yy,ww,hh,list[0],f,null,false);			myStatusSeq = 0;			myTxt="";		}		override public function myStatus_swap():void {			myTxt="";			if (myStatusSeq<myList.length-1) {				myStatusSeq++			} else {				myStatusSeq = 0;			}			txt=myList[myStatusSeq];/**/		}		public function setStatus(p):void {			myStatusSeq = p;			txt=myList[myStatusSeq];			mouseOutHandler(null);		}		override public function mouseDownHandler(event:Event):void {			myStatus_swap();			fnz(param, myStatusSeq);			if (exp && event) {				lab.text=txt + myTxt;				lab.width=lab.textWidth + 6;			}		}	}}