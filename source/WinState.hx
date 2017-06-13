package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.text.FlxText;

class WinState extends FlxState
{
    private var TxtBox:TextBox;
    private var TextArray:Array<String>;

    public override function create()
    {
        super.create();
        TextArray = new Array<String>();

        TextArray[0] = "You got me...";
        TextArray[1] = "I throw up my hands";
        TextArray[2] = "You may have got me...";
        TextArray[3] = "But you will never stop our plans!";

        this.TxtBox = new TextBox("Emma", TextArray, "assets/sounds/Text.ogg", 8, (480 - (480 / 4)) - 200, 300);

        add(this.TxtBox);

        this.TxtBox.play();

        
        
    }

    public override function update(elapsed:Float):Void
    {
        super.update(elapsed);

            if (FlxG.mouse.justReleased)
            {
                if (TxtBox.checkDialogMax())
                {
                    var txt:FlxText = new FlxText();
                    txt.text = "Thanks for playing";
                    txt.x = 640 / 2 - txt.text.length * 8;
                    txt.y = 480 / 2;
                    txt.setFormat("assets/data/PressStart2P.ttf", 20, FlxColor.WHITE, CENTER);
                    add(txt);
                }
                else
                {
                    TxtBox.Continue();
                }
            }
    }
}