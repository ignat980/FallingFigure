package {
  import flash.display.MovieClip;
  import flash.events.Event;
  import flash.display.Shape;
  import fl.motion.Color;
  import flash.geom.ColorTransform;

  public class Figure extends MovieClip {
    public var speed: Number;
    public var shape: String;
    public var color: Number;
    public var arrayIndex: Number;
    public var wierdness: Boolean;
    public const one:int = 1;
    public var figureType = {
      Circle: 1,
      Triangle: 2,
      Square:3
    };
    private var instanceSpeed: Number;
    public function Figure(figureShape: Number = one, myColor: Number = 1) {
      super();
      this.gotoAndStop(figureShape);
      switch (figureShape) {
        case figureType.Circle:
          shape = "Circle";
          break;
        case figureType.Triangle:
          shape = "Triangle";
          break;
        case figureType.Square:
          shape = "Square";
          break;
        default:
          shape = "Error";
          break;
      }

      var tempColor: Number;
      switch (myColor) {
        case 1:
          tempColor = 0xFF0099;
          break;
        case 2:
          tempColor = 0x0033FF;
          break;
        case 3:
          tempColor = 0x00FF33;
          break;
        default:
          tempColor = 0x000000;
          break;
      }
      var myTransform: ColorTransform = new ColorTransform();
      myTransform.color = tempColor;
      this.transform.colorTransform = myTransform;
      color = myColor;
      speed = (Math.random() + 0.2) * 4;
      instanceSpeed = speed;
      arrayIndex = 0;
    }

    public function stopFalling(): void {
      speed = 0;
    }

    public function continueFalling(): void {
      speed = instanceSpeed;
    }

    /*public function chooseFigure():Shape {
    var myShape:Shape = new Shape();
    myShape.
    return myShape;
    }*/
  }
}
