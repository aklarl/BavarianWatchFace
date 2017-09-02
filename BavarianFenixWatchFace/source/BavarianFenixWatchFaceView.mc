using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Lang as Lang;
using Toybox.Application as App;

class BavarianFenixWatchFaceView extends Ui.WatchFace {

	private var hoursToText = { 
		1 => "oans", 
		2 => "zwoa", 
		3 => "drei", 
		4 => "viere",
		5 => "fimfe",
		6 => "sechse",
		7 => "simme",
		8 => "ochde",
		9 => "neine",
		10 => "zehne",
		11 => "eife",
		0 => "zweife"
	};
		
	private var minutesToText = {
		0 => "umara",
		1 => "fimf" + "\n" + "noch",
		2 => "zehn" + "\n" + "noch",
		3 => "viadl" + "\n" + "noch",
		4 => "zwang" + "\n" + "noch",
		5 => "fimf" + "\n" + "voa hoiba",
		6 => "hoiba",
		7 => "fimf" + "\n" + "noch hoiba",
		8 => "zwang" + "\n" + "voa",
		9 => "dreiviadl",
		10 => "zehn" + "\n" + "voa",
		11 => "fimf" + "\n" + "voa"	
	};

    function initialize() {
        WatchFace.initialize();
    }

    // load resources
    function onLayout(dc) {
        setLayout(Rez.Layouts.BavarianFenixWatchFace(dc));
    }

    // update the view
    function onUpdate(dc) {
    		
		// get the current time
        var clockTime = Sys.getClockTime();
       	var hours = clockTime.hour % 12;
	    var minutes = clockTime.min;
	    
	    // variables for text output
	    var hoursOutput = "";
	    var minutesOutput = "";
        
        // get text for hours        
        if (minutes <= 22) { hoursOutput = hoursToText[hours]; }
        else { hoursOutput = hoursToText[hours + 1]; }
        
        // get text for minutes
        minutesOutput = minutesToText[ ( (minutes+2)%60 ) /5 ];
        
        // get full text
        var output = minutesOutput + "\n" + hoursOutput;
        
        // update the view
        var view = View.findDrawableById("TimeLabel");
        view.setLocation(dc.getWidth()/2,dc.getHeight()/2);
       	view.setText(output);

        // call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }
}
