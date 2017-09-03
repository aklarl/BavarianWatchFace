using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Lang as Lang;
using Toybox.Application as App;

class BavarianFenixWatchFaceView extends Ui.WatchFace {

	private var fontS = Gfx.FONT_SMALL;
	private var fontM = Gfx.FONT_MEDIUM;
	private var fontL = Gfx.FONT_LARGE;
	//private var justification = Gfx.TEXT_JUSTIFY_CENTER | Gfx.TEXT_JUSTIFY_VCENTER;
	private var justification = Gfx.TEXT_JUSTIFY_CENTER;
	private var backgroundColor = Gfx.COLOR_BLACK;
	private var minutesColor = Gfx.COLOR_WHITE;
	private var hoursColor = Gfx.COLOR_RED;
	

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
    }

    // update the view
    function onUpdate(dc) {
    		
		// get the current time
        var clockTime = Sys.getClockTime();
       	var hours = clockTime.hour;
	    var minutes = clockTime.min;
	    
	    // variables for text output
	    var minutesOutput = "";
	    var separatorOutput = "";
	    var hoursOutput = "";
       
        // get text for minutes
        minutesOutput = minutesToText[ ( (minutes+2)%60 ) /5 ];
        minutesOutput = minutesOutput.toUpper();
        
        // get text for separator
        separatorOutput = minutesToSeparator[ ( (minutes+2)%60 ) /5 ];
        separatorOutput = separatorOutput.toUpper();
        
        // get text for hours        
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
		var heightS = dc.getFontHeight(me.fontS);
		var textHeightS = ascentS - descentS;
		
		var offset = 0;
		var offsetUpper = 0;
		var offsetLower = 0;
		if (!separatorOutput.equals("")) {
			offset = descentS + textHeightS/2;
			offsetUpper = textHeightS + 6;
			offsetLower = ascentS - descentL + 10;
		}
		else {
			offsetUpper = ascentS + 6/2;
			offsetLower = -descentL + 10/2;
		}
		
		// set time
		dc.setColor(me.minutesColor, Gfx.COLOR_TRANSPARENT);
		dc.drawText(dc.getWidth()/2, dc.getHeight()/2 - offset - offsetUpper, me.fontS, minutesOutput, me.justification);
		dc.drawText(dc.getWidth()/2, dc.getHeight()/2 - offset    , me.fontS, separatorOutput, me.justification);		
	
		dc.setColor(me.hoursColor, Gfx.COLOR_TRANSPARENT);		
		dc.drawText(dc.getWidth()/2, dc.getHeight()/2 - offset + offsetLower, me.fontL, hoursOutput, me.justification);
    }
}
