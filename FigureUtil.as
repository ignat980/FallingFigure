package {
  import flash.display.DisplayObject;
  
  public class FigureUtil {
    public static const CIRCLE = 1;
    public static const TRIANGLE = 2;
    public static const SQUARE = 3;
    
    public static const PINK = 1;
    public static const PINK_COLOR = 0xFF0099;
    public static const BLUE = 2;
    public static const BLUE_COLOR = 0x0033FF;
    public static const GREEN = 3;
    public static const GREEN_COLOR = 0x00FF33;
    
    /*function shapeForShapetype(type: Number): String {
       switch (figureShape) {
       case CIRCLE:
       return "Circle";
       break;
       case TRIANGLE:
       return "Triangle";
       break;
       case SQUARE:
       return "Square";
       break;
       default:
       return "Error";
       break;
       }
       }*/
    
    public function colorForType(type: Number): Number {
      switch (type) {
        case PINK: 
          return PINK_COLOR;
          break;
        case BLUE: 
          return BLUE_COLOR;
          break;
        case GREEN: 
          return GREEN_COLOR;
          break;
        default: 
          return 0x000000;
          break;
      }
    }
    
    //http://stackoverflow.com/a/13542669/3923022
    public static function shadeColor(color: uint, percent: Number): uint {
      var f = color;
      var t = percent < 0 ? 0 : 255;
      var p = percent < 0 ? percent * -1 : percent;
      var R = f >> 16;
      var G = f >> 8 & 0x00FF;
      var B = f & 0x0000FF;
      trace("Shading", color, "by", p, "%")
      return (0x1000000 + (Math.round((t - R) * p) + R) * 0x10000 + (Math.round((t - G) * p) + G) * 0x100 + (Math.round((t - B) * p) + B));
    }
    
    public static function extend(): void {
      /**
       * Helper method, sets a MovieClip's position
       * *Note*: This only works if you turn off strict mode in the compiler settings
       *
       * Params:
       *     {Number} x - The x coordinate to add the child at
       *     {Number} y - The y coordinate to add the child at
       */
      DisplayObject.prototype.at = function(x: Number, y: Number) {
        this.x = x;
        this.y = y;
        return this;
      };
    }
  }
}
