
	thumb_func_start ov111_021E5900
ov111_021E5900: @ 0x021E5900
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r1, #0
	ldr r1, [r4]
	cmp r1, #0
	beq _021E5916
	cmp r1, #1
	beq _021E5922
	cmp r1, #2
	beq _021E5944
	b _021E5956
_021E5916:
	bl ov111_021E5E34
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _021E595A
_021E5922:
	bl FUN_02007290
	movs r1, #6
	str r1, [sp]
	movs r1, #1
	str r1, [sp, #4]
	ldr r0, [r0]
	adds r2, r1, #0
	str r0, [sp, #8]
	movs r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _021E595A
_021E5944:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _021E595A
	movs r0, #0
	str r0, [r4]
	add sp, #0xc
	movs r0, #1
	pop {r3, r4, pc}
_021E5956:
	bl GF_AssertFail
_021E595A:
	movs r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov111_021E5900

	thumb_func_start ov111_021E5960
ov111_021E5960: @ 0x021E5960
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r1, #0
	adds r5, r0, #0
	bl FUN_02007290
	ldr r1, [r4]
	cmp r1, #0
	beq _021E5978
	cmp r1, #1
	beq _021E5998
	b _021E59AC
_021E5978:
	movs r1, #6
	str r1, [sp]
	movs r1, #1
	str r1, [sp, #4]
	ldr r0, [r0]
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _021E59B0
_021E5998:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _021E59B0
	adds r0, r5, #0
	bl ov111_021E5F04
	add sp, #0xc
	movs r0, #1
	pop {r4, r5, pc}
_021E59AC:
	bl GF_AssertFail
_021E59B0:
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
	thumb_func_end ov111_021E5960

	thumb_func_start ov111_021E59B8
ov111_021E59B8: @ 0x021E59B8
	push {r4, lr}
	bl FUN_02007290
	adds r4, r0, #0
	bne _021E59C6
	bl GF_AssertFail
_021E59C6:
	ldr r1, [r4, #0x2c]
	adds r0, r4, #0
	lsls r2, r1, #2
	ldr r1, _021E59E0 @ =0x021E6D40
	ldr r1, [r1, r2]
	blx r1
	cmp r0, #0
	beq _021E59DA
	movs r0, #1
	pop {r4, pc}
_021E59DA:
	movs r0, #0
	pop {r4, pc}
	nop
_021E59E0: .4byte 0x021E6D40
	thumb_func_end ov111_021E59B8

	thumb_func_start ov111_021E59E4
ov111_021E59E4: @ 0x021E59E4
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x24]
	movs r5, #0
	mvns r5, r5
	bl ov111_021E6A2C
	adds r6, r0, #0
	ldr r0, [r4, #0x24]
	bl ov111_021E6888
	cmp r0, #0
	beq _021E5A06
	add sp, #4
	movs r0, #0
	pop {r3, r4, r5, r6, pc}
_021E5A06:
	ldr r0, [r4, #0x30]
	cmp r0, #3
	bhi _021E5A7E
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021E5A18: @ jump table
	.2byte _021E5A20 - _021E5A18 - 2 @ case 0
	.2byte _021E5A4A - _021E5A18 - 2 @ case 1
	.2byte _021E5A5A - _021E5A18 - 2 @ case 2
	.2byte _021E5A78 - _021E5A18 - 2 @ case 3
_021E5A20:
	ldr r0, [r4, #4]
	movs r1, #0
	ldr r5, [r0]
	movs r2, #0x80
	str r5, [sp]
	ldr r0, [r4, #0x20]
	movs r3, #0x48
	bl ov111_021E6738
	adds r0, r5, #0
	bl FUN_02070DB0
	adds r2, r0, #0
	adds r0, r6, #0
	movs r1, #0
	bl FUN_0200BF1C
	movs r0, #2
	movs r5, #0
	str r0, [r4, #0x30]
	b _021E5A82
_021E5A4A:
	ldr r0, [r4, #0x24]
	bl ov111_021E6888
	cmp r0, #0
	bne _021E5A82
	movs r0, #2
	str r0, [r4, #0x30]
	b _021E5A82
_021E5A5A:
	bl FUN_02025358
	cmp r0, #0
	bne _021E5A6C
	ldr r0, _021E5A98 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #1
	tst r0, r1
	beq _021E5A82
_021E5A6C:
	ldr r0, _021E5A9C @ =0x000005DC
	bl FUN_0200604C
	movs r0, #3
	str r0, [r4, #0x30]
	b _021E5A82
_021E5A78:
	add sp, #4
	movs r0, #1
	pop {r3, r4, r5, r6, pc}
_021E5A7E:
	bl GF_AssertFail
_021E5A82:
	movs r0, #0
	mvns r0, r0
	cmp r5, r0
	beq _021E5A92
	ldr r0, [r4, #0x24]
	adds r1, r5, #0
	bl ov111_021E68FC
_021E5A92:
	movs r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_021E5A98: .4byte 0x021D110C
_021E5A9C: .4byte 0x000005DC
	thumb_func_end ov111_021E59E4

	thumb_func_start ov111_021E5AA0
ov111_021E5AA0: @ 0x021E5AA0
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x24]
	movs r5, #0
	mvns r5, r5
	bl ov111_021E6A2C
	ldr r0, [r4, #0x24]
	bl ov111_021E6888
	cmp r0, #0
	beq _021E5ABC
	movs r0, #0
	pop {r3, r4, r5, pc}
_021E5ABC:
	ldr r0, [r4, #0x30]
	cmp r0, #6
	bhi _021E5BC2
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021E5ACE: @ jump table
	.2byte _021E5ADC - _021E5ACE - 2 @ case 0
	.2byte _021E5AEA - _021E5ACE - 2 @ case 1
	.2byte _021E5AF6 - _021E5ACE - 2 @ case 2
	.2byte _021E5B70 - _021E5ACE - 2 @ case 3
	.2byte _021E5B88 - _021E5ACE - 2 @ case 4
	.2byte _021E5BA0 - _021E5ACE - 2 @ case 5
	.2byte _021E5BBE - _021E5ACE - 2 @ case 6
_021E5ADC:
	movs r5, #1
	adds r0, r4, #0
	bl ov111_021E5BE4
	adds r0, r5, #0
	str r0, [r4, #0x30]
	b _021E5BC6
_021E5AEA:
	adds r0, r4, #0
	bl ov111_021E5C54
	movs r0, #2
	str r0, [r4, #0x30]
	b _021E5BC6
_021E5AF6:
	ldr r0, [r4, #0x18]
	bl FUN_020168F4
	cmp r0, #1
	beq _021E5B06
	cmp r0, #2
	beq _021E5B3A
	b _021E5BC6
_021E5B06:
	ldr r0, [r4, #0x18]
	bl FUN_020169CC
	ldr r0, [r4, #0x14]
	movs r1, #0
	bl FUN_0200DCE8
	ldr r0, [r4, #0x20]
	movs r1, #0
	movs r2, #1
	movs r3, #0x48
	bl ov111_021E6770
	movs r1, #1
	ldr r0, [r4, #0x20]
	adds r2, r1, #0
	movs r3, #0xf2
	bl ov111_021E6770
	adds r0, r4, #0
	movs r1, #1
	bl ov111_021E5D08
	movs r0, #3
	str r0, [r4, #0x30]
	b _021E5BC6
_021E5B3A:
	ldr r0, [r4, #0x18]
	bl FUN_020169CC
	ldr r0, [r4, #0x14]
	movs r1, #0
	bl FUN_0200DCE8
	movs r2, #1
	adds r3, r2, #0
	ldr r0, [r4, #0x20]
	movs r1, #0
	subs r3, #0x33
	bl ov111_021E6770
	movs r1, #1
	ldr r0, [r4, #0x20]
	adds r2, r1, #0
	movs r3, #0x48
	bl ov111_021E6770
	adds r0, r4, #0
	movs r1, #2
	bl ov111_021E5D08
	movs r0, #4
	str r0, [r4, #0x30]
	b _021E5BC6
_021E5B70:
	ldr r0, [r4, #0x20]
	bl ov111_021E6784
	ldr r0, [r4, #0x20]
	bl ov111_021E67A4
	cmp r0, #0
	beq _021E5BC6
	movs r0, #5
	movs r5, #2
	str r0, [r4, #0x30]
	b _021E5BC6
_021E5B88:
	ldr r0, [r4, #0x20]
	bl ov111_021E6784
	ldr r0, [r4, #0x20]
	bl ov111_021E67A4
	cmp r0, #0
	beq _021E5BC6
	movs r0, #5
	movs r5, #3
	str r0, [r4, #0x30]
	b _021E5BC6
_021E5BA0:
	bl FUN_02025358
	cmp r0, #0
	bne _021E5BB2
	ldr r0, _021E5BDC @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #1
	tst r0, r1
	beq _021E5BC6
_021E5BB2:
	ldr r0, _021E5BE0 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #6
	str r0, [r4, #0x30]
	b _021E5BC6
_021E5BBE:
	movs r0, #1
	pop {r3, r4, r5, pc}
_021E5BC2:
	bl GF_AssertFail
_021E5BC6:
	movs r0, #0
	mvns r0, r0
	cmp r5, r0
	beq _021E5BD6
	ldr r0, [r4, #0x24]
	adds r1, r5, #0
	bl ov111_021E68FC
_021E5BD6:
	movs r0, #0
	pop {r3, r4, r5, pc}
	nop
_021E5BDC: .4byte 0x021D110C
_021E5BE0: .4byte 0x000005DC
	thumb_func_end ov111_021E5AA0

	thumb_func_start ov111_021E5BE4
ov111_021E5BE4: @ 0x021E5BE4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, [r5, #0x24]
	bl ov111_021E6A2C
	adds r7, r0, #0
	ldr r0, [r5, #4]
	movs r1, #0
	ldr r6, [r0]
	ldr r4, [r0, #4]
	movs r2, #0x80
	str r6, [sp]
	ldr r0, [r5, #0x20]
	movs r3, #0x20
	bl ov111_021E6738
	str r4, [sp]
	ldr r0, [r5, #0x20]
	movs r1, #1
	movs r2, #0x80
	movs r3, #0x70
	bl ov111_021E6738
	adds r0, r6, #0
	bl FUN_02070DB0
	adds r2, r0, #0
	adds r0, r7, #0
	movs r1, #0
	bl FUN_0200BF1C
	adds r0, r4, #0
	bl FUN_02070DB0
	adds r2, r0, #0
	adds r0, r7, #0
	movs r1, #1
	bl FUN_0200BF1C
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, [r5, #0xc]
	ldr r1, [r5, #0x10]
	movs r2, #0x80
	movs r3, #0x48
	bl ov111_021E6330
	movs r1, #1
	str r0, [r5, #0x14]
	bl FUN_0200DD10
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov111_021E5BE4

	thumb_func_start ov111_021E5C54
ov111_021E5C54: @ 0x021E5C54
	push {r3, r4, lr}
	sub sp, #0x14
	add r1, sp, #0
	movs r2, #0
	str r2, [r1]
	str r2, [r1, #4]
	str r2, [r1, #8]
	str r2, [r1, #0xc]
	str r2, [r1, #0x10]
	ldr r2, [r0, #8]
	add r3, sp, #0
	str r2, [sp]
	movs r2, #1
	str r2, [sp, #4]
	movs r2, #0xc8
	str r2, [sp, #8]
	movs r2, #6
	str r2, [sp, #0xc]
	movs r2, #0x19
	strb r2, [r3, #0x10]
	movs r2, #0xa
	strb r2, [r3, #0x11]
	ldrb r4, [r3, #0x12]
	movs r2, #0xf0
	bics r4, r2
	strb r4, [r3, #0x12]
	ldr r0, [r0, #0x18]
	bl FUN_020166FC
	add sp, #0x14
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov111_021E5C54

	thumb_func_start ov111_021E5C94
ov111_021E5C94: @ 0x021E5C94
	push {r3, lr}
	cmp r0, #0
	beq _021E5CA0
	cmp r0, #1
	beq _021E5CA4
	b _021E5CA8
_021E5CA0:
	movs r0, #1
	pop {r3, pc}
_021E5CA4:
	movs r0, #0
	pop {r3, pc}
_021E5CA8:
	bl GF_AssertFail
	bl GF_AssertFail
	movs r0, #0
	pop {r3, pc}
	thumb_func_end ov111_021E5C94

	thumb_func_start ov111_021E5CB4
ov111_021E5CB4: @ 0x021E5CB4
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _021E5CD0 @ =0x021E6BD8
	add r3, sp, #0
	movs r2, #5
_021E5CBE:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _021E5CBE
	add r0, sp, #0
	bl FUN_02022BE8
	add sp, #0x28
	pop {r4, pc}
	.align 2, 0
_021E5CD0: .4byte 0x021E6BD8
	thumb_func_end ov111_021E5CB4

	thumb_func_start ov111_021E5CD4
ov111_021E5CD4: @ 0x021E5CD4
	push {r3, lr}
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	bl FUN_02022C54
	bl FUN_02022CBC
	movs r2, #1
	lsls r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _021E5D00 @ =0xFFFFE0FF
	ands r1, r0
	str r1, [r2]
	ldr r2, _021E5D04 @ =0x04001000
	ldr r1, [r2]
	ands r0, r1
	str r0, [r2]
	pop {r3, pc}
	.align 2, 0
_021E5D00: .4byte 0xFFFFE0FF
_021E5D04: .4byte 0x04001000
	thumb_func_end ov111_021E5CD4

	thumb_func_start ov111_021E5D08
ov111_021E5D08: @ 0x021E5D08
	push {r3, lr}
	cmp r1, #1
	beq _021E5D14
	cmp r1, #2
	beq _021E5D1C
	b _021E5D24
_021E5D14:
	ldr r1, [r0, #4]
	ldr r0, [r1]
	str r0, [r1, #0x10]
	pop {r3, pc}
_021E5D1C:
	ldr r1, [r0, #4]
	ldr r0, [r1, #4]
	str r0, [r1, #0x10]
	pop {r3, pc}
_021E5D24:
	bl GF_AssertFail
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov111_021E5D08

	thumb_func_start ov111_021E5D2C
ov111_021E5D2C: @ 0x021E5D2C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	adds r4, r0, #0
	adds r5, r1, #0
	adds r7, r2, #0
	bl FUN_0201EE88
	str r0, [sp, #0x1c]
	adds r0, r4, #0
	bl FUN_0201EE8C
	str r0, [sp, #0x18]
	adds r0, r4, #0
	bl FUN_0201EE98
	str r0, [sp, #0x10]
	adds r0, r4, #0
	bl FUN_0201EE9C
	str r0, [sp, #0x14]
	adds r0, r5, #0
	adds r1, r7, #0
	movs r2, #0x30
	bl FUN_02088068
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r7, #0
	movs r2, #0x30
	bl FUN_020880B0
	cmp r0, #4
	bhi _021E5D90
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021E5D7A: @ jump table
	.2byte _021E5D84 - _021E5D7A - 2 @ case 0
	.2byte _021E5D8C - _021E5D7A - 2 @ case 1
	.2byte _021E5D88 - _021E5D7A - 2 @ case 2
	.2byte _021E5D84 - _021E5D7A - 2 @ case 3
	.2byte _021E5D84 - _021E5D7A - 2 @ case 4
_021E5D84:
	movs r6, #1
	b _021E5D94
_021E5D88:
	movs r6, #0xa
	b _021E5D94
_021E5D8C:
	movs r6, #0x13
	b _021E5D94
_021E5D90:
	bl GF_AssertFail
_021E5D94:
	adds r0, r6, #0
	adds r0, #8
	lsls r0, r0, #0x10
	movs r5, #0
	lsrs r7, r0, #0x10
_021E5D9E:
	cmp r4, #8
	blo _021E5DA6
	adds r2, r7, #0
	b _021E5DAC
_021E5DA6:
	adds r0, r6, r4
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_021E5DAC:
	ldr r0, [sp, #0x14]
	ldr r3, [sp, #0x10]
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x11
	str r0, [sp, #0xc]
	adds r3, r3, r5
	lsls r3, r3, #0x18
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x18]
	lsrs r3, r3, #0x18
	bl FUN_0201C8C4
	cmp r4, #8
	bhs _021E5DD2
	movs r4, #0
	b _021E5DD8
_021E5DD2:
	subs r4, #8
	lsls r0, r4, #0x18
	lsrs r4, r0, #0x18
_021E5DD8:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #6
	blo _021E5D9E
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x18]
	bl FUN_0201EFBC
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov111_021E5D2C

	thumb_func_start ov111_021E5DF0
ov111_021E5DF0: @ 0x021E5DF0
	push {r4, lr}
	adds r4, r0, #0
	bne _021E5DFA
	bl GF_AssertFail
_021E5DFA:
	ldr r0, [r4, #0x10]
	cmp r0, #0
	bne _021E5E04
	bl GF_AssertFail
_021E5E04:
	ldr r0, [r4, #8]
	cmp r0, #0
	bne _021E5E0E
	bl GF_AssertFail
_021E5E0E:
	ldr r0, [r4, #0x10]
	bl FUN_0200D020
	bl FUN_0200D034
	ldr r0, [r4, #8]
	bl FUN_0201EEB4
	ldr r3, _021E5E2C @ =0x027E0000
	ldr r1, _021E5E30 @ =0x00003FF8
	movs r0, #1
	ldr r2, [r3, r1]
	orrs r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	.align 2, 0
_021E5E2C: .4byte 0x027E0000
_021E5E30: .4byte 0x00003FF8
	thumb_func_end ov111_021E5DF0

	thumb_func_start ov111_021E5E34
ov111_021E5E34: @ 0x021E5E34
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	bl FUN_020072A4
	adds r5, r0, #0
	bne _021E5E46
	bl GF_AssertFail
_021E5E46:
	movs r0, #3
	movs r1, #0x94
	lsls r2, r0, #0x10
	bl FUN_0201A910
	adds r0, r4, #0
	movs r1, #0x34
	movs r2, #0x94
	bl FUN_02007280
	movs r1, #0
	movs r2, #0x34
	adds r4, r0, #0
	blx FUN_020D4994
	movs r0, #0x94
	str r0, [r4]
	str r5, [r4, #4]
	ldr r0, [r5, #8]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl ov111_021E5C94
	str r0, [r4, #0x2c]
	bl ov111_021E5CD4
	ldr r2, _021E5EF8 @ =0x04000304
	ldr r0, _021E5EFC @ =0xFFFF7FFF
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	bl ov111_021E5CB4
	adds r0, r4, #0
	bl ov111_021E5F50
	adds r0, r4, #0
	bl ov111_021E6000
	adds r0, r4, #0
	bl ov111_021E60D4
	adds r0, r4, #0
	bl ov111_021E6180
	ldr r0, [r4]
	bl FUN_0201660C
	str r0, [r4, #0x18]
	ldr r0, [r4]
	bl ov111_021E67C4
	str r0, [r4, #0x24]
	ldr r1, [r4, #8]
	ldr r3, [r5, #0xc]
	movs r2, #1
	bl ov111_021E67EC
	ldr r0, [r4, #0x10]
	str r0, [sp]
	movs r0, #0x28
	ldrsb r0, [r4, r0]
	str r0, [sp, #4]
	ldr r0, [r4]
	ldr r1, [r4, #8]
	ldr r2, [r4, #0x24]
	ldr r3, [r4, #0xc]
	bl ov111_021E66DC
	str r0, [r4, #0x20]
	movs r0, #0
	bl FUN_0200FBDC
	movs r0, #1
	bl FUN_0200FBDC
	movs r0, #1
	bl FUN_02002B34
	movs r0, #1
	bl FUN_02002B8C
	ldr r0, _021E5F00 @ =ov111_021E5DF0
	adds r1, r4, #0
	bl FUN_0201A0FC
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_021E5EF8: .4byte 0x04000304
_021E5EFC: .4byte 0xFFFF7FFF
_021E5F00: .4byte ov111_021E5DF0
	thumb_func_end ov111_021E5E34

	thumb_func_start ov111_021E5F04
ov111_021E5F04: @ 0x021E5F04
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_02007290
	adds r4, r0, #0
	ldr r0, [r4, #0x18]
	bl FUN_02016624
	ldr r0, [r4, #0x20]
	bl ov111_021E6710
	ldr r0, [r4, #0x24]
	bl ov111_021E685C
	ldr r0, [r4, #0x14]
	cmp r0, #0
	beq _021E5F2E
	bl FUN_0200D9DC
	movs r0, #0
	str r0, [r4, #0x14]
_021E5F2E:
	ldr r0, [r4, #0xc]
	ldr r1, [r4, #0x10]
	bl ov111_021E6170
	adds r0, r4, #0
	bl ov111_021E5FD4
	bl ov111_021E5CD4
	adds r0, r5, #0
	bl FUN_02007294
	movs r0, #0x94
	bl FUN_0201A9C4
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov111_021E5F04

	thumb_func_start ov111_021E5F50
ov111_021E5F50: @ 0x021E5F50
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0xa0
	adds r5, r0, #0
	ldr r0, [r5]
	bl FUN_0201AC88
	add r3, sp, #4
	ldr r4, _021E5FC8 @ =0x021E6B7C
	str r0, [r5, #8]
	adds r2, r3, #0
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_0201ACB0
	ldr r4, _021E5FCC @ =0x021E6CA4
	add r3, sp, #0x14
	movs r2, #0x11
_021E5F78:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _021E5F78
	ldr r0, [r4]
	ldr r4, _021E5FD0 @ =_021E6B74
	str r0, [r3]
	movs r7, #0
	add r6, sp, #0x14
_021E5F8A:
	ldrb r1, [r4]
	ldr r0, [r5, #8]
	adds r2, r6, #0
	movs r3, #0
	bl FUN_0201B1E4
	ldrb r1, [r4]
	ldr r0, [r5, #8]
	bl FUN_0201CAE0
	movs r0, #0
	str r0, [sp]
	ldrb r1, [r4]
	ldr r0, [r5, #8]
	movs r2, #0
	movs r3, #1
	bl FUN_0201C1F4
	adds r7, r7, #1
	adds r6, #0x1c
	adds r4, r4, #1
	cmp r7, #5
	blt _021E5F8A
	ldr r1, [r5]
	movs r0, #0xad
	bl FUN_02007688
	str r0, [r5, #0x1c]
	add sp, #0xa0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E5FC8: .4byte 0x021E6B7C
_021E5FCC: .4byte 0x021E6CA4
_021E5FD0: .4byte _021E6B74
	thumb_func_end ov111_021E5F50

	thumb_func_start ov111_021E5FD4
ov111_021E5FD4: @ 0x021E5FD4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, [r6, #0x1c]
	bl FUN_0200770C
	ldr r5, _021E5FFC @ =_021E6B74
	movs r4, #0
_021E5FE2:
	ldrb r1, [r5]
	ldr r0, [r6, #8]
	bl FUN_0201BB4C
	adds r4, r4, #1
	adds r5, r5, #1
	cmp r4, #5
	blt _021E5FE2
	ldr r0, [r6, #8]
	bl FUN_0201AB0C
	pop {r4, r5, r6, pc}
	nop
_021E5FFC: .4byte _021E6B74
	thumb_func_end ov111_021E5FD4

	thumb_func_start ov111_021E6000
ov111_021E6000: @ 0x021E6000
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #0
	bne _021E6010
	bl GF_AssertFail
_021E6010:
	movs r0, #2
	lsls r0, r0, #8
	str r0, [sp]
	ldr r0, [r4]
	movs r1, #0
	str r0, [sp, #4]
	ldr r0, [r4, #0x1c]
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_02007B8C
	movs r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	movs r1, #1
	str r1, [sp, #8]
	ldr r0, [r4]
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x1c]
	ldr r2, [r4, #8]
	bl FUN_02007B44
	movs r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [r4]
	movs r1, #2
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x1c]
	ldr r2, [r4, #8]
	bl FUN_02007B68
	movs r1, #1
	str r1, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r0, [r4]
	movs r1, #4
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x1c]
	ldr r2, [r4, #8]
	movs r3, #2
	bl FUN_02007B44
	movs r1, #1
	str r1, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r0, [r4]
	movs r1, #4
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x1c]
	ldr r2, [r4, #8]
	movs r3, #3
	bl FUN_02007B44
	movs r0, #2
	lsls r0, r0, #8
	str r0, [sp]
	ldr r0, [r4]
	movs r1, #0
	str r0, [sp, #4]
	ldr r0, [r4, #0x1c]
	movs r2, #4
	adds r3, r1, #0
	bl FUN_02007B8C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r1, #1
	str r1, [sp, #8]
	ldr r0, [r4]
	movs r3, #4
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x1c]
	ldr r2, [r4, #8]
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [r4]
	movs r1, #3
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x1c]
	ldr r2, [r4, #8]
	movs r3, #4
	bl FUN_02007B68
	add sp, #0x10
	pop {r4, pc}
	thumb_func_end ov111_021E6000

	thumb_func_start ov111_021E60D4
ov111_021E60D4: @ 0x021E60D4
	push {r3, r4, r5, r6, lr}
	sub sp, #0x4c
	adds r5, r0, #0
	ldr r0, [r5]
	bl FUN_0200CF18
	str r0, [r5, #0xc]
	bl FUN_0200CF38
	add r2, sp, #0x2c
	ldr r3, _021E6164 @ =0x021E6BB8
	str r0, [r5, #0x10]
	ldm r3!, {r0, r1}
	adds r4, r2, #0
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	ldr r6, _021E6168 @ =0x021E6B8C
	stm r2!, {r0, r1}
	add r3, sp, #0x18
	ldm r6!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r6]
	adds r1, r4, #0
	str r0, [r3]
	movs r3, #0x20
	str r3, [sp, #0x18]
	ldr r0, [r5, #0xc]
	bl FUN_0200CF70
	ldr r0, [r5, #0xc]
	ldr r1, [r5, #0x10]
	movs r2, #0x20
	bl FUN_0200CFF4
	ldr r4, _021E616C @ =0x021E6BA0
	add r3, sp, #0
	adds r2, r3, #0
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r5, #0xc]
	ldr r1, [r5, #0x10]
	bl FUN_0200D3F8
	ldr r0, [r5, #0xc]
	bl FUN_0200CF6C
	movs r2, #0x83
	movs r1, #0
	lsls r2, r2, #0xe
	bl FUN_02009FC8
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	add sp, #0x4c
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_021E6164: .4byte 0x021E6BB8
_021E6168: .4byte 0x021E6B8C
_021E616C: .4byte 0x021E6BA0
	thumb_func_end ov111_021E60D4

	thumb_func_start ov111_021E6170
ov111_021E6170: @ 0x021E6170
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_0200D998
	adds r0, r4, #0
	bl FUN_0200D108
	pop {r4, pc}
	thumb_func_end ov111_021E6170

	thumb_func_start ov111_021E6180
ov111_021E6180: @ 0x021E6180
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r7, [r5, #0xc]
	ldr r6, [r5, #0x10]
	movs r1, #0
	str r1, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r2, [r5, #0x1c]
	adds r0, r7, #0
	adds r1, r6, #0
	movs r3, #5
	bl FUN_0200D5D4
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	ldr r2, [r5, #0x1c]
	adds r0, r7, #0
	adds r1, r6, #0
	movs r3, #6
	bl FUN_0200D504
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r2, [r5, #0x1c]
	adds r0, r7, #0
	adds r1, r6, #0
	movs r3, #7
	bl FUN_0200D6EC
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r2, [r5, #0x1c]
	adds r0, r7, #0
	adds r1, r6, #0
	movs r3, #8
	bl FUN_0200D71C
	ldr r1, [r5]
	movs r0, #0x14
	bl FUN_02007688
	str r0, [sp, #0x10]
	movs r4, #0
_021E61EE:
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	adds r0, r4, #1
	str r0, [sp, #8]
	ldr r2, [r5, #0x1c]
	adds r0, r7, #0
	adds r1, r6, #0
	movs r3, #9
	bl FUN_0200D504
	adds r4, r4, #1
	cmp r4, #2
	blt _021E61EE
	bl FUN_02074490
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldr r2, [sp, #0x10]
	adds r0, r7, #0
	adds r1, r6, #0
	bl FUN_0200D5D4
	adds r5, #0x28
	strb r0, [r5]
	bl FUN_0207449C
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r2, [sp, #0x10]
	adds r0, r7, #0
	adds r1, r6, #0
	bl FUN_0200D6EC
	bl FUN_020744A8
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r2, [sp, #0x10]
	adds r0, r7, #0
	adds r1, r6, #0
	bl FUN_0200D71C
	ldr r0, [sp, #0x10]
	bl FUN_0200770C
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov111_021E6180

	thumb_func_start ov111_021E6268
ov111_021E6268: @ 0x021E6268
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r4, r1, #0
	movs r0, #0x14
	adds r1, r3, #0
	adds r6, r2, #0
	str r3, [sp, #4]
	bl FUN_02007688
	adds r7, r0, #0
	adds r0, r4, #0
	bl FUN_020741B0
	adds r1, r0, #0
	ldr r0, [sp, #4]
	movs r2, #0
	str r0, [sp]
	adds r0, r7, #0
	add r3, sp, #0xc
	bl FUN_02007C10
	ldr r1, [sp, #0xc]
	movs r2, #1
	str r0, [sp, #8]
	ldr r1, [r1, #0x14]
	adds r0, r5, #0
	lsls r2, r2, #0xa
	bl ov111_021E62E0
	ldr r0, [sp, #8]
	bl FUN_0201AB0C
	adds r0, r4, #0
	bl FUN_02074484
	adds r0, r6, r0
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	adds r0, r5, #0
	bl FUN_0200DD10
	adds r0, r5, #0
	movs r1, #1
	bl FUN_0200DC4C
	movs r1, #1
	adds r0, r5, #0
	lsls r1, r1, #0xc
	bl FUN_0200DC8C
	adds r0, r5, #0
	movs r1, #1
	bl FUN_0200DC78
	adds r0, r7, #0
	bl FUN_0200770C
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov111_021E6268

	thumb_func_start ov111_021E62E0
ov111_021E62E0: @ 0x021E62E0
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	adds r6, r1, #0
	adds r7, r2, #0
	bl FUN_02024B60
	adds r4, r0, #0
	ldr r0, [r5]
	bl FUN_02024B1C
	adds r1, r4, #0
	blx FUN_020B802C
	adds r5, r0, #0
	adds r0, r6, #0
	adds r1, r7, #0
	blx FUN_020D2894
	cmp r4, #1
	beq _021E6310
	cmp r4, #2
	beq _021E631C
	b _021E6328
_021E6310:
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r7, #0
	blx FUN_020CFE74
	pop {r3, r4, r5, r6, r7, pc}
_021E631C:
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r7, #0
	blx FUN_020CFECC
	pop {r3, r4, r5, r6, r7, pc}
_021E6328:
	bl GF_AssertFail
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov111_021E62E0

	thumb_func_start ov111_021E6330
ov111_021E6330: @ 0x021E6330
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	ldr r4, _021E637C @ =0x021E6C34
	adds r6, r2, #0
	adds r5, r3, #0
	adds r7, r0, #0
	mov ip, r1
	add r3, sp, #0
	movs r2, #6
_021E6342:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _021E6342
	ldr r0, [r4]
	add r1, sp, #0
	str r0, [r3]
	strh r6, [r1]
	strh r5, [r1, #2]
	add r0, sp, #0x38
	ldrb r2, [r0, #0x14]
	movs r3, #0x83
	lsls r3, r3, #0xe
	str r2, [sp, #8]
	ldrb r0, [r0, #0x10]
	add r2, sp, #0
	strh r0, [r1, #6]
	adds r0, r7, #0
	mov r1, ip
	bl FUN_0200D740
	movs r1, #1
	adds r4, r0, #0
	bl FUN_0200DC78
	adds r0, r4, #0
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	nop
_021E637C: .4byte 0x021E6C34
	thumb_func_end ov111_021E6330

	thumb_func_start ov111_021E6380
ov111_021E6380: @ 0x021E6380
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	ldr r6, _021E63CC @ =0x021E6C00
	adds r5, r2, #0
	adds r4, r3, #0
	adds r7, r0, #0
	str r1, [sp]
	add r3, sp, #4
	movs r2, #6
_021E6392:
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _021E6392
	ldr r0, [r6]
	str r0, [r3]
	add r0, sp, #0x40
	ldrb r0, [r0, #0x10]
	cmp r0, #2
	blo _021E63AA
	bl GF_AssertFail
_021E63AA:
	add r0, sp, #0x40
	ldrb r0, [r0, #0x10]
	movs r3, #0x83
	ldr r1, [sp]
	adds r0, r0, #1
	str r0, [sp, #0x18]
	add r0, sp, #4
	strh r5, [r0]
	strh r4, [r0, #2]
	adds r0, r7, #0
	add r2, sp, #4
	lsls r3, r3, #0xe
	bl FUN_0200D740
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E63CC: .4byte 0x021E6C00
	thumb_func_end ov111_021E6380

	thumb_func_start ov111_021E63D0
ov111_021E63D0: @ 0x021E63D0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	str r1, [sp, #0x14]
	str r0, [sp, #0x2c]
	str r2, [sp, #0x18]
	adds r4, r3, #0
	bne _021E63E2
	movs r0, #2
	b _021E63E4
_021E63E2:
	movs r0, #3
_021E63E4:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x2c]
	movs r1, #0x78
	ldr r0, [r0]
	bl FUN_0201AA8C
	str r0, [sp, #0x28]
	movs r1, #0
	movs r2, #0x78
	blx FUN_020D4994
	ldr r1, [sp, #0x48]
	ldr r0, [sp, #0x28]
	ldr r2, [sp, #0x28]
	str r1, [r0]
	adds r1, r0, #0
	ldr r0, [sp, #0x14]
	adds r1, #0x72
	strh r0, [r1]
	ldr r1, [sp, #0x28]
	ldr r0, [sp, #0x18]
	adds r1, #0x74
	strh r0, [r1]
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r3, #0x72
	ldrsh r2, [r2, r3]
	ldr r0, [sp, #0x2c]
	ldr r1, [sp, #0x2c]
	ldr r3, [sp, #0x28]
	movs r5, #0x74
	ldrsh r3, [r3, r5]
	ldr r0, [r0, #0xc]
	ldr r1, [r1, #0x10]
	bl ov111_021E6330
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x28]
	str r0, [r1, #4]
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r3, #0x72
	ldrsh r2, [r2, r3]
	ldr r0, [sp, #0x2c]
	ldr r1, [sp, #0x2c]
	subs r2, #0x2c
	lsls r2, r2, #0x10
	ldr r3, [sp, #0x28]
	adds r4, r5, #0
	ldrsh r3, [r3, r4]
	ldr r0, [r0, #0xc]
	ldr r1, [r1, #0x10]
	subs r3, #8
	lsls r3, r3, #0x10
	asrs r2, r2, #0x10
	asrs r3, r3, #0x10
	bl ov111_021E6380
	ldr r1, [sp, #0x28]
	ldr r4, _021E64C4 @ =0x021E6C68
	str r0, [r1, #8]
	ldr r0, [sp, #0x18]
	adds r5, r1, #0
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x14]
	movs r7, #0
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	adds r5, #0xc
	str r0, [sp, #0x1c]
_021E647E:
	movs r0, #2
	ldrsh r1, [r4, r0]
	ldr r0, [sp, #0x20]
	movs r3, #0
	adds r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	ldrb r0, [r4, #4]
	adds r1, r5, #0
	str r0, [sp, #4]
	ldrb r0, [r4, #5]
	str r0, [sp, #8]
	ldrb r0, [r4, #6]
	str r0, [sp, #0xc]
	ldrh r0, [r4, #8]
	str r0, [sp, #0x10]
	ldrsh r6, [r4, r3]
	ldr r3, [sp, #0x1c]
	ldr r0, [sp, #0x2c]
	adds r3, r3, r6
	lsls r3, r3, #0x18
	ldr r0, [r0, #4]
	ldr r2, [sp, #0x24]
	lsrs r3, r3, #0x18
	bl FUN_0201D40C
	adds r7, r7, #1
	adds r4, #0xa
	adds r5, #0x10
	cmp r7, #6
	blt _021E647E
	ldr r0, [sp, #0x28]
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E64C4: .4byte 0x021E6C68
	thumb_func_end ov111_021E63D0

	thumb_func_start ov111_021E64C8
ov111_021E64C8: @ 0x021E64C8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r4, r1, #0
	adds r5, r0, #0
	adds r0, r4, #0
	bl ov111_021E6A2C
	adds r7, r0, #0
	ldr r6, [r5]
	cmp r5, #0
	bne _021E64E2
	bl GF_AssertFail
_021E64E2:
	cmp r4, #0
	bne _021E64EA
	bl GF_AssertFail
_021E64EA:
	adds r0, r6, #0
	movs r1, #0xa3
	movs r2, #0
	bl FUN_0206E540
	str r0, [sp, #0x10]
	adds r0, r6, #0
	movs r1, #0xa4
	movs r2, #0
	bl FUN_0206E540
	str r0, [sp, #0xc]
	adds r0, r6, #0
	bl FUN_02070DB0
	adds r2, r0, #0
	adds r0, r7, #0
	movs r1, #0
	bl FUN_0200BF1C
	movs r0, #1
	adds r1, r5, #0
	movs r2, #4
	str r0, [sp]
	adds r0, r4, #0
	adds r1, #0xc
	adds r3, r2, #0
	bl ov111_021E6934
	adds r0, r6, #0
	ldr r7, _021E65C8 @ =0x00070800
	bl FUN_0206FF88
	cmp r0, #0
	beq _021E653A
	cmp r0, #1
	beq _021E6540
	cmp r0, #2
	beq _021E654A
	b _021E6550
_021E653A:
	movs r0, #5
	str r0, [sp, #8]
	b _021E6554
_021E6540:
	movs r0, #6
	movs r7, #0xc1
	str r0, [sp, #8]
	lsls r7, r7, #0xa
	b _021E6554
_021E654A:
	movs r0, #7
	str r0, [sp, #8]
	b _021E6554
_021E6550:
	bl GF_AssertFail
_021E6554:
	movs r0, #1
	str r0, [sp]
	adds r1, r5, #0
	ldr r2, [sp, #8]
	adds r0, r4, #0
	adds r1, #0x1c
	movs r3, #0
	str r7, [sp, #4]
	bl ov111_021E696C
	adds r0, r6, #0
	movs r1, #0xa1
	movs r2, #0
	bl FUN_0206E540
	adds r2, r0, #0
	movs r0, #1
	str r0, [sp]
	adds r1, r5, #0
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r1, #0x2c
	movs r3, #3
	bl ov111_021E69A0
	movs r0, #0
	str r0, [sp]
	adds r1, r5, #0
	str r0, [sp, #4]
	ldr r2, [sp, #0x10]
	adds r0, r4, #0
	adds r1, #0x3c
	movs r3, #3
	bl ov111_021E69A0
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	adds r1, r5, #0
	str r0, [sp, #4]
	ldr r2, [sp, #0xc]
	adds r0, r4, #0
	adds r1, #0x4c
	movs r3, #3
	bl ov111_021E69A0
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0xc]
	adds r5, #0x5c
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	adds r0, r5, #0
	lsrs r1, r1, #0x10
	lsrs r2, r2, #0x10
	bl ov111_021E5D2C
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_021E65C8: .4byte 0x00070800
	thumb_func_end ov111_021E64C8

	thumb_func_start ov111_021E65CC
ov111_021E65CC: @ 0x021E65CC
	str r1, [r0, #0x6c]
	adds r0, #0x70
	strh r2, [r0]
	bx lr
	thumb_func_end ov111_021E65CC

	thumb_func_start ov111_021E65D4
ov111_021E65D4: @ 0x021E65D4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	bne _021E65E0
	bl GF_AssertFail
_021E65E0:
	adds r4, r5, #0
	adds r4, #0xc
	adds r0, r4, #0
	bl FUN_0201EE88
	str r0, [sp, #4]
	adds r0, r4, #0
	bl FUN_0201EE8C
	str r0, [sp]
	movs r0, #0x74
	ldrsh r1, [r5, r0]
	movs r0, #0x70
	ldrsh r2, [r5, r0]
	subs r0, r1, r2
	bpl _021E6602
	rsbs r0, r0, #0
_021E6602:
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	asrs r6, r0, #2
	cmp r0, #1
	ble _021E6610
	cmp r6, #0
	bne _021E6616
_021E6610:
	movs r0, #0
	str r0, [r5, #0x6c]
	b _021E6678
_021E6616:
	cmp r1, r2
	ble _021E6624
	movs r0, #0
	mvns r0, r0
	muls r0, r6, r0
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
_021E6624:
	movs r1, #0x74
	ldrsh r0, [r5, r1]
	adds r2, r0, r6
	adds r0, r5, #0
	adds r0, #0x74
	strh r2, [r0]
	ldrsh r0, [r5, r1]
	cmp r0, #0xe8
	bge _021E6678
	ldr r0, [sp, #4]
	ldr r1, [sp]
	movs r2, #5
	adds r3, r6, #0
	bl FUN_0201F238
	movs r7, #0
	add r4, sp, #8
_021E6646:
	add r1, sp, #8
	movs r3, #0x83
	ldr r0, [r5, #4]
	adds r1, #2
	add r2, sp, #8
	lsls r3, r3, #0xe
	bl FUN_0200DE94
	movs r0, #0
	ldrsh r0, [r4, r0]
	movs r3, #0x83
	movs r1, #2
	adds r0, r0, r6
	strh r0, [r4]
	movs r2, #0
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r5, #4]
	lsls r3, r3, #0xe
	bl FUN_0200DDF4
	adds r7, r7, #1
	adds r5, r5, #4
	cmp r7, #2
	blt _021E6646
_021E6678:
	ldr r0, [sp, #4]
	ldr r1, [sp]
	bl FUN_0201BF7C
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov111_021E65D4

	thumb_func_start ov111_021E6684
ov111_021E6684: @ 0x021E6684
	ldr r0, [r0, #0x6c]
	cmp r0, #0
	bne _021E668E
	movs r0, #1
	bx lr
_021E668E:
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov111_021E6684

	thumb_func_start ov111_021E6694
ov111_021E6694: @ 0x021E6694
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	bne _021E669E
	bl GF_AssertFail
_021E669E:
	movs r4, #0
	adds r5, r7, #0
	adds r6, r4, #0
_021E66A4:
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _021E66B0
	bl FUN_0200D9DC
	str r6, [r5, #4]
_021E66B0:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #2
	blt _021E66A4
	adds r4, r7, #0
	movs r5, #0
	adds r4, #0xc
_021E66BE:
	adds r0, r4, #0
	bl FUN_0201D8C8
	adds r0, r4, #0
	bl FUN_0201D520
	adds r5, r5, #1
	adds r4, #0x10
	cmp r5, #6
	blt _021E66BE
	adds r0, r7, #0
	bl FUN_0201AB0C
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov111_021E6694

	thumb_func_start ov111_021E66DC
ov111_021E66DC: @ 0x021E66DC
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r1, #0
	movs r1, #0x20
	adds r5, r0, #0
	adds r7, r2, #0
	str r3, [sp]
	bl FUN_0201AA8C
	adds r4, r0, #0
	movs r1, #0
	movs r2, #0x20
	blx FUN_020D4994
	str r6, [r4, #4]
	str r5, [r4]
	ldr r0, [sp]
	str r7, [r4, #8]
	str r0, [r4, #0xc]
	ldr r0, [sp, #0x18]
	add r1, sp, #8
	str r0, [r4, #0x10]
	movs r0, #0x14
	ldrsb r0, [r1, r0]
	strb r0, [r4, #0x14]
	adds r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov111_021E66DC

	thumb_func_start ov111_021E6710
ov111_021E6710: @ 0x021E6710
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	bne _021E671A
	bl GF_AssertFail
_021E671A:
	movs r4, #0
	adds r5, r6, #0
_021E671E:
	ldr r0, [r5, #0x18]
	cmp r0, #0
	beq _021E6728
	bl ov111_021E6694
_021E6728:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #2
	blt _021E671E
	adds r0, r6, #0
	bl FUN_0201AB0C
	pop {r4, r5, r6, pc}
	thumb_func_end ov111_021E6710

	thumb_func_start ov111_021E6738
ov111_021E6738: @ 0x021E6738
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r4, r1, #0
	ldr r1, [sp, #0x18]
	adds r5, r0, #0
	str r1, [sp]
	adds r1, r2, #0
	adds r2, r3, #0
	adds r3, r4, #0
	bl ov111_021E63D0
	adds r6, r0, #0
	movs r2, #0x14
	ldrsb r2, [r5, r2]
	ldr r0, [r6, #8]
	ldr r1, [r6]
	ldr r3, [r5]
	bl ov111_021E6268
	ldr r1, [r5, #8]
	adds r0, r6, #0
	bl ov111_021E64C8
	lsls r0, r4, #2
	adds r0, r5, r0
	str r6, [r0, #0x18]
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov111_021E6738

	thumb_func_start ov111_021E6770
ov111_021E6770: @ 0x021E6770
	lsls r1, r1, #2
	adds r0, r0, r1
	adds r1, r2, #0
	adds r2, r3, #0
	ldr r3, _021E6780 @ =ov111_021E65CC
	ldr r0, [r0, #0x18]
	bx r3
	nop
_021E6780: .4byte ov111_021E65CC
	thumb_func_end ov111_021E6770

	thumb_func_start ov111_021E6784
ov111_021E6784: @ 0x021E6784
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_021E678A:
	ldr r0, [r5, #0x18]
	bl ov111_021E6684
	cmp r0, #0
	bne _021E679A
	ldr r0, [r5, #0x18]
	bl ov111_021E65D4
_021E679A:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #2
	blt _021E678A
	pop {r3, r4, r5, pc}
	thumb_func_end ov111_021E6784

	thumb_func_start ov111_021E67A4
ov111_021E67A4: @ 0x021E67A4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_021E67AA:
	ldr r0, [r5, #0x18]
	bl ov111_021E6684
	cmp r0, #0
	bne _021E67B8
	movs r0, #0
	pop {r3, r4, r5, pc}
_021E67B8:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #2
	blt _021E67AA
	movs r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov111_021E67A4

	thumb_func_start ov111_021E67C4
ov111_021E67C4: @ 0x021E67C4
	push {r3, r4, r5, lr}
	movs r1, #0x34
	adds r5, r0, #0
	bl FUN_0201AA8C
	movs r1, #0
	movs r2, #0x34
	adds r4, r0, #0
	blx FUN_020D4994
	movs r0, #1
	movs r1, #2
	movs r2, #0
	adds r3, r5, #0
	str r5, [r4, #0x18]
	bl FUN_0200CC74
	str r0, [r4, #4]
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov111_021E67C4

	thumb_func_start ov111_021E67EC
ov111_021E67EC: @ 0x021E67EC
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0
	str r1, [r4]
	mvns r0, r0
	str r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	ldr r0, _021E6858 @ =0xFFF8FFFF
	ands r1, r0
	lsls r0, r2, #0x1d
	lsrs r0, r0, #0xd
	orrs r0, r1
	str r0, [r4, #0x30]
	str r3, [r4, #0x14]
	ldr r3, [r4, #0x18]
	movs r0, #1
	movs r1, #0x1b
	movs r2, #0x1d
	bl FUN_0200BAF8
	str r0, [r4, #0xc]
	ldr r0, [r4, #0x18]
	bl FUN_0200BD08
	str r0, [r4, #8]
	bl FUN_02020080
	ldr r1, [r4, #0x30]
	ldr r0, [r4]
	lsls r1, r1, #0xd
	lsrs r1, r1, #0x1d
	lsls r1, r1, #0x18
	ldr r2, [r4, #0x18]
	lsrs r1, r1, #0x18
	bl ov111_021E6A44
	movs r1, #0x1e
	ldr r2, [r4, #0x18]
	movs r0, #0
	lsls r1, r1, #4
	bl FUN_02003030
	movs r2, #0
	str r2, [sp]
	ldr r1, [r4, #0x30]
	ldr r0, [r4]
	lsls r1, r1, #0xd
	lsrs r1, r1, #0x1d
	movs r3, #1
	bl FUN_0201C1F4
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_021E6858: .4byte 0xFFF8FFFF
	thumb_func_end ov111_021E67EC

	thumb_func_start ov111_021E685C
ov111_021E685C: @ 0x021E685C
	push {r4, lr}
	adds r4, r0, #0
	bl ov111_021E69F4
	ldr r0, [r4, #0xc]
	bl FUN_0200BB44
	ldr r0, [r4, #8]
	bl FUN_0200BDA0
	ldr r0, [r4, #0x10]
	cmp r0, #0
	beq _021E687A
	bl FUN_02026380
_021E687A:
	ldr r0, [r4, #4]
	bl FUN_0200CD94
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	thumb_func_end ov111_021E685C

	thumb_func_start ov111_021E6888
ov111_021E6888: @ 0x021E6888
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	ldr r1, [r4, #0x2c]
	mvns r0, r0
	cmp r1, r0
	beq _021E68BC
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	bne _021E68B8
	ldr r1, [r4, #0x30]
	ldr r0, _021E68F4 @ =0xFFFF0000
	ands r0, r1
	str r0, [r4, #0x30]
	ldr r0, [r4, #0x10]
	bl FUN_02026380
	movs r0, #0
	str r0, [r4, #0x10]
	subs r0, r0, #1
	str r0, [r4, #0x2c]
_021E68B8:
	movs r0, #1
	pop {r4, pc}
_021E68BC:
	ldr r2, [r4, #0x30]
	lsls r1, r2, #0x10
	lsrs r3, r1, #0x10
	beq _021E68EE
	lsls r1, r2, #0xc
	lsrs r1, r1, #0x1f
	cmp r1, #1
	bne _021E68DA
	lsls r0, r0, #0x10
	adds r1, r2, #0
	ands r1, r0
	ldr r0, _021E68F8 @ =0xFFF7FFFF
	ands r0, r1
	str r0, [r4, #0x30]
	b _021E68EE
_021E68DA:
	lsls r0, r0, #0x10
	adds r1, r2, #0
	ands r1, r0
	subs r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	orrs r0, r1
	str r0, [r4, #0x30]
	movs r0, #1
	pop {r4, pc}
_021E68EE:
	movs r0, #0
	pop {r4, pc}
	nop
_021E68F4: .4byte 0xFFFF0000
_021E68F8: .4byte 0xFFF7FFFF
	thumb_func_end ov111_021E6888

	thumb_func_start ov111_021E68FC
ov111_021E68FC: @ 0x021E68FC
	push {r3, r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	adds r2, r4, #0
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r4, #0x30]
	adds r1, r4, #0
	lsls r0, r0, #0xd
	lsrs r0, r0, #0x1d
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	ldr r0, [r4, #0x18]
	adds r1, #0x1c
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x14]
	adds r2, #0x10
	str r0, [sp, #0x10]
	ldr r0, [r4]
	ldr r3, [r4, #8]
	bl ov111_021E6A74
	str r0, [r4, #0x2c]
	add sp, #0x14
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov111_021E68FC

	thumb_func_start ov111_021E6934
ov111_021E6934: @ 0x021E6934
	push {r4, lr}
	sub sp, #0x18
	adds r4, r0, #0
	str r2, [sp]
	ldr r0, [r4, #0x30]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0x1d
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	str r3, [sp, #8]
	add r0, sp, #0x10
	ldrb r0, [r0, #0x10]
	str r0, [sp, #0xc]
	ldr r0, _021E6968 @ =0x00010200
	str r0, [sp, #0x10]
	ldr r0, [r4, #0x18]
	str r0, [sp, #0x14]
	ldr r0, [r4]
	ldr r2, [r4, #8]
	ldr r3, [r4, #0xc]
	bl ov111_021E6B30
	add sp, #0x18
	pop {r4, pc}
	nop
_021E6968: .4byte 0x00010200
	thumb_func_end ov111_021E6934

	thumb_func_start ov111_021E696C
ov111_021E696C: @ 0x021E696C
	push {r4, lr}
	sub sp, #0x18
	adds r4, r0, #0
	str r2, [sp]
	ldr r0, [r4, #0x30]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0x1d
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	str r3, [sp, #8]
	add r0, sp, #0x10
	ldrb r0, [r0, #0x10]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x24]
	str r0, [sp, #0x10]
	ldr r0, [r4, #0x18]
	str r0, [sp, #0x14]
	ldr r0, [r4]
	ldr r2, [r4, #8]
	ldr r3, [r4, #0xc]
	bl ov111_021E6B30
	add sp, #0x18
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov111_021E696C

	thumb_func_start ov111_021E69A0
ov111_021E69A0: @ 0x021E69A0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r4, r1, #0
	adds r5, r0, #0
	adds r0, r4, #0
	movs r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	bl FUN_0201D978
	ldr r0, [sp, #0x28]
	cmp r0, #0
	beq _021E69D4
	movs r0, #1
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [r5, #4]
	ldr r1, [sp, #0x2c]
	adds r2, r6, #0
	adds r3, r7, #0
	bl FUN_0200CE7C
	b _021E69E8
_021E69D4:
	str r4, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5, #4]
	adds r1, r6, #0
	adds r2, r7, #0
	movs r3, #1
	bl FUN_0200CDF0
_021E69E8:
	adds r0, r4, #0
	bl FUN_0201D5C8
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov111_021E69A0

	thumb_func_start ov111_021E69F4
ov111_021E69F4: @ 0x021E69F4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	ldr r1, [r4, #0x2c]
	mvns r0, r0
	cmp r1, r0
	beq _021E6A0A
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	bl FUN_020200A0
_021E6A0A:
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	beq _021E6A2A
	adds r0, r4, #0
	adds r0, #0x1c
	movs r1, #0
	bl FUN_0200E9BC
	adds r0, r4, #0
	adds r0, #0x1c
	bl FUN_0201D8C8
	adds r4, #0x1c
	adds r0, r4, #0
	bl FUN_0201D520
_021E6A2A:
	pop {r4, pc}
	thumb_func_end ov111_021E69F4

	thumb_func_start ov111_021E6A2C
ov111_021E6A2C: @ 0x021E6A2C
	push {r4, lr}
	adds r4, r0, #0
	bne _021E6A36
	bl GF_AssertFail
_021E6A36:
	ldr r0, [r4, #8]
	cmp r0, #0
	bne _021E6A40
	bl GF_AssertFail
_021E6A40:
	ldr r0, [r4, #8]
	pop {r4, pc}
	thumb_func_end ov111_021E6A2C

	thumb_func_start ov111_021E6A44
ov111_021E6A44: @ 0x021E6A44
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r1, #0
	movs r1, #7
	adds r5, r0, #0
	movs r0, #0
	lsls r1, r1, #6
	adds r4, r2, #0
	bl FUN_02003030
	movs r0, #0
	str r0, [sp]
	ldr r2, _021E6A70 @ =0x000003D2
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #0xd
	str r4, [sp, #4]
	bl FUN_0200E644
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_021E6A70: .4byte 0x000003D2
	thumb_func_end ov111_021E6A44

	thumb_func_start ov111_021E6A74
ov111_021E6A74: @ 0x021E6A74
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	str r3, [sp, #0x14]
	cmp r5, #0
	bne _021E6A88
	bl GF_AssertFail
_021E6A88:
	ldr r0, [sp, #0x40]
	cmp r0, #0
	bne _021E6A92
	bl GF_AssertFail
_021E6A92:
	ldr r0, [r4]
	cmp r0, #0
	bne _021E6ADE
	movs r0, #0x13
	str r0, [sp]
	movs r0, #0x1b
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0xf
	str r0, [sp, #0xc]
	movs r0, #1
	str r0, [sp, #0x10]
	add r2, sp, #0x20
	ldrb r2, [r2, #0x18]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r3, #2
	bl FUN_0201D40C
	adds r0, r4, #0
	bl FUN_0201EE8C
	adds r7, r0, #0
	ldr r0, [sp, #0x40]
	bl FUN_0202ADCC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	ldr r0, [sp, #0x3c]
	ldr r2, _021E6B28 @ =0x000003D2
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r1, r7, #0
	movs r3, #0xd
	bl FUN_0200E644
_021E6ADE:
	ldr r0, [sp, #0x40]
	bl FUN_0202AD3C
	adds r5, r0, #0
	adds r0, r4, #0
	movs r1, #0xf
	bl FUN_0201D978
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x30]
	ldr r2, [sp, #0x34]
	ldr r3, [sp, #0x3c]
	bl FUN_0200BC4C
	str r0, [r6]
	movs r3, #0
	str r3, [sp]
	ldr r0, _021E6B2C @ =0x0001020F
	str r5, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	ldr r2, [r6]
	adds r0, r4, #0
	movs r1, #1
	bl FUN_020200FC
	adds r5, r0, #0
	ldr r2, _021E6B28 @ =0x000003D2
	adds r0, r4, #0
	movs r1, #0
	movs r3, #0xd
	bl FUN_0200E998
	adds r0, r5, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E6B28: .4byte 0x000003D2
_021E6B2C: .4byte 0x0001020F
	thumb_func_end ov111_021E6A74

	thumb_func_start ov111_021E6B30
ov111_021E6B30: @ 0x021E6B30
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r1, #0
	adds r0, r5, #0
	movs r1, #0
	adds r4, r2, #0
	adds r6, r3, #0
	bl FUN_0201D978
	ldr r2, [sp, #0x20]
	ldr r3, [sp, #0x34]
	adds r0, r4, #0
	adds r1, r6, #0
	bl FUN_0200BC4C
	adds r4, r0, #0
	add r3, sp, #0x10
	ldrb r0, [r3, #0x1c]
	movs r1, #0
	adds r2, r4, #0
	str r0, [sp]
	ldr r0, [sp, #0x30]
	str r1, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldrb r3, [r3, #0x18]
	adds r0, r5, #0
	bl FUN_020200FC
	adds r0, r4, #0
	bl FUN_02026380
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end ov111_021E6B30

	.rodata

_021E6B74:
	.byte 0x00, 0x01, 0x02, 0x03, 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x02, 0x00, 0x00, 0x40, 0x00, 0x00, 0x10, 0x00, 0x10, 0x00, 0x10, 0x00, 0x10, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFE, 0xFF, 0xFE, 0xFF, 0x08, 0x02, 0x0F, 0x00
	.byte 0x1C, 0x00, 0x06, 0x00, 0xFE, 0xFF, 0x01, 0x02, 0x0F, 0x00, 0x2C, 0x00, 0xF8, 0xFF, 0x01, 0x00
	.byte 0x05, 0x01, 0x0F, 0x00, 0x2E, 0x00, 0xFE, 0xFF, 0x01, 0x00, 0x03, 0x01, 0x0F, 0x00, 0x33, 0x00
	.byte 0x01, 0x00, 0x01, 0x00, 0x05, 0x01, 0x0F, 0x00, 0x36, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x01
	.byte 0x0F, 0x00, 0x3B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x01, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x01, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x02, 0x03
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x03, 0x04, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.data

_021E6D40:
	.byte 0xE5, 0x59, 0x1E, 0x02, 0xA1, 0x5A, 0x1E, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	@ 0x021E6D60
