/*
 *  BoarischesWatchFace is a Watch Face for a large set of Garmin smart watches.
 *
 *  Copyright (C) 2017  Annabelle Klarl
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

var minutesWhenToJumpToNextHourKaernten = 13;

var hoursToTextKaernten = { 
	1 =>  "ans", 
	2 =>  "zwa", 
	3 =>  "dreie", 
	4 =>  "viere",
	5 =>  "fünfe",
	6 =>  "sechse",
	7 =>  "siebene",
	8 =>  "ochte",
	9 =>  "neine",
	10 => "zehne",
	11 => "elfe",
	0 =>  "zwölfe"
};

var minutesToSeparatorKaernten = {
	0 => "",
	1 => "noch",
	2 => "noch",
	3 => "",
	4 => "vuar holba",
	5 => "vuar holba",
	6 => "",
	7 => "noch holba",
	8 => "noch holba",
	9 => "",
	10 => "vuar",
	11 => "vuar"	
};
	
var minutesToTextKaernten = {
	0 =>  "",
	1 =>  "fünf",
	2 =>  "zehn",
	3 =>  "viertl",
	4 =>  "zehn",
	5 =>  "fünf",
	6 =>  "holba",
	7 =>  "fünf",
	8 =>  "zehn",
	9 =>  "dreiviertl",
	10 => "zehn",
	11 => "fünf"	
};
