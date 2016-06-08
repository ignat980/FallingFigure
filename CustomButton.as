package {
  
  import flash.display.SimpleButton;
  import flash.display.Sprite;
  import flash.text.TextField;
  import flash.text.TextFormat;
  import flash.text.TextFormatAlign;
  import flash.text.TextFieldAutoSize;
  
  public class CustomButton extends SimpleButton {
    public var labels: Array;
    private var upbg: Sprite
    private var downbg: Sprite
    private var overbg: Sprite
    
    public function CustomButton(labelText: String = "", color: Number = 0xEEEE00) {
      super()
      with ((upbg = new Sprite()).graphics) {
        beginFill(color);
        lineStyle(3);
        drawRect(-62, -36.5, 124, 73);
      }
      with ((downbg = new Sprite()).graphics) {
        beginFill(FigureUtil.shadeColor(color, -0.3));
        lineStyle(3);
        drawRect(-62, -36.5, 124, 73);
      }
      with ((overbg = new Sprite()).graphics) {
        beginFill(FigureUtil.shadeColor(color, 0.3));
        lineStyle(3);
        drawRect(-62, -36.5, 124, 73);
      }
      labels = [new TextField, new TextField, new TextField]
      for (var i: int in labels) {
        with (labels[i]) {
          width = 120
          autoSize = TextFieldAutoSize.CENTER;
          wordWrap = true;
          defaultTextFormat = new TextFormat("Times New Roman", 22, null, true, null, null, null, null, TextFormatAlign.CENTER);
          text = labelText;
          at(-width / 2, -height / 2)
        }
      }
      upbg.addChild(labels[0])
      downbg.addChild(labels[1])
      overbg.addChild(labels[2])
      upState = upbg
      downState = downbg
      overState = overbg
    }
  }

}
