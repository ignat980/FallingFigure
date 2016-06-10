package {
  import fl.controls.Button;
  import flash.display.MovieClip;
  import flash.display.DisplayObject;
  import flash.events.Event;
  import flash.text.TextFormat;
  import flash.text.TextField;
  import flash.text.TextFieldAutoSize;
  import fl.controls.CheckBox;
  import flash.events.MouseEvent;
  import FigureUtil;
  
  /**
   * This class is the setup class for the Stage
   * This is the first class called on initialization
   */
  public class Main extends MovieClip {
    const cyanColor = "0x66FFFF";
    var pifagor: MovieClip;
    var instructions: TextField;
    var startBtn: CustomButtonContainer;
    var checkboxes: Array;
    var game: Game;
    
    //init, Makes the main menu screen
    public function Main() {
      FigureUtil.extend(); //Add runtime-specific functionality
      
      //Add an animated character at the center near the top
      (pifagor = FigureUtil.addPifagor(this)).at(this.stage.stageWidth / 2 - pifagor.width / 2, 70);
      
      this.stage.color = int(cyanColor);
      
      //Setup instructions text
      with (instructions = new TextField) {
        defaultTextFormat = new TextFormat("Times New Roman", 22, null, true);
        text = "Sort the figures!";
        autoSize = TextFieldAutoSize.CENTER;
        selectable = false;
      }
      addChild(instructions).at(this.stage.stageWidth / 2 - instructions.width / 2, 200);
      
      //Setup start button
      addChild(startBtn = new CustomButtonContainer("Easy", 0x00EE00)).at(this.stage.stageWidth / 4, 300).addEventListener(MouseEvent.CLICK, startGame);
      addChild(startBtn = new CustomButtonContainer("Medium", 0xEE7700)).at(this.stage.stageWidth / 2, 300).addEventListener(MouseEvent.CLICK, startGame);
      addChild(startBtn = new CustomButtonContainer("Hard", 0xEE0000)).at(this.stage.stageWidth / 4 * 3, 300).addEventListener(MouseEvent.CLICK, startGame);
      startBtn.enabled = true;
    
    }
    
    //Handler method on button click for starting a game
    public function startGame(e: MouseEvent) {
      if (e.target.enabled) {
        trace("Clicked", e.target.label.text)
      }
      if (false) {
        //TODO: Create game based on difficulty, random properties (easy = any 1, medium = any 2, hard = all 3)
        addChild(game = new Game()).at(0, 0)
        game.addEventListener(GameEvent.DONE, backToMenu)
      }
    }
    
    public function backToMenu(e: Event): void {
      removeChild(game)
    }
  }
}
