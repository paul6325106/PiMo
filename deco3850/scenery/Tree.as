﻿package deco3850.scenery {
	import flash.debug.Debug;
	import flash.utils.getDefinitionByName;
	
	public class Tree extends Scenery {
		public function Tree(x:Number = 0, y:Number = 0) {
			this.setName("Tree");
			this.x = x;
			this.y = y;
			this.setCooldownPeriod(10000);
			this.setAnimalSpawnType(getDefinitionByName('deco3850.animals.Owl') as Class);
		}
		
		override public function sceneryInteraction() {
			
		}
	}
}