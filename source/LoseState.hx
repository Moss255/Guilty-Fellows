package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.text.FlxText;

class LoseState extends FlxState
{
    private var TxtBox:TextBox;
    private var TextArray:Array<String>;

    public override function create()
    {
        super.create();
        TextArray = new Array<String>();
        TextArray[0] = "You couldn't find them!";
        TextArray[1] = "THAT OUTRAGEOUS!";
        TextArray[2] = "We are immidately taking you off the case!";

        #if flash
        this.TxtBox = new TextBox("???", TextArray, "assets/sounds/Text.mp3", 8, (480 - (480 / 4)) - 200, 300);
        #else
        this.TxtBox = new TextBox("???", TextArray, "assets/sounds/Text.ogg", 8, (480 - (480 / 4)) - 200, 300);
        #end
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
                    txt.text = "They got away...";
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