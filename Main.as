﻿package  {
	import flash.display.MovieClip;
	
	public class Main extends MovieClip {
		private var environment:Environment;
		private var demo:Demo;
		private var gameController:GameController;
		
		public static var SCREEN_SIZE_X:Number = 1024;
		public static var SCREEN_SIZE_Y:Number = 768;
		
		public function Main() {
			this.gameController = new GameController(stage);
			//createEnvironment();
			//this.demo = new Demo(this.stage);
			//var skeletonBonesDemo:SkeletonBonesDemo = new SkeletonBonesDemo();
			//new RFIDHandler();
		}
		
		private function createEnvironment() {
			this.environment = new Environment();
		}
	}
}