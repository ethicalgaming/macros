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
      Equip("mainhand_leng", "mainhand")
      Equip("offhand_leng", "offhand")
   } else {
      Equip("mainhand", "mainhand")
      Equip("offhand", "offhand")
   }
Return