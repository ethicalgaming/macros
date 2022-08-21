# Image Searching, Component Based Macro API

This repository is an AutoHotkey **Application Programming Interface** for PvMing. It provides a variety of tools that can be used to improve your PvM experience.

Before getting started, I highly suggest you install Visual Studio Code, and after installing, install the [AutoHotkey Plus Plus](https://marketplace.visualstudio.com/items?itemName=mark-wiemer.vscode-autohotkey-plus-plus) extension.

![vscode](https://puu.sh/JgNGB.png)

All these macros require an input key that you press. As most macros that you can make with this API are 1:x, not 1:1, write your macros at your own risk. This is open source software and has no affiliation with Jagex Ltd, RuneScape or any other entities.

## Advantages

- For items that unequip or do not have an augment property, i.e. chinchompas or unaugmented vestment pieces, clicking a keybind or re-clicking it will never unequip the item.

- Spam in chatbox is completely eliminated when an item is added through image searching.

- Component based PvM macroing allows a script such as DualWield.ahk to be re-used in any script. This means that if scripts are made depending on bossing, i.e. `Vorago.ahk`, `Solak.ahk`, etc, they can all inherit the same files, allowing for the main script to be a few lines long.

## Traditional Macroing

Please see the `Script.ahk` file. This is an example of traditional image searching. Each script will lie inside this file instead of importing other files. 

## Component Based Macroing

A component will fall inside the `components` folder. In this example, `DualWield.ahk` already exists there. 

The primary file is called `ComponentScript.ahk`, and inside the file, a simple import statement immediately uses that file, instead of having to copy/paste the code from other scripts.

## Getting Started

The logic to understand is that in your interface, you will have an equipped items tab. 

For each item you want to search, the corresponding area, i.e. for a vestment helm, the corresponding area is `Helm`, and is visible in the interface. 

For each region, two coordinates are needed. This is the top left of the region, and bottom right of the region, (X1,Y1) and (X2,Y2) respectively. A good rule of thumb is taking slightly outside the 'square' of the item, i.e. the 'square' around the helm region. Add these coordinates to the `components/utils/ImageSearch.ahk` file. This only needs to be done once per type of item.

![region](https://puu.sh/JgNHO.png)

The region code should look something like this:

```ahk
    ; Line 21
    Coordinates.Helm := Object("X1", 2519, "Y1", 691, "X2", 2551, "Y2", 722)
```

To actually image search, an image of the item inside the search region is required. The item should be as small as possible, 10x10px is preferred as a size. This image should also include as little as possible of the background. This is to prevent contrast changing in colours affecting the image search, and also the region being 100% correct.

This image is then stored in `components/images`. To get these coordinates, use the provided `Coordinates.ahk` file under `components/utils`.

![screenshotregion](https://puu.sh/JgNIa.png)

A check should be added to the `components/utils/ImageSearch.ahk` Switch case, i.e. something like the following after line 41. Lets assume we're adding a check for a tectonic helm, then the code would look something like:

```ahk
    ; Line 41
    Case "tectonic_helm":
        path := Path("tectonic_helm")
        item_type := "Helm"
```

That's it. Now you should be able to call `Equipped('tectonic_helm')` in your code to check if the item is equipped, or `Unequipped('tectonic_helm')` for the opposite, before you equip your items.

## Helper Functions

- `Equipped(Item)` - Takes a string `Item` that represents a specific item, such as `mainhand_melee` that maps to a saved image.
- `Unequipped(Item)` - The inverse of `Equipped`. Purely there to clean up code.
- `Equip(Image, Keybind)` - Equips an item given an `Image` and corresponding `Keybind`. The `Keybind` maps to the variable of choice. If it is null, then the default variable used is the same as the name of `Image`. If `Image` is null, no image search is performed.
- `Cast(Keybind)` - Sends a keybind with delay, allowing no image search on things like abilities, auto attacks, etc.
- `LeftClick()` - Sends a left click, can be used for Bladed Dive, Targeted Magma Tempest, etc.

2 examples of possible macros, a simple Dual Wield and Bladed Dive are included under `components`.

## Additional Info and Advice

I like to have a hotkey that I can use to pause my macros. The way I've written it means that it will only activate on the game window, however at times pausing is nice too. The default keybind for this is <kbd>F12</kbd>. This can also be abstracted into a component in itself, such as `Pause.ahk`.

I've also added a Tray Icon, by default, this is just a gear. You are welcome to change this to whatever you'd like. 

A cool tip is to use your 'input' keybinds, i.e. whatever a macro is mapped to, as the <kbd>F9</kbd> key all the way up to <kbd>F24</kbd>. These are invisible F keys that can be assigned through mouse software and detectable by AHK.

If you ever find that you're running out of input keys, the game treats something like a backslash differently to the backslash on Numpad. This is possible for all the mathematical operators on numpad, 4 additional keys you can use. To call this in AHK, it is just `NumpadSub` for -, `NumpadMult` for *, etc.

For further requests, please open an Issue on GitHub. Have fun.