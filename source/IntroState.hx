package;

import flixel.FlxState;
import flixel.text.FlxText;
import flixel.input.gamepad.FlxGamepad;
import flixel.FlxG;
import flixel.util.FlxColor;

/**
 * ...
 * @author Jack
 */
class IntroState extends FlxState
{
	private var introTxtBox:TextBox;
	private var introText:Array<String>;
	private var helpText:FlxText;

	public override function create() 
	{
		super.create();
		
		introText = new Array<String>();
		introText[0] = "There is a traitor in our mits";
		introText[1] = "The royals...";
		introText[2] = "They have been shot. Dead.";
		introText[3] = "We assigned you to conduct the interviews";
		introText[4] = "We took the liberty of rounding up some suspects";
		introText[5] = "You only get 3 shots to guess who it is";
		introText[6] = "Hopefully you can find the real culpurt";

		introTxtBox = new TextBox("???", introText, "assets/sounds/Text.ogg", 8, (480 - (480 /4 )) - 200, 300);

		add(introTxtBox);
		
		introTxtBox.play();
		
		helpText = new FlxText();
		helpText.text = "click to continue";
		helpText.x = 640 / 2 - helpText.text.length * 8;
		helpText.y = 480 - 30;
		helpText.setFormat("assets/data/PressStart2P.ttf", 11, FlxColor.WHITE, CENTER);
		add(helpText);
	}
	
	public override function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		var gamepad = FlxG.gamepads.lastActive;
		
		if (FlxG.mouse.justReleased)
		{
			if (introTxtBox.checkDialogMax())
			{
				FlxG.switchState(new PlayState());
				FlxG.sound.music.stop();
			}
			else
			{
				introTxtBox.Continue();
			}
			
		}
	}
	
}