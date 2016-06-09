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
    
    //init, Makes the main menu screen
    public function Main() {
      FigureUtil.extend(); //Add runtime-specific functionality
      
      //Add an animated character at the center near the top
      (pifagor = FigureUtil.addPifagor(this)).at(this.stage.stageWidth / 2 - pifagor.width / 2, 20);
      
      this.stage.color = int(cyanColor);
      
      //Setup instructions text
      with (instructions = new TextField) {
        defaultTextFormat = new TextFormat("Times New Roman", 22, null, true);
        text = "Sort the figures!";
        autoSize = TextFieldAutoSize.CENTER;
        selectable = false;
      }
      addChild(instructions).at(this.stage.stageWidth / 2 - instructions.width / 2, 150);
      
      //Setup start button
      addChild(startBtn = new CustomButtonContainer("Start!")).at(this.stage.stageWidth / 2, 300).addEventListener(MouseEvent.CLICK, startGame);
      startBtn.enabled = false;
      
      //Setup checkboxes
      checkboxes = [new CheckBox(), new CheckBox(), new CheckBox()];
      const labels = ["By Color", "By Size", "By Shape"];
      for (var i: int in checkboxes) {
        const c: CheckBox = checkboxes[i];
        with (c) {
          addEventListener(Event.CHANGE, handleCheckbox);
          label = labels[i]; //Set label text
          labelPlacement = "bottom";//Arrange label to be below checkbox
          move(instructions.stage.stageWidth / 4 * (i + 1) - width / 2, 220);
        }
        addChild(c);
      }
    }
    
    //Handler method when you select a checkbox
    private function handleCheckbox(e: Event) {
      if (checkboxes.every(function(c: CheckBox, index: int, array: Array) {
        return !c.selected;
      })) {
        startBtn.enabled = false;
      } else {
        startBtn.enabled = true;
      }
    }
    
    //Handler method for starting a game
    public function startGame(e: MouseEvent) {
      if (e.target.enabled) {
        var labels = checkboxes.filter(function(c: CheckBox, index: int, arr: Array) {
          return c.selected == true;
        }).map(function(c: CheckBox, index: int, arr: Array) {
          return c.label.substring(3);
        });
        trace("The labels are", labels)
      }
    }
  }
}
