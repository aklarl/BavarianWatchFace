/*
 *  BoarischesWatchFace is a Watch Face for a large set of Garmin smart watches.
 *
 *  Copyright (C) 2017  Annabelle Klarl
 *  All rights reserved.
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 *
 */

using Toybox.WatchUi as WatchUi;
using Toybox.Graphics as Graphics;
using Toybox.System as Sys;
using Toybox.Lang as Lang;
using Toybox.Application as App;

var fontS = Graphics.FONT_SMALL;
var fontL = Graphics.FONT_LARGE;
var fontSigns = Graphics.FONT_TINY;

var justification = Graphics.TEXT_JUSTIFY_CENTER;
	
var backgroundColor = Graphics.COLOR_BLACK;
var minutesColor = Graphics.COLOR_WHITE;
var hoursColor = Graphics.COLOR_RED;
	
var dotRadius = 3;
var dotDistance = 2*dotRadius + 10;
var dotY = 32;

var unactiveDotColor = Graphics.COLOR_WHITE;
var activeDotColor = Graphics.COLOR_RED;

class BavarianGarminWatchFaceView extends WatchUi.WatchFace {

	var xcenter = WatchUi.LAYOUT_HALIGN_CENTER;
	var ycenter = WatchUi.LAYOUT_VALIGN_CENTER;
	
	private var hoursToText = { 
		1 =>  "oans", 
		2 =>  "zwoa", 
		3 =>  "drei", 
		4 =>  "viere",
		5 =>  "fimfe",
		6 =>  "sechse",
		7 =>  "simme",
		8 =>  "ochde",
		9 =>  "neine",
		10 => "zehne",
		11 => "eife",
		0 =>  "zweife"
	};
	
	private var minutesToSeparator = {
		0 => "",
		1 => "noch",
		2 => "noch",
		3 => "noch",
		4 => "noch",
		5 => "voa hoiba",
		6 => "",
		7 => "noch hoiba",
		8 => "voa",
		9 => "",
		10 => "voa",
		11 => "voa"	
	};
		
	private var minutesToText = {
		0 =>  "umara",
		1 =>  "fimf",
		2 =>  "zehn",
		3 =>  "viadl",
		4 =>  "zwanzg",
		5 =>  "fimf",
		6 =>  "hoiba",
		7 =>  "fimf",
		8 =>  "zwanzg",
		9 =>  "dreiviadl",
		10 => "zehn",
		11 => "fimf"	
	};

    function initialize() {
        WatchFace.initialize();
    }

    // load resources
    function onLayout(dc) {
    	BavarianGarminWatchFaceApp.refreshSettings();
    
        me.xcenter = dc.getWidth()/2;
        me.ycenter = dc.getHeight()/2;
    }

    // update the view
    function onUpdate(dc) {
    		
		// get the current time
        var clockTime = Sys.getClockTime();
       	var hours = clockTime.hour;
	    var minutes = clockTime.min;
	    
        // get text for minutes
        var minutesOutput = minutesToText[ ( (minutes+2)%60 ) /5 ].toUpper();
        
        // get text for separator
        var separatorOutput = minutesToSeparator[ ( (minutes+2)%60 ) /5 ].toUpper();
        
        // get text for hours        
	    var hoursOutput = "";
        if (minutes <= 22) { hoursOutput = hoursToText[hours % 12]; }
        else { hoursOutput = hoursToText[(hours + 1) % 12]; }
        hoursOutput = hoursOutput.toUpper();
        
   		// set background color
		dc.setColor(backgroundColor, backgroundColor);
		dc.clear();

		// compute offsets for text
		var ascentS = dc.getFontAscent(fontS);
		var descentS = dc.getFontDescent(fontS);
		var descentL = dc.getFontDescent(fontL);
		var textHeightS = ascentS - descentS;
		
		var offsetSeparator = 0;
		var offsetMinutes = 0;
		var offsetHours = 0;
		if (!separatorOutput.equals("")) {
			offsetSeparator = descentS + textHeightS/2;
			offsetMinutes = textHeightS + 6;
			offsetHours = ascentS - descentL + 10;
		}
		else {
			offsetSeparator = 0;
			offsetMinutes = ascentS + 4;
			offsetHours = -descentL + 6;
		}
		
		// set time
		dc.setColor(minutesColor, Graphics.COLOR_TRANSPARENT);
		dc.drawText(me.xcenter, me.ycenter - offsetSeparator - offsetMinutes, fontS, minutesOutput, justification);
		dc.drawText(me.xcenter, me.ycenter - offsetSeparator    , fontS, separatorOutput, justification);		
	
		dc.setColor(hoursColor, Graphics.COLOR_TRANSPARENT);		
		dc.drawText(me.xcenter, me.ycenter - offsetSeparator + offsetHours, fontL, hoursOutput, justification);
		
		// set exact minutes
		var minute = (minutes+2)%60 %5;
		var textY = dotY - dc.getFontDescent(fontSigns) - (dc.getFontAscent(fontSigns)-dc.getFontDescent(fontSigns))/2;
		
		if (minute == 0) { dc.setColor(activeDotColor, Graphics.COLOR_TRANSPARENT); }
		else { dc.setColor(unactiveDotColor, Graphics.COLOR_TRANSPARENT); }
		dc.drawText(me.xcenter - 2*dotDistance, textY, fontSigns, "-", justification);
		//dc.fillCircle(me.xcenter - 2*dotDistance, dotY, dotRadius);
		
		if (minute == 1) { dc.setColor(activeDotColor, Graphics.COLOR_TRANSPARENT); }
		else { dc.setColor(unactiveDotColor, Graphics.COLOR_TRANSPARENT); }
		dc.drawText(me.xcenter - dotDistance, textY, fontSigns, "-", justification);
		//dc.fillCircle(me.xcenter - dotDistance, dotY, dotRadius);
		
		if (minute == 2) { dc.setColor(activeDotColor, Graphics.COLOR_TRANSPARENT); }
		else { dc.setColor(unactiveDotColor, Graphics.COLOR_TRANSPARENT); }
		dc.fillCircle(me.xcenter, dotY, dotRadius);
		
		if (minute == 3) { dc.setColor(activeDotColor, Graphics.COLOR_TRANSPARENT); }
		else { dc.setColor(unactiveDotColor, Graphics.COLOR_TRANSPARENT); } 
		dc.drawText(me.xcenter + dotDistance, textY, fontSigns, "+", justification);
		//dc.fillCircle(me.xcenter + dotDistance, dotY, dotRadius);
		
		if (minute == 4) { dc.setColor(activeDotColor, Graphics.COLOR_TRANSPARENT); }
		else { dc.setColor(unactiveDotColor, Graphics.COLOR_TRANSPARENT); }
		dc.drawText(me.xcenter + 2*dotDistance, textY, fontSigns, "+", justification);
		//dc.fillCircle(me.xcenter + 2*dotDistance, dotY, dotRadius);
    }
}
