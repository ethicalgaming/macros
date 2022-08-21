/**
 * Copyright (c) GitHub/EthicalGaming.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 *
*/

SetWorkingDir ..\%A_ScriptDir%
#Include, components\utils\General.ahk

; Filename helper for finding images.
Path(Filename){
   return Format("components\images\{}.png", Filename)
}

; Coordinates object for storing coordinates of each item slot
global Coordinates := Object()
Coordinates.Mainhand := Object("X1", 2395, "Y1", 913, "X2", 2433, "Y2", 951)
Coordinates.Offhand := Object("X1", 2435, "Y1", 913, "X2", 2473, "Y2", 951)
Coordinates.Helm := Object("X1", 2519, "Y1", 691, "X2", 2551, "Y2", 722)

; Checks if an item is equipped in its corresponding slot.
Equipped(Item){
   Switch Item
   { 
   Case "mainhand":
      path := Path("mainhand")
      item_type := "Mainhand"
   Case "mainhand_leng":
      path := Path("mainhand_leng")
      item_type := "Mainhand" 
   Case "offhand":
      path := Path("offhand")
      item_type := "Offhand"
   Case "offhand_leng":
      path := Path("offhand_leng")
      item_type := "Offhand" 
   Case "vestment":
      path := Path("vestmenthelm")
      item_type := "Helm"
   Default:
      path := ""
      item_type := ""
   }
   CoordMode, Pixel, Screen
   ImageSearch, , , Coordinates[item_type].X1, Coordinates[item_type].Y1, Coordinates[item_type].X2, Coordinates[item_type].Y2, *40, *TransBlack %path%
   ; Logic is that the equipped items are searched, if the item exists in the corresponding slot, return True, else False
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

; Helper function to detect which style is equipped
Style(){
   if (Equipped("vestment")) {
   return "melee"
} else {
   return "magic"
}
}

; Helper function to equip an item, has optional custom keybind option
Equip(Image, Keybind := False) {
   keybind := Keybind ? %Keybind% : %Image%
   if (Unequipped(Image)){
      Send {%keybind% down}
      Sleep, % ran(1,2) 
      Send {%keybind% up}
      Sleep, % ran(1,2)
   }
}
