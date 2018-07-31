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

class Hochdeutsch {
	public static function updateDictionaries() {
		minutesWhenToJumpToNextHour = 23;
		
		hoursToText = { 
			1 =>  "eins", 
			2 =>  "zwei", 
			3 =>  "drei", 
			4 =>  "vier",
			5 =>  "fünf",
			6 =>  "sechs",
			7 =>  "sieben", // 6 characters
			8 =>  "acht",
			9 =>  "neun",
			10 => "zehn",
			11 => "elf",
			0 =>  "zwölf"
		};
		
		minutesToSeparator = {
			0 => "",
			1 => "nach",
			2 => "nach",
			3 => "nach",
			4 => "nach",
			5 => "vor halb",
			6 => "",
			7 => "nach halb", // 9 characters
			8 => "vor",
			9 => "vor",
			10 => "vor",
			11 => "vor"	
		};
			
		minutesToText = {
			0 =>  "um",
			1 =>  "fünf",
			2 =>  "zehn",
			3 =>  "viertel", // 3 lines: 7 characters
			4 =>  "zwanzig",
			5 =>  "fünf",
			6 =>  "halb", // 2 lines: 4 characters
			7 =>  "fünf",
			8 =>  "zwanzig",
			9 =>  "viertel",
			10 => "zehn",
			11 => "fünf"	
		};
	}
}