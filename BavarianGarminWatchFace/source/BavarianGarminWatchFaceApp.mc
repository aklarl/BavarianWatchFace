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

using Toybox.Application as Application;
using Toybox.WatchUi as WatchUi;
using Toybox.Graphics as Graphics;
using Toybox.Lang as Lang;
using Toybox.System as System;

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
    	BavarianGarminWatchFaceApp.refreshSettings();
    	
        WatchUi.requestUpdate();
    }

	static function refreshSettings() {
		// refresh language
		switch (getNumberProperty("Language",1)) {
			case 1:
				minutesWhenToJumpToNextHour = minutesWhenToJumpToNextHourBayern;
				hoursToText = hoursToTextBayern;
				minutesToSeparator = minutesToSeparatorBayern;
				minutesToText = minutesToTextBayern;
				break;
			case 2:
				minutesWhenToJumpToNextHour = minutesWhenToJumpToNextHourKaernten;
				hoursToText = hoursToTextKaernten;
				minutesToSeparator = minutesToSeparatorKaernten;
				minutesToText = minutesToTextKaernten;
				break;
		}
	
		// refresh font
		switch (getNumberProperty("Font",2)) {
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
			default:
				fontS = WatchUi.loadResource(Rez.Fonts.BritannicS);
				fontL = WatchUi.loadResource(Rez.Fonts.BritannicL);
				fontSigns = WatchUi.loadResource(Rez.Fonts.Signs);
				break;
		}
		
		// refresh color
		var color = null;
		switch (getNumberProperty("HighlightColor",1)) {
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

	private static function getNumberProperty(property, defaultValue) {
		var value = Application.getApp().getProperty(property);
		if (value != null) {
			if (value instanceof Lang.Number) {
				return value;
			}
			else if (value instanceof Lang.String
					|| value instanceof Lang.Double
					|| value instanceof Lang.Float
					|| value instanceof Lang.Long) {
				return value.toNumber();
			}
		}
		return defaultValue;
	}
}