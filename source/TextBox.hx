package;

import flixel.FlxState;
import flixel.text.FlxText;
import flixel.addons.text.FlxTypeText;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.input.keyboard.FlxKey;
import flixel.FlxCamera;
import flixel.FlxG;
import flixel.system.FlxSound;
import openfl.Assets;

/**
 * ...
 * @author Jack
 */
class TextBox extends FlxState
{
	private var fontText:FlxTypeText;
	private var measureText:FlxText;
	private var textBox:FlxSprite;
	private var txtFinshed:Bool;
	private var textblip:FlxSound;
	private var TextToDisplay:Array<String>;
	private var TextArray:Array<String>;
	private var textBoxOutline:FlxSprite;
	private var DialogPosition:Int;
	private var DialogMax:Int;
	private var fontSize:Int;
	private var textName:String;
	private var X:Float;
	private var Y:Float;
		
	public function new(NewName:String, NewText:Array<String>, SoundFile:String, NewfontSize:Int, NewX:Float, NewY:Float) 
	{
		super();
		
		X = NewX;
		Y = NewY;

		this.fontSize = NewfontSize;

		this.textName = NewName;

		this.TextToDisplay = new Array<String>();

		this.TextArray = new Array<String>();
		this.TextArray = NewText;

		this.DialogPosition = 0;
		this.DialogMax = NewText.length - 1;	

		if (textName != null)
		{
			this.TextToDisplay[this.DialogPosition] = this.textName + " : " + this.TextArray[this.DialogPosition];
		}
		else
		{
			this.TextToDisplay[this.DialogPosition] = this.TextArray[this.DialogPosition];
		}

		this.textblip = new FlxSound();
		this.textblip.looped = true;
		this.textblip.loadStream(SoundFile, true, false);
		add(this.textblip);

		this.textBox = new FlxSprite(X - 150, Y - 150);

		this.textBox.loadGraphic("assets/images/Textbox.png");

		
		this.measureText = new FlxText(X, Y, 300, TextToDisplay[DialogPosition], fontSize);
		this.measureText.setFormat("assets/data/PressStart2P.ttf", fontSize, FlxColor.WHITE);

		

		//this.textBox = new FlxSprite(X - 15, Y - 15);
		
		//this.textBox.makeGraphic(Std.int(measureText.width) + 30, Std.int(measureText.height) + 30, FlxColor.BLUE);
		//this.textBox.loadGraphic("assets/images/textbox.png", 200, 300);
		
	this.textBox.setGraphicSize(Std.int(measureText.width) + 50, 0);

		this.fontText = new FlxTypeText(X, Y, 250, TextToDisplay[DialogPosition], fontSize, false);

		this.fontText.setFormat("assets/data/PressStart2P.ttf", fontSize, FlxColor.BLUE);

		// this.textBoxOutline = new FlxSprite(textBox.x - 5, textBox.y - 5);
		
		// this.textBoxOutline.makeGraphic(Std.int(textBox.width) + 10, Std.int(textBox.height) + 10, FlxColor.GRAY);
		
		this.txtFinshed = false;
		
	}

	public function play():Void
	{
		//add(this.textBoxOutline);
		add(this.textBox);
		add(this.fontText);
		

		this.fontText.start(0.02, true, false, null, ReportFinish);
		this.textblip.play(true, 0);
	}

	public function checkDialogMax():Bool
	{
		if (this.DialogPosition == this.DialogMax)
		{
			return true;
		}
		else
		{
			return false;
		}
	}

	public function Continue():Void
	{
		trace(DialogPosition);
		this.DialogPosition += 1;

		if (this.textName != null)
		{
			this.TextToDisplay[DialogPosition] = this.textName + " : " + this.TextArray[DialogPosition];
		}
		else
		{
			this.TextToDisplay[DialogPosition] = this.TextArray[DialogPosition];
		}


		resetText();
		
		this.fontText.start(0.02, true, false, null, ReportFinish);
		this.textblip.play(true, 0);
	}

	private function resetText():Void
	{
		remove(this.fontText);
		this.fontText = null;

		this.fontText = new FlxTypeText(X, Y, 250, TextToDisplay[DialogPosition], fontSize, false);
		this.fontText.setFormat("assets/data/PressStart2P.ttf", fontSize, FlxColor.BLUE);

		add(this.fontText);

	}

	public function reset():Void
	{
		remove(this.textBox);
		remove(this.fontText);
		//remove(this.textBoxOutline);
		this.textblip.stop();
		this.DialogPosition = 0;
	}
	
	public function SwitchedIsFinished():Void
	{
		this.txtFinshed = !this.txtFinshed;
	}
	
	public function IsFinished():Bool
	{
		return this.txtFinshed;
	}

	private function ReportFinish():Void
	{
		this.SwitchedIsFinished();
		this.textblip.stop();
	}
}