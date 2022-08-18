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
   if (Equipped("vestment")){ 
      if (Unequipped("mainhand_leng")){
         Send {%mainhand% down}
         Sleep, % ran(1,2) 
         Send {%mainhand% up}
         Sleep, % ran(1,2)
      }
      if (Unequipped("offhand_leng")){
         Send {%offhand% down}
         Sleep, % ran(1,2) 
         Send {%offhand% up}
         Sleep, % ran(1,2)
      } 
   } else {
      if (Unequipped("mainhand")){
         Send {%mainhand% down}
         Sleep, % ran(1,2) 
         Send {%mainhand% up}
         Sleep, % ran(1,2)
      } 
      if (Unequipped("offhand")){
         Send {%offhand% down}
         Sleep, % ran(1,2) 
         Send {%offhand% up}
         Sleep, % ran(1,2)
      }
   }
Return