package;

//Import necessary libraries from flixel
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.input.gamepad.FlxGamepad;

class MenuState extends FlxState
{
	
	// Create appropriate variable used in the menu
	private var TitleText:FlxText;
	private var playButton:FlxButton;
	private var menuText:FlxText;

	override public function create():Void
	{
		// Calls the constructor
		super.create();
		
		// Instantiates the array which stores the menubuttons
		playButton = new FlxButton(640 / 2 , 480 / 2, "Play", playButtonPressed);

		// Adds the menu buttons to the State
		playButton.scale.x = 1.5;
		playButton.scale.y = 1.5;
		add(playButton);
		

		// Creates the Guilty Fellows title
		TitleText = new FlxText(100, 100);
		TitleText.text = "Guilty Fellows";
		TitleText.setFormat("assets/data/PressStart2P.ttf", 20, FlxColor.WHITE, CENTER);
		TitleText.setBorderStyle(OUTLINE, FlxColor.RED, 1);
		add(TitleText);
		
		FlxG.sound.playMusic("assets/music/IntroMusic.ogg", FlxG.sound.volume, true);

		FlxG.mouse.visible = true;
	}

	private function playButtonPressed():Void
	{
		FlxG.switchState(new IntroState());
	}
	override public function update(elapsed:Float):Void
	{ 
		super.update(elapsed);
	}
}