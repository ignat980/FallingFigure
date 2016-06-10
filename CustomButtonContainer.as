package {
  
  import flash.display.Sprite;
  import flash.geom.Rectangle;
  import flash.text.TextField;
  import flash.text.TextFormat;
  import flash.text.TextFormatAlign;
  import flash.text.TextFieldAutoSize;
  
  public class CustomButtonContainer extends Sprite {
    public var label: TextField;
    private var button: _CustomButton;
    
    public function CustomButtonContainer(labelText: String = "", color: Number = 0xEEEE00, rect: Rectangle = null) {
      addChild(button = new _CustomButton(color, rect))
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
      button.label = label
      addChild(label)
    }
    
    public function get enabled(): Boolean {
      return button.enabled;
    }
    
    public function set enabled(newValue: Boolean): void {
      button.enabled = newValue;
    }
  }
}

import flash.display.SimpleButton;
import flash.display.Shape;
import flash.filters.DropShadowFilter;
import flash.geom.Rectangle;
import flash.text.TextField;

class _CustomButton extends SimpleButton {
  
  public function _CustomButton(color: Number = 0xEEEE00, rect: Rectangle = null) {
    super()
    this.upState = new ButtonState(color, 0, rect)
    var b = new ButtonState(color, -0.1, rect)
    b.filters = [new DropShadowFilter(0, 0, 0, .75, 20, 20, 1.7, 1, true)]
    this.downState = b
    this.overState = new ButtonState(color, 0.2, rect)
    this.hitTestState = overState
    this.useHandCursor = true
  }
  
  public function set label(value):void {
    this.downState.label = value
  }
  
  public function get label(): TextField {
    return this.downState.label;
  }

}

class ButtonState extends Shape {
  private var bgColor: uint;
  private var brightness: Number;
  private var drawRect: Rectangle;
  public var label: TextField;
  
  public function ButtonState(color: uint, brightness: Number = 0, rect: Rectangle = null): void {
    super()
    this.bgColor = color
    this.brightness = brightness
    this.drawRect = rect ? rect : new Rectangle(-62, -35, 124, 70);
    draw();
  }
  
  private function draw(): void {
    with (this.graphics) {
      beginFill(FigureUtil.shadeColor(this.bgColor, this.brightness));
      lineStyle(3);
      drawRect(this.drawRect.x, this.drawRect.y, this.drawRect.width, this.drawRect.height);
    }
  }
}
