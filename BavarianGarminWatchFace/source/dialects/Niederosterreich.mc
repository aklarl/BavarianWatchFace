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

class Niederosterreich {
	public static function updateDictionaries() {
		minutesWhenToJumpToNextHour = 13;
		
		hoursToText = { 
			1 =>  "aans", 
			2 =>  "zwa", 
			3 =>  "drei", 
			4 =>  "viere",
			5 =>  "fünfe",
			6 =>  "sechse",
			7 =>  "siebane", // 7 characters
			8 =>  "ochte",
			9 =>  "neine",
			10 => "zehne",
			11 => "ölf",
			0 =>  "zwöfe"
		};
		
		minutesToSeparator = {
			0 => "",
			1 => "noch",
			2 => "noch",
			3 => "",
			4 => "voa hoiba",
			5 => "voa hoiba",
			6 => "",
			7 => "noch hoiba", // 10 characters
			8 => "noch hoiba",
			9 => "",
			10 => "voa",
			11 => "voa"	
		};
			
		minutesToText = {
			0 =>  "",
			1 =>  "fünf", // 3 lines: 4 characters
			2 =>  "zehn",
			3 =>  "viertl",
			4 =>  "zehn",
			5 =>  "fünf",
			6 =>  "hoiba",
			7 =>  "fünf",
			8 =>  "zehn",
			9 =>  "dreiviertl", // 2 lines: 10 characters
			10 => "zehn",
			11 => "fünf"	
		};
	}
}