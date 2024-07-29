# The Game Boy Mini Flashable Camera - a fork
**A license free small flashable version of the original Game Boy Camera. A fork I've made for my own use but I assume it can be helpful to anyone.**

The current release (1.3) has been produced, assembled and tested. The board is compatible with any regular camera rom (Game Boy Camera, Pocket Camera, Hello Kitty, Zelda special edition and [Debagame tester](https://tcrf.net/Proto:Game_Boy_Camera)) and homebrews like [Photo!](https://github.com/untoxa/gb-photo) or [2bit PXLR Studio](https://github.com/HerrZatacke/2bit-pxlr-studio). It is recommended to flash this board with a [GBxCart](https://www.gbxcart.com/) and [FlashGBX](https://github.com/lesserkuma/FlashGBX) as support is guaranteed. FlashGBX automatically recognizes it without doing anything. Other devices (Cyclones, GB Operator, etc.) were not tested, may or may not work, try them by yourself.

## Minimal hardware/soft skill required in addition to all the BOM before starting anything
- A multimeter with a continuity mode for troubleshooting;
- A soldering iron with a fine tip and a temperature setting;
- A hot air gun or a hot plate to desolder the MAC-GBD;
- Good quality solder wire/flux or solder paste/solder wick;
- Isopropanol in large quantities to clean all the flux mess;
- A magnifying system like an USB microscope or binocular magnifiers;
- A GBxCart flasher and FlashGBX software;
- An overall skill in soldering SMD components because this is ***not a beginner project.*** Damaging the MAC-GBD, the flash of the FRAM chips is easy.
- Some kapton tape (ideal) or regular thick tape to cover the PCB gold fingers.

Ready to go ?

## What to fit it with

The GB mini flashable camera in short version fits perfectly with the [Camera+ Mini shell](https://ko-fi.com/s/a4d7bd649a). With this shell, you can reuse the regular camera sensor ribbon.

The "Longboard" version has a "neck" that allows mounting it is a regular Game Boy Camera shell with the original ribbon cable. If you change your idea, you can physically break the neck and adapt the PCB again in the [Camera+ Mini shell](https://ko-fi.com/s/a4d7bd649a). **The long neck must be used with a vertical SMD JST connector.**

Both versions come with pads for both vertical and horizontal SMD JST connectors on the short part (before the neck). Be sure to solder the right connector on the right pad to avoid polarity inversion. **For the Camera+ mini shell and short PCB, it is recommended to go with the horizontal socket as there is not too much room inside.**

![](/Images/Connector.png)

**I overall recommend to order the long board which is more versatile**. The neck is easy to break and file to make a short board from it.

In case you want to mount the short PCB in a regular camera shell or in the regular [Game Boy Camera+ shell](https://ko-fi.com/s/9457d1cc6e), you will need a longer ribbon cable. 
Aliexpress cables are too thick and crappy for that task and you must order a genuine JST cable. The only available seller for good replacement and longer cable is Digikey. Choose a [type B cable "socket to socket" ](https://www.digikey.fr/en/products/base-product/jst-sales-america-inc/455/A09ZR09Z/588181). The regular camera cable is [2 inches long](https://www.digikey.fr/en/products/detail/jst-sales-america-inc/A09ZR09ZR28H51B/6708551), so take at least a [4 inches one](https://www.digikey.fr/en/products/detail/jst-sales-america-inc/A09ZR09ZR28H102B/9972202). Digikey ribbon cables are stiffer than the genuine cables but they can sustain the same amount of bending/torsion without connection issue.

Please follow the [building instructions from the original author](/Building_guides/build.pdf) for PCB ordering options. Use [JLCPCB](https://passport.jlcpcb.com/) for ordering if you live in Europe. They offer VAT compliant services for European customers and very cheap shipping options. I typically got 5 boards ENIG finish shipped to France for 23€ in 2024.

**IMPORTANT note:** some Game Boy cameras have the U4 regulator populated instead of the U5 regulator. The board is designed to work with either the regulator linked in the BOM (recommended) or the U5 regulator harvested from the original camera cart. **U4 from the original board will not work.** If you're using a new 3V0 regulator from the BOM list, the **C16 capacitor will not be necessary.** Unlike the original 3V0 regulator, the pin connected to this capacitor is NC on the new 3V0 regulator.

## Component location and orientation on PCB (short and long version)

![](Images/Component_placement_w_components.png)

## Component list (short and long version)

|Reference	|Value	|Count	|Footprint	|Name	|Description|
|-----------|----------|-----------|----------------|-------------|------------------|
|C2, C3, C4, C5, C6, C7, C8, C9, C12, C13, C14, C15, C16, C19	|10nF	|14	|0603 (imperial)|	Capacitor Ceramic (X7R)|	Decoupling Capacitor|
|C11, C18	|22pF	|2	|0603 (imperial)	|Capacitor Ceramic (X7R)|	Decoupling Capacitor|
|C10	|39pF	|1	|0603 (imperial)	|Capacitor Ceramic (X7R)|	Decoupling Capacitor|
|C17	|22uF	|1	|1206 (imperial)	|Capacitor Tantalum (≤10%)	|Filtering Capacitor|
|C1	|100nF	|1	|0603 (imperial)	|Capacitor Ceramic (X7R)	|Decoupling Capacitor|
|D1	|N/A	|1	|SOT-23	|BAT54W-HG3-18 (or BAT 63-02V H6327 )	|Schottky diode|
|J2	|N/A	|1	|N/A	|JST ZH1.5mm (9 pins)	|Camera Connector (male)|
|R1	|1kΩ	|1	|0603 (imperial)	|Resistor	|Resistor|
|U1	|N/A	|1	|TQFP-100 (14x14mm)	|MAC-GBD from original cart	|Main gamecart mapper chip|
|U2	|N/A	|1	|SC-88A-5 	|M74VHC1GU04DFT1G-L22038	|Signal inverter|
|U3	|N/A	|1	|TSOP-I-32 (12.4x8mm)	|FM28V100-TG 	|FRAM|
|U4	|N/A	|1	|SOT-23-5	|NCP718ASN300T1G 	|3V0 voltage regulator|
|U5	|N/A	|1	|TSOP-I-40 (18.4x10mm)	|AM29F080B	|Flash memory|

## Overview of JLCPCB ordering options

- Base Material **FR-4**
- Layers **2**
- Dimensions **Auto-filled**
- PCB Qty **As desired**
- Product type **Industrial/Consumer electronics**
- Different Design **1**
- Delivery format **Single PCB**
- PCB thickness **0.8**
- PCB Color **As desired**
- Silkscreen **As desired**
- Surface Finish **ENIG**
- Outer Copper weight **1 oz**
- Via Covering **Tented**
- Board Outline Tolerance **±0.2mm(Regular)**
- Confirm Production file **No**
- Remove Order Number **Specify a location**
- Flying Probe Test **Fully Test**
- Gold Fingers **Yes**
- 30°finger chamfered **No**
- Castellated Holes **No**

## Notes (please read completely before attempting the project)

- It is not reported in the original repo but C10 capacity must be increased to remove any graphical glitch due to FRAM timing inconsistencies. You should use a 39 pf capacitor instead of a 22 pf as indicated on the original schematic. I had the exact same issue with Cypress and RAMTRON chips, so it's not chip related (more probably capacitor tolerance related).
- The AM29F080B is discontinued but easy to find on Aliexpress for cheap (batches are mainly recycled chips but there are lots of old new stocks). It can be fun to dump the content to see what was the chip usage before its recycling.
- Some versions of the FM28V100-TG by Cypress semiconductors come without a dot to indicate pin 1 but only a side notch. The side notch also indicates the row where pin 1 is located, so it must be soldered with notch pointing down (same as the dot if present).
- The M74VHC1GU04DFT1G signal inverter is becoming hard to source in 2024 so it is recommended to switch to a MC74VHC1GU04DF1G (same pinout, same characteristics). The SC-88 package version is quite hard to find on Aliexpress but available on Mouser and Digikey. Chip marking must be **V6** in case of doubt when receiving the order.
- Low voltage Schottky diode can also be hard to source but any equivalent one will do the job (there are many). The original camera used a Panasonic MA784 with marking **2D** (discontinued), among other undocumented variations, you can take inspiration from its datasheet. The RB510VM-30 is a possible replacement for example. It must have the lowest possible forward voltage drop. Its role is to protect the MAC-GBD internal analog to digital converter from any overvoltage, so the anode is connected to VOUT (1V5 in the schematic) and the cathode to 3.0V. It triggers at around 3.18V on the anode.
- Most parts can be found on Aliexpress, Mouser and Digikey except for the ribbon cable (Digikey only) if you need a longer one.
- You can easily desolder the MAC-GBD by using a hot air gun (set at about 350°C) on the back side of the original board until the chip falls by itself or after a gentle shaking. This is by far the most secure way I've found (I do not own a heating plate). I do not recommend using low temp solder or other bismuth containing crap. No need. The author of the original project recommends using a heating plate set at 250°C. In any case, work fast to minimize at most heat budget on the chips.
- Lead free solder in wire can be crap depending on the alloy and could be a pain to use due to high melting point. Either use old good lead/tin alloy with flux core (and a ton of flux anyway) if you can find some or quality lead free solder paste. And always remind the rule of thumb when using flux: "the bigger the blob, the better the job".
- The ferrite beads filters have been removed from the definitive PCB even if they are still mentioned in the pdf description of the project.
- The schematic is clear and precise enough to troubleshoot any issue with a multimeter in continuity mode. Easy check: the caps must **never** be shorted, two adjacent pins of the FRAM and flash memory must never be shorted. After that, any remaining issue is a just a matter of flow and reflow.
- It's **very recommended** to use a magnifying system (USB microscope or binocular magnifier). Soldering with bare eyes is possible if you are lucky enough to get the device working first try but any issue will be impossible to troubleshoot. A multimeter is mandatory too in case of issue.
- The ENIG finish can be hard to "wet" with solder depending on the flux used. I used a BEEYUIHF #8403 "no clean" flux in syringe and was very great in my case (good flux wetting, easy to clean with isopropanol, not greasy and no headache after soldering contrary to some other el cheapo Aliexpress fluxes in metal containers I used to spread before).
- Of course, cover the cartridge connector completely with kapton tape to avoid any solder splats on it. They are basically impossible to remove after, so better avoid them.
- I also recommend to clean with flux/solder wick/isopropanol and unbend very thoroughly the pins of the MAC-GBD or any recycled chip **before** soldering them again. A solder bridge due to a metal particle between/below pins is very annoying to remove (you basically have to remove the whole chip to get rid of it anyway).
- I've soldered the components in this order: chips, caps/diode/resistor, regulator/inverter, and then the connector. I've cleaned board between each step with isopropanol to get a clear view of the work and check dry solder joints and shorts.
- first connection to FlashGBX will always report a bad/unknown mapper/rom but as soon as you try to flash a rom everything will go fine. I recommend flashing a regular rom (which fills the whole 1MB flash chip) and fill the whole memory with different images for testing. If after reboot all your images are still there without artifacts and in the same order, you're good to go with your new device !

## Showcase with the long board

![](Images/Showcase_2.png)

The Cypress FRAM I bought came without dot to indicate pin 1 so I used the notch to orient it. I've swapped it with a RAMTRON and I'm 100% sure that the orientation notch/dot down is correct.

![](Images/Showcase_3.png)

I've ordered the long board to fit it initially in a regular camera shell. It can be broken at the "neck" to fit a shorter shell. Important reminder: there are no shell mods allowing selfies, the regular camera shell only has a rotating head.

![](Images/Showcase_1.png)

**Some notes:**
- I've ordered the signal inverter in the wrong package on Aliexpess (package SC−74A, it was referenced as SC-88A but it was not). It barely fits on the original traces, and it was quite a pain to solder correctly on the traces but it works. As long as the chip marking begins by V6, pinout is the same.
- Using a 22 pf capacitor for C10 as recommended in the original repo led to graphical glitches on my side. As I know that this very particular cap is crucial for FRAM stability, I've tried doubling or dividing the value by two (and changing the FRAM brand, I thought it was the culprit but in fact not). Doubling to 44 pf with two 22 pf in parallel fixes the graphical glitches. So I recommend using a single 39 pf instead of a 22 pf for C10 (44 pf does not exist).
- I've soldered C16 in place even if it is not required as I used a new voltage regulator. Just in case.
- I've used an old new stock Panasonic MA784 Schottky diode because I own a bunch of them that I bough for science years ago.

## Showcase with the long board, neck broken to make it short

![](Images/Showcase_4.png)

Short version (after breaking the neck and soldering an horizontal JST connector) installed inside the [Camera+ Mini shell](https://ko-fi.com/s/a4d7bd649a). That's beautiful and handy to use, very great mod !

**Some notes:**
- I've ordered the Camera+ Mini shell at JLCPCB with the following option: 3D Technology: MJF(Nylon) Material: PA12-HP Nylon Colors: Black Surface Finish: Dyeing-Dyed Black. It came very nice and sturdy like this.
- The C/CS mount I bought was way to large in diameter to enter the front hole so I had to file it manually until it enters with a moderate force. At this step, you can adjust the C/CS mount deepness until your lens can easily focus to infinity before glueing it definitely by the inside. The mod is very well made so even with the C/CS ring completely pressed inside the hole, it must be OK.
- The mod does reuse only screws from the genuine camera shell, which is great !

## Funfacts
- The MAC-GBD I used here came from another mod, so it was desoldered two times without that much precaution and soldered three times. On the other hand, I had one MAC-GBD dead after a single transplant (with another mod too, not this one). For this latter, I think it was yet dead on its initial board as it came from an "untested" camera (my fault). My conclusion is that the MAC-GBD is rather sturdy, but better test a camera before modding it to avoid nervous breakdown.
- The C10 "magic cap" is a well-worn subject of discussion among camera modders. Its minimal value is subjected to variations along the camera mods/PCBs but the consensus is that 22 pF is very a minimal value. Maximal value that can be used is unknown (44 pF is the highest value tested so far without glitches).

## Acknowledgements
- [Andreas Hahn](https://github.com/HerrZatacke) and [Mraulio](https://github.com/Mraulio) for helping me to complete this fork by extracting lacking informations from that information black hole that is Discord.
- [2BitWizard](https://github.com/2BitWizard), original author, for bringing the project to fruition. Thanks also for sending me some early prototypes for testing long before I found time to dive into the project. Go [here](https://disboard.org/fr/server/568464159050694666) to discuss with him directly.
- [2BitToy](https://ko-fi.com/2bittoy/) for his great/neat camera mods.
