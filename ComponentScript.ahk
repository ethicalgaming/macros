/**
 * Copyright (c) GitHub/EthicalGaming.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 *
*/

Menu, Tray, Icon, %A_ScriptDir%\icons\gear.ico
#Include, utils\ImageSearch.ahk
#Include, utils\Variables.ahk

#MaxThreadsPerHotkey 2
#SingleInstance Force
#IfWinActive RuneScape

	global name := "Boss Macro"
	; Pause Hotkey
	#Include, components\Pause.ahk
	; This is a component based way of creating a script. This allows you to have your dual wield or other macro
	; in a specific file, and import it into any script you'd like. i.e. Vorago, Solak, etc.

	; Conditional Wand Orb or Lengs depending on style equipped. Only equips if item is not already equipped.
	; Will never spam chatbox.
	#Include, components\DualWield.ahk
	#Include, components\BladedDive.ahk
	#Include, components\Prayers.ahk