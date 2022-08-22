﻿/**
 * Copyright (c) GitHub/EthicalGaming.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 *
*/

Menu, Tray, Icon, %A_ScriptDir%\components\icons\icon.ico
#Include, components\utils\ImageSearch.ahk
#Include, components\utils\Variables.ahk

#MaxThreadsPerHotkey 2
#SingleInstance Force
#IfWinActive RuneScape

   global name := "Boss Macro"

   ; Pause Hotkey
   F12::
      Suspend
      If A_IsSuspended
      {
         TrayTip, %name%, Macros Deactivated, 20, 1
      } else {
         TrayTip, %name%, Macros Activated, 20, 1
      }
   Return

   ; This script is designed so that all your macros are written into this file. The downside to this is that
   ; if you use the same macro, i.e. dual wield over different bosses, you have to copy paste them in every file.

   ; Conditional Wand Orb or Lengs depending on style equipped. Only equips if item is not already equipped.
   ; Will never spam chatbox.
   F9:: 
      if (Style() = "melee"){ 
         Equip("mainhand_leng", "mainhand")
         Equip("offhand_leng", "offhand")
      } else {
         Equip("mainhand", "mainhand")
         Equip("offhand", "offhand")
      }
   Return

   ; Bladed Dive
   F20:: 
      Equip("melee_mainhand", "bd_mainhand")
      Equip("melee_offhand", "bd_offhand")
      Cast("bladed_dive")
      LeftClick()
   Return