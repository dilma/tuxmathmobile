
/*=======================================================================================================
												LICENSE 
  =======================================================================================================
  
				The contents of this file are subject to the Mozilla Public
				License Version 2.0 (the "License"); you may not use this file
				except in compliance with the License. You may obtain a copy of
				the License at http://www.mozilla.org/MPL/2.0/

				Software distributed under the License is distributed on an "AS
				IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or
				implied. See the License for the specific language governing
				rights and limitations under the License.

				The Original Code is "Tuxmath"
				
				Copyright (C) 2012 by Tux4kids.  All Rights Reserved.
				Author : Deepak Aggarwal
  =======================================================================================================*/

package tuxkids;
import nme.display.Bitmap;
import nme.events.Event;
import nme.text.TextField;
import nme.text.TextFormat;
import nme.display.Sprite;
import nme.Lib;
import nme.text.TextFormatAlign;
import nme.events.MouseEvent;
import nme.Assets;

/**
 * ...
 * @author Deepak Aggarwal
 */

/**
 * Private static class used for fetching text to be shown on screen when a sublevel starts.
 */
private class ConstantText
{
	public static function getText(level:Int, sublevel:Int)
	{
		switch(level)
		{
			case 1:  // Addition
				switch(sublevel)
					{
						case 1:	return "Addition upto 5";							
						case 2: return "Addition upto 10";	
						case 3: return "Addition upto 15";	
						case 4: return "Addition upto 20";	
						case 5: return "Addition of two digit number";	
						case 6:	return "Addition question having missing number";	
						case 7:	return "Addition of two digit missing number";												
						case 8: return "Addition mixed mode";	
						case 9: return "Addition mixed mode";	
						case 10:return "Addition mixed mode";	
					}
					
			case 2:               // Subtraction
				switch(sublevel)
					{
						case 1:	return "Subtraction upto 5";							
						case 2: return "Subtraction upto 10";	
						case 3: return "Subtraction upto 15";	
						case 4: return "Subtraction upto 20";	
						case 5: return "Subtraction of two digit number";	
						case 6:	return "Subtraction question having missing number";	
						case 7:	return "Subtraction of two digit missing number";												
						case 8: return "Subtraction mixed mode";	
						case 9: return "Subtraction mixed mode";	
						case 10:return "Subtraction mixed mode";	
					}
					
			case 3:   // Addition and subtraction operations 
					switch(sublevel)
					{
						case 1:	return "Addition and Subtraction upto 5";							
						case 2: return "Addition and Subtraction upto 10";	
						case 3: return "Addition and Subtraction upto 15";	
						case 4: return "Addition and Subtraction upto 20";	
						case 5: return "Addition and Subtraction of two digit number";	
						case 6:	return "Addition and Subtraction question having missing number";	
						case 7:	return "Addition and Subtraction of two digit missing number";												
						case 8: return "Addition and Subtraction mixed mode";	
						case 9: return "Addition and Subtraction mixed mode";	
						case 10:return "Addition and Subtraction mixed mode";	
					}
					
			// Multiplication 
			case 4: switch(sublevel)
					{
						case 1: return "Multiple of 2";
						case 2: return "Multiple of 3"; 
						case 3: return "Multiple of 4";
						case 4: return "Multiple of 5";
						case 5: return "Multiple upto 2";
						case 6:	return "Multiple of 6";
						case 7: return "Multiple of 7";
						case 8: return "Multiple upto 7";
						case 9: return "Multiple of 8";
						case 10:return "Multiple of 9";
					}
			
					//Multiplication as well as revision
			case 5:
				if (sublevel >= 5)
				{
					return "Revision Addition, Subtraction,Multiplication";
				}
				switch(sublevel)
					{
						case 1: return "Multiple of 10";
						case 2: return "Multiple upto 10";
						case 3: return "Multiplication question having missing number";
						case 4: return "Multiplication mixed mode";
					}
					
					// Divide
			case 6: switch(sublevel)
					{
						case 1: return "Division by 2";
						case 2: return "Division by 3";
						case 3: return "Division by 4";
						case 4: return "Division by 5";
						case 5: return "Division upto 5";
						case 6: return "Division by 6";
						case 7: return "Division by 7";
						case 8: return "Division by 8";
						case 9: return "Division by 9";
						case 10:return "Division upto 9";
					}
			case 7: 
				if(sublevel>=7)
					return "Revising all arithmetic operation";
				switch(sublevel)
					{
						case 1: return "Division by 10";
						case 2: return "Division by 11";
						case 3: return "Division by 12";
						case 4: return "Division upto 12";
						case 5: return "Division question having missing number";
						case 6: return "Division mixed mode";  										
					}
			case 8:
				if (sublevel >= 8)
				{
					return "Factors of 2, 3, 5 and 7";
				}
				switch(sublevel)
					{
						case 1:
							return "Factors of 2";
						case 2:
							return "Factors of 3";
						case 3:
							return "Factors of 2 and 3";
						case 4:
							return "Factors of 5";
						case 5:
							return "Factors of 2, 3 and 5";
						case 6:
							return "Factors of 7";
						case 7:
							return "Factors of 5 and 7";
					}
			case 9:
				return "Pro Mode - Question having all types of question"; 
		}
		return "Not found";
	}
}

/**
 * Class which is used to display sublevel information when a sublevel starts
 */
class GameTutorial extends Sprite 
{
    var text_format:TextFormat;
	var text:TextField;
	/**
	 * Constructor.
	 */
	public function new() 
	{
		super();
		text_format = new TextFormat('Arial', 30, 0xffb717, true);
		text_format.align = TextFormatAlign.CENTER;
		text = new TextField();
		text.text = "tuxkids tuxkids tuxkids ";
		text.text += text.text;
		text.width = GameConstant.stageWidth * 0.7;
		text.height = GameConstant.stageHeight * 0.6;
		text.wordWrap = true;
		var textSize:Float = GameConstant.stageWidth * 0.65;                         //  Will cover 100% of button height
		// Setting size of text. 
		if (text.textWidth > textSize)
			while (text.textWidth > textSize)
			{
				text_format.size--;
				text.setTextFormat(text_format);
			}
		else
			while (text.textWidth < textSize)
			{
				text_format.size++;
				text.setTextFormat(text_format); 
			}
		// Setting position.
		text.x = GameConstant.stageWidth * 0.15;
		text.y = GameConstant.stageHeight * 0.2;
		addChild(text);
		// Adding ok button
		var ok_button:Sprite = Button.button("OK", 0x14B321, GameConstant.stageHeight * 0.2);
		ok_button.x = GameConstant.stageWidth - ok_button.width;
		ok_button.y = GameConstant.stageHeight - ok_button.height;
		ok_button.addEventListener(MouseEvent.CLICK, function(ev:Event) {
			// Dispatch event OK so that game can start.
			dispatchEvent(new Event("OK"));
		});
		addChild(ok_button);
	}
	/**
	 * Function Used to display text based on level and sublevel. <br>
	 * @param	level :- Current level. <br>
	 * @param	sublevel :- Current sublevel. <br>
	 */
	public function initializeText(level:Int, sublevel:Int)
	{
		// Fetching text to be displayed.
		text.text = ConstantText.getText(level, sublevel);
		text.setTextFormat(text_format);
	}
}