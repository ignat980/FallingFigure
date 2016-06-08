package {
  import flash.display.MovieClip;
  import flash.events.Event;
  import flash.display.Shape;
  import fl.motion.Color;
  import flash.geom.ColorTransform;
  import flash.events.MouseEvent;
  
  public class Figure extends MovieClip {
    public var speed: Number;
    public var shape: Number;
    public var color: Number;
    public var arrayIndex: Number;
    public var wierdness: Boolean;
    private var instanceSpeed: Number;
    
    public function Figure(figureShape: Number = FigureUtil.CIRCLE, myColor: Number = 1) {
      super();
      this.gotoAndStop(figureShape);
      shape = figureShape
      var myTransform: ColorTransform = new ColorTransform();
      myTransform.color = FigureUtil.colorForType(myColor);
      this.transform.colorTransform = myTransform;
      color = myColor;
      speed = (Math.random() + 0.2) * 4;
      instanceSpeed = speed;
      arrayIndex = 0;
      //this.addEventListener(MouseEvent.MOUSE_DOWN,
    }
    
    public function stopFalling(): void {
      speed = 0;
    }
    
    public function continueFalling(): void {
      speed = instanceSpeed;
    }
  }
}