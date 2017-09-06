using Toybox.Application as Application;
using Toybox.WatchUi as WatchUi;
using Toybox.Graphics as Graphics;

class BavarianFenixWatchFaceApp extends Application.AppBase {

	private var view;

    function initialize() {
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state) {
    }

    // onStop() is called when your application is exiting
    function onStop(state) {
    }

    // Return the initial view of your application here
    function getInitialView() {
        return [ new BavarianFenixWatchFaceView() ];
    }

    // New app settings have been received so trigger a UI update
    function onSettingsChanged() {
    	refreshSettings();
    	
        WatchUi.requestUpdate();
    }

	function refreshSettings() {
		switch (Application.getApp().getProperty("Font")) {
			case 1:
				fontS = WatchUi.loadResource(Rez.Fonts.BauhausS);
				fontL = WatchUi.loadResource(Rez.Fonts.BauhausL);
				break;
			case 2:
				fontS = WatchUi.loadResource(Rez.Fonts.BritannicS);
				fontL = WatchUi.loadResource(Rez.Fonts.BritannicL);
				break;
			case 3:
				fontS = WatchUi.loadResource(Rez.Fonts.StencilS);
				fontL = WatchUi.loadResource(Rez.Fonts.StencilL);
				break;
		}
		
		var color = null;
		switch (Application.getApp().getProperty("HighlightColor")) {
			case 1:
				color = Graphics.COLOR_RED;
				break;
			case 2:
				color = Graphics.COLOR_DK_RED;
				break;
			case 3:
				color = Graphics.COLOR_BLUE;
				break;
			case 4:
				color = Graphics.COLOR_DK_BLUE;
				break;
			case 5:
				color = Graphics.COLOR_GREEN;
				break;
			case 6:
				color = Graphics.COLOR_DK_GREEN;
				break;
			default:
				color = Graphics.COLOR_WHITE;
				break;
		}
		
		// only set color of hours and of active dot to highlight color
		hoursColor = color;
		activeDotColor = color;
	}

}