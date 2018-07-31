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

class Schwaben {
	public static function updateDictionaries() {
		minutesWhenToJumpToNextHour = 8;
		
		hoursToText = { 
			1 =>  "ois", 
			2 =>  "zwoi", 
			3 =>  "dreie", 
			4 =>  "viere",
			5 =>  "femfe",
			6 =>  "sechse",
			7 =>  "siebene", // 7 characters
			8 =>  "achde",
			9 =>  "neine",
			10 => "zehne",
			11 => "elfe",
			0 =>  "zwelfe"
		};
		
		minutesToSeparator = {
			0 => "",
			1 => "noch",
			2 => "vor viertel",
			3 => "",
			4 => "vor halber",
			5 => "vor halber",
			6 => "",
			7 => "noch halber",
			8 => "dreiviertel", // 11 characters
			9 => "",
			10 => "vor",
			11 => "vor"	
		};
			
		minutesToText = {
			0 =>  "",
			1 =>  "femf",
			2 =>  "femf",
			3 =>  "viertel",
			4 =>  "zehn",
			5 =>  "femf",
			6 =>  "halber",
			7 =>  "femf",
			8 =>  "femf vor", // 3 lines: 8 characters
			9 =>  "dreiviertel", // 2 lines: 11 characters
			10 => "zehn",
			11 => "femf"	
		};
	}
}