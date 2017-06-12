package;

import openfl.Assets;
import haxe.Json;

class DialogManager
{
    private var fileNameToLoad:String;

    public function new(FileName:String)
    {
        this.fileNameToLoad = FileName;
    }

    public function LoadDialog(NewID:Int):Dynamic
    {
        var jsonOutput = Assets.getText(this.fileNameToLoad);
        var jsonData:Dynamic = Json.parse(jsonOutput);

        for (i in 0...8)
        {
            if (jsonData[i].id == NewID)
            {
                return jsonData[i];

            }
        }
        return null;
    }
}