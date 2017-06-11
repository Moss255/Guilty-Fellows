package;

import openfl.Assets;
import haxe.Json;

class DialogManager
{
    private var fileNameToLoad:String;

    public function new(FileName:String)
    {
        //this.Text = new Array<String>();

        this.fileNameToLoad = FileName;
    }

    public function LoadDialog(NewID:Int):Dynamic
    {
        var jsonOutput = Assets.getText(this.fileNameToLoad);
        var jsonData:Dynamic = Json.parse(jsonOutput);

        for (i in 0...8)
        {
            trace(jsonData[i].id == NewID);
            if (jsonData[i].id == NewID)
            {
                trace(jsonData[i]);
                return jsonData[i];

            }
        }
        return null;
    }
}

//
// IF JSON doesn't work out, check below
//

// var xmlOutput = Assets.getText(this.fileNameToLoad);

//         var xmlData = Xml.parse(xmlOutput);
//         for (i in xmlData.elements())
//         {
//             var fast:Fast = new Fast(i);
//             trace(fast.hasNode.name);
//             trace(fast.node.name.innerData);
//             trace(fast.node.text.innerData);
//             // trace(var id = person.ID);
//             // trace(var name = person.name.innerData());
//             // trace(var text = person.text.innerData());
           
//         }