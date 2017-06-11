package;

import flixel.FlxGame;
import openfl.display.Sprite;

class Main extends Sprite
{
	public function new()
	{
		super();
		//Insertion point for the FlxGame
		addChild(new FlxGame(0, 0, MenuState, 1, 30, 30, true, false));
	}
}