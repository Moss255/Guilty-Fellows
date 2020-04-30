package;

import flixel.FlxG;
import openfl.Assets;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import haxe.Json;
import flixel.math.FlxRandom;
/**
 * ...
 * @author Jack
 */
class NPC extends FlxSprite
{
	private var Name:String;
	private var Text:Array<String>;
	private var txtbox:TextBox;
	private var Iscontact:Bool;
	private var dialogControl:DialogManager;
	private var IsSuspect:Bool;
	private var dialogLines:Int;

	
	public function new(NewID:Int) 
	{
		super();

		var rnd:FlxRandom;

		rnd = new FlxRandom();

		rnd.resetInitialSeed();

 		this.loadGraphic("assets/images/P" + NewID + ".png");

		this.x = 272;
		this.y = 144;

		Text = new Array<String>();

		dialogControl = new DialogManager("assets/data/Characters.json");

		var tempNPC = this.dialogControl.LoadDialog(NewID);
		
		this.Name = tempNPC.name;
		this.Text = tempNPC.text;
		this.IsSuspect = tempNPC.suspect;
		
		this.txtbox = new TextBox(this.Name, this.Text, "assets/sounds/Text.ogg", 20, 32, 368);
	}

	public function getName():String
	{
		return this.Name;
	}
	
	public function gettxtBox():TextBox
	{
		return this.txtbox;
	}

	public function GetIsSuspect():Bool
	{
		return this.IsSuspect;
	}
	
	
}