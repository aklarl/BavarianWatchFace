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

class Erzgebirge {
	public static function updateDictionaries() {
		minutesWhenToJumpToNextHour = 13;
		
		hoursCentered = {
			0 =>  false,
			1 =>  true, 
			2 =>  false, 
			3 =>  false, 
			4 =>  false,
			5 =>  false,
			6 =>  false,
			7 =>  true,
			8 =>  false,
			9 =>  false,
			10 => false,
			11 => false
		};
		
		hoursToText = { 
			1 =>  "aans", 
			2 =>  "zwehe", 
			3 =>  "dreie", 
			4 =>  "viere",
			5 =>  "fimfe",
			6 =>  "sechse", // 6 characters
			7 =>  "sieme",
			8 =>  "achte",
			9 =>  "neine",
			10 => "zahne",
			11 => "elfe",
			0 =>  "zwölfe"
		};
		
		minutesToSeparator = {
			0 => "",
			1 => "", 
			2 => "noch",
			3 => "",
			4 => "vor holb",
			5 => "holb",
			6 => "",
			7 => "durch", // exchange
			8 => "noch holb", // 9 characters
			9 => "",
			10 => "vor",
			11 => ""	
		};
			
		minutesToText = {
			0 =>  "",
			1 =>  "durch", // exchange
			2 =>  "zahne", // 3 lines: 5
			3 =>  "vartl",
			4 =>  "zahne",
			5 =>  "glei",
			6 =>  "holb",
			7 =>  "holb",
			8 =>  "zahne",
			9 =>  "dreivartl", // 2 lines: 9
			10 => "zahne",
			11 => "glei"	
		};
	}
}