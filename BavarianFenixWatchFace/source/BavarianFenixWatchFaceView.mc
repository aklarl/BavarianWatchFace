using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Lang as Lang;
using Toybox.Application as App;

class BavarianFenixWatchFaceView extends Ui.WatchFace {

	private var fontS = Gfx.FONT_SMALL;
	private var fontM = Gfx.FONT_MEDIUM;
	private var fontL = Gfx.FONT_LARGE;
	
	private var justification = Gfx.TEXT_JUSTIFY_CENTER;
	
	private var xcenter = WatchUi.LAYOUT_HALIGN_CENTER;
	private var ycenter = WatchUi.LAYOUT_VALIGN_CENTER;
	
	private var backgroundColor = Gfx.COLOR_BLACK;
	private var minutesColor = Gfx.COLOR_WHITE;
	private var hoursColor = Gfx.COLOR_RED;
	
	private var dotRadius = 3;
	private var dotDistance;
	private var dotY = 30;
	private var unactiveDotColor = Gfx.COLOR_WHITE;
	private var activeDotColor = Gfx.COLOR_RED;
	

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
        me.fontS = Ui.loadResource(Rez.Fonts.BavarianFontS);
        me.fontM = Ui.loadResource(Rez.Fonts.BavarianFontM);
        me.fontL = Ui.loadResource(Rez.Fonts.BavarianFontL);
        
        me.xcenter = dc.getWidth()/2;
        me.ycenter = dc.getHeight()/2;
		
		me.dotDistance = 2*me.dotRadius + 10;
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
		dc.setColor(me.backgroundColor, me.backgroundColor);
		dc.clear();

		//minutesOutput = minutesToText[9].toUpper();
		//separatorOutput = minutesToSeparator[7].toUpper();
		//separatorOutput = "";
		//hoursOutput = hoursToText[0].toUpper();
		
		// compute offsets
		var ascentS = dc.getFontAscent(me.fontS);
		var descentS = dc.getFontDescent(me.fontS);
		var descentL = dc.getFontDescent(me.fontL);
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
			offsetMinutes = ascentS + 3;
			offsetHours = -descentL + 5;
		}
		
		// set time
		dc.setColor(me.minutesColor, Gfx.COLOR_TRANSPARENT);
		dc.drawText(me.xcenter, me.ycenter - offsetSeparator - offsetMinutes, me.fontS, minutesOutput, me.justification);
		dc.drawText(me.xcenter, me.ycenter - offsetSeparator    , me.fontS, separatorOutput, me.justification);		
	
		dc.setColor(me.hoursColor, Gfx.COLOR_TRANSPARENT);		
		dc.drawText(me.xcenter, me.ycenter - offsetSeparator + offsetHours, me.fontL, hoursOutput, me.justification);
		
		// set exact minutes
		var minute = (minutes+2)%60 %5;
		
		if (minute == 0) { dc.setColor(me.activeDotColor, Gfx.COLOR_TRANSPARENT); }
		else { dc.setColor(me.unactiveDotColor, Gfx.COLOR_TRANSPARENT); }
		dc.fillCircle(me.xcenter - 2*me.dotDistance, me.dotY, me.dotRadius);
		
		if (minute == 1) { dc.setColor(me.activeDotColor, Gfx.COLOR_TRANSPARENT); }
		else { dc.setColor(me.unactiveDotColor, Gfx.COLOR_TRANSPARENT); } 
		dc.fillCircle(me.xcenter - me.dotDistance, me.dotY, me.dotRadius);
		
		if (minute == 2) { dc.setColor(me.activeDotColor, Gfx.COLOR_TRANSPARENT); }
		else { dc.setColor(me.unactiveDotColor, Gfx.COLOR_TRANSPARENT); }
		dc.fillCircle(me.xcenter, me.dotY, me.dotRadius);
		
		if (minute == 3) { dc.setColor(me.activeDotColor, Gfx.COLOR_TRANSPARENT); }
		else { dc.setColor(me.unactiveDotColor, Gfx.COLOR_TRANSPARENT); } 
		dc.fillCircle(me.xcenter + me.dotDistance, me.dotY, me.dotRadius);
		
		if (minute == 4) { dc.setColor(me.activeDotColor, Gfx.COLOR_TRANSPARENT); }
		else { dc.setColor(me.unactiveDotColor, Gfx.COLOR_TRANSPARENT); }
		dc.fillCircle(me.xcenter + 2*me.dotDistance, me.dotY, me.dotRadius);
    }
}
