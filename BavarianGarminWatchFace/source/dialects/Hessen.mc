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

class Hessen {
	public static function updateDictionaries() {
		minutesWhenToJumpToNextHour = 23;
		
		hoursToText = { 
			1 =>  "oans", 
			2 =>  "zwaa", 
			3 =>  "drei", 
			4 =>  "veijer", // 6 characters
			5 =>  "fünf",
			6 =>  "six",
			7 =>  "siwwe", 
			8 =>  "oacht",
			9 =>  "neu",
			10 => "zeje",
			11 => "elf",
			0 =>  "zwelf"
		};
		
		minutesToSeparator = {
			0 => "",
			1 => "noach",
			2 => "noach",
			3 => "noach",
			4 => "noach",
			5 => "fir halb",
			6 => "",
			7 => "noach halb", // 10 characters
			8 => "fir",
			9 => "fir",
			10 => "fir",
			11 => "fir"	
		};
			
		minutesToText = {
			0 =>  "",
			1 =>  "fünf",
			2 =>  "zeje",
			3 =>  "firddel",
			4 =>  "zwansisch", // 3 lines: 9 characters
			5 =>  "fünf",
			6 =>  "halb", // 2 lines: 4 characters
			7 =>  "fünf",
			8 =>  "zwansisch",
			9 =>  "firddel",
			10 => "zeje",
			11 => "fünf"	
		};
	}
}