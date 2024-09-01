## Some technical comments / project comparison

- HDR projects uses a 3.3V regulator and 2BitWizard a 3.0V regulator (like the original GB camera). Both fits within the FRAM specification and the difference seems to have no effect on the MAC-GBD voltage scale for ADC (image looks absolutely the same with the two designs). This implies that the voltage reference for the MAC-GBD flash ADC is probably pulled from the 5V line.
- HDR project uses no voltage inverter and RAM_CE1 is directly connected to ground. 2BitWizard uses a voltage inverter connecting RAM_CE1 to RST line which mimicks the Camera strategy by inactivating writing to RAM during reset. Shorting RAM_CE1 to GND on the 2bitwizard project works perfectly in case of voltage inverter shortage.
- HDR project uses 100 nf caps by default while 2BitWizard uses 10 nf caps by default on the voltage lines (with one 100 nf only). The value seems not that critical so, and 2BitWizard design must also work with only 100 nf caps instead of a mix 10/100 nf caps to limit the reference number.
- HDR project works with 22 pf caps connected to the RAM_WE and RAM_CE2 lines while 2BitWizard design requires slighly higher value for cap connected on RAM_WE and uses caps on RAM_WE, RAM_CE2 and RAM_OE. As 22 pf is a very minimal value, different design in ground plane / dielectric constant of materials may explain why this value may suffice or not. The cap on RAM_OE looks anyway not critical. 22 pf is OK for RAM_CE2 for both projects and value for RAM_WE should be 22 pf or more for 2BitWizard project.
- HDR design uses a 2MB flash chip with a physical switch to select one of two banks on ROM_A20, allowing two roms to coexist on the same board, while 2BitWizard design uses a smaller 1MB flash chip. I never had any use of the second bank when using HDR design due to the need to open the shell but I can understand the appeal for some users or with some shell mods.

I have only amateur skill in electronics and these comments are just based on schematics. They do not constitute an opinion on who made the best design (and I don't give a shit of that anymore to be honest). I have tested both (I made several of them over years), **they work perfectly, and exactly as the original Game Boy Camera**, according to my demanding user experience. The only difference for the user is the license associated to each project. Both were designed with passion (maybe a little bit too much) and the same motivation to fill a gap in the modding community.

## Alternative design proposal for the 2BitWizard project (validated)
- RAM_CE1 shorted to ground without the signal inverter (you can use a 1k resistor to make the bridge as it is exactly the good lenght). You can get rid of C12 in this case.
- Only 100 nf capacitors instead of 10 nf capacitors on voltage lines.
- All of this is perfectly working in any case (hard reset, soft reset, custom and regular roms).

![](/Images/Component_placement_alternative.png)
