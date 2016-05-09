package {
	import flash.display.MovieClip;
	public class FadingTransition extends MovieClip {

		public function FadingTransition(part: Number = 0) {
			switch (part) {
				case 0:
					this.gotoAndStop(1);
					break;
				case 1:
					this.gotoAndPlay(1);
					break;
				default:
					this.gotoAndPlay(49);
					break;
			}
		}

		public function fadeIn():void {
			this.gotoAndPlay(1);
		}

		public function fadeOut():void {
			this.gotoAndPlay(49);
		}
	}
}