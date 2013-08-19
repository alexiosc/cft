<?php
/*************************************************************************************
 * cftasm.php
 * -------
 * Author: Alexios Chouchoulas (alexios@bedroomlan.org)
 * 
 * Derived from c.php:
 *
 * Author: Tux (tux@inmail.cz)
 * Copyright: (c) 2004 Tux (http://tux.a4.cz/), Nigel McNie (http://qbnz.com/highlighter)
 * Release Version: 1.0.7.20
 * Date Started: 2004/07/27
 *
 * x86 Assembler language file for GeSHi.
 * Words are from SciTe configuration file (based on NASM syntax)
 *
 * CHANGES
 * -------
 * 2004/11/27 (1.0.2)
 *  -  Added support for multiple object splitters
 * 2004/10/27 (1.0.1)
 *   -  Added support for URLs
 *   -  Added binary and hexadecimal regexps
 * 2004/08/05 (1.0.0)
 *   -  First Release
 *
 * TODO (updated 2004/11/27)
 * -------------------------
 *
 *************************************************************************************
 *
 *     This file is part of GeSHi.
 *
 *   GeSHi is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation; either version 2 of the License, or
 *   (at your option) any later version.
 *
 *   GeSHi is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details.
 *
 *   You should have received a copy of the GNU General Public License
 *   along with GeSHi; if not, write to the Free Software
 *   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 *
 ************************************************************************************/

