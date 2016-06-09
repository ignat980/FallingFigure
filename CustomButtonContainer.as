package {
  
  import flash.display.Sprite;
  import flash.text.TextField;
  import flash.text.TextFormat;
  import flash.text.TextFormatAlign;
  import flash.text.TextFieldAutoSize;
  
  public class CustomButtonContainer extends Sprite {
    public var label: TextField;
    private var button: _CustomButton;
    
    public function CustomButtonContainer(labelText: String = "", color: Number = 0xEEEE00) {
      addChild(button = new _CustomButton(color))
      with (label = new TextField) {
        width = 120
        autoSize = TextFieldAutoSize.CENTER;
        wordWrap = true;
        defaultTextFormat = new TextFormat("Times New Roman", 22, null, true, null, null, null, null, TextFormatAlign.CENTER);
        selectable = false
        mouseEnabled = false
        text = labelText;
        at(-width / 2, -height / 2)
      }
      addChild(label)
    }
    
    
    public function get enabled():Boolean {
       return button.enabled;
    }

    public function set enabled(newValue:Boolean):void {
      button.enabled = enabled;
    }
  }
}

import flash.display.SimpleButton;
import flash.display.Shape;

class _CustomButton extends SimpleButton {
  
  public function _CustomButton(color: Number = 0xEEEE00) {
    super()
    upState = new ButtonState(color)
    downState = new ButtonState(color, -0.3)
    overState = new ButtonState(color, 0.3)
    hitTestState = overState
    useHandCursor = true
  }

}

class ButtonState extends Shape {
  private var bgColor: uint;
  private var brightness: Number;
  
  public function ButtonState(color, brightness: Number = 0): void {
    super()
    this.bgColor = color
    this.brightness = brightness
    draw();
  }
  
  private function draw(): void {
    with (this.graphics) {
      beginFill(FigureUtil.shadeColor(this.bgColor, this.brightness));
      lineStyle(3);
      drawRect(-62, -36.5, 124, 73);
    }
  }
}
