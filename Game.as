package {
  import flash.display.MovieClip;
  
  public class Game extends MovieClip {
    var buckets: Array;
    var figures: Array;
    var counter: int;
    var properties: Array;
    
    public function Game() {
      super()
    }
    
    public function setupConveyor(): void {
      //TODO: Load multiple conveyor object to make a track for object to appear
    }
    
    public function setupBuckets(): void {
      //TODO: Setup 3 buckets with the sorting properties
    }
    
    public function setupFigures(): void {
      // TODO: Create custom figure generator
      // TODO: Event listeners on mouse down, mouse up, and mouse movement
    }
    
    public function gameTick():void {
      //TODO: Move figures across conveyor
    }
  }
}
