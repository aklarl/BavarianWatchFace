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

class Oberfranken {
	public static function updateDictionaries() {
		minutesWhenToJumpToNextHour = 13;
		
		hoursToText = { 
			1 =>  "aans", 
			2 =>  "zwaa", 
			3 =>  "dreia", 
			4 =>  "viera",
			5 =>  "fimfa",
			6 =>  "sechsa", // 6 characters
			7 =>  "siema", 
			8 =>  "ochda",
			9 =>  "neina",
			10 => "zehna",
			11 => "elfa",
			0 =>  "zwelfa"
		};
		
		minutesToSeparator = {
			0 => "",
			1 => "noch",
			2 => "noch",
			3 => "",
			4 => "voa holba",
			5 => "voa holba",
			6 => "",
			7 => "noch holba", // 10 characters
			8 => "noch holba",
			9 => "",
			10 => "voa",
			11 => "voa"	
		};
			
		minutesToText = {
			0 =>  "",
			1 =>  "fimf", // 3 lines: 4 characters
			2 =>  "zehn",
			3 =>  "värddl",
			4 =>  "zehn",
			5 =>  "fimf",
			6 =>  "holba",
			7 =>  "fimf",
			8 =>  "zehn",
			9 =>  "dreivärddl", // 2 lines: 10 characters
			10 => "zehn",
			11 => "fimf"	
		};
	}
}
