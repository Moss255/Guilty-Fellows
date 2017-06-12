package lime;


import lime.utils.Assets;


class AssetData {

	private static var initialized:Bool = false;
	
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var path = new #if haxe3 Map <String, #else Hash <#end String> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();	
	
	public static function initialize():Void {
		
		if (!initialized) {
			
			path.set ("assets/images/textbox-smaller.png", "assets/images/textbox-smaller.png");
			type.set ("assets/images/textbox-smaller.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/3.gif", "assets/images/3.gif");
			type.set ("assets/images/3.gif", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/textbox.png", "assets/images/textbox.png");
			type.set ("assets/images/textbox.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/images-go-here.txt", "assets/images/images-go-here.txt");
			type.set ("assets/images/images-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/music/Factory.mp3", "assets/music/Factory.mp3");
			type.set ("assets/music/Factory.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
			path.set ("assets/music/Factory.ogg", "assets/music/Factory.ogg");
			type.set ("assets/music/Factory.ogg", Reflect.field (AssetType, "music".toUpperCase ()));
			path.set ("assets/music/IntroMusic.mp3", "assets/music/IntroMusic.mp3");
			type.set ("assets/music/IntroMusic.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
			path.set ("assets/music/IntroMusic.ogg", "assets/music/IntroMusic.ogg");
			type.set ("assets/music/IntroMusic.ogg", Reflect.field (AssetType, "music".toUpperCase ()));
			path.set ("assets/music/music-goes-here.txt", "assets/music/music-goes-here.txt");
			type.set ("assets/music/music-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/sounds/LowText.ogg", "assets/sounds/LowText.ogg");
			type.set ("assets/sounds/LowText.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/Text.mp3", "assets/sounds/Text.mp3");
			type.set ("assets/sounds/Text.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
			path.set ("assets/sounds/Text.ogg", "assets/sounds/Text.ogg");
			type.set ("assets/sounds/Text.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/sounds-go-here.txt", "assets/sounds/sounds-go-here.txt");
			type.set ("assets/sounds/sounds-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/PressStart2P.woff", "assets/data/PressStart2P.woff");
			type.set ("assets/data/PressStart2P.woff", Reflect.field (AssetType, "binary".toUpperCase ()));
			path.set ("assets/data/Characters.json", "assets/data/Characters.json");
			type.set ("assets/data/Characters.json", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/PressStart2P.ttf", "assets/data/PressStart2P.ttf");
			type.set ("assets/data/PressStart2P.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("assets/data/PressStart2P.eot", "assets/data/PressStart2P.eot");
			type.set ("assets/data/PressStart2P.eot", Reflect.field (AssetType, "binary".toUpperCase ()));
			path.set ("assets/data/data-goes-here.txt", "assets/data/data-goes-here.txt");
			type.set ("assets/data/data-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/PressStart2P.svg", "assets/data/PressStart2P.svg");
			type.set ("assets/data/PressStart2P.svg", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("flixel/sounds/beep.ogg", "flixel/sounds/beep.ogg");
			type.set ("flixel/sounds/beep.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/sounds/flixel.ogg", "flixel/sounds/flixel.ogg");
			type.set ("flixel/sounds/flixel.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/fonts/nokiafc22.ttf", "flixel/fonts/nokiafc22.ttf");
			type.set ("flixel/fonts/nokiafc22.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/fonts/monsterrat.ttf", "flixel/fonts/monsterrat.ttf");
			type.set ("flixel/fonts/monsterrat.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/images/ui/button.png", "flixel/images/ui/button.png");
			type.set ("flixel/images/ui/button.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/images/logo/default.png", "flixel/images/logo/default.png");
			type.set ("flixel/images/logo/default.png", Reflect.field (AssetType, "image".toUpperCase ()));
			
			
			initialized = true;
			
		} //!initialized
		
	} //initialize
	
	
} //AssetData
