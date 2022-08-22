/**
 * Copyright (c) GitHub/EthicalGaming.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 *
*/

; Conditional Wand Orb or Lengs depending on style equipped. Only equips if item is not already equipped.
; Will never spam chatbox.
F12::
   Suspend
   If A_IsSuspended
   {
      TrayTip, %name%, Macros Deactivated, 20, 1
   } else {
      TrayTip, %name%, Macros Activated, 20, 1
   }
Return