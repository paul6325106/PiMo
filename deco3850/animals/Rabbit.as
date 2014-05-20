﻿package deco3850.animals {
	import flash.display.MovieClip;
	
	public class Rabbit extends Animal {
		
		public function Rabbit() {
			this.setName("Rabbit");
			this.setTags(['010232cd72', '010238914a', '0102387557']);
			this.setScore(10);
		}
		
		override public function interactionAttach():Boolean {
			return true;
		}
	}
}