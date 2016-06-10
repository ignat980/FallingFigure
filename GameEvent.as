package {
  import flash.events.Event;
  
  /**
   * The GameEvent class sends notifications on different event triggers within the Game Class.
   * @author Ignat Remizov
   */
  public class GameEvent extends Event {
    
    public static const DONE: String = "Done";
    
    function GameEvent(type: String): void {
      super(type)
    }
  
  }

}