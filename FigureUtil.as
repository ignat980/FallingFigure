package {
  import flash.display.DisplayObject;
  import flash.display.MovieClip;
  
  public class FigureUtil {
    
    public static const PROPERTY_SIZE: String = "size";
    public static const PROPERTY_SHAPE: String = "shape";
    public static const PROPERTY_COLOR: String = "color";
    
    public static const CIRCLE: int = 1;
    public static const TRIANGLE: int = 2;
    public static const SQUARE: int = 3;
    
    public static const SMALL_SIZE: int = 1;
    public static const MEDIUM_SIZE: int = 2;
    public static const LARGE_SIZE: int = 3;
    
    public static const PINK_COLOR: uint = 0xFF0099;
    public static const BLUE_COLOR: uint = 0x0033FF;
    public static const GREEN_COLOR: uint = 0x00FF33;
    
    public static function shapeForShapetype(type: Number): String {
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
      }
    }
    
    public static function sizeForSizeClass(type: int = MEDIUM_SIZE): Number {
      switch (type) {
        case SMALL_SIZE: 
          return 20 + Math.random() * 30
          break;
        case MEDIUM_SIZE: 
          return 50 + Math.random() * 50
          break;
        case LARGE_SIZE: 
          return 50 + Math.random() * 50
          
          break;
        default: 
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
    
    /**
     * Adds the pifagor animation as a child
     *
     * Params:
     *    {String} type - A string identifying what type of pifagor to add.
     *  Can be either "Silent" or "Talking". Defaults to "Silent".
     */
    public static function addPifagor(parent: DisplayObject, type: String = "Silent"): MovieClip {
      var pifagor: MovieClip
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
      return parent.addChild(pifagor);
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
