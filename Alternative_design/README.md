# Alternative design proposal for the 2BitWizard project

## 1. Get rid of the signal inverter

RAM_CE1 can be connected to ground directly, without the signal inverter. You can use a 1kOhms resistor to make the bridge as it is exactly the good lenght, just be carefull to not short RST and GND in the process. You can get rid of C12 in this case (see [an example here](/Images/While_troubleshooting.png)). My understanding is that the RESET signal is intended to be pulled down by the [battery backup management system](https://github.com/MouseBiteLabs/Game-Boy-MBC3-Cartridge/tree/main/Technical) (not used here because FRAM), to halt **both CPU operation AND writing to SRAM** when voltage is unstable while the Game Boy is powered down. But as it is pulled high on the Game Boy CPU side by default, the signal inverter pulls it down and always allows writing to the FRAM when Game Boy is ON. What a wire to ground does perfectly too. I can find at least as many arguments pro or against grounding RAM_CE1 or using the inverter.

**Possible placements for a 1kOhms resistor (or jumper wire, or 0 Ohm) to ground RAM_CE1 pin**
![](/Alternative_design/Resistor_placement.png)

The author has since released a 1.5 version (see [original repo](https://github.com/2BitWizard/GB_Mini_Camera)) that just adds a jumper (JP1) to do this cleanly. I however did not test this release.

## 2. Use only 100 nf caps on the voltage lines

Use only 100 nf capacitors instead of 10 nf capacitors on voltage lines to reduce the number of references to buy. 100 nf or more is the default cap value for many cart mods on voltage lines, so do not hesitate as 10 pf caps are of no use for other related mods. 

**Alternative capacitor placement on PCB**
![](/Alternative_design/Component_placement_alternative.png)

**Alternative schematic**
![](/Alternative_design/Alternative_schematic.png)

## Alternative BOM

|Silkscreen |Value |# |Footprint |Exact reference |Aliexpress link |
|---------|---------|---------|---------|---------|---------|
|C1 to C9, C12 to C16, C19	|100nF	|15	|0603 |	Capacitor Ceramic (X7R)|[100 nf - 0603](https://fr.aliexpress.com/item/1005005690927737.html)|
|C10, C11, C18	|39pF	|3	|0603 |Capacitor Ceramic (X7R)|[39 pf - 0603](https://fr.aliexpress.com/item/1005005690927737.html)|
|C17	|22µF	|1	|1206 |Capacitor Tantalum (≤10%)	|[22 µf, 16V X7R - 1206](https://fr.aliexpress.com/item/1005006022131059.html)|
|D1	|N/A	|1	|SOD-123 |BAT54W-HG3-18 Schottky diode|[BAT54W - SOD-123](https://fr.aliexpress.com/item/1005005967484049.html)|
|J2	|N/A	|1	|N/A	|JST ZH1.5mm (9 pins)	Camera Connector (male, horizontal or vertical)|[9 pins JST connectors](https://fr.aliexpress.com/item/1005006028155508.html)|
|R1	|1kΩ	|2	|0603 |Resistor	|[1kOhm - 0603](https://fr.aliexpress.com/item/1005005677654015.html)|
|U1	|N/A	|1	|TQFP-100 |MAC-GBD gamecart mapper chip|Harvest from cart|
|U3	|N/A	|1	|TSOP-I-32 |FM28V100-TG FRAM|[FM28V100-TG - TSOP-32](https://fr.aliexpress.com/item/1005006265366983.html)|
|U4	|N/A	|1	|SOT-23-5	|NCP718ASN300T1G 3V0 voltage regulator|[NCP718ASN300T1G - SOT-23-5](https://fr.aliexpress.com/item/1005007543804480.html)|
|U5	|N/A	|1	|TSOP-I-40 |AM29F080B	Flash memory|[AM29F080B - TSOP-40](https://fr.aliexpress.com/item/1005006991297704.html)|

**These modifications were bullet-proofed in any situation I can test, and I have lots of imagination (repeated hard and soft resets, custom and regular roms, combined with DMG, modded DMG, GBC, modded GBC, GB Boy Colour and GBA).** You can cumulate these two mofifications or use them separately, it works too (i.e. 100 nf caps with inverter or 10 nf caps without inverter). Enjoy !
