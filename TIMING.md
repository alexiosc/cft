# Notes About Processor Timign

* T3 starts at CLK3 rising edge + one flip flop propagation delay, ~ 16ns.
* Bus transactions go from T3 to T3.
* The bus write signal (W) must strobe in T4, or T1. T1 is better for slow devices.
* Actions should be asserted between the rising edge of CLK3 and the
  rising edge of CLK1 (inclusive), i.e. during T4 or T1.