$language_data =
  array (
	 'LANG_NAME' => 'CFT Assembler 2.x',
	 'COMMENT_SINGLE' => array(1 => ';', 2 => '/'),
	 'COMMENT_MULTI' => array(),
	 'CASE_KEYWORDS' => GESHI_CAPS_NO_CHANGE,
	 'QUOTEMARKS' => array("'", '"'),
	 'ESCAPE_CHAR' => '',
	 'KEYWORDS' => 
	 array(
	       // Processor instructions and alias macros
	       1 =>
	       array(
		     'TRAP', 'IOT', 'LOAD', 'STORE', 'IN', 'OUT', 'JMP', 'RET', 'RTT',
		     'RTI', 'JSR', 'ADD', 'AND', 'OR', 'XOR', 'OP1', 'NOP', 'NOP10',
		     'IFL', 'IFV', 'CLA', 'CLL', 'NOT', 'INC', 'CPL', 'RBL', 'RBR',
		     'RNL', 'RNR', 'NEG', 'ING', 'SBL', 'SBR', 'SEL', 'OP2', 'NOP8',
		     'SKPN', 'SNA', 'SZA', 'SSL', 'SSV', 'SKIP', 'SNN', 'SNZ', 'SCL',
		     'SCV', 'CLA', 'CLI', 'STI', 'SNP', 'SPA', 'POP', 'ISZ', 'LIA',
		     'LI', 'JMPII',
		     'R', 'I'),
			      
	       // Peripherals
	       2 =>
	       array(
		     'PANEL', 'LSR', 'LDSR', 'SOR', 'HALT', /* Front panel */
		     ),
			      
	       // Registers
	       3 =>
	       array(
		     'RETV', 'RTTV', 'RTIV', /* Machine vectors */
		     'R0', 'R1', 'R2', 'R3', 'R4', 'R5', 'R6', 'R7', 
		     'R8', 'R9', 'R10', 'R11', 'R12', 'R13', 'R14', 'R15',
		     'TR0', 'TR1', 'TR2', 'TR3', 'TR4', 'TR5', 'TR6', 'TR7',
		     'TR8', 'TR9', 'TR10', 'TR11', 'TR12', 'TR13', 'TR14', 'TR15',
		     'TMP0', 'TMP1', 'TMP2', 'TMP3', 'TMP4', 'TMP5', 'TMP6', 'TMP7',
		     'TMP8', 'TMP9', 'TMP10', 'TMP11', 'TMP12', 'TMP13', 'TMP14', 'TMP15',
		     'ARG0', 'ARG1', 'ARG2', 'ARG3', 'ARG4', 'ARG5', 'ARG6', 'ARG7',
		     'ARG8', 'ARG9', 'ARG10', 'ARG11', 'ARG12', 'ARG13', 'ARG14', 'ARG15',
		     'ISRR0', 'ISRR1', 'ISRR2', 'ISRR3', 'ISRR4', 'ISRR5', 'ISRR6', 'ISRR7',
		     'ISRR8', 'ISRR9', 'ISRR10', 'ISRR11', 'ISRR12', 'ISRR13', 'ISRR14', 'ISRR15',
		     'I0', 'I1', 'I2', 'I3', 'I4', 'I5', 'I6', 'I7',
		     'I8', 'I9', 'I10', 'I11', 'I12', 'I13', 'I14', 'I15',
		     'TI0', 'TI1', 'TI2', 'TI3', 'TI4', 'TI5', 'TI6', 'TI7',
		     'TI8', 'TI9', 'TI10', 'TI11', 'TI12', 'TI13', 'TI14', 'TI15',
		     'IIR0', 'IIR1', 'IIR2', 'IIR3', 'IIR4', 'IIR5', 'IIR6', 'IIR7',
		     'IIR8', 'IIR9', 'IIR10', 'IIR11', 'IIR12', 'IIR13', 'IIR14', 'IIR15',
		     ),
			      
	       // Directives
	       4 =>
	       array(
		     '.equ', '.reg', '.macro', '.include', '.macro', '.end',
		     '.word', '.str', '.strn', '.strp', '.fill', '.regfill', '.page',
		     ),
	       ),
	 'SYMBOLS' =>
	 array(
	       '@',
	       ),
	 'CASE_SENSTITIVE' =>
	 array(
	       GESHI_COMMENTS => true,
	       1 => false,
	       2 => false,
	       3 => false,
	       4 => false,
	       5 => false
	       ),
	 'STYLES' =>
	 array(
	       'KEYWORDS' =>
	       array(
		     1 => 'color: #00007f;',
		     2 => 'color: #0000ff;',
		     3 => 'color: #46aa03; font-weight:bold;',
		     4 => 'color: #0000ff;',
		     5 => 'color: #0000ff;'
		     ),
	       'COMMENTS' =>
	       array(
		     1 => 'color: #adadad; font-style: italic;',
		     2 => 'color: #adadad; font-style: italic;',
		     ),
	       'ESCAPE_CHAR' =>
	       array(
		     0 => 'color: #000099; font-weight: bold;'
		     ),
	       'BRACKETS' =>
	       array(
		     0 => 'color: #66cc66;'
		     ),
	       'STRINGS' =>
	       array(
		     0 => 'color: #7f007f;'
		     ),
	       'NUMBERS' =>
	       array(
		     0 => 'color: #ff0000;'
		     ),
	       'METHODS' =>
	       array(
                        ),
	       'SYMBOLS' =>
	       array(
		     0 => 'color: #66cc66;'
		     ),
	       'REGEXPS' =>
	       array(
		     0 => 'color: #ff0000;',
		     1 => 'color: #ff0000;'
		     ),
	       'SCRIPT' => array(
                        )
	       ),
	 'URLS' => array(
			 1 => '',
			 2 => ''
			 ),
	 'OOLANG' => false,
	 'OBJECT_SPLITTERS' => array(
                ),
	 'REGEXPS' => array(
			    0 => '0[0-9a-fA-F]{1,32}[hH]',
			    1 => '[01]{1,64}[bB]'
			    ),
	 'STRICT_MODE_APPLIES' => GESHI_NEVER,
	 'SCRIPT_DELIMITERS' => array(
                ),
	 'HIGHLIGHT_STRICT_BLOCK' => array(
					   ),
	 'TAB_WIDTH' => 8
	 );

?>
