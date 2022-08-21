/**
 * Copyright (c) GitHub/EthicalGaming.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 *
*/

Menu, Tray, Icon, %A_ScriptDir%\components\icons\rs.ico
#Include, components\utils\ImageSearch.ahk
#Include, components\utils\Variables.ahk

F12::
	Suspend
	If A_IsSuspended
	{
		TrayTip, Macro Title, Deactivated, 20, 1
	} else {
		TrayTip, Macro Title, Activated, 20, 1
	}
Return

#MaxThreadsPerHotkey 2
#SingleInstance Force
#IfWinActive RuneScape

	; This is a component based way of creating a script. This allows you to have your dual wield or other macro
	; in a specific file, and import it into any script you'd like. i.e. Vorago, Solak, etc.

	; Conditional Wand Orb or Lengs depending on style equipped. Only equips if item is not already equipped.
	; Will never spam chatbox.
	#Include, components\DualWield.ahk
	#Include, components\BladedDive.ahk