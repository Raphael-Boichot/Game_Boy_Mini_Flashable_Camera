# The Game Boy Mini Flashable Camera - a friendly fork

**A license free flashable version of the Game Boy Camera, in a small form factor. A fork I've made for my own convenience as the main branch is short with details. I assume it can be helpful to anyone wanting to do a flashable camera mod without having to seek for help online (which is my case). The license (rather the absence of it) allows you to do what you want with your mod: selling it, offering service for doing the mod, modifying it starting from the [schematic](/PCB/Schematic.pdf), make a nice gift, it's up to you.**

![game boy camera flashable](/Images/Short_board.jpg)
**Isn't this gorgeous in purple ?**

The current release has been produced, assembled, tested and bullet proofed in sweat and blood. The board is compatible with any regular camera rom (Game Boy Camera, Pocket Camera, Hello Kitty, Zelda special edition and [Debagame tester](https://tcrf.net/Proto:Game_Boy_Camera)) and homebrews like [Photo!](https://github.com/untoxa/gb-photo) or [2bit PXLR Studio](https://github.com/HerrZatacke/2bit-pxlr-studio). It is recommended to flash this board with a [GBxCart](https://www.gbxcart.com/) and [FlashGBX](https://github.com/lesserkuma/FlashGBX) as support is guaranteed. FlashGBX automatically recognizes it without doing anything. Other flashing devices (Cyclones, GB Operator, Sanni Cart Reader, etc.) were not tested, try them by yourself.

## What have been changed compared to the main branch ?
- Inconsistencies between BOM and schematic have been fixed;
- All 22 pf caps have been replaced with 39 pf to definitely fix image artifacts;
- The project now contains all necessary informations to be made without help.

## Minimal hardware/soft skill required in addition to all the BOM before starting anything
- A multimeter with a continuity mode for troubleshooting;
- A 60W soldering iron with a fine tip and a temperature setting;
- A hot air gun (reflow station) or a heating plate to desolder the MAC-GBD;
- Good quality solder wire/flux or solder paste and solder wick;
- Isopropanol in large quantities to clean all the flux mess;
- A magnifying system like an USB microscope or binocular magnifiers;
- A GBxCart flasher and FlashGBX software. Other flashers may or may not work;
- Some kapton tape (or any whatever branded polyimide tape) to cover the PCB gold fingers;
- Fine twizzers to handle the tiny components;
- 3 hours of free time with your prefered music in background and no kids whining around;
- An overall skill in soldering SMD components because this is **not a beginner project.** Damaging the MAC-GBD beyond repair is easy.

**Now ready to go ?**

## What to fit it with

The GB mini flashable camera in short version fits perfectly with the [Camera+ Mini shell](https://ko-fi.com/s/a4d7bd649a). With this shell, you can reuse the regular camera sensor ribbon.

The "Longboard" version has a "neck" that allows mounting it is a regular Game Boy Camera shell with the original ribbon cable. If you change your idea, you can physically break the neck and adapt the PCB again in the [Camera+ Mini shell](https://ko-fi.com/s/a4d7bd649a). **The long neck must be used with a vertical SMD JST connector.**

Both versions come with pads for both vertical and horizontal SMD JST connectors on the short part (before the neck). Be sure to solder the right connector on the right pad to avoid polarity inversion. **For the Camera+ mini shell and short PCB, it is recommended to go with the horizontal socket as there is not too much room inside.**

![](/Images/Connector.png)

**I overall recommend to order the long board which is more versatile**. The neck is easy to break and file to make a short board from it.

In case you want to mount the short PCB in a regular camera shell or in the regular [Game Boy Camera+ shell](https://ko-fi.com/s/9457d1cc6e), you will need a longer ribbon cable. 
Aliexpress cables are too thick and crappy for that task and you must order a genuine JST cable. The only available seller for good replacement and longer cable is Digikey. Choose a [type B cable "socket to socket" ](https://www.digikey.fr/en/products/base-product/jst-sales-america-inc/455/A09ZR09Z/588181). The regular camera cable is [2 inches long](https://www.digikey.fr/en/products/detail/jst-sales-america-inc/A09ZR09ZR28H51B/6708551), so take at least a [4 inches one](https://www.digikey.fr/en/products/detail/jst-sales-america-inc/A09ZR09ZR28H102B/9972202). Digikey ribbon cables are stiffer than the genuine cables but they can sustain the same amount of bending/torsion without connection issue.

Please follow the [building instructions from the original author](/Building_guides/build.pdf) (also given in next section) for PCB ordering options. Use [JLCPCB](https://passport.jlcpcb.com/) for ordering if you live in Europe. They offer VAT compliant services for European customers and very cheap shipping options. I typically got 5 boards ENIG finish shipped to France for 23€ in 2024.

**IMPORTANT note:** some Game Boy cameras have the U4 regulator populated instead of the U5 regulator. The board is designed to work with either the regulator linked in the BOM (recommended) or the U5 regulator harvested from the original camera cart. **U4 from the original board will not work.** If you're using a new 3V0 regulator from the BOM list, the **C16 capacitor will not be necessary.** Unlike the original 3V0 regulator, the pin connected to this capacitor is not connected on the new 3V0 regulator.

## Component location and orientation on PCB

![game boy camera flashable](Images/Component_placement_w_components.png)

It's not an interactive BOM sorry, I'm too cheap for that.

## Component list (BOM)

|Reference	|Value	|Count	|Footprint	|Name	|Description|
|-----------|----------|-----------|----------------|-------------|------------------|
|C1	|100 nF	|1	|0603 (imperial)	|Capacitor Ceramic (X7R)	|Decoupling Capacitor|
|C2, C3, C4, C5, C6, C7, C8, C9, C12, C13, C14, C15, C16, C19	|10 nF	|14	|0603 (imperial)|	Capacitor Ceramic (X7R)|	Decoupling Capacitor|
|C10, C11, C18	|39 pF	|3	|0603 (imperial)	|Capacitor Ceramic (X7R)|	Decoupling Capacitor|
|C17	|22 µF	|1	|1206 (imperial)	|Capacitor Tantalum (≤10%)	|Filtering Capacitor|
|D1	|N/A	|1	|SOT-23	|BAT54W-HG3-18 (or BAT 63-02V H6327 )	|Schottky diode|
|J2	|N/A	|1	|N/A	|JST ZH1.5mm (9 pins)	|Camera Connector (male)|
|R1	|1 kΩ	|1	|0603 (imperial)	|Resistor	|Resistor|
|U1	|N/A	|1	|TQFP-100 (14x14mm)	|MAC-GBD from original cart	|Main gamecart mapper chip|
|U2	|N/A	|1	|SC-88A-5 	|M74VHC1GU04DFT1G-L22038	|Signal inverter|
|U3	|N/A	|1	|TSOP-I-32 (12.4x8mm)	|FM28V100-TG 	|FRAM|
|U4	|N/A	|1	|SOT-23-5	|NCP718ASN300T1G 	|3V0 voltage regulator|
|U5	|N/A	|1	|TSOP-I-40 (18.4x10mm)	|AM29F080B	|Flash memory|

The PCB was designed on purpose with "big" components only (0603 is the smallest footprint) and not sadistic small caps like the 0402 size. The only intimidating component is the tiny signal inverter (SC-88A is indeed not the most comfortable package to handle I must admit).

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

- C10, C11 and C18 capacity has been increased compared to the original design to remove any graphical glitch due to FRAM timing inconsistencies. I had the exact same issue by doing the original design with Cypress Semiconductors and RAMTRON chips, so it's not chip related (more probably capacitor tolerance related). It is now perfectly OK with the cap values proposed in this fork.
- The AM29F080B, as most of 5 volts flash chips, is discontinued but easy to find on Aliexpress for cheap (batches are mainly recycled chips but there are lots of old new stocks). It can be fun to dump the content to see what was the chip usage before its recycling.
- Some late versions of the FM28V100 FRAM by Cypress Semiconductors come without a dot to indicate pin 1 but only a side notch. The side notch also indicates the row where pin 1 is located, so it must be soldered with notch pointing down (same as the dot if present).
- The M74VHC1GU04DFT1G signal inverter can be difficult to source in 2024 (sold out at Digikey for example) so it is recommended to switch to a MC74VHC1GU04DF1G (same pinout, same characteristics). The SC-88 package version is hard to find on Aliexpress but available on Mouser. The package SC−74A can be used too in case of no other choice, it barely fits. Chip marking must be **V6** in case of doubt when receiving the order.
- Low voltage Schottky diode is a generic one and any equivalent one will do the job (there are many). The original camera used a Panasonic MA784 with marking **2D** (discontinued), among other undocumented variations, you can take inspiration from its datasheet. The RB510VM-30 is a possible replacement for example. It must have the lowest possible forward voltage drop. Its role is to protect the MAC-GBD internal analog to digital converter from any overvoltage, so the anode is connected to VOUT (1V5 in the schematic) and the cathode to 3.0V. It triggers at around 3.18V on the anode. Whatever the diode used, it must have a specific mark on the cathode (see corresponding datasheet, can be a white line on black background or the inverse).
- Most parts can be found on Aliexpress, Mouser and Digikey except for the ribbon cable (Digikey only) if you need a longer one.
- You can easily desolder the MAC-GBD by using a hot air gun (set at about 350°C) on the back side of the original board until the chip falls by itself or after a gentle shaking. This is by far the most secure way I've found (I do not own a heating plate). I do not recommend using low temp solder or other bismuth containing crap. No need. The author of the original project recommends using a heating plate set at 250°C. In any case, work fast to minimize at most heat budget on the chip.
- Lead free solder in wire can be crap depending on the alloy and could be a pain to melt due to high melting point. Either use old good lead/tin alloy with flux core (and a ton of flux anyway) if you can find some or quality lead free solder paste. And always remind the rule of thumb when using flux: "the bigger the blob, the better the job".
- The ferrite beads filters have been removed from the definitive PCB even if they are still mentioned in the pdf description of the project.
- The schematic is clear and comprehensive enough to troubleshoot any issue by yourself with a multimeter in continuity mode. Easy check before first flashing attempt: the caps must **never** be shorted, two adjacent pins of the FRAM and flash memory must never be shorted. After that, any remaining issue is a just a matter of flow and reflow due to a dry solder joint.
- It's **very recommended** to use a magnifying system (USB microscope or binocular magnifier). Soldering with bare eyes is possible if you are lucky enough to get the device working first try but any issue will be impossible to troubleshoot.
- The ENIG finish can be hard to "wet" with solder depending on the flux used. I used a BEEYUIHF #8403 "no clean" flux in syringe which was OK in my case (good flux wetting, easy to "no clean" with isopropanol, not greasy and no headache after long soldering sessions contrary to some other el cheapo Aliexpress fluxes in metal containers I used to spread before).
- Of course, cover the cartridge connector completely with kapton tape to avoid any solder splats on it during soldering. They are basically impossible to remove after, so better avoid them.
- I also recommend to clean with flux/solder wick/isopropanol and unbend very thoroughly the pins of the MAC-GBD or any recycled chip **before** soldering them to the PCB. A solder bridge due to a metal particle between/below pins (like a ripped pad, own experience...) is very annoying to remove (you basically have to remove the whole chip to get rid of it).
- I've soldered the components in this order: chips, caps/diode/resistor, regulator/inverter, and then the connector. I've cleaned board between each step with isopropanol to get a clear view of the work and check for dry solder joints and obvious shorts.
- First connection to FlashGBX will always report a bad/unknown mapper/rom but as soon as you try to flash a rom everything will go fine. I recommend flashing a regular rom (which fills the whole 1MB flash chip) and fill the whole memory with different images for testing. If after reboot all your images are still there without artifacts and in the same order, you're good to go with your new device !
- As the populated PCB is full "solid state", it can be cleaned by directly soaking it in isopropanol, the caps risk nothing.
- I learnt soldering surface mount stuff by just watching the [Ben Heck hacks](https://www.youtube.com/watch?v=oGB7Yrbeo_Y) on Youtube (but you certainly have your favorite gen Z youtuber doing the same), so it's not rocket science either. I only had basic skill in soldering prior of that and it was enough to start modding without too much difficulty. Hardware is the key (good iron with temperature control, good solder alloy, good flux, accurate magnifying device) as soldering surface mount stuff is not forgiving. Best is to start practicing soldering/desoldering with any whatever dead PCB, no need to buy online soldering kits that will end in a drawer.

## Showcase with the long board attached to a GBxCart for flashing

![game boy camera flashable](Images/Long_board.png)

I've ordered a set of long boards to fit them initially in regular camera shells. The long board can be broken at the "neck" to fit a shorter shell. Important reminder: there are no shell mods allowing selfies, the regular camera shell only has a rotating head. The image shown here was taken while troubleshooting C10, so the two caps mounted in parallel (see next section).

## The story within the story

![](Images/While_troubleshooting.png)

- I've received the signal inverter in the wrong package on Aliexpess (package SC−74A, it was referenced as SC-88A but it was not). It barely fits and was quite a pain to solder correctly on the traces but it works. As long as the chip marking begins by V6, chip is the same.
- Using a 22 pf capacitor for C10 as recommended in the original repo led to image glitches on my side (I must precise that I did not specifically order X7R caps but was working at "room temperature" with unbranded caps). As I know that this very particular cap is crucial for FRAM stability, I've tried doubling or dividing the value by two (and changing the FRAM brand, I thought it was the culprit but in fact not). Divinding the capacitance by two made glitches worse. Doubling to 44 pf with two 22 pf in parallel fixes the graphical glitches. So I then tried a 39 pf cap to be closer from initial value and it was OK. As C11 and C18 are less critical than C10 and to avoid ordering too many different cap references, they were also increased to 39 pf (which is validated as perfectly working on my side).
- I've soldered C16 in place even if it is not required as I used a new voltage regulator. Just in case.
- I've used an old new stock Panasonic MA784 Schottky diode because I own a bunch of them that I bought for science years ago.

## Showcase with the Camera+ Mini shell

![game boy camera flashable](Images/Mini_camera_shell.png)

Short version (made after breaking the neck of a long version, soldering an horizontal JST connector and going with the definitive capacitor set given in the BOM) installed inside the [Camera+ Mini shell](https://ko-fi.com/s/a4d7bd649a). That's a beautiful and handy mod to use, I highly recommend.

![](Images/Image_example.png)

Some pictures made with the device: the use of a lens mod improves drastically the quality of image taken.

**Some notes about the Camera+ Mini shell:**
- I've ordered [this version of the Camera+ Mini shell](/Shell) at JLCPCB with the following option: 3D Technology: MJF(Nylon) Material: PA12-HP Nylon Colors: Black Surface Finish: Dyeing-Dyed Black. It came very nice and sturdy like this.
- The C/CS mount I bought was way to large to enter the front hole so I had to file its external diameter until it enters with a moderate force. At this step, you can adjust the C/CS mount deepness until your lens can easily focus to infinity before glueing it definitely by the inside. The mod is very well made so even with the C/CS ring completely pressed inside the hole, it must be OK.
- The mod does reuse only screws from the genuine camera shell, which is great !

## Funfacts
- The MAC-GBD I used here was hosted on three different PCBs. The mapper was so desoldered two times and soldered three times (one time in factory, two times by me on two different custom PCBs). My conclusion is that the MAC-GBD seems rather forgiving in term of thermal budget.
- Interestingly enough, this mod was started completely from scratch by reverse engineering the Game Boy Camera PCB and ended as a quite different design (closer to the original PCB) compared to the other known flashable camera mod. You can read the whole making of [here](/Building_guides/Micro_Camera_II.pdf), which is super interesting to understand the choice of components.
- The project was literally plagued on my side. My Digikey order had all components count doubled (as well as the price) without any reason, and I saw that after paying. The signal inverters were then removed from the order by Digikey due to part shortage on their side while everything was OK during checkout. I got the information **only after shipping** so no possibility to ask for a replacement part in the same parcel. In consequence, I ordered some from Aliexpress because free shipping, they came in the wrong package 3 weeks later (despite being labelled as SC-88A). The platform refuses the refund, because well, it was the good component, so I've decided to proceed with this package anyway. After assembly, the image had random artifacts which came first from a dry solder joint below the signal inverter (due to the wrong package) and then issue with capacitors value (I though initially that it was a bad FRAM or a fried MAC-GBD as both of them were recycled from another PCB). I had to debug for two days (comprising some chip swap and a ton of double checking) to find the solution and then re-order a bunch of new capacitors. They arrived during my vacations out of home so impossible to continue the project for one more week. Overall, more than two months pass from the first Digikey order to the project completion. But it really deserved the effort. I hope you will have fun doing this mod.
  
## Acknowledgements
- [Andreas Hahn](https://github.com/HerrZatacke) and [Mraulio](https://github.com/Mraulio) for helping me to complete this fork by confirming me some educated guesses I had to do and giving me links to some references lost on the internet.
- [2BitWizard](https://github.com/2BitWizard), original author, for bringing the project to fruition. Thanks also for sending me some early prototypes for testing in 2023, unfortunately at about the same time I left all social media and long before I found time and motivation to dive again into the project and make it. Sadly I have no contact with him anymore.
- [2BitToy](https://ko-fi.com/2bittoy/) for his great/neat camera mods. Don't forget [donation](https://ko-fi.com/s/a4d7bd649a) if you appreciate this mod.
