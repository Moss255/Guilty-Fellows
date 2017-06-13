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

		lives = 3;

		NPCcounter = 0;

		switchButton = new Array<FlxButton>();
		switchButton[0] = new FlxButton(20, 480 / 2, "<<", switchSubjectleft);
		switchButton[1] = new FlxButton(640 - 100, 480 / 2, ">>", switchSubjectright);
		//switchButton[2] = new FlxButton(640 / 2, 480 - 50, "Hear statement", playStatement);
		switchButton[3] = new FlxButton(640 / 2 + 100, 480 - 50, "Suspect!", suspectButton);
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
				
				lives -= 1;
				var txtArray:Array<String> = new Array<String>();
				txtArray[0] = "You have to be kidding! It can't be them";

				this.suspectTxtBox = new TextBox("???", txtArray, "assets/sounds/Text.ogg", 9, 110, 320);

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
		}
		currentNPC = Peers[NPCcounter];
	}

	private function switchSubjectleft():Void
	{
		
		if (CheckNPC())
		{
			currentNPC.gettxtBox().reset();
			remove(currentNPC.gettxtBox());
			currentNPC.gettxtBox().SwitchedIsFinished();
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
		add(currentNPC);
	} 

	private function switchSubjectright():Void
	{
		if (CheckNPC())
		{
			currentNPC.gettxtBox().reset();
			remove(currentNPC.gettxtBox());
			currentNPC.gettxtBox().SwitchedIsFinished();
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
	}

	public override function update(elapsed:Float):Void
	{
		super.update(elapsed);

		if (FlxG.mouse.justReleased)
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
