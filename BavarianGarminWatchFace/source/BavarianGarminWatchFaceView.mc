/*
 *  BoarischesWatchFace is a Watch Face for a large set of Garmin smart watches.
 *
 *  Copyright (C) 2018  Annabelle Klarl
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
using Toybox.Time as Time;

class BavarianGarminWatchFaceView extends WatchUi.WatchFace {

	var xcenter = WatchUi.LAYOUT_HALIGN_CENTER;
	var ycenter = WatchUi.LAYOUT_VALIGN_CENTER;

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
        var today = Time.Gregorian.info(Time.now(), Time.FORMAT_SHORT);
       	var hours = today.hour;
	    var minutes = today.min;
	    
	    // get date
	    var dateOutput = Lang.format(
				"$1$.$2$.$3$",
				[today.day.format("%02d"), today.month.format("%02d"), (today.year % 100).format("%02d")]
			);
	    
        // get text for minutes
        var minutesIndex = ( (minutes+2)%60 ) /5;
        var minutesOutput = minutesToText[ minutesIndex ].toUpper();
        
        // get text for separator
        var separatorOutput = minutesToSeparator[ ( (minutes+2)%60 ) /5 ].toUpper();
        
        // get text for hours        
	    var hoursOutput = "";
        if (minutes < minutesWhenToJumpToNextHour) { hoursOutput = hoursToText[hours % 12]; }
        else { hoursOutput = hoursToText[(hours + 1) % 12]; }
        hoursOutput = hoursOutput.toUpper();
        
   		// set background color
		dc.setColor(backgroundColor, backgroundColor);
		dc.clear();

		// compute offsets for text
		var ascentS = dc.getFontAscent(fontS);
		var descentS = dc.getFontDescent(fontS);
		var ascentL = dc.getFontAscent(fontL);
		var descentL = dc.getFontDescent(fontL);
		var textHeightS = ascentS - descentS;
		var textHeightL = ascentL - descentL;
		
		var offsetSeparator = 0;
		var offsetMinutes = 0;
		var offsetHours = 0;
		if (!minutesOutput.equals("") && !separatorOutput.equals("")) {
			offsetMinutes = -textHeightS - 10;
			if (hoursCentered[minutesIndex]) {
				offsetHours -= descentL + textHeightL/2;
				offsetMinutes += offsetHours;
				offsetSeparator = ascentL - descentS + 14;
				offsetSeparator += offsetHours;
			}
			else {
				offsetSeparator -= descentS + textHeightS/2;
				offsetMinutes += offsetSeparator;
				offsetHours = ascentS - descentL + 14;
				offsetHours += offsetSeparator;
			}
		}
		else if (!minutesOutput.equals("") && separatorOutput.equals("")) {
			offsetSeparator = 0;
			if (hoursCentered[minutesIndex]) {
				offsetMinutes += -descentS + 6;
				offsetHours -= ascentL + 4;
			}
			else {
				offsetMinutes -= ascentS + 4;
				offsetHours += -descentL + 6;
			}
		}
		else if (minutesOutput.equals("") && separatorOutput.equals("")) {
			offsetMinutes = 0;
			offsetSeparator = 0;
			offsetHours -= descentL + textHeightL/2;
		}
		
		// set time
		dc.setColor(minutesColor, Graphics.COLOR_TRANSPARENT);
		dc.drawText(me.xcenter, me.ycenter + offsetMinutes, fontS, minutesOutput, justification);
		dc.drawText(me.xcenter, me.ycenter + offsetSeparator    , fontS, separatorOutput, justification);		
	
		dc.setColor(hoursColor, Graphics.COLOR_TRANSPARENT);		
		dc.drawText(me.xcenter, me.ycenter + offsetHours, fontL, hoursOutput, justification);
		
		// set exact minutes
		dotY = dc.getHeight() * 0.13;
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
		
		// set date
		if (showDate) {
			var dateY = dc.getHeight() - dotY - (dc.getFontAscent(fontNumbers)-dc.getFontDescent(fontNumbers))/2;
			if (dateY - (me.ycenter + offsetHours) < 56) { 
				dateY = (me.ycenter + offsetHours) + 56;
			}
			dc.setColor(minutesColor, Graphics.COLOR_TRANSPARENT);
			dc.drawText(me.xcenter, dateY, fontNumbers, dateOutput, justification);
		}
    }
}
