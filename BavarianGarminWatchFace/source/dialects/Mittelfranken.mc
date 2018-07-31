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

class Mittelfranken {
	public static function updateDictionaries() {
		minutesWhenToJumpToNextHour = 13;
		
		hoursToText = { 
			1 =>  "aanser", 
			2 =>  "zwarer", 
			3 =>  "dreier", 
			4 =>  "vierer",
			5 =>  "fümfer",
			6 =>  "sechser", // 7 characters
			7 =>  "siemer", 
			8 =>  "achder",
			9 =>  "neuner",
			10 => "zehner",
			11 => "elfer",
			0 =>  "zwölfer"
		};
		
		minutesToSeparator = {
			0 => "",
			1 => "nach",
			2 => "nach",
			3 => "",
			4 => "vor halber",
			5 => "vor halber",
			6 => "",
			7 => "nach halber", // 11 characters
			8 => "nach halber",
			9 => "",
			10 => "vor",
			11 => "vor"	
		};
			
		minutesToText = {
			0 =>  "",
			1 =>  "fümf", // 3 lines: 4 characters
			2 =>  "zehn",
			3 =>  "väddl",
			4 =>  "zehn",
			5 =>  "fümf",
			6 =>  "halber",
			7 =>  "fümf",
			8 =>  "zehn",
			9 =>  "dreiväddl", // 2 lines: 9 characters
			10 => "zehn",
			11 => "fümf"	
		};
	}
}
