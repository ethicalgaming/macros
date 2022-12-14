/**
 * Copyright (c) GitHub/EthicalGaming.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 *
*/

; Conditional Wand Orb or Lengs depending on style equipped. Only equips if item is not already equipped.
; Will never spam chatbox.
F9:: 
   if (Style() = "melee"){
      Equip("melee_mainhand", "mainhand")
      Equip("melee_offhand", "offhand")
   } else {
      Equip("mage_mainhand", "mainhand")
      Equip("mage_offhand", "offhand")
   }
Return