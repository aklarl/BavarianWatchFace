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

using Toybox.Application as Application;
using Toybox.WatchUi as WatchUi;
using Toybox.Graphics as Graphics;

class BavarianGarminWatchFaceApp extends Application.AppBase {

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
        return [ new BavarianGarminWatchFaceView() ];
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
				fontSigns = WatchUi.loadResource(Rez.Fonts.Signs);
				break;
			case 2:
				fontS = WatchUi.loadResource(Rez.Fonts.BritannicS);
				fontL = WatchUi.loadResource(Rez.Fonts.BritannicL);
				fontSigns = WatchUi.loadResource(Rez.Fonts.Signs);
				break;
			case 3:
				fontS = WatchUi.loadResource(Rez.Fonts.StencilS);
				fontL = WatchUi.loadResource(Rez.Fonts.StencilL);
				fontSigns = WatchUi.loadResource(Rez.Fonts.Signs);
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
			case 7:
				color = Graphics.COLOR_ORANGE;
				break;
			case 8:
				color = Graphics.COLOR_LT_GRAY;
				break;
			case 9:
				color = Graphics.COLOR_DK_GRAY;
				break;
			default:
				color = Graphics.COLOR_WHITE;
				break;
		}
		
		// only set color of hours and of active dot to highlight color
		hoursColor = color;
		activeDotColor = color;
		
		if (activeDotColor == Graphics.COLOR_LT_GRAY | activeDotColor == Graphics.COLOR_WHITE) {
			activeDotColor = Graphics.COLOR_DK_GRAY;
		}
	}

}