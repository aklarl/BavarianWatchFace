using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Lang as Lang;
using Toybox.Application as App;

class BavarianFenixWatchFaceView extends Ui.WatchFace {



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
    	var bla = { 
    		1 => "oans", 
    		2 => "zwoa", 
    		3 => "drei", 
    		4 => "fiare",
    		5 => "fimfe",
			6 => "sechse",
			7 => "simme",
			8 => "ochde",
			9 => "neine",
			10 => "zehne",
			11 => "eife",
			0 => "zweife"
		};
		
		// get the current time
        var clockTime = Sys.getClockTime();
                
        // get text for hours
       	var hours = clockTime.hour % 12;
        var stunde = bla[ hours ];
        
        // get text for minutes
        var minutes = clockTime.min;
        var minute = "";
        if (minutes <= 2) { minute = "umara"; }
        else if (minutes <= 7) { minute = "fimf \n noch"; }
        else if (minutes <= 12) { minute = "zehn \n noch"; }
        else if (minutes <= 17) { minute = "viadl \n noch"; }
        else if (minutes <= 22) { minute = "zwanzg \n noch"; }
        else if (minutes <= 27) { minute = "fimf \n voa hoiba"; }
        else if (minutes <= 32) { minute = "hoiba"; }
        else if (minutes <= 37) { minute = "fimf \n noch hoiba"; }
        else if (minutes <= 42) { minute = "zwanzg \n voa"; }
        else if (minutes <= 47) { minute = "dreiviadl"; }
        else if (minutes <= 52) { minute = "zehn \n voa"; }
        else if (minutes <= 57) { minute = "fimf \n voa"; }
        else { minute = "umara"; }
        
        var timeFormat = "$1$:$2$";
        if (!Sys.getDeviceSettings().is24Hour) {
            if (hours > 12) {
                hours = hours - 12;
            }
        } else {
            if (App.getApp().getProperty("UseMilitaryFormat")) {
                timeFormat = "$1$$2$";
                hours = hours.format("%02d");
            }
        }
        
        var timeString = Lang.format(timeFormat, [hours, clockTime.min.format("%02d")]);

        // Update the view
        var view = View.findDrawableById("TimeLabel");
        view.setColor(App.getApp().getProperty("ForegroundColor"));
        //view.setText(timeString);
        view.setText(minute + "\n" + stunde);

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
