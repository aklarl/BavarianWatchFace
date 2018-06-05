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

var minutesWhenToJumpToNextHourTirolerischWattensSchwaz = 18;

var hoursToTextTirolerischWattensSchwaz = { 
	1 =>  "oans", 
	2 =>  "zwoa", 
	3 =>  "drei", 
	4 =>  "viere",
	5 =>  "fünfe",
	6 =>  "seggse",
	7 =>  "siemne", // 6 characters
	8 =>  "achte",
	9 =>  "neine",
	10 => "zehne",
	11 => "elfe",
	0 =>  "zwölfe"
};

var minutesToSeparatorTirolerischWattensSchwaz = {
	0 => "",
	1 => "noch",
	2 => "noch",
	3 => "noch",
	4 => "voa holbe",
	5 => "voa holbe",
	6 => "",
	7 => "noch holbe", // 10 characters
	8 => "noch holbe",
	9 => "",
	10 => "voa",
	11 => "voa"	
};
	
var minutesToTextTirolerischWattensSchwaz = {
	0 =>  "",
	1 =>  "fünf",
	2 =>  "zehn",
	3 =>  "viatl", // line 3: 5 characters
	4 =>  "zehn",
	5 =>  "fünf",
	6 =>  "holba",
	7 =>  "fünf",
	8 =>  "zehn",
	9 =>  "dreiviatl", // line 2: 9 characters
	10 => "zehn",
	11 => "fünf"	
};
