package  {
	
	import flash.display.MovieClip;
	import flash.display.DisplayObject;
	
	/**
	* This class is the setup class for the Stage
	* This is the first class called on initialization
	*/
	public class Main extends MovieClip {
		
		const cyanColor = "0x66FFFF"
		var pifagor:MovieClip;
		
		//init
		public function Main() {
			addPifagor(0, 20)
			pifagor.x = this.stage.stageWidth/2 - pifagor.width/2
			this.stage.color = int(cyanColor)
		}
		
		/**
		* Adds the pifagor animation as a child
		*
		* Params: 
		*	{Number} x - The x coordinate to add pifagor at
		*	{Number} y - The y coordinate to add pifagor at
		*	{String} type - A string identifying what type of pifagor to add.
		*					Can be either "Silent" or "Talking". Defaults to "Silent".
		*/
		public function addPifagor(x:Number, y:Number, type:String = "Silent") {
			switch (type) {
				case "Silent":
					pifagor = new PifagorSilent();
					break;
				case "Talking":
					pifagor = new Pifagor();
					break;
				default:
					pifagor = new PifagorSilent();
					break;
			}
			addChildAtPos(pifagor, x, y)
		}
		
		/**
		* Sets a MovieClip's position and then adds it as a child
		*
		* Params:
		*	{DisplayObject} child - An object with x and y properties
		*	{Number} x - The x coordinate to add the child at
		*	{Number} y - The y coordinate to add the child at
		*/
		public function	addChildAtPos(child:DisplayObject, x:Number, y:Number) {
			child.x = x
			child.y = y
			addChild(child)
		}
	}
	
}
