﻿package deco3850.animals {
	import flash.display.MovieClip;
	import flash.utils.getDefinitionByName;
	
	public class Cow extends Animal {
		public function Cow() {
			this.setName("Cow");
			this.createTimer(5000);
			this.setTags([]);
			this.setScore(20);
		}
		
		override public function interactionAttach():Boolean {
			
			return true;
		}
		
		public static function getClass():Class {return getDefinitionByName("deco3850.animals.Cow") as Class;}
	}
}