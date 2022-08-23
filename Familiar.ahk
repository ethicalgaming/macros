#include, utils\lib\Vis2.ahk
#Include, utils\General.ahk

; Setting to check spirit cape
global SpiritCape := True
global FamiliarCoordinates := Object()
FamiliarCoordinates.SummoningPoints := Object("X1", 2036, "Y1", 1302, "X2", 2104, "Y2", 1322)

global Familiars := Object()
Familiars.RipperDemon := Object("Name", "RIPPER DEMON", "Cost", 20) 
global cost := SpiritCape ? Familiars.RipperDemon.Cost * 0.8 : Familiars.RipperDemon.Cost

call_familiar := "1"
familiar_spec := "2"

Loop
{
    SummoningPoints := OCR([FamiliarCoordinates.SummoningPoints.X1, FamiliarCoordinates.SummoningPoints.Y1, FamiliarCoordinates.SummoningPoints.X2 - FamiliarCoordinates.SummoningPoints.X1, FamiliarCoordinates.SummoningPoints.Y2 - FamiliarCoordinates.SummoningPoints.Y1])

    slashPosition := RegExMatch(SummoningPoints, "/")

    currentPoints := SubStr(SummoningPoints, slashPosition - 2 , 2)

    if currentPoints - Familiars.RipperDemon.Cost >= 0
    {
        Send {%call_familiar% down}
        Sleep, % ran(1,2) 
        Send {%call_familiar% up}
        Sleep, % ran(1,2)
        Send {%familiar_spec% down}
        Sleep, % ran(1,2) 
        Send {%familiar_spec% up}
        Sleep, % ran(600,1200)
    }
}

RWin::Pause,Toggle