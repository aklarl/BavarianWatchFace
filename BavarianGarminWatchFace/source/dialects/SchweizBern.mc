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

class SchweizBern {
	public static function updateDictionaries() {
		minutesWhenToJumpToNextHour = 23;
		
		hoursToText = { 
			1 =>  "eis", 
			2 =>  "zwöi", 
			3 =>  "drü", 
			4 =>  "vieri",
			5 =>  "füfi",
			6 =>  "sächsi", // 6 characters
			7 =>  "sibni", 
			8 =>  "achti",
			9 =>  "nüni",
			10 => "zähni",
			11 => "eufi",
			0 =>  "zwöufi"
		};
		
		minutesToSeparator = {
			0 => "",
			1 => "ab",
			2 => "ab",
			3 => "ab",
			4 => "ab",
			5 => "vor haubi", // 9 characters
			6 => "",
			7 => "ab haubi",
			8 => "vor",
			9 => "vor",
			10 => "vor",
			11 => "vor"	
		};
			
		minutesToText = {
			0 =>  "",
			1 =>  "füf",
			2 =>  "zäh",
			3 =>  "viertu", // 3 lines: 6 characters
			4 =>  "zwänzg",
			5 =>  "füf",
			6 =>  "haubi", // 2 lines: 5 characters
			7 =>  "füf",
			8 =>  "zwänzg",
			9 =>  "viertu",
			10 => "zäh",
			11 => "füf"	
		};
	}
}