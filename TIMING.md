# Notes About Processor Timing

* T3 starts at CLK3 rising edge + one flip flop propagation delay, ~ 16ns.
* Bus transactions go from T3 to T3.
* The bus write signal (W) must strobe in T4, or T1. T1 is better for slow devices.
* Actions should be asserted between the rising edge of CLK3 and the
  rising edge of CLK1 (inclusive), i.e. during T4 or T1.



## Processor Cycle

It has a period of 250 ns (4 MHz clock). There are four clock phases,
T1 to T4.

Synchronisation is achieved using four clock signals, CLK1 to
CLK4. The clocks have a 75% duty cycle and 90° phase difference
between them. CLK1 is low during T1, CLK2 during T4, and so on.

### Phase T1 and T2

At the beginning of T1, the µPC is incremented, and the microcode
address vector changes. In the next approximately 55ns, the Control
Store (a 256 KB × 24-bit ROM) fetches the 24-bit control vector for
the new microcode address.

The vector is allowed to settle until the end of T2, and is registered
on the rising edge of CLK2. Its signals drive the rest of the system
during T3 and T4.

Because of this registration, there is a certain amount of pipelining
in the CFT. A bus transaction may still be occurring during T1 and
T2. For bus write transactions, the write signal will be de-asserted
at the end of T1.

### Phase T3

Any requested bus transactions start here. For write transactions, the
bus W signal is asserted now. This allows slow devices to decode the
transaction and enable themselves as early as possible.

If a device can't complete the transaction  187ns, it must
assert the WS signal during T3. The processor will prolong the bus
transaction by whole processor cycles until (on a future rising edge
of CLK3) the WS signal is no longer asserted.

### Phase T4



## Wait States

Wait states must be asserted during T3, as early as possible, and at
least one 74AC flip-flop setup time before the rising edge of CLK3 to
avoid metastability issues.

The WS signal is open drain, so it must be driven by an open drain
driver, or through a Schottky diode.

No device should ever assert WS unless it's being addressed.

During Wait States:

* The µPC is not modified. It's neither incremented, nor set to zero at
  the end of an instruction. 
* WS is sampled on the rising edge of CLK3.
  
