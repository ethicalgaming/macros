/**
 * Copyright (c) GitHub/EthicalGaming.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 *
*/

; Random function for delays inbetween actions
ran(min,max)
{
    random, ran, min, max
    return ran
}

; Filename helper for finding images.
Path(Filename){
    return Format("images\{}.png", Filename)
}