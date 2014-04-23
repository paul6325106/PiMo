﻿package  {
	import flash.display.Stage;

	public class GameController {
		private var document:Stage;
		
		private var kinectInput:KinectInput;
		private var rfidReader:RFIDReaderSingle;
		
		private var score:int; //cumulative score for this game, nonnegative
		
		private var scenery:Array; //interactable objects in the background
		private var wild:Array; //animals in the scene, not following the player
		private var party:Array; //animals currently following the player
		private var player:Player;

		/**
		 * Controls the proceedings for one round of the game.
		 */
		public function GameController(document:Stage) {
			this.document = document;
			this.kinectInput = new KinectInput(this.document, this);
			//this.rfidReader = new RFIDReaderSingle(this);
			this.score = 0;
			this.wild = new Array();
			this.party = new Array();
			
			this.player = new Player(this.kinectInput.getKinectSkeleton());
			this.player.x = 50;
			this.player.y = 400;
			this.document.addChild(this.player);
			
			loadScene();
			loadScenery();
		}
		
		public function renderPlayer() {
			//trace("Render");
			this.player.renderPlayer();
		}
		
		private function loadScene():void {
			loadScenery();
		}
		
		private function loadScenery():void {
			this.scenery = new Array();
		}
		
		//private function isSceneComplete():Boolean {
		
		private function checkForScenery():void {
			
		}
		
		private function spawnAnimal(scenery:Scenery):void {
			
		}
		
		private function despawnAnimal(animal:Animal):void {
			
		}
		
		private function activateTag(tag:String) {
			
		}
		
		private function deactivateTag(tag:String) {
			
		}
		
		private function attachAnimal(animal:Animal):void {
			
		}
		
		private function endGame():void {
			
		}
	}
}