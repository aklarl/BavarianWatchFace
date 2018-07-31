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

class Oberbayern {
	public static function updateDictionaries() {
		minutesWhenToJumpToNextHour = 23;
		
		 hoursToText = { 
			1 =>  "oans", 
			2 =>  "zwoa", 
			3 =>  "drei", 
			4 =>  "viere",
			5 =>  "fimfe",
			6 =>  "sechse", // 6 characters
			7 =>  "simme",
			8 =>  "ochde",
			9 =>  "neine",
			10 => "zehne",
			11 => "eife",
			0 =>  "zweife"
		};
		
		minutesToSeparator = {
			0 => "",
			1 => "noch",
			2 => "noch",
			3 => "noch",
			4 => "noch",
			5 => "voa hoiba",
			6 => "",
			7 => "noch hoiba", // 10 characters
			8 => "voa",
			9 => "",
			10 => "voa",
			11 => "voa"	
		};
			
		minutesToText = {
			0 =>  "umara",
			1 =>  "fimf",
			2 =>  "zehn",
			3 =>  "viadl",
			4 =>  "zwanzg", // 3 lines: 6 characters
			5 =>  "fimf",
			6 =>  "hoiba",
			7 =>  "fimf",
			8 =>  "zwanzg",
			9 =>  "dreiviadl", // 2 lines: 9 characters
			10 => "zehn",
			11 => "fimf"	
		};
	}
}
