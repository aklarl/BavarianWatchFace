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
		1 => "fimf noch",
		2 => "zehn noch",
		3 => "viadl noch",
		4 => "zwang noch",
		5 => "fimf voa hoiba",
		6 => "hoiba",
		7 => "fimf noch hoiba",
		8 => "zwang voa",
		9 => "dreiviadl",
		10 => "zehn voa",
		11 => "fimf voa"	
	};

    function initialize() {
        WatchFace.initialize();
    }

    // Load your resources here
    function onLayout(dc) {
        setLayout(Rez.Layouts.WatchFace(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    }

    // Update the view
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
        
        // Update the view
        var view = View.findDrawableById("TimeLabel");
        view.setColor(App.getApp().getProperty("ForegroundColor"));
        view.setText(minutesOutput + "\n" + hoursOutput);

        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }

    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() {
    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() {
    }

}
