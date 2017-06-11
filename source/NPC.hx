package;

import flixel.FlxG;
import openfl.Assets;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import haxe.Json;
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

	
	public function new(NewID:Int) 
	{
		super();

 		this.loadGraphic("assets/images/" + NewID + ".gif");

		//this.makeGraphic(128, 128, FlxColor.RED);
		this.x = 640 / 2 - 128;
		this.y = 50;

		Text = new Array<String>();

		dialogControl = new DialogManager("assets/data/Characters.json");

		var tempNPC = dialogControl.LoadDialog(NewID);
		
		this.Name = tempNPC.name;
		this.Text = tempNPC.text;
		this.IsSuspect = tempNPC.suspect;

		#if flash
		this.txtbox = new TextBox(this.Name, this.Text, "assets/sounds/Text.mp3", 8, (480 - (480 / 4)) - 150, 300);
		#else
		this.txtbox = new TextBox(this.Name, this.Text, "assets/sounds/Text.ogg", 8, (480 - (480 / 4)) - 150, 300);
		#end
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