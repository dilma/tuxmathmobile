
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

import nme.display.StageAlign;
import nme.display.StageScaleMode;
import nme.Lib;
import nape.shape.Polygon;
import nape.space.Space;
import nape.util.ShapeDebug;
import nape.geom.Vec2;
import nape.phys.Body;
import nape.phys.BodyType;
import nme.events.Event;
import nme.Assets;

/**
 * ...
 * @author Deepak Aggarwal
 */

class Main 
{
	//var deep:BitmapToBody;
	static public function main() 
	{
		var stage = Lib.current.stage;
		stage.scaleMode = StageScaleMode.NO_SCALE;
		stage.align = StageAlign.TOP_LEFT;
		
		
		
		
		
		var stage = Lib.current.stage;
		stage.scaleMode = StageScaleMode.NO_SCALE;
		stage.align = StageAlign.TOP_LEFT;
		// entry point
		var space:Space = new Space(new Vec2(0, 300));

		var debug:ShapeDebug = new ShapeDebug(600, 600, 0x333333);
		Lib.current.addChild(debug.display);

		var border:Body = new Body(BodyType.STATIC);
		border.shapes.add(new Polygon(Polygon.rect(0, 0, -40, 600)));
		border.shapes.add(new Polygon(Polygon.rect(600,0,40,600)));
		border.shapes.add(new Polygon(Polygon.rect(0,0,600,-40)));
		border.shapes.add(new Polygon(Polygon.rect(0, 600, 600, 40)));
		border.space = space;

		var block:Polygon = new Polygon(Polygon.box(50, 50));
		
		var body = BitmapToBody.bitmapToBody(Assets.getBitmapData("assets/spaceship.png"), 0x80, new Vec2(6,6));
		body.position.setxy(200,100);
		body.space = space;
		Lib.current.addChild(body.graphic);

		Lib.current.addEventListener(Event.ENTER_FRAME, function (_:Event):Void {
		debug.clear();
		space.step(1 / stage.frameRate, 10, 10);
		debug.draw(space);
		debug.flush();
		});
	}
	
}