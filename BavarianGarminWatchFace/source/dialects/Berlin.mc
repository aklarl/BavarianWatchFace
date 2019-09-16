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

class Berlin {
	public static function updateDictionaries() {
		minutesWhenToJumpToNextHour = 13;
		
		hoursToText = { 
			1 =>  "eens", 
			2 =>  "zwee", 
			3 =>  "drei", 
			4 =>  "vier",
			5 =>  "fümf",
			6 =>  "sechs",
			7 =>  "siem",
			8 =>  "acht",
			9 =>  "neun",
			10 => "zehn",
			11 => "ölf",
			0 =>  "swölf" // 6 characters
		};
		
		minutesToSeparator = {
			0 => "",
			1 => "na",
			2 => "na",
			3 => "",
			4 => "vor",
			5 => "vor halb",
			6 => "",
			7 => "na halb", // 7 characters
			8 => "na",
			9 => "",
			10 => "vor",
			11 => "vor"	
		};
			
		minutesToText = {
			0 =>  "",
			1 =>  "kurz",
			2 =>  "zehn",
			3 =>  "vürdl", // 3 lines: 5 characters
			4 =>  "zehn",
			5 =>  "fümf",
			6 =>  "halb",
			7 =>  "fümf",
			8 =>  "zehn",
			9 =>  "dreivürdl", // 2 lines: 9 character
			10 => "zehn",
			11 => "kurz"	
		};
	}
}