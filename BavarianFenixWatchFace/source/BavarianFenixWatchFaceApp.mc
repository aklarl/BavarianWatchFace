using Toybox.Application as App;
using Toybox.WatchUi as Ui;

class BavarianFenixWatchFaceApp extends App.AppBase {

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
    	
        Ui.requestUpdate();
    }

	function refreshSettings() {
		switch (Application.getApp().getProperty("Font")) {
			case 1:
				fontS = Ui.loadResource(Rez.Fonts.BauhausS);
				fontL = Ui.loadResource(Rez.Fonts.BauhausL);
				break;
			case 2:
				fontS = Ui.loadResource(Rez.Fonts.BritannicS);
				fontL = Ui.loadResource(Rez.Fonts.BritannicL);
				break;
			case 3:
				fontS = Ui.loadResource(Rez.Fonts.StencilS);
				fontL = Ui.loadResource(Rez.Fonts.StencilL);
				break;
		}
	}

}