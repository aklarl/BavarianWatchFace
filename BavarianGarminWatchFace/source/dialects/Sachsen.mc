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

class Sachsen {
	public static function updateDictionaries() {
		minutesWhenToJumpToNextHour = 13;
		
		hoursToText = { 
			1 =>  "eens", 
			2 =>  "zwee", 
			3 =>  "dreie", 
			4 =>  "viere",
			5 =>  "finfe",
			6 =>  "sechse", // 6 characters
			7 =>  "siebn", 
			8 =>  "achte",
			9 =>  "neune",
			10 => "zehne",
			11 => "elfe",
			0 =>  "twelve"
		};
		
		minutesToSeparator = {
			0 => "",
			1 => "nach",
			2 => "nach",
			3 => "",
			4 => "vor halb",
			5 => "vor halb",
			6 => "",
			7 => "nach halb", // 9 characters
			8 => "nach halb",
			9 => "",
			10 => "vor",
			11 => "vor"	
		};
			
		minutesToText = {
			0 =>  "",
			1 =>  "finf",  // 3 lines: 4 characters
			2 =>  "zehn",
			3 =>  "viertel",
			4 =>  "zehn",
			5 =>  "finfe",
			6 =>  "halb",
			7 =>  "finf",
			8 =>  "zehn",
			9 =>  "dreiviertel", // 2 lines: 11 characters
			10 => "zehn",
			11 => "finf"	
		};
	}
}