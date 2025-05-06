<h1>N-Pulse - Control Board</h1>

<h2>Key Features</h2>

<ul>
    <li><strong>Microcontroller</strong>: A STM32G484 optimized for mixed-signal applications with a 16MHz external oscillator. Control the 8 DC motors independently.</li>
    <li><strong>Power Management</strong>: +12V supply +5V supplied from the Power Board. Use of a LDO to convert +5V to +3.3V ensuring a clean and independent +3.3V on the board.</li>
    <li><strong>8 motor drivers</strong>: DRV8220 (TI) 2 Half-side bridges control with a 4-NOR-Gates SNLVC7402 with a PWM and a digital inputs</li>
    <li><strong>6 10 positions connectors</strong>: link between the control board and the "connector board" on which all wires are solder (Power supply, FSR - Force sensor resistor, Motors + encoders)</li>
    <li><strong></strong></li>
</ul>

<h2>Points that need to be reviewed</h2>
<ol>
    <li>Schematic - All the pins of the MCU : Check in the datasheet that all signals (PWM, Analogic (FSRs, LED, VBat, currents), encoders, oscillators, UARTs, SPI, reset, debug) are connected to the good MCU pins. So, the properties and the timers of each MCU must be checked.</li>
    <li>PCB - Footprint of each components (Daniel is working on that) : Check that all the selected footprints are the same as those described in datasheets.</li>
