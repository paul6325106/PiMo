﻿package {
	import com.as3nui.nativeExtensions.air.kinect.Kinect;
	import com.as3nui.nativeExtensions.air.kinect.KinectSettings;
	import com.as3nui.nativeExtensions.air.kinect.constants.CameraResolution;
	import com.as3nui.nativeExtensions.air.kinect.data.User;
	import com.as3nui.nativeExtensions.air.kinect.events.CameraImageEvent;
	import com.as3nui.nativeExtensions.air.kinect.events.DeviceEvent;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.sampler.StackFrame;
	import flash.display.Bitmap;
	
	public class KinectInput {
		private var kinect:Kinect;
		private var kinectSettings:KinectSettings;
		private var kinectSkeleton:KinectSkeleton;
		private var depthBitmap:Bitmap;
		private var document:Stage;
		
		public function KinectInput(document:Stage) {
			this.document = document;
			if(Kinect.isSupported()) {
				this.kinect = Kinect.getDevice();
				
				this.kinectSettings = new KinectSettings();
				this.kinectSettings.depthEnabled = true;
				this.kinectSettings.depthShowUserColors = true;
				this.kinectSettings.rgbEnabled = true;
				this.kinectSettings.rgbResolution = CameraResolution.RESOLUTION_1280_960;
				this.kinectSettings.skeletonEnabled = true;
				this.kinectSkeleton = new KinectSkeleton();
				this.document.addChild(this.kinectSkeleton.getSkeleton());
				this.kinectSkeleton.getSkeleton().x = 20;
				this.kinectSkeleton.getSkeleton().y = 400;
				
				// Listen to when the kinect is ready
				this.kinect.addEventListener(DeviceEvent.STARTED, kinectStarted);
				
				// Depth Update
				this.kinect.addEventListener(CameraImageEvent.DEPTH_IMAGE_UPDATE, depthImageUpdateHandler);
				
				this.kinect.start(this.kinectSettings);
				
				// Update Skeleton
				this.kinect.addEventListener(Event.ENTER_FRAME, on_enter_frame, false, 0, true);
				this.kinect.addEventListener(Event.EXIT_FRAME, on_exit_frame, false, 0, true);
				trace("Done");
			} else {
				trace("Kinect not supported.");
			}
		}
		
		private function on_enter_frame() {
			trace("Enter Frame");
			for each(var user:User in this.kinect.usersWithSkeleton) {
				trace("Hello 1");
				this.kinectSkeleton.setPoints(user);
				trace("Hello 2");
			}
		}
		
		private function on_exit_frame() {
			trace("Exit Frame");
		}
		
		private function kinectStarted(e:DeviceEvent):void {
			trace("kinect has started");
		}
		
		protected function rgbImageUpdateHandler(event:CameraImageEvent):void {
			trace("rgbUpdate");
			depthBitmap.bitmapData = event.imageData;
		}
		
		protected function depthImageUpdateHandler(event:CameraImageEvent):void {
			for each(var user:User in this.kinect.usersWithSkeleton) {
				this.kinectSkeleton.setPoints(user);
			}
		}
		
		public function getKinectSkeleton():KinectSkeleton {return this.kinectSkeleton;}
	}
}