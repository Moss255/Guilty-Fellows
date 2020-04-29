package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.math.FlxPoint;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.math.FlxRandom;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	private var switchButton:Array<FlxButton>;
	private var Peers:Array<NPC>;
	private var NPCcounter:Int;
	private var rnd:FlxRandom;
	private var currentNPC:NPC;
	private var lives:Int;
	private var suspectTxtBox:TextBox;
	
	public override function create():Void
	{
		super.create();

		var bg = new FlxSprite(0, 0);

		bg.loadGraphic('assets/images/bg.png');
		
		add(bg);

		lives = 3;

		NPCcounter = 0;

		switchButton = new Array<FlxButton>();
		switchButton[0] = new FlxButton(4, 164, "<<", switchSubjectleft);
		switchButton[1] = new FlxButton(684, 156, ">>", switchSubjectright);
		switchButton[2] = new FlxButton(316, 4, "Suspect!", suspectButton);
		for (button in switchButton) 
		{
			add(button);
			button.scale.x = 1.5;
			button.scale.y = 1.5;
		}
		Peers = new Array<NPC>();

		FlxG.sound.playMusic("assets/music/Factory.ogg", 0.125, true);
		
		loadSubjects();
	}

	private function suspectButton()
	{
		//var sound:FlxSound;
		var sound = FlxG.sound.load("assets/sounds/Fail.ogg");
		
		if (CheckNPC())
		{
			currentNPC.gettxtBox().reset();
			if (currentNPC.GetIsSuspect() == true)
			{
				FlxG.switchState(new WinState());
				FlxG.sound.music.stop();
			}
			else
			{
				sound.volume = 0.75;
				sound.play();
				lives -= 1;
				var txtArray:Array<String> = new Array<String>();
				txtArray[0] = "You have to be kidding! It can't be them";

				this.suspectTxtBox = new TextBox("???", txtArray, "assets/sounds/Text.ogg", 20, 32, 368);

				add(suspectTxtBox);
				suspectTxtBox.play();

			}
		}
	}

	private function CheckNPC()
	{
		if (currentNPC != null)
		{
			return true;
		}
		else
		{
			return false;
		}
	}

	private function playStatement()
	{
		if (CheckNPC())
		{
			currentNPC.gettxtBox().reset();
			currentNPC.gettxtBox().play();
			add (currentNPC.gettxtBox());
			if (currentNPC.gettxtBox().IsFinished())
			{
				while (!currentNPC.gettxtBox().checkDialogMax())
				{
				currentNPC.gettxtBox().Continue();	
				}
			}
			
		}	
		else
		{
			trace("Unable to find NPC");
		}
	}


	private function loadSubjects():Void
	{
		for (i in 0...8)
		{
			Peers.insert(i, new NPC(i));
			add(Peers[i]);
			Peers[i].visible = false;
		}
		currentNPC = Peers[NPCcounter];
		currentNPC.visible = true;
	}

	private function switchSubjectleft():Void
	{
		
		if (CheckNPC())
		{
			trace(currentNPC.gettxtBox().DialogPosition);

			currentNPC.gettxtBox().reset();

			trace(currentNPC.gettxtBox().DialogPosition);

			currentNPC.gettxtBox().SwitchedIsFinished();

			trace(currentNPC.gettxtBox().DialogPosition);
			currentNPC.visible = false;
		}
		
		if (NPCcounter == 0)
		{
			NPCcounter = 7;
		}
		else
		{
			NPCcounter -= 1;
		}

		currentNPC = Peers[NPCcounter];
		currentNPC.visible = true;
	} 

	private function switchSubjectright():Void
	{
		if (CheckNPC())
		{
			currentNPC.gettxtBox().reset();
			currentNPC.gettxtBox().SwitchedIsFinished();
			currentNPC.visible = false;
		}
		

		if (NPCcounter == 7)
		{
			NPCcounter = 0;
		}
		else
		{
			NPCcounter += 1;
		}
		currentNPC = Peers[NPCcounter];
		currentNPC.visible = true;
	}

	public override function update(elapsed:Float):Void
	{
		super.update(elapsed);

		if (FlxG.mouse.justReleased && !switchButton[2].overlapsPoint(FlxG.mouse.getScreenPosition()))
        {
			playStatement();
			if (suspectTxtBox != null)
			{
				if (suspectTxtBox.IsFinished())
           		{
					suspectTxtBox.reset();
					remove(suspectTxtBox);
            	}
			}
            
        }
		
		if (lives == 0)
		{
			FlxG.switchState(new LoseState());
		}
	}
}
