## Some technical comments / project comparison

- HDR projects uses a 3.3V regulator and 2BitWizard a 3.0V regulator (like the original GB camera). Both fits within the FRAM specification and the difference seems to have no effect on the MAC-GBD voltage scale for ADC (image looks absolutely the same with the two designs). This implies that the voltage reference for the MAC-GBD flash ADC is probably pulled from the 5V line.
- HDR project uses no voltage inverter and RAM_CE1 is directly connected to ground. 2BitWizard uses a voltage inverter connecting RAM_CE1 to RST line which mimicks the Camera strategy by inactivating writing to RAM during reset. Shorting RAM_CE1 to GND on the 2bitwizard project works perfectly in case of voltage inverter shortage.
- HDR project uses 100 nf caps by default while 2BitWizard uses 10 nf caps by default on the voltage lines (with one 100 nf only). The value seems not that critical so, and 2BitWizard design must also work with only 100 nf caps instead of a mix 10/100 nf caps to limit the reference number.
- HDR project works with 22 pf caps connected to the RAM_WE and RAM_CE2 lines while 2BitWizard design requires slighly higher value for cap connected on RAM_WE and uses caps on RAM_WE, RAM_CE2 and RAM_OE. As 22 pf is a very minimal value, different design in ground plane / dielectric constant of materials may explain why this value may suffice or not. The cap on RAM_OE looks anyway not critical. 22 pf is OK for RAM_CE2 for both projects and value for RAM_WE should be 22 pf or more for 2BitWizard project.
- HDR design uses a 2MB flash chip with a physical switch to select one of two banks on ROM_A20, allowing two roms to coexist on the same board, while 2BitWizard design uses a smaller 1MB flash chip. I never had any use of the second bank when using HDR design due to the need to open the shell but I can understand the appeal for some users or with some shell mods.

I have only amateur skill in electronics and these comments are just based on schematics. Remind that we are just talking about modding a toy produced in millions of units, even a huge mistake with my understanding won't keep me awake at night. I also don't give a shit of who got the best design. I have tested both (I made several of them over years), **they work perfectly, and exactly as the original Game Boy Camera**, according to my demanding user experience. The only difference for the user is the license associated to each project. Both were designed with passion (maybe even a [little bit too much](https://github.com/HDR/Licence-Violation-Hall-Of-Shame)) and the same motivation to ~make money on~ benefit to the modding community.

## Alternative design proposal for the 2BitWizard project (validated on my side)
- RAM_CE1 shorted to ground without the signal inverter (you can use a 1k resistor to make the bridge as it is exactly the good lenght, just be carefull to not short RST and GND in the process). You can get rid of C12 in this case (see [an example here](/Images/While_troubleshooting.png)).
- Only 100 nf capacitors instead of 10 nf capacitors on voltage lines to reduce the number of references to buy.
- All of this is perfectly working in any case (hard reset, soft reset, custom and regular roms, on DMG, GBC, GB Boy Colour and GBA).

![](/Images/Component_placement_alternative.png)

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

Enjoy this simplified new design !
