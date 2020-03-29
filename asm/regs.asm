;;; Definitions for Page Zero.
;;;
;;; Copyright © 2014–2020 Alexios Chouchoulas.
;;;
;;; This program is free software; you can redistribute it and/or modify it
;;; under the terms of the GNU General Public License as published by the Free
;;; Software Foundation; either version 2, or (at your option) any later
;;; version.
;;; 
;;; This program is distributed in the hope that it will be useful, but WITHOUT
;;; ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
;;; FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
;;; more details.
;;; 
;;; You should have received a copy of the GNU General Public License along with
;;; this program; if not, write to the Free Software Foundation, Inc., 59 Temple
;;; Place - Suite 330, Boston, MA 02111-1307, USA.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; 300–33F: PLAIN BANK-RELATIVE REGISTERS (BxRy)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		
		.reg B0R0 R &300
		.reg B0R1 R &308
		.reg B0R2 R &310
		.reg B0R3 R &318
		.reg B0R4 R &320
		.reg B0R5 R &328
		.reg B0R6 R &330
		.reg B0R7 R &338
		
		.reg B1R0 R &301
		.reg B1R1 R &309
		.reg B1R2 R &311
		.reg B1R3 R &319
		.reg B1R4 R &321
		.reg B1R5 R &329
		.reg B1R6 R &331
		.reg B1R7 R &339
		
		.reg B2R0 R &302
		.reg B2R1 R &30a
		.reg B2R2 R &312
		.reg B2R3 R &31a
		.reg B2R4 R &322
		.reg B2R5 R &32a
		.reg B2R6 R &332
		.reg B2R7 R &33a
		
		.reg B3R0 R &303
		.reg B3R1 R &30b
		.reg B3R2 R &313
		.reg B3R3 R &31b
		.reg B3R4 R &323
		.reg B3R5 R &32b
		.reg B3R6 R &333
		.reg B3R7 R &33b
		
		.reg B4R0 R &304
		.reg B4R1 R &30c
		.reg B4R2 R &314
		.reg B4R3 R &31c
		.reg B4R4 R &324
		.reg B4R5 R &32c
		.reg B4R6 R &334
		.reg B4R7 R &33c
		
		.reg B5R0 R &305
		.reg B5R1 R &30d
		.reg B5R2 R &315
		.reg B5R3 R &31d
		.reg B5R4 R &325
		.reg B5R5 R &32d
		.reg B5R6 R &335
		.reg B5R7 R &33d
		
		.reg B6R0 R &306
		.reg B6R1 R &30e
		.reg B6R2 R &316
		.reg B6R3 R &31e
		.reg B6R4 R &326
		.reg B6R5 R &32e
		.reg B6R6 R &336
		.reg B6R7 R &33e
		
		.reg B7R0 R &307
		.reg B7R1 R &30f
		.reg B7R2 R &317
		.reg B7R3 R &31f
		.reg B7R4 R &327
		.reg B7R5 R &32f
		.reg B7R6 R &337
		.reg B7R7 R &33F

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; 340–37F: AUTO-INCREMENT BANK-RELATIVE REGISTERS (BxAIy)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		
		.reg B0AI0 R &340
		.reg B0AI1 R &348
		.reg B0AI2 R &350
		.reg B0AI3 R &358
		.reg B0AI4 R &360
		.reg B0AI5 R &368
		.reg B0AI6 R &370
		.reg B0AI7 R &378
		
		.reg B1AI0 R &341
		.reg B1AI1 R &349
		.reg B1AI2 R &351
		.reg B1AI3 R &359
		.reg B1AI4 R &361
		.reg B1AI5 R &369
		.reg B1AI6 R &371
		.reg B1AI7 R &379
		
		.reg B2AI0 R &342
		.reg B2AI1 R &34a
		.reg B2AI2 R &352
		.reg B2AI3 R &35a
		.reg B2AI4 R &362
		.reg B2AI5 R &36a
		.reg B2AI6 R &372
		.reg B2AI7 R &37a
		
		.reg B3AI0 R &343
		.reg B3AI1 R &34b
		.reg B3AI2 R &353
		.reg B3AI3 R &35b
		.reg B3AI4 R &363
		.reg B3AI5 R &36b
		.reg B3AI6 R &373
		.reg B3AI7 R &37b
		
		.reg B4AI0 R &344
		.reg B4AI1 R &34c
		.reg B4AI2 R &354
		.reg B4AI3 R &35c
		.reg B4AI4 R &364
		.reg B4AI5 R &36c
		.reg B4AI6 R &374
		.reg B4AI7 R &37c
		
		.reg B5AI0 R &345
		.reg B5AI1 R &34d
		.reg B5AI2 R &355
		.reg B5AI3 R &35d
		.reg B5AI4 R &365
		.reg B5AI5 R &36d
		.reg B5AI6 R &375
		.reg B5AI7 R &37d
		
		.reg B6AI0 R &346
		.reg B6AI1 R &34e
		.reg B6AI2 R &356
		.reg B6AI3 R &35e
		.reg B6AI4 R &366
		.reg B6AI5 R &36e
		.reg B6AI6 R &376
		.reg B6AI7 R &37e
		
		.reg B7AI0 R &347
		.reg B7AI1 R &34f
		.reg B7AI2 R &357
		.reg B7AI3 R &35f
		.reg B7AI4 R &367
		.reg B7AI5 R &36f
		.reg B7AI6 R &377
		.reg B7AI7 R &37f

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; 380–3BF: AUTO-DECREMENT BANK-RELATIVE REGISTERS (BxADy)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		
                .reg B0AD0 R &380
                .reg B1AD0 R &381
                .reg B2AD0 R &382
                .reg B3AD0 R &383
                .reg B4AD0 R &384
                .reg B5AD0 R &385
                .reg B6AD0 R &386
                .reg B7AD0 R &387
		
                .reg B0AD1 R &388
                .reg B1AD1 R &389
                .reg B2AD1 R &38a
                .reg B3AD1 R &38b
                .reg B4AD1 R &38c
                .reg B5AD1 R &38d
                .reg B6AD1 R &38e
                .reg B7AD1 R &38f
		
                .reg B0AD2 R &390
                .reg B1AD2 R &391
                .reg B2AD2 R &392
                .reg B3AD2 R &393
                .reg B4AD2 R &394
                .reg B5AD2 R &395
                .reg B6AD2 R &396
                .reg B7AD2 R &397
		
                .reg B0AD3 R &398
                .reg B1AD3 R &399
                .reg B2AD3 R &39a
                .reg B3AD3 R &39b
                .reg B4AD3 R &39c
                .reg B5AD3 R &39d
                .reg B6AD3 R &39e
                .reg B7AD3 R &39f
		
                .reg B0AD4 R &3a0
                .reg B1AD4 R &3a1
                .reg B2AD4 R &3a2
                .reg B3AD4 R &3a3
                .reg B4AD4 R &3a4
                .reg B5AD4 R &3a5
                .reg B6AD4 R &3a6
                .reg B7AD4 R &3a7
		
                .reg B0AD5 R &3a8
                .reg B1AD5 R &3a9
                .reg B2AD5 R &3aa
                .reg B3AD5 R &3ab
                .reg B4AD5 R &3ac
                .reg B5AD5 R &3ad
                .reg B6AD5 R &3ae
                .reg B7AD5 R &3af
		
                .reg B0AD6 R &3b0
                .reg B1AD6 R &3b1
                .reg B2AD6 R &3b2
                .reg B3AD6 R &3b3
                .reg B4AD6 R &3b4
                .reg B5AD6 R &3b5
                .reg B6AD6 R &3b6
                .reg B7AD6 R &3b7
		
                .reg B0AD7 R &3b8
                .reg B1AD7 R &3b9
                .reg B2AD7 R &3ba
                .reg B3AD7 R &3bb
                .reg B4AD7 R &3bc
                .reg B5AD7 R &3bd
                .reg B6AD7 R &3be
                .reg B7AD7 R &3bf

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; 3C0–3FF: BANK-RELATIVE STACK POINTERS (BxSPy)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		
                .reg B0SP0 R &3c0
                .reg B1SP0 R &3c1
                .reg B2SP0 R &3c2
                .reg B3SP0 R &3c3
                .reg B4SP0 R &3c4
                .reg B5SP0 R &3c5
                .reg B6SP0 R &3c6
                .reg B7SP0 R &3c7
		
                .reg B0SP1 R &3c8
                .reg B1SP1 R &3c9
                .reg B2SP1 R &3ca
                .reg B3SP1 R &3cb
                .reg B4SP1 R &3cc
                .reg B5SP1 R &3cd
                .reg B6SP1 R &3ce
                .reg B7SP1 R &3cf
		
                .reg B0SP2 R &3d0
                .reg B1SP2 R &3d1
                .reg B2SP2 R &3d2
                .reg B3SP2 R &3d3
                .reg B4SP2 R &3d4
                .reg B5SP2 R &3d5
                .reg B6SP2 R &3d6
                .reg B7SP2 R &3d7
		
                .reg B0SP3 R &3d8
                .reg B1SP3 R &3d9
                .reg B2SP3 R &3da
                .reg B3SP3 R &3db
                .reg B4SP3 R &3dc
                .reg B5SP3 R &3dd
                .reg B6SP3 R &3de
                .reg B7SP3 R &3df
		
                .reg B0SP4 R &3e0
                .reg B1SP4 R &3e1
                .reg B2SP4 R &3e2
                .reg B3SP4 R &3e3
                .reg B4SP4 R &3e4
                .reg B5SP4 R &3e5
                .reg B6SP4 R &3e6
                .reg B7SP4 R &3e7
		
                .reg B0SP5 R &3e8
                .reg B1SP5 R &3e9
                .reg B2SP5 R &3ea
                .reg B3SP5 R &3eb
                .reg B4SP5 R &3ec
                .reg B5SP5 R &3ed
                .reg B6SP5 R &3ee
                .reg B7SP5 R &3ef
		
                .reg B0SP6 R &3f0
                .reg B1SP6 R &3f1
                .reg B2SP6 R &3f2
                .reg B3SP6 R &3f3
                .reg B4SP6 R &3f4
                .reg B5SP6 R &3f5
                .reg B6SP6 R &3f6
                .reg B7SP6 R &3f7
		
                .reg B0SP7 R &3f8
                .reg B1SP7 R &3f9
                .reg B2SP7 R &3fa
                .reg B3SP7 R &3fb
                .reg B4SP7 R &3fc
                .reg B5SP7 R &3fd
                .reg B6SP7 R &3fe
                .reg B7SP7 R &3ff		

;;; End of file.
