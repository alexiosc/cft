#!/usr/bin/python3

print("""
<html>
<head>
<style>
body {
  background:#888;
  color:#fff;
  font-weight:normal;
}

.lr {
  fill:#800;
}

</style>
</head>
<body>
<h1>SVG Panel</h1>

<svg width="1969" height="700" xmlns="http://www.w3.org/2000/svg" xmlns:xlink= "http://www.w3.org/1999/xlink">
""")


print("""

  <defs>
    <circle id="_cftlo" r="15"/>
  </defs>

  <rect x="0" y="0" width="1969" height="700" style="fill:#000"/>
  <g transform="translate(100 100)">
    <text font-size="17" fill="#fff" x="0" y="0">Micro-Instruction Control Vector</text>
    <g fill="#800" transform="translate(15 30)">
      <use href="#_cftlo" x="0"   id="cft_la00" class="lr"/>
      <use href="#_cftlo" x="50"  id="cft_la00" class="lr"/>
      <use href="#_cftlo" x="100" id="cft_la00" class="lr"/>
      <use href="#_cftlo" x="150" id="cft_la00" class="lr"/>
      <use href="#_cftlo" x="200" id="cft_la00" class="lr"/>
      <use href="#_cftlo" x="250" id="cft_la00" class="lr"/>
      <use href="#_cftlo" x="300" id="cft_la00" class="lr"/>
      <use href="#_cftlo" x="350" id="cft_la00" class="lr"/>
    </g>
  </g>

""")


panel = {
    "uc"
}



print("""
</svg>
</body>
</html>
""")

# End of file.