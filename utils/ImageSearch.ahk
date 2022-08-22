/**
 * Copyright (c) GitHub/EthicalGaming.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 *
*/

SetWorkingDir ..\%A_ScriptDir%
#Include, utils\General.ahk

; Coordinates object for storing coordinates of each item slot
global Coordinates := Object()
Coordinates.Mainhand := Object("X1", 2395, "Y1", 913, "X2", 2433, "Y2", 951)
Coordinates.Offhand := Object("X1", 2435, "Y1", 913, "X2", 2473, "Y2", 951)
Coordinates.Helm := Object("X1", 2519, "Y1", 691, "X2", 2551, "Y2", 722)

Equipped(Item){
   Switch Item
   {
   Case "mage_mainhand":
      path := Path("mainhand")
      item_type := "Mainhand"
   Case "melee_mainhand":
      path := Path("mainhand_leng")
      item_type := "Mainhand" 
   Case "mage_offhand":
      path := Path("offhand")
      item_type := "Offhand"
   Case "melee_offhand":
      path := Path("offhand_leng")
      item_type := "Offhand" 
   Case "vestment":
      path := Path("vestmenthelm")
      item_type := "Helm" 
   Default:
      path := ""
      item_type := "Mainhand"
   }
   CoordMode, Pixel, Screen
   ImageSearch, , , Coordinates[item_type].X1, Coordinates[item_type].Y1, Coordinates[item_type].X2, Coordinates[item_type].Y2, *40, *TransBlack %path%
   if (ErrorLevel = 0){
   return True
} else {
   return False
}
}

; Helper function for unequipped, returns opposite of equipped, makes the actual macro code look cleaner.
Unequipped(Item){
   return !Equipped(Item)
}

; Helper function to check what style is equipped.
; Usage would be: if (Style() = "melee")
Style(){
   if (Equipped("vestment")) {
   return "melee"
} else {
   return "magic"
}
}

; Helper function to equip an item. Both input variables are optional, when image is null it doesn't do an image search.
; If keybind is null it defaults to the image name as the variable name, i.e. when variable = image name.
Equip(Image := False, Keybind := False) {
   keybind := Keybind ? %Keybind% : %Image%
   if (Image) {
      if (Unequipped(Image)){
         Send {%keybind% down}
         Sleep, % ran(1,2) 
         Send {%keybind% up}
         Sleep, % ran(1,2)
      }
   } else {
      Send {%keybind% down}
      Sleep, % ran(1,2) 
      Send {%keybind% up}
      Sleep, % ran(1,2)
   }
}

; Helper function to send a keybind up and down, i.e. casting an ability or auto attack.
Cast(Keybind) {
   keybind := %Keybind%
   Send {%keybind% down}
   Sleep, % ran(1,2) 
   Send {%keybind% up}
   Sleep, % ran(1,2)
}

; Helper function to perform a left click.
LeftClick() {
   Send {Click down}
   Sleep, % ran(1,2) 
   Send {Click up}
   Sleep, % ran(1,2)
}
