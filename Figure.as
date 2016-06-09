package {
  import flash.display.MovieClip;
  import flash.events.Event;
  import flash.display.Shape;
  import fl.motion.Color;
  import flash.geom.ColorTransform;
  import flash.events.MouseEvent;
  
  /**
   * The Figure class creates a shape with a specifc color and size class.
   * Use the constants found in the FigureUtil class when initializing a Figure.
   * The three possible shapes are a Circle, Triangle, or Square. Default is a Circle.
   * The three possible colors are Blue, Pink, and Green. Default is Blue.
   * The three size classes are ranges between 20-50, 51-100, 100-1000. Default is 51-100.
   */
  public class Figure extends MovieClip {
    public var speed: Number;
    public var shape: Number;
    public var color: Number;
    public var size: Number;
    public var arrayIndex: Number;
    public var wierdness: Boolean;
    private var previousSpeed: Number;
    
    public function Figure(figureShape: Number = FigureUtil.CIRCLE, myColor: uint = FigureUtil.BLUE_COLOR, size: Number = 2, index: int = 0) {
      super();
      this.gotoAndStop(figureShape);
      this.shape = figureShape;
      var myTransform = new ColorTransform();
      myTransform.color = this.color = myColor;
      this.transform.colorTransform = myTransform;
      this.previousSpeed = this.speed = (Math.random() + 0.2) * 4;
      this.arrayIndex = index;
      //this.addEventListener(MouseEvent.MOUSE_DOWN,
    }
    
    public function stopFalling(): void {
      speed = 0;
    }
    
    public function continueFalling(): void {
      speed = previousSpeed;
    }
  }
}
