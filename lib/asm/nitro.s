	.include "asm/macros.inc"
	.include "global.inc"
	.public GXi_DmaId

	.bss

	.public GX_ResetBankForClearImage
	.public G2_GetBG0ScrPtr
	.public G2S_GetBG0ScrPtr
	.public G2_GetBG1ScrPtr
	.public G2S_GetBG1ScrPtr
	.public G2_GetBG2ScrPtr
	.public G2S_GetBG2ScrPtr
	.public G2_GetBG3ScrPtr
	.public G2S_GetBG3ScrPtr
	.public G3_LoadMtx44
	.public OSi_GetUnusedThreadId
	.public OSi_InsertLinkToQueue
	.public OSi_ThreadInfo
	.public OSi_IrqThreadQueue

	.public OSi_IrqCallback
	.public OSi_IrqCallbackInfoIndex
	.public OSi_IrqCallbackInfo
	.public OSi_EnterDmaCallback
	.public OSi_EnterTimerCallback
	.public OS_SetIrqStackChecker
	.public OS_InitLock
	.public OSi_DoLockByWord
	.public OS_LockByWord
	.public OSi_DoUnlockByWord
	.public OS_UnlockByWord
	.public OSi_DoTryLockByWord
	.public OS_LockCartridge
	.public OS_UnlockCartridge
	.public OS_UnLockCartridge
	.public OS_TryLockCartridge
	.public OS_LockCard
	.public OS_UnlockCard
	.public OS_UnLockCard
	.public OS_ReadOwnerOfLockWord
	.public OS_InitThread
	.public OSi_ExitThread
	.public OSi_ExitThread_ArgSpecified
	.public OSi_InsertThreadToList
	.public OSi_RemoveLinkFromQueue
	.public OSi_RemoveMutexLinkFromQueue
	.public OSi_RemoveSpecifiedLinkFromQueue
	.public OSi_RemoveThreadFromList
	.public OSi_RescheduleThread
	.public OSi_ExitThread_Destroy
	.public OS_IsRunOnEmulator
	.public OS_GetConsoleType
	.public OS_JamMessage
	.public DC_InvalidateAll
	.public DC_StoreAll
	.public DC_FlushAll
	.public DC_InvalidateRange
	.public DC_StoreRange
	.public DC_FlushRange
	.public IC_InvalidateAll

	.public OS_InitIrqTable
	.public OSi_WaitVCount0
	.public OS_GetArenaHi
	.public OS_GetArenaLo
	.public DLAddFront
	.public DLExtract
	.public DLInsert
	.public OS_GetDTCMParam
	.public OS_EnableProtectionUnit
	.public OS_DisableProtectionUnit
	.public OS_SetDPermissionsForProtectionRegion
	.public OSi_SetTimerReserved
	.public OSi_SetTimer
	.public OSi_InsertAlarm
	.public OS_GetCpsrIrq
	.public OSi_SendToPxi

_021E1A08:
	.space 0x3988

	.text

	arm_func_start OS_GetMacAddress
OS_GetMacAddress: ; 0x020D3C40
	ldr ip, _020D3C54 ; =MIi_CpuCopy8
	mov r1, r0
	ldr r0, _020D3C58 ; =0x027FFCF4
	mov r2, #6
	bx ip
	.align 2, 0
_020D3C54: .word MIi_CpuCopy8
_020D3C58: .word 0x027FFCF4
	arm_func_end OS_GetMacAddress

	arm_func_start OS_GetOwnerInfo
OS_GetOwnerInfo: ; 0x020D3C5C
	stmdb sp!, {r4, lr}
	ldr ip, _020D3CDC ; =0x027FFC80
	mov r4, r0
	ldrh r2, [ip, #0x64]
	add r0, ip, #6
	add r1, r4, #4
	mov r2, r2, lsl #0x1d
	mov r2, r2, lsr #0x1d
	strb r2, [r4]
	ldrb r3, [ip, #2]
	mov r2, #0x14
	mov r3, r3, lsl #0x1c
	mov r3, r3, lsr #0x1c
	strb r3, [r4, #1]
	ldrb r3, [ip, #3]
	strb r3, [r4, #2]
	ldrb r3, [ip, #4]
	strb r3, [r4, #3]
	ldrb r3, [ip, #0x1a]
	strh r3, [r4, #0x1a]
	ldrb r3, [ip, #0x50]
	strh r3, [r4, #0x52]
	bl MIi_CpuCopy16
	ldr r0, _020D3CDC ; =0x027FFC80
	add r1, r4, #0x1c
	add r0, r0, #0x1c
	mov r2, #0x34
	bl MIi_CpuCopy16
	mov r0, #0
	strh r0, [r4, #0x18]
	strh r0, [r4, #0x50]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020D3CDC: .word 0x027FFC80
	arm_func_end OS_GetOwnerInfo

	arm_func_start OS_GetOwnerRtcOffset
OS_GetOwnerRtcOffset: ; 0x020D3CE0
	ldr r1, _020D3CF0 ; =0x027FFC80
	ldr r0, [r1, #0x68]
	ldr r1, [r1, #0x6c]
	bx lr
	.align 2, 0
_020D3CF0: .word 0x027FFC80
	arm_func_end OS_GetOwnerRtcOffset

	arm_func_start sub_020D3CF4
sub_020D3CF4: ; 0x020D3CF4
	clz r0, r0
	bx lr
	arm_func_end sub_020D3CF4

	arm_func_start OSi_InitVramExclusive
OSi_InitVramExclusive: ; 0x020D3CFC
	ldr r0, _020D3D28 ; =0x021E1A08
	mov r3, #0
	str r3, [r0]
	ldr r0, _020D3D2C ; =0x021E1A0C
	mov r2, r3
_020D3D10:
	mov r1, r3, lsl #1
	add r3, r3, #1
	strh r2, [r0, r1]
	cmp r3, #9
	blt _020D3D10
	bx lr
	.align 2, 0
_020D3D28: .word 0x021E1A08
_020D3D2C: .word 0x021E1A0C
	arm_func_end OSi_InitVramExclusive

	arm_func_start sub_020D3D30
sub_020D3D30: ; 0x020D3D30
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r7, r0
	mov r8, r1
	bl OS_DisableInterrupts
	ldr r1, _020D3DE4 ; =0x021E1A08
	mov r6, r0
	ldr r0, [r1]
	ldr sb, _020D3DE8 ; =0x021E1A0C
	and r5, r7, r0
	mov r4, #1
_020D3D58:
	mov r0, r5
	bl sub_020D3CF4
	rsbs r1, r0, #0x1f
	bmi _020D3D90
	mov r0, r1, lsl #1
	ldrh r0, [sb, r0]
	mvn r1, r4, lsl r1
	cmp r8, r0
	and r5, r5, r1
	beq _020D3D58
	mov r0, r6
	bl OS_RestoreInterrupts
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_020D3D90:
	ldr r0, _020D3DEC ; =0x000001FF
	ldr r4, _020D3DE8 ; =0x021E1A0C
	ldr sb, _020D3DE4 ; =0x021E1A08
	and r7, r7, r0
	mov r5, #1
_020D3DA4:
	mov r0, r7
	bl sub_020D3CF4
	rsbs r1, r0, #0x1f
	bmi _020D3DD4
	ldr r0, [sb]
	mvn r2, r5, lsl r1
	orr r0, r0, r5, lsl r1
	mov r1, r1, lsl #1
	strh r8, [r4, r1]
	str r0, [sb]
	and r7, r7, r2
	b _020D3DA4
_020D3DD4:
	mov r0, r6
	bl OS_RestoreInterrupts
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_020D3DE4: .word 0x021E1A08
_020D3DE8: .word 0x021E1A0C
_020D3DEC: .word 0x000001FF
	arm_func_end sub_020D3D30

	arm_func_start OSi_UnlockVram
OSi_UnlockVram: ; 0x020D3DF0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r5, r0
	mov sl, r1
	bl OS_DisableInterrupts
	ldr r4, _020D3E6C ; =0x021E1A08
	ldr r1, _020D3E70 ; =0x000001FF
	ldr r2, [r4]
	mov sb, r0
	and r0, r5, r2
	ldr r6, _020D3E74 ; =0x021E1A0C
	and r8, r0, r1
	mov r7, #1
	mov r5, #0
_020D3E24:
	mov r0, r8
	bl sub_020D3CF4
	rsbs r2, r0, #0x1f
	bmi _020D3E60
	mov r1, r2, lsl #1
	ldrh r0, [r6, r1]
	mvn r2, r7, lsl r2
	cmp sl, r0
	and r8, r8, r2
	bne _020D3E24
	ldr r0, [r4]
	strh r5, [r6, r1]
	and r0, r0, r2
	str r0, [r4]
	b _020D3E24
_020D3E60:
	mov r0, sb
	bl OS_RestoreInterrupts
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_020D3E6C: .word 0x021E1A08
_020D3E70: .word 0x000001FF
_020D3E74: .word 0x021E1A0C
	arm_func_end OSi_UnlockVram

	arm_func_start sub_020D3E78
sub_020D3E78: ; 0x020D3E78
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _020D3F38 ; =0x04000006
	mov r5, r0
	ldrh r6, [r1]
	ldr r4, _020D3F3C ; =0x027FFC00
	bl OS_GetTickLo
	orr r0, r0, r6, lsl #16
	str r0, [r5]
	ldr r1, _020D3F40 ; =0x021E19DC
	ldrh ip, [r4, #0xf8]
	ldr r3, [r1]
	ldr r2, [r1, #4]
	mov r0, r4
	eor r2, r3, ip, lsl #16
	str r2, [r5, #4]
	ldr r2, [r1]
	ldr r3, [r0, #0x3c]
	ldr r2, [r1, #4]
	ldr r1, [r4, #0xf4]
	ldr ip, _020D3F44 ; =0x04000600
	eor r1, r2, r1
	eor r2, r3, r1
	str r2, [r5, #8]
	ldr r1, [ip]
	eor r1, r2, r1
	str r1, [r5, #8]
	ldr r2, [r0, #0x1e8]
	add r1, r0, #0x300
	str r2, [r5, #0xc]
	ldr r3, [r0, #0x1ec]
	sub r2, ip, #0x4d0
	str r3, [r5, #0x10]
	ldr r3, [r0, #0x390]
	ldrh r4, [r1, #0x94]
	add r0, r0, #0x3a8
	eor r3, r3, r4, lsl #16
	str r3, [r5, #0x14]
	ldrh r4, [r1, #0xaa]
	ldrh r3, [r1, #0xac]
	orr r3, r3, r4, lsl #16
	str r3, [r5, #0x18]
	ldrh r2, [r2]
	ldrh r0, [r0]
	ldrh r1, [r1, #0x98]
	orr r0, r2, r0
	orr r0, r0, r1, lsl #16
	str r0, [r5, #0x1c]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020D3F38: .word 0x04000006
_020D3F3C: .word 0x027FFC00
_020D3F40: .word 0x021E19DC
_020D3F44: .word 0x04000600
	arm_func_end sub_020D3E78

	arm_func_start OS_Terminate
OS_Terminate: ; 0x020D3F48
	stmdb sp!, {r3, lr}
_020D3F4C:
	bl OS_DisableInterrupts
	bl OS_Halt
	b _020D3F4C
	arm_func_end OS_Terminate

	arm_func_start OS_Halt
OS_Halt: ; 0x020D3F58
	mov r0, #0
	mcr p15, 0, r0, c7, c0, 4
	bx lr
	arm_func_end OS_Halt

	arm_func_start sub_020D3F64
sub_020D3F64: ; 0x020D3F64
	ldr r1, _020D3F70 ; =0x04000247
	strb r0, [r1]
	bx lr
	.align 2, 0
_020D3F70: .word 0x04000247
	arm_func_end sub_020D3F64

	arm_func_start MI_DmaFill32
MI_DmaFill32: ; 0x020D3F74
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	movs r4, r3
	mov r8, r0
	mov r7, r1
	mov r6, r2
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	add r0, r8, r8, lsl #1
	add r0, r0, #2
	mov r0, r0, lsl #2
	add r0, r0, #0xb0
	add r5, r0, #0x4000000
_020D3FA0:
	ldr r0, [r5]
	tst r0, #0x80000000
	bne _020D3FA0
	bl OS_DisableInterrupts
	mov r2, r8, lsl #2
	add r1, r2, #0xe0
	mov r3, r4, lsr #2
	mov r4, r0
	add ip, r2, #0x4000000
	mov r0, r8
	mov r2, r7
	add r1, r1, #0x4000000
	orr r3, r3, #0x85000000
	str r6, [ip, #0xe0]
	bl sub_01FF851C
	mov r0, r4
	bl OS_RestoreInterrupts
_020D3FE4:
	ldr r0, [r5]
	tst r0, #0x80000000
	bne _020D3FE4
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end MI_DmaFill32

	arm_func_start MI_DmaCopy32
MI_DmaCopy32: ; 0x020D3FF4
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r5, r3
	mov r6, r2
	mov r2, r5
	mov r3, #0
	mov r8, r0
	mov r7, r1
	bl sub_020D4394
	cmp r5, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	add r0, r8, r8, lsl #1
	add r0, r0, #2
	mov r0, r0, lsl #2
	add r0, r0, #0xb0
	add r4, r0, #0x4000000
_020D4030:
	ldr r0, [r4]
	tst r0, #0x80000000
	bne _020D4030
	mov r3, r5, lsr #2
	mov r0, r8
	mov r1, r7
	mov r2, r6
	orr r3, r3, #0x84000000
	bl sub_01FF8488
_020D4054:
	ldr r0, [r4]
	tst r0, #0x80000000
	bne _020D4054
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end MI_DmaCopy32

	arm_func_start MI_DmaCopy16
MI_DmaCopy16: ; 0x020D4064
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	movs r5, r3
	mov r8, r0
	mov r7, r1
	mov r6, r2
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	mov r2, r5
	mov r3, #0
	bl sub_020D4394
	add r0, r8, r8, lsl #1
	add r0, r0, #2
	mov r0, r0, lsl #2
	add r0, r0, #0xb0
	add r4, r0, #0x4000000
_020D409C:
	ldr r0, [r4]
	tst r0, #0x80000000
	bne _020D409C
	mov r3, r5, lsr #1
	mov r0, r8
	mov r1, r7
	mov r2, r6
	orr r3, r3, #0x80000000
	bl sub_01FF8488
_020D40C0:
	ldr r0, [r4]
	tst r0, #0x80000000
	bne _020D40C0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end MI_DmaCopy16

	arm_func_start MI_DmaFill32Async
MI_DmaFill32Async: ; 0x020D40D0
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	movs r4, r3
	mov r7, r0
	mov r6, r1
	mov r5, r2
	ldr r8, [sp, #0x18]
	bne _020D4100
	cmp r8, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r0, [sp, #0x1c]
	blx r8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020D4100:
	bl MI_WaitDma
	cmp r8, #0
	beq _020D4158
	ldr r2, [sp, #0x1c]
	mov r0, r7
	mov r1, r8
	bl OSi_EnterDmaCallback
	bl OS_DisableInterrupts
	mov r3, r4, lsr #2
	mov r2, r7, lsl #2
	add r1, r2, #0xe0
	add r2, r2, #0x4000000
	str r5, [r2, #0xe0]
	mov r4, r0
	mov r0, r7
	mov r2, r6
	add r1, r1, #0x4000000
	orr r3, r3, #0xc5000000
	bl sub_01FF84F8
	mov r0, r4
	bl OS_RestoreInterrupts
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020D4158:
	bl OS_DisableInterrupts
	mov r2, r7, lsl #2
	add r1, r2, #0xe0
	mov r3, r4, lsr #2
	mov r4, r0
	add ip, r2, #0x4000000
	mov r0, r7
	mov r2, r6
	add r1, r1, #0x4000000
	orr r3, r3, #0x85000000
	str r5, [ip, #0xe0]
	bl sub_01FF84F8
	mov r0, r4
	bl OS_RestoreInterrupts
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end MI_DmaFill32Async

	arm_func_start MI_DmaCopy32Async
MI_DmaCopy32Async: ; 0x020D4194
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r5, r3
	mov r6, r2
	mov r2, r5
	mov r3, #0
	mov r8, r0
	mov r7, r1
	ldr r4, [sp, #0x18]
	bl sub_020D4394
	cmp r5, #0
	bne _020D41D4
	cmp r4, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r0, [sp, #0x1c]
	blx r4
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020D41D4:
	mov r0, r8
	bl MI_WaitDma
	cmp r4, #0
	beq _020D4210
	ldr r2, [sp, #0x1c]
	mov r0, r8
	mov r1, r4
	bl OSi_EnterDmaCallback
	mov r3, r5, lsr #2
	mov r0, r8
	mov r1, r7
	mov r2, r6
	orr r3, r3, #0xc4000000
	bl sub_01FF8448
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020D4210:
	mov r3, r5, lsr #2
	mov r0, r8
	mov r1, r7
	mov r2, r6
	orr r3, r3, #0x84000000
	bl sub_01FF8448
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end MI_DmaCopy32Async

	arm_func_start MI_WaitDma
MI_WaitDma: ; 0x020D422C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl OS_DisableInterrupts
	add r1, r4, r4, lsl #1
	add r1, r1, #2
	mov r1, r1, lsl #2
	add r1, r1, #0xb0
	add r2, r1, #0x4000000
_020D424C:
	ldr r1, [r2]
	tst r1, #0x80000000
	bne _020D424C
	cmp r4, #0
	bne _020D4288
	mov r1, #0xc
	mul r2, r4, r1
	add r1, r2, #0xb0
	add r2, r2, #0x4000000
	mov r3, #0
	str r3, [r2, #0xb0]
	add r2, r1, #0x4000000
	ldr r1, _020D4290 ; =0x81400001
	str r3, [r2, #4]
	str r1, [r2, #8]
_020D4288:
	bl OS_RestoreInterrupts
	ldmia sp!, {r4, pc}
	.align 2, 0
_020D4290: .word 0x81400001
	arm_func_end MI_WaitDma

	arm_func_start MI_StopDma
MI_StopDma: ; 0x020D4294
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl OS_DisableInterrupts
	mov r1, #6
	mul r1, r4, r1
	add r1, r1, #5
	mov r1, r1, lsl #1
	add r1, r1, #0x4000000
	ldrh r2, [r1, #0xb0]
	cmp r4, #0
	bic r2, r2, #0x3a00
	strh r2, [r1, #0xb0]
	ldrh r2, [r1, #0xb0]
	bic r2, r2, #0x8000
	strh r2, [r1, #0xb0]
	ldrh r2, [r1, #0xb0]
	ldrh r1, [r1, #0xb0]
	bne _020D4304
	mov r1, #0xc
	mul r2, r4, r1
	add r1, r2, #0xb0
	add r2, r2, #0x4000000
	mov r3, #0
	str r3, [r2, #0xb0]
	add r2, r1, #0x4000000
	ldr r1, _020D430C ; =0x81400001
	str r3, [r2, #4]
	str r1, [r2, #8]
_020D4304:
	bl OS_RestoreInterrupts
	ldmia sp!, {r4, pc}
	.align 2, 0
_020D430C: .word 0x81400001
	arm_func_end MI_StopDma

	arm_func_start sub_020D4310
sub_020D4310: ; 0x020D4310
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r5, _020D4390 ; =0x040000B8
	mov r7, r0
	mov r6, r1
	mov r4, #0
_020D4324:
	cmp r4, r7
	beq _020D437C
	ldr r0, [r5]
	tst r0, #0x80000000
	andne r0, r0, #0x38000000
	cmpne r0, r6
	beq _020D437C
	cmp r0, #0x8000000
	cmpeq r6, #0x10000000
	beq _020D437C
	cmp r0, #0x10000000
	cmpeq r6, #0x8000000
	beq _020D437C
	cmp r0, #0x18000000
	cmpne r0, #0x20000000
	cmpne r0, #0x28000000
	cmpne r0, #0x30000000
	cmpne r0, #0x38000000
	cmpne r0, #0x8000000
	cmpne r0, #0x10000000
	bne _020D437C
	bl OS_Terminate
_020D437C:
	add r4, r4, #1
	cmp r4, #3
	add r5, r5, #0xc
	blt _020D4324
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020D4390: .word 0x040000B8
	arm_func_end sub_020D4310

	arm_func_start sub_020D4394
sub_020D4394: ; 0x020D4394
	stmdb sp!, {r3, lr}
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	cmp r3, #0
	and ip, r1, #0xff000000
	beq _020D43B8
	cmp r3, #0x800000
	subeq r1, r1, r2
	b _020D43BC
_020D43B8:
	add r1, r1, r2
_020D43BC:
	cmp ip, #0x4000000
	and r0, r1, #0xff000000
	beq _020D43E0
	cmp ip, #0x8000000
	bhs _020D43E0
	cmp r0, #0x4000000
	beq _020D43E0
	cmp r0, #0x8000000
	ldmloia sp!, {r3, pc}
_020D43E0:
	bl OS_Terminate
	ldmia sp!, {r3, pc}
	arm_func_end sub_020D4394

	arm_func_start sub_020D43E8
sub_020D43E8: ; 0x020D43E8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	mov r7, r0
	mov r4, r3
	mov r1, #0x10000000
	mov r5, r2
	bl sub_020D4310
	mov r0, r7
	mov r1, r6
	mov r2, r4
	mov r3, #0
	bl sub_020D4394
	cmp r4, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r7
	bl MI_WaitDma
	ldr r3, _020D4444 ; =0x96600000
	mov r0, r7
	mov r1, r6
	mov r2, r5
	orr r3, r3, r4, lsr #2
	bl sub_01FF8448
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020D4444: .word 0x96600000
	arm_func_end sub_020D43E8

	arm_func_start sub_020D4448
sub_020D4448: ; 0x020D4448
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	mov r7, r0
	mov r4, r3
	mov r1, #0x10000000
	mov r5, r2
	bl sub_020D4310
	mov r0, r7
	mov r1, r6
	mov r2, r4
	mov r3, #0
	bl sub_020D4394
	cmp r4, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r7
	bl MI_WaitDma
	ldr r3, _020D44A4 ; =0x92600000
	mov r0, r7
	mov r1, r6
	mov r2, r5
	orr r3, r3, r4, lsr #1
	bl sub_01FF8448
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020D44A4: .word 0x92600000
	arm_func_end sub_020D4448

	arm_func_start sub_020D44A8
sub_020D44A8: ; 0x020D44A8
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r2, #0
	bne _020D44CC
	cmp r3, #0
	ldmeqia sp!, {r4, pc}
	ldr r0, [sp, #8]
	blx r3
	ldmia sp!, {r4, pc}
_020D44CC:
	ldr r0, _020D4594 ; =0x021E1A20
_020D44D0:
	ldr ip, [r0]
	cmp ip, #0
	bne _020D44D0
	ldr ip, _020D4598 ; =0x04000600
_020D44E0:
	ldr r0, [ip]
	and r0, r0, #0x7000000
	mov r0, r0, lsr #0x18
	tst r0, #2
	beq _020D44E0
	ldr ip, _020D4594 ; =0x021E1A20
	mov r0, #1
	str r0, [ip]
	str r4, [ip, #4]
	str r1, [ip, #8]
	str r2, [ip, #0xc]
	str r3, [ip, #0x10]
	ldr lr, [sp, #8]
	mov r0, r4
	mov r3, #0
	str lr, [ip, #0x14]
	bl sub_020D4394
	mov r0, r4
	bl MI_WaitDma
	bl OS_DisableInterrupts
	ldr r1, _020D4598 ; =0x04000600
	mov r4, r0
	ldr r0, [r1]
	ldr r1, _020D4594 ; =0x021E1A20
	and r0, r0, #0xc0000000
	mov r2, r0, lsr #0x1e
	mov r0, #0x200000
	str r2, [r1, #0x18]
	bl OS_GetIrqFunction
	ldr r1, _020D4594 ; =0x021E1A20
	ldr r2, _020D4598 ; =0x04000600
	str r0, [r1, #0x1c]
	ldr r0, [r2]
	ldr r1, _020D459C ; =sub_020D45A0
	bic r0, r0, #0xc0000000
	orr r3, r0, #0x40000000
	mov r0, #0x200000
	str r3, [r2]
	bl OS_SetIrqFunction
	mov r0, #0x200000
	bl OS_EnableIrqMask
	bl sub_020D45A0
	mov r0, r4
	bl OS_RestoreInterrupts
	ldmia sp!, {r4, pc}
	.align 2, 0
_020D4594: .word 0x021E1A20
_020D4598: .word 0x04000600
_020D459C: .word sub_020D45A0
	arm_func_end sub_020D44A8

	arm_func_start sub_020D45A0
sub_020D45A0: ; 0x020D45A0
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _020D463C ; =0x021E1A20
	ldr r5, [r0, #0xc]
	cmp r5, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, _020D463C ; =0x021E1A20
	cmp r5, #0x1d8
	ldr r1, [r0, #0xc]
	movhs r5, #0x1d8
	ldr r4, [r0, #8]
	subs r1, r1, r5
	str r1, [r0, #0xc]
	add r1, r4, r5
	str r1, [r0, #8]
	bne _020D4618
	ldr r0, [r0, #4]
	ldr r1, _020D4640 ; =sub_020D464C
	mov r2, #0
	bl OSi_EnterDmaCallback
	ldr r0, _020D463C ; =0x021E1A20
	mov r3, #0x3bc00000
	rsb r3, r3, #0
	ldr r0, [r0, #4]
	ldr r2, _020D4644 ; =0x04000400
	mov r1, r4
	orr r3, r3, r5, lsr #2
	bl sub_01FF8448
	mov r0, #0x200000
	bl OS_ResetRequestIrqMask
	ldmia sp!, {r3, r4, r5, pc}
_020D4618:
	ldr r3, _020D4648 ; =0x84400000
	ldr r0, [r0, #4]
	ldr r2, _020D4644 ; =0x04000400
	mov r1, r4
	orr r3, r3, r5, lsr #2
	bl sub_01FF8448
	mov r0, #0x200000
	bl OS_ResetRequestIrqMask
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020D463C: .word 0x021E1A20
_020D4640: .word sub_020D464C
_020D4644: .word 0x04000400
_020D4648: .word 0x84400000
	arm_func_end sub_020D45A0

	arm_func_start sub_020D464C
sub_020D464C: ; 0x020D464C
	stmdb sp!, {r3, lr}
	mov r0, #0x200000
	bl OS_DisableIrqMask
	ldr r2, _020D46A4 ; =0x04000600
	ldr r0, _020D46A8 ; =0x021E1A20
	ldr r1, [r2]
	ldr r3, [r0, #0x18]
	bic r1, r1, #0xc0000000
	orr r1, r1, r3, lsl #30
	str r1, [r2]
	ldr r1, [r0, #0x1c]
	mov r0, #0x200000
	bl OS_SetIrqFunction
	ldr r0, _020D46A8 ; =0x021E1A20
	mov r1, #0
	str r1, [r0]
	ldr r1, [r0, #0x10]
	ldr r0, [r0, #0x14]
	cmp r1, #0
	ldmeqia sp!, {r3, pc}
	blx r1
	ldmia sp!, {r3, pc}
	.align 2, 0
_020D46A4: .word 0x04000600
_020D46A8: .word 0x021E1A20
	arm_func_end sub_020D464C

	arm_func_start sub_020D46AC
sub_020D46AC: ; 0x020D46AC
	stmdb sp!, {r4, r5, r6, lr}
	movs r4, r2
	mov r6, r0
	mov r5, r1
	bne _020D46D4
	cmp r3, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r0, [sp, #0x10]
	blx r3
	ldmia sp!, {r4, r5, r6, pc}
_020D46D4:
	ldr r0, _020D4758 ; =0x021E1A20
_020D46D8:
	ldr r1, [r0]
	cmp r1, #0
	bne _020D46D8
	ldr r2, _020D4758 ; =0x021E1A20
	mov r0, #1
	str r0, [r2]
	str r6, [r2, #4]
	ldr ip, [sp, #0x10]
	str r3, [r2, #0x10]
	mov r0, r6
	mov r1, #0x38000000
	str ip, [r2, #0x14]
	bl sub_020D4310
	mov r0, r6
	mov r1, r5
	mov r2, r4
	mov r3, #0
	bl sub_020D4394
	mov r0, r6
	bl MI_WaitDma
	mov r0, r6
	ldr r1, _020D475C ; =sub_020D4764
	mov r2, #0
	bl OSi_EnterDmaCallback
	mov r0, r6
	mov r1, r5
	ldr r2, _020D4760 ; =0x04000400
	mov r3, #0x3c00000
	rsb r3, r3, #0
	orr r3, r3, r4, lsr #2
	bl sub_01FF8448
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020D4758: .word 0x021E1A20
_020D475C: .word sub_020D4764
_020D4760: .word 0x04000400
	arm_func_end sub_020D46AC

	arm_func_start sub_020D4764
sub_020D4764: ; 0x020D4764
	stmdb sp!, {r3, lr}
	ldr r0, _020D478C ; =0x021E1A20
	mov r1, #0
	str r1, [r0]
	ldr r1, [r0, #0x10]
	ldr r0, [r0, #0x14]
	cmp r1, #0
	ldmeqia sp!, {r3, pc}
	blx r1
	ldmia sp!, {r3, pc}
	.align 2, 0
_020D478C: .word 0x021E1A20
	arm_func_end sub_020D4764

	arm_func_start MIi_CpuClear16
MIi_CpuClear16: ; 0x020D4790
	mov r3, #0
_020D4794:
	cmp r3, r2
	blt _020D47A0
	b _020D47A4
_020D47A0:
	strh r0, [r1, r3]
_020D47A4:
	blt _020D47AC
	b _020D47B0
_020D47AC:
	add r3, r3, #2
_020D47B0:
	blt _020D4794
	bx lr
	arm_func_end MIi_CpuClear16

	arm_func_start MIi_CpuCopy16
MIi_CpuCopy16: ; 0x020D47B8
	mov ip, #0
_020D47BC:
	cmp ip, r2
	blt _020D47C8
	b _020D47CC
_020D47C8:
	ldrh r3, [r0, ip]
_020D47CC:
	blt _020D47D4
	b _020D47D8
_020D47D4:
	strh r3, [r1, ip]
_020D47D8:
	blt _020D47E0
	b _020D47E4
_020D47E0:
	add ip, ip, #2
_020D47E4:
	blt _020D47BC
	bx lr
	arm_func_end MIi_CpuCopy16

	arm_func_start MIi_CpuClear32
MIi_CpuClear32: ; 0x020D47EC
	add ip, r1, r2
_020D47F0:
	cmp r1, ip
	blt _020D47FC
	b _020D4800
_020D47FC:
	stmia r1!, {r0}
_020D4800:
	blt _020D47F0
	bx lr
	arm_func_end MIi_CpuClear32

	arm_func_start MIi_CpuCopy32
MIi_CpuCopy32: ; 0x020D4808
	add ip, r1, r2
_020D480C:
	cmp r1, ip
	blt _020D4818
	b _020D481C
_020D4818:
	ldmia r0!, {r2}
_020D481C:
	blt _020D4824
	b _020D4828
_020D4824:
	stmia r1!, {r2}
_020D4828:
	blt _020D480C
	bx lr
	arm_func_end MIi_CpuCopy32

	arm_func_start sub_020D4830
sub_020D4830: ; 0x020D4830
	add ip, r0, r2
_020D4834:
	cmp r0, ip
	blt _020D4840
	b _020D4844
_020D4840:
	ldmia r0!, {r2}
_020D4844:
	blt _020D484C
	b _020D4850
_020D484C:
	str r2, [r1]
_020D4850:
	blt _020D4834
	bx lr
	arm_func_end sub_020D4830

	arm_func_start MIi_CpuClearFast
MIi_CpuClearFast: ; 0x020D4858
	stmdb sp!, {r4, r5, r6, r7, r8, sb}
	add sb, r1, r2
	mov ip, r2, lsr #5
	add ip, r1, ip, lsl #5
	mov r2, r0
	mov r3, r2
	mov r4, r2
	mov r5, r2
	mov r6, r2
	mov r7, r2
	mov r8, r2
_020D4884:
	cmp r1, ip
	blt _020D4890
	b _020D4894
_020D4890:
	stmia r1!, {r0, r2, r3, r4, r5, r6, r7, r8}
_020D4894:
	blt _020D4884
_020D4898:
	cmp r1, sb
	blt _020D48A4
	b _020D48A8
_020D48A4:
	stmia r1!, {r0}
_020D48A8:
	blt _020D4898
	ldmia sp!, {r4, r5, r6, r7, r8, sb}
	bx lr
	arm_func_end MIi_CpuClearFast

	arm_func_start MIi_CpuCopyFast
MIi_CpuCopyFast: ; 0x020D48B4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl}
	add sl, r1, r2
	mov ip, r2, lsr #5
	add ip, r1, ip, lsl #5
_020D48C4:
	cmp r1, ip
	blt _020D48D0
	b _020D48D4
_020D48D0:
	ldmia r0!, {r2, r3, r4, r5, r6, r7, r8, sb}
_020D48D4:
	blt _020D48DC
	b _020D48E0
_020D48DC:
	stmia r1!, {r2, r3, r4, r5, r6, r7, r8, sb}
_020D48E0:
	blt _020D48C4
_020D48E4:
	cmp r1, sl
	blt _020D48F0
	b _020D48F4
_020D48F0:
	ldmia r0!, {r2}
_020D48F4:
	blt _020D48FC
	b _020D4900
_020D48FC:
	stmia r1!, {r2}
_020D4900:
	blt _020D48E4
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl}
	bx lr
	arm_func_end MIi_CpuCopyFast

	arm_func_start MI_Copy32B
MI_Copy32B: ; 0x020D490C
	ldmia r0!, {r2, r3, ip}
	stmia r1!, {r2, r3, ip}
	ldmia r0!, {r2, r3, ip}
	stmia r1!, {r2, r3, ip}
	ldmia r0!, {r2, r3}
	stmia r1!, {r2, r3}
	bx lr
	arm_func_end MI_Copy32B

	arm_func_start MI_Copy36B
MI_Copy36B: ; 0x020D4928
	ldmia r0!, {r2, r3, ip}
	stmia r1!, {r2, r3, ip}
	ldmia r0!, {r2, r3, ip}
	stmia r1!, {r2, r3, ip}
	ldmia r0!, {r2, r3, ip}
	stmia r1!, {r2, r3, ip}
	bx lr
	arm_func_end MI_Copy36B

	arm_func_start MI_Copy48B
MI_Copy48B: ; 0x020D4944
	ldmia r0!, {r2, r3, ip}
	stmia r1!, {r2, r3, ip}
	ldmia r0!, {r2, r3, ip}
	stmia r1!, {r2, r3, ip}
	ldmia r0!, {r2, r3, ip}
	stmia r1!, {r2, r3, ip}
	ldmia r0!, {r2, r3, ip}
	stmia r1!, {r2, r3, ip}
	bx lr
	arm_func_end MI_Copy48B

	arm_func_start MI_Copy64B
MI_Copy64B: ; 0x020D4968
	ldmia r0!, {r2, r3, ip}
	stmia r1!, {r2, r3, ip}
	ldmia r0!, {r2, r3, ip}
	stmia r1!, {r2, r3, ip}
	ldmia r0!, {r2, r3, ip}
	stmia r1!, {r2, r3, ip}
	ldmia r0!, {r2, r3, ip}
	stmia r1!, {r2, r3, ip}
	ldmia r0, {r0, r2, r3, ip}
	stmia r1!, {r0, r2, r3, ip}
	bx lr
	arm_func_end MI_Copy64B

	arm_func_start MI_CpuFill8
MI_CpuFill8: ; 0x020D4994
	cmp r2, #0
	beq _020D49A0
	b _020D49A4
_020D49A0:
	bx lr
_020D49A4:
	tst r0, #1
	beq _020D49D0
	ldrh ip, [r0, #-1]
	and ip, ip, #0xff
	orr r3, ip, r1, lsl #8
	strh r3, [r0, #-1]
	add r0, r0, #1
	subs r2, r2, #1
	beq _020D49CC
	b _020D49D0
_020D49CC:
	bx lr
_020D49D0:
	cmp r2, #2
	blo _020D4A28
	orr r1, r1, r1, lsl #8
	tst r0, #2
	beq _020D49F8
	strh r1, [r0], #2
	subs r2, r2, #2
	beq _020D49F4
	b _020D49F8
_020D49F4:
	bx lr
_020D49F8:
	orr r1, r1, r1, lsl #16
	bics r3, r2, #3
	beq _020D4A18
	sub r2, r2, r3
	add ip, r3, r0
_020D4A0C:
	str r1, [r0], #4
	cmp r0, ip
	blo _020D4A0C
_020D4A18:
	tst r2, #2
	bne _020D4A24
	b _020D4A28
_020D4A24:
	strh r1, [r0], #2
_020D4A28:
	tst r2, #1
	beq _020D4A34
	b _020D4A38
_020D4A34:
	bx lr
_020D4A38:
	ldrh r3, [r0]
	and r3, r3, #0xff00
	and r1, r1, #0xff
	orr r1, r1, r3
	strh r1, [r0]
	bx lr
	arm_func_end MI_CpuFill8

	arm_func_start MIi_CpuCopy8
MIi_CpuCopy8: ; 0x020D4A50
	cmp r2, #0
	beq _020D4A5C
	b _020D4A60
_020D4A5C:
	bx lr
_020D4A60:
	tst r1, #1
	beq _020D4AB8
	ldrh ip, [r1, #-1]
	and ip, ip, #0xff
	tst r0, #1
	bne _020D4A7C
	b _020D4A80
_020D4A7C:
	ldrh r3, [r0, #-1]
_020D4A80:
	bne _020D4A88
	b _020D4A8C
_020D4A88:
	mov r3, r3, lsr #8
_020D4A8C:
	beq _020D4A94
	b _020D4A98
_020D4A94:
	ldrh r3, [r0]
_020D4A98:
	orr r3, ip, r3, lsl #8
	strh r3, [r1, #-1]
	add r0, r0, #1
	add r1, r1, #1
	subs r2, r2, #1
	beq _020D4AB4
	b _020D4AB8
_020D4AB4:
	bx lr
_020D4AB8:
	eor ip, r1, r0
	tst ip, #1
	beq _020D4B14
	bic r0, r0, #1
	ldrh ip, [r0], #2
	mov r3, ip, lsr #8
	subs r2, r2, #2
	blo _020D4AF0
_020D4AD8:
	ldrh ip, [r0], #2
	orr ip, r3, ip, lsl #8
	strh ip, [r1], #2
	mov r3, ip, lsr #0x10
	subs r2, r2, #2
	bhs _020D4AD8
_020D4AF0:
	tst r2, #1
	beq _020D4AFC
	b _020D4B00
_020D4AFC:
	bx lr
_020D4B00:
	ldrh ip, [r1]
	and ip, ip, #0xff00
	orr ip, ip, r3
	strh ip, [r1]
	bx lr
_020D4B14:
	tst ip, #2
	beq _020D4B40
	bics r3, r2, #1
	beq _020D4BA4
	sub r2, r2, r3
	add ip, r3, r1
_020D4B2C:
	ldrh r3, [r0], #2
	strh r3, [r1], #2
	cmp r1, ip
	blo _020D4B2C
	b _020D4BA4
_020D4B40:
	cmp r2, #2
	blo _020D4BA4
	tst r1, #2
	beq _020D4B68
	ldrh r3, [r0], #2
	strh r3, [r1], #2
	subs r2, r2, #2
	beq _020D4B64
	b _020D4B68
_020D4B64:
	bx lr
_020D4B68:
	bics r3, r2, #3
	beq _020D4B88
	sub r2, r2, r3
	add ip, r3, r1
_020D4B78:
	ldr r3, [r0], #4
	str r3, [r1], #4
	cmp r1, ip
	blo _020D4B78
_020D4B88:
	tst r2, #2
	bne _020D4B94
	b _020D4B98
_020D4B94:
	ldrh r3, [r0], #2
_020D4B98:
	bne _020D4BA0
	b _020D4BA4
_020D4BA0:
	strh r3, [r1], #2
_020D4BA4:
	tst r2, #1
	beq _020D4BB0
	b _020D4BB4
_020D4BB0:
	bx lr
_020D4BB4:
	ldrh r2, [r1]
	ldrh r0, [r0]
	and r2, r2, #0xff00
	and r0, r0, #0xff
	orr r0, r2, r0
	strh r0, [r1]
	bx lr
	arm_func_end MIi_CpuCopy8

	thumb_func_start sub_020D4BD0
sub_020D4BD0: ; 0x020D4BD0
	mov r1, #0
	mov r2, #0
	mov r3, #0
	stmia r0!, {r1, r2, r3}
	stmia r0!, {r1, r2, r3}
	stmia r0!, {r1, r2, r3}
	bx lr
	thumb_func_end sub_020D4BD0

	.balign 4, 0

	arm_func_start MI_SwapWord
MI_SwapWord: ; 0x020D4BE0
	swp r0, r0, [r1]
	bx lr
	arm_func_end MI_SwapWord

	arm_func_start MI_UncompressLZ8
MI_UncompressLZ8: ; 0x020D4BE8
	stmdb sp!, {r4, r5, r6, r7, lr}
	ldr r5, [r0], #4
	mov r2, r5, lsr #8
	mov r7, #0
	tst r5, #0xf
	bne _020D4C04
	b _020D4C08
_020D4C04:
	mov r7, #1
_020D4C08:
	cmp r2, #0
	ble _020D4CE0
	ldrb lr, [r0], #1
	mov r4, #8
_020D4C18:
	subs r4, r4, #1
	blt _020D4C08
	tst lr, #0x80
	bne _020D4C3C
	ldrb r6, [r0], #1
	swpb r6, r6, [r1]
	add r1, r1, #1
	sub r2, r2, #1
	b _020D4CC8
_020D4C3C:
	ldrb r5, [r0]
	cmp r7, #0
	beq _020D4C4C
	b _020D4C50
_020D4C4C:
	mov r6, #3
_020D4C50:
	beq _020D4C94
	tst r5, #0xe0
	bne _020D4C60
	b _020D4C64
_020D4C60:
	mov r6, #1
_020D4C64:
	bne _020D4C94
	add r0, r0, #1
	and r6, r5, #0xf
	mov r6, r6, lsl #4
	tst r5, #0x10
	beq _020D4C8C
	mov r6, r6, lsl #8
	ldrb r5, [r0], #1
	add r6, r6, r5, lsl #4
	add r6, r6, #0x100
_020D4C8C:
	add r6, r6, #0x11
	ldrb r5, [r0]
_020D4C94:
	add r3, r6, r5, asr #4
	add r0, r0, #1
	and r5, r5, #0xf
	mov ip, r5, lsl #8
	ldrb r6, [r0], #1
	orr r5, r6, ip
	add ip, r5, #1
	sub r2, r2, r3
_020D4CB4:
	ldrb r5, [r1, -ip]
	swpb r5, r5, [r1]
	add r1, r1, #1
	subs r3, r3, #1
	bgt _020D4CB4
_020D4CC8:
	cmp r2, #0
	bgt _020D4CD4
	b _020D4CD8
_020D4CD4:
	mov lr, lr, lsl #1
_020D4CD8:
	bgt _020D4C18
	b _020D4C08
_020D4CE0:
	ldmia sp!, {r4, r5, r6, r7, lr}
	bx lr
	arm_func_end MI_UncompressLZ8

	arm_func_start sub_020D4CE8
sub_020D4CE8: ; 0x020D4CE8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r1
	mov r6, r0
	mov r7, r3
	mvn r1, #0
	mov r4, r2
	bl sub_020D4310
	mov r0, r6
	mov r1, r5
	mov r2, r7
	mov r3, #0x1000000
	bl sub_020D4394
	cmp r7, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	add r0, r6, r6, lsl #1
	add r0, r0, #2
	mov r0, r0, lsl #2
	add r0, r0, #0xb0
	add r1, r0, #0x4000000
_020D4D34:
	ldr r0, [r1]
	tst r0, #0x80000000
	bne _020D4D34
	ldr r3, _020D4D58 ; =0xAF000001
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl sub_01FF8448
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020D4D58: .word 0xAF000001
	arm_func_end sub_020D4CE8

	arm_func_start sub_020D4D5C
sub_020D4D5C: ; 0x020D4D5C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x18
	mov sl, r0
	movs r0, r3
	ldrne r0, _020D4F30 ; =0x00010110
	str r3, [sp, #4]
	strne r0, [sp, #8]
	moveq r0, #0x12
	streq r0, [sp, #8]
	ldr r0, [sp, #4]
	mov sb, r1
	cmp r0, #0
	movne r1, #1
	mov r0, sb, lsl #8
	moveq r1, #0
	orr r0, r0, #0x10
	mov r8, r2
	orr r0, r0, r1
	str sl, [sp, #0x10]
	mov r7, sb
	cmp sb, #0
	str r0, [r8], #4
	mov r4, #4
	beq _020D4EFC
_020D4DBC:
	ldr r0, _020D4F34 ; =0x00000111
	mov r5, #0
	str r8, [sp, #0xc]
	mov r6, r5
	add r8, r8, #1
	add r4, r4, #1
	rsb fp, r0, #0
_020D4DD8:
	cmp sb, #0
	mov r0, r5, lsl #1
	and r5, r0, #0xff
	beq _020D4EDC
	ldr r0, [sp, #8]
	mov r1, sl
	str r0, [sp]
	ldr r0, [sp, #0x10]
	mov r2, sb
	add r3, sp, #0x14
	bl sub_020D4F38
	cmp r0, #0
	beq _020D4EBC
	orr r1, r5, #1
	add r2, r4, #2
	cmp r2, r7
	and r5, r1, #0xff
	addhs sp, sp, #0x18
	movhs r0, #0
	ldmhsia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r1, [sp, #4]
	cmp r1, #0
	beq _020D4E84
	ldr r1, _020D4F34 ; =0x00000111
	cmp r0, r1
	blo _020D4E64
	mov r4, r2
	add r1, r0, fp
	mov r2, r1, lsr #0xc
	orr r2, r2, #0x10
	strb r2, [r8]
	mov r2, r1, lsr #4
	strb r2, [r8, #1]
	add r8, r8, #2
	b _020D4E88
_020D4E64:
	cmp r0, #0x11
	sublo r1, r0, #1
	blo _020D4E88
	sub r1, r0, #0x11
	mov r2, r1, lsr #4
	strb r2, [r8], #1
	add r4, r4, #1
	b _020D4E88
_020D4E84:
	sub r1, r0, #3
_020D4E88:
	ldrh r2, [sp, #0x14]
	add r4, r4, #2
	add sl, sl, r0
	sub r2, r2, #1
	mov r2, r2, asr #8
	orr r1, r2, r1, lsl #4
	strb r1, [r8]
	sub sb, sb, r0
	ldrh r0, [sp, #0x14]
	sub r0, r0, #1
	strb r0, [r8, #1]
	add r8, r8, #2
	b _020D4EDC
_020D4EBC:
	add r4, r4, #1
	cmp r4, r7
	addhs sp, sp, #0x18
	movhs r0, #0
	ldmhsia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldrb r0, [sl], #1
	sub sb, sb, #1
	strb r0, [r8], #1
_020D4EDC:
	add r0, r6, #1
	and r6, r0, #0xff
	cmp r6, #8
	blo _020D4DD8
	ldr r0, [sp, #0xc]
	cmp sb, #0
	strb r5, [r0]
	bne _020D4DBC
_020D4EFC:
	tst r4, #3
	mov r2, #0
	beq _020D4F24
	mov r1, r2
_020D4F0C:
	add r0, r2, #1
	and r2, r0, #0xff
	add r0, r4, r2
	tst r0, #3
	strb r1, [r8], #1
	bne _020D4F0C
_020D4F24:
	mov r0, r4
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020D4F30: .word 0x00010110
_020D4F34: .word 0x00000111
	arm_func_end sub_020D4D5C

	arm_func_start sub_020D4F38
sub_020D4F38: ; 0x020D4F38
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r7, [sp, #0x20]
	mov r4, #2
	cmp r2, #3
	movlo r0, #0
	ldmloia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	sub ip, r1, #0x1000
	cmp ip, r0
	movlo ip, r0
	sub r6, r1, ip
	cmp r6, #2
	blt _020D5018
_020D4F68:
	mov r0, r1
	ldrb r5, [r1]
	b _020D4F84
_020D4F74:
	add ip, ip, #1
	sub r6, r1, ip
	cmp r6, #2
	blt _020D5018
_020D4F84:
	ldrb r8, [ip]
	cmp r5, r8
	ldreqb sb, [r1, #1]
	ldreqb r8, [ip, #1]
	cmpeq sb, r8
	ldreqb sb, [r1, #2]
	ldreqb r8, [ip, #2]
	cmpeq sb, r8
	bne _020D4F74
	add sl, ip, #3
	add r0, r0, #3
	mov r5, #3
	b _020D4FCC
_020D4FB8:
	add r5, r5, #1
	cmp r5, r7
	add r0, r0, #1
	add sl, sl, #1
	beq _020D4FE8
_020D4FCC:
	sub r8, r0, r1
	cmp r8, r2
	bhs _020D4FE8
	ldrb sb, [r0]
	ldrb r8, [sl]
	cmp sb, r8
	beq _020D4FB8
_020D4FE8:
	cmp r5, r4
	bls _020D5008
	mov r0, r6, lsl #0x10
	cmp r5, r7
	mov r4, r5
	mov lr, r0, lsr #0x10
	cmpne r5, r2
	beq _020D5018
_020D5008:
	add ip, ip, #1
	sub r6, r1, ip
	cmp r6, #2
	bge _020D4F68
_020D5018:
	cmp r4, #3
	movlo r0, #0
	movhs r0, r4
	strhsh lr, [r3]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end sub_020D4F38

	arm_func_start MI_Init
MI_Init: ; 0x020D502C
	stmdb sp!, {r3, lr}
	mov r0, #3
	bl sub_020D3F64
	mov r0, #0
	bl MI_StopDma
	ldmia sp!, {r3, pc}
	arm_func_end MI_Init

	arm_func_start sub_020D5044
sub_020D5044: ; 0x020D5044
	stmdb sp!, {r3, lr}
	mov r2, #0
	mov r1, r0
	mov r3, r2
	mov r0, #1
	str r2, [sp]
	bl sub_020D548C
	ldmia sp!, {r3, pc}
	arm_func_end sub_020D5044

	arm_func_start sub_020D5064
sub_020D5064: ; 0x020D5064
	stmdb sp!, {r3, lr}
	mov lr, r1
	mov ip, r2
	str r3, [sp]
	mov r1, r0
	mov r2, lr
	mov r3, ip
	mov r0, #2
	bl sub_020D548C
	ldmia sp!, {r3, pc}
	arm_func_end sub_020D5064

	arm_func_start sub_020D508C
sub_020D508C: ; 0x020D508C
	stmdb sp!, {r3, lr}
	mov r2, #0
	mov r1, r0
	mov r3, r2
	mov r0, #3
	str r2, [sp]
	bl sub_020D548C
	ldmia sp!, {r3, pc}
	arm_func_end sub_020D508C

	arm_func_start sub_020D50AC
sub_020D50AC: ; 0x020D50AC
	stmdb sp!, {r3, lr}
	mov r2, r1
	mov r3, #0
	mov r1, r0
	mov r0, #4
	str r3, [sp]
	bl sub_020D548C
	ldmia sp!, {r3, pc}
	arm_func_end sub_020D50AC

	arm_func_start sub_020D50CC
sub_020D50CC: ; 0x020D50CC
	ldr ip, _020D50E0 ; =sub_020D543C
	mov r2, r1
	mov r1, #0x1a
	mov r3, #2
	bx ip
	.align 2, 0
_020D50E0: .word sub_020D543C
	arm_func_end sub_020D50CC

	arm_func_start sub_020D50E4
sub_020D50E4: ; 0x020D50E4
	ldr ip, _020D50F8 ; =sub_020D543C
	mov r2, r1
	mov r1, #6
	mov r3, #2
	bx ip
	.align 2, 0
_020D50F8: .word sub_020D543C
	arm_func_end sub_020D50E4

	arm_func_start sub_020D50FC
sub_020D50FC: ; 0x020D50FC
	ldr ip, _020D5110 ; =sub_020D543C
	mov r2, r1
	mov r1, #4
	mov r3, #1
	bx ip
	.align 2, 0
_020D5110: .word sub_020D543C
	arm_func_end sub_020D50FC

	arm_func_start sub_020D5114
sub_020D5114: ; 0x020D5114
	stmdb sp!, {r3, lr}
	mov r3, r2
	mov ip, #2
	mov r2, #0xc
	str ip, [sp]
	bl sub_020D5464
	ldmia sp!, {r3, pc}
	arm_func_end sub_020D5114

	arm_func_start sub_020D5130
sub_020D5130: ; 0x020D5130
	stmdb sp!, {r3, lr}
	mov r3, r2
	mov ip, #1
	mov r2, #9
	str ip, [sp]
	bl sub_020D5464
	ldmia sp!, {r3, pc}
	arm_func_end sub_020D5130

	arm_func_start sub_020D514C
sub_020D514C: ; 0x020D514C
	stmdb sp!, {r3, lr}
	mov lr, r1
	mov r3, r2
	mov ip, #0
	mov r1, r0
	mov r2, lr
	mov r0, #9
	str ip, [sp]
	bl sub_020D548C
	ldmia sp!, {r3, pc}
	arm_func_end sub_020D514C

	arm_func_start sub_020D5174
sub_020D5174: ; 0x020D5174
	stmdb sp!, {r3, lr}
	mov lr, r1
	mov ip, r2
	str r3, [sp]
	mov r1, r0
	mov r2, lr
	mov r3, ip
	mov r0, #0xc
	bl sub_020D548C
	ldmia sp!, {r3, pc}
	arm_func_end sub_020D5174

	arm_func_start sub_020D519C
sub_020D519C: ; 0x020D519C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r7, r2
	mov sb, r0
	mov r8, r1
	mov r6, r3
	mov r5, r7
	mov r4, #0
	b _020D51D4
_020D51BC:
	tst r5, #1
	beq _020D51CC
	mov r0, r4
	bl sub_020D5C70
_020D51CC:
	add r4, r4, #1
	mov r5, r5, lsr #1
_020D51D4:
	cmp r4, #8
	bge _020D51E4
	cmp r5, #0
	bne _020D51BC
_020D51E4:
	mov r1, sb
	mov r2, r8
	mov r3, r7
	mov r0, #0xd
	str r6, [sp]
	bl sub_020D548C
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end sub_020D519C

	arm_func_start sub_020D5200
sub_020D5200: ; 0x020D5200
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r4, r2
	mov r5, r1
	ldr r2, [sp, #0x18]
	mov r6, r0
	mov r1, r3
	bl sub_020D5C90
	str r0, [sp]
	mov r1, r6
	mov r2, r5
	mov r3, r4
	mov r0, #0x12
	bl sub_020D548C
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	arm_func_end sub_020D5200

	arm_func_start sub_020D5240
sub_020D5240: ; 0x020D5240
	stmdb sp!, {r3, lr}
	mov r2, r1
	mov r3, #0
	mov r1, r0
	mov r0, #0x1a
	str r3, [sp]
	bl sub_020D548C
	ldmia sp!, {r3, pc}
	arm_func_end sub_020D5240

	arm_func_start sub_020D5260
sub_020D5260: ; 0x020D5260
	stmdb sp!, {r3, lr}
	mov r2, r1
	mov r3, #0
	mov r1, r0
	mov r0, #0x1b
	str r3, [sp]
	bl sub_020D548C
	ldmia sp!, {r3, pc}
	arm_func_end sub_020D5260

	arm_func_start sub_020D5280
sub_020D5280: ; 0x020D5280
	stmdb sp!, {r3, lr}
	mov r2, r1
	mov r3, #0
	mov r1, r0
	mov r0, #0x13
	str r3, [sp]
	bl sub_020D548C
	ldmia sp!, {r3, pc}
	arm_func_end sub_020D5280

	arm_func_start sub_020D52A0
sub_020D52A0: ; 0x020D52A0
	stmdb sp!, {r3, lr}
	mov lr, r1
	mov r3, r2
	mov ip, #0
	mov r1, r0
	mov r2, lr
	mov r0, #0x14
	str ip, [sp]
	bl sub_020D548C
	ldmia sp!, {r3, pc}
	arm_func_end sub_020D52A0

	arm_func_start sub_020D52C8
sub_020D52C8: ; 0x020D52C8
	stmdb sp!, {r3, lr}
	mov r2, r1
	mov r3, #0
	mov r1, r0
	mov r0, #0x15
	str r3, [sp]
	bl sub_020D548C
	ldmia sp!, {r3, pc}
	arm_func_end sub_020D52C8

	arm_func_start sub_020D52E8
sub_020D52E8: ; 0x020D52E8
	stmdb sp!, {r3, r4, r5, lr}
	ldr ip, [sp, #0x1c]
	mov r1, r1, lsl #0x18
	orr r4, r1, r3, lsl #26
	ldr r5, [sp, #0x24]
	mov r1, ip, lsl #0x16
	ldr r3, [sp, #0x18]
	ldr ip, [sp, #0x10]
	orr r4, r4, r5, lsl #16
	orr r4, ip, r4
	ldr lr, [sp, #0x20]
	orr r3, r1, r3, lsl #24
	ldr ip, [sp, #0x14]
	orr r1, r0, lr, lsl #16
	orr r3, ip, r3
	mov r0, #0xe
	str r4, [sp]
	bl sub_020D548C
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020D52E8

	arm_func_start sub_020D5334
sub_020D5334: ; 0x020D5334
	stmdb sp!, {r3, lr}
	mov r2, r1
	mov r3, #0
	mov r1, r0
	mov r0, #0x1e
	str r3, [sp]
	bl sub_020D548C
	ldmia sp!, {r3, pc}
	arm_func_end sub_020D5334

	arm_func_start sub_020D5354
sub_020D5354: ; 0x020D5354
	stmdb sp!, {r3, lr}
	mov r2, r1
	mov r3, #0
	mov r1, r0
	mov r0, #0x1f
	str r3, [sp]
	bl sub_020D548C
	ldmia sp!, {r3, pc}
	arm_func_end sub_020D5354

	arm_func_start sub_020D5374
sub_020D5374: ; 0x020D5374
	stmdb sp!, {r3, lr}
	mov r2, r1
	mov r3, #0
	mov r1, r0
	mov r0, #0x20
	str r3, [sp]
	bl sub_020D548C
	ldmia sp!, {r3, pc}
	arm_func_end sub_020D5374

	arm_func_start sub_020D5394
sub_020D5394: ; 0x020D5394
	stmdb sp!, {r3, lr}
	mov r2, #0
	mov r1, r0
	mov r3, r2
	mov r0, #0x17
	str r2, [sp]
	bl sub_020D548C
	ldmia sp!, {r3, pc}
	arm_func_end sub_020D5394

	arm_func_start sub_020D53B4
sub_020D53B4: ; 0x020D53B4
	stmdb sp!, {r3, lr}
	mov lr, r1
	mov ip, r2
	str r3, [sp]
	mov r1, r0
	mov r2, lr
	mov r3, ip
	mov r0, #0x19
	bl sub_020D548C
	ldmia sp!, {r3, pc}
	arm_func_end sub_020D53B4

	arm_func_start sub_020D53DC
sub_020D53DC: ; 0x020D53DC
	stmdb sp!, {r3, lr}
	mov r2, #0
	mov r1, r0
	mov r3, r2
	mov r0, #0x18
	str r2, [sp]
	bl sub_020D548C
	ldmia sp!, {r3, pc}
	arm_func_end sub_020D53DC

	arm_func_start sub_020D53FC
sub_020D53FC: ; 0x020D53FC
	stmdb sp!, {r3, lr}
	mov r2, #0
	mov r0, #0x18
	mov r3, r2
	sub r1, r0, #0x19
	str r2, [sp]
	bl sub_020D548C
	ldmia sp!, {r3, pc}
	arm_func_end sub_020D53FC

	arm_func_start sub_020D541C
sub_020D541C: ; 0x020D541C
	stmdb sp!, {r3, lr}
	mov r2, #0
	mov r1, r0
	mov r3, r2
	mov r0, #0x21
	str r2, [sp]
	bl sub_020D548C
	ldmia sp!, {r3, pc}
	arm_func_end sub_020D541C

	arm_func_start sub_020D543C
sub_020D543C: ; 0x020D543C
	stmdb sp!, {r3, lr}
	mov lr, r1
	mov ip, r2
	str r3, [sp]
	mov r1, r0
	mov r2, lr
	mov r3, ip
	mov r0, #6
	bl sub_020D548C
	ldmia sp!, {r3, pc}
	arm_func_end sub_020D543C

	arm_func_start sub_020D5464
sub_020D5464: ; 0x020D5464
	stmdb sp!, {r3, lr}
	ldr ip, [sp, #8]
	mov lr, r2
	str r3, [sp]
	mov r2, r1
	orr r1, r0, ip, lsl #24
	mov r3, lr
	mov r0, #7
	bl sub_020D548C
	ldmia sp!, {r3, pc}
	arm_func_end sub_020D5464

	arm_func_start sub_020D548C
sub_020D548C: ; 0x020D548C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r0, #1
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl sub_020D5714
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	str r7, [r0, #4]
	str r6, [r0, #8]
	str r5, [r0, #0xc]
	ldr r1, [sp, #0x18]
	str r4, [r0, #0x10]
	str r1, [r0, #0x14]
	bl sub_020D579C
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020D548C

	arm_func_start sub_020D54D0
sub_020D54D0: ; 0x020D54D0
	stmdb sp!, {r3, lr}
	ldr r1, _020D5500 ; =0x021E1A40
	ldr r0, [r1]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _020D5504 ; =0x021E1A44
	mov r2, #1
	str r2, [r1]
	bl OS_InitMutex
	bl sub_020D5530
	bl sub_020D5C40
	ldmia sp!, {r3, pc}
	.align 2, 0
_020D5500: .word 0x021E1A40
_020D5504: .word 0x021E1A44
	arm_func_end sub_020D54D0

	arm_func_start sub_020D5508
sub_020D5508: ; 0x020D5508
	ldr ip, _020D5514 ; =OS_LockMutex
	ldr r0, _020D5518 ; =0x021E1A44
	bx ip
	.align 2, 0
_020D5514: .word OS_LockMutex
_020D5518: .word 0x021E1A44
	arm_func_end sub_020D5508

	arm_func_start sub_020D551C
sub_020D551C: ; 0x020D551C
	ldr ip, _020D5528 ; =OS_UnlockMutex
	ldr r0, _020D552C ; =0x021E1A44
	bx ip
	.align 2, 0
_020D5528: .word OS_UnlockMutex
_020D552C: .word 0x021E1A44
	arm_func_end sub_020D551C

	arm_func_start sub_020D5530
sub_020D5530: ; 0x020D5530
	stmdb sp!, {r4, lr}
	bl sub_020D5B30
	ldr lr, _020D55EC ; =0x021E1D40
	ldr r0, _020D55F0 ; =0x021E1A60
	mov r4, #0
	str lr, [r0]
	mov r0, #0x18
	mov r1, r0
	b _020D5568
_020D5554:
	add r3, r4, #1
	mul r2, r4, r1
	mla ip, r3, r0, lr
	mov r4, r3
	str ip, [lr, r2]
_020D5568:
	cmp r4, #0xff
	blt _020D5554
	ldr r0, _020D55F4 ; =0x021E2A60
	mov r3, #0
	str r3, [r0, #0xac8]
	ldr r1, _020D55F8 ; =0x021E3528
	ldr r2, _020D55F0 ; =0x021E1A60
	mov r0, #1
	str r1, [r2, #0x10]
	str r3, [r2, #8]
	str r3, [r2, #0xc]
	str r3, [r2, #0x1c]
	str r3, [r2, #0x14]
	str r3, [r2, #0x18]
	str r0, [r2, #0x20]
	ldr r0, _020D55FC ; =0x021E1AC0
	ldr r1, _020D5600 ; =0x021E35A0
	str r3, [r2, #4]
	str r0, [r1]
	bl sub_020D6068
	mov r0, #1
	bl sub_020D5714
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	mov r2, #0x1d
	ldr r1, _020D5600 ; =0x021E35A0
	str r2, [r0, #4]
	ldr r1, [r1]
	str r1, [r0, #8]
	bl sub_020D579C
	mov r0, #1
	bl sub_020D57D4
	ldmia sp!, {r4, pc}
	.align 2, 0
_020D55EC: .word 0x021E1D40
_020D55F0: .word 0x021E1A60
_020D55F4: .word 0x021E2A60
_020D55F8: .word 0x021E3528
_020D55FC: .word 0x021E1AC0
_020D5600: .word 0x021E35A0
	arm_func_end sub_020D5530

	arm_func_start sub_020D5604
sub_020D5604: ; 0x020D5604
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	bl OS_DisableInterrupts
	mov r4, r0
	tst r5, #1
	beq _020D5660
	bl sub_020D6040
	ldr r5, _020D570C ; =0x021E1A60
	ldr r1, [r5, #4]
	cmp r1, r0
	bne _020D5684
	mov r6, #0x64
_020D5634:
	mov r0, r4
	bl OS_RestoreInterrupts
	mov r0, r6
	bl OS_SpinWait
	bl OS_DisableInterrupts
	mov r4, r0
	bl sub_020D6040
	ldr r1, [r5, #4]
	cmp r1, r0
	beq _020D5634
	b _020D5684
_020D5660:
	bl sub_020D6040
	ldr r1, _020D570C ; =0x021E1A60
	ldr r1, [r1, #4]
	cmp r1, r0
	bne _020D5684
	mov r0, r4
	bl OS_RestoreInterrupts
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
_020D5684:
	ldr r0, _020D570C ; =0x021E1A60
	ldr r2, _020D5710 ; =0x021E1A84
	ldr r3, [r0, #0x14]
	add r1, r3, #1
	ldr r5, [r2, r3, lsl #2]
	str r1, [r0, #0x14]
	cmp r1, #8
	movgt r1, #0
	strgt r1, [r0, #0x14]
	ldr r0, [r5]
	mov r2, r5
	cmp r0, #0
	beq _020D56C8
_020D56B8:
	ldr r2, [r2]
	ldr r0, [r2]
	cmp r0, #0
	bne _020D56B8
_020D56C8:
	ldr r0, _020D570C ; =0x021E1A60
	ldr r1, [r0, #0x10]
	cmp r1, #0
	strne r5, [r1]
	streq r5, [r0]
	ldr r1, _020D570C ; =0x021E1A60
	mov r0, r4
	str r2, [r1, #0x10]
	ldr r2, [r1, #0x1c]
	sub r2, r2, #1
	str r2, [r1, #0x1c]
	ldr r2, [r1, #4]
	add r2, r2, #1
	str r2, [r1, #4]
	bl OS_RestoreInterrupts
	mov r0, r5
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020D570C: .word 0x021E1A60
_020D5710: .word 0x021E1A84
	arm_func_end sub_020D5604

	arm_func_start sub_020D5714
sub_020D5714: ; 0x020D5714
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_020D5C00
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	bl sub_020D5BB8
	cmp r0, #0
	ldmneia sp!, {r4, pc}
	tst r4, #1
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	bl sub_020D5AF0
	cmp r0, #0
	ble _020D5774
	mov r4, #0
_020D5754:
	mov r0, r4
	bl sub_020D5604
	cmp r0, #0
	bne _020D5754
	bl sub_020D5BB8
	cmp r0, #0
	beq _020D577C
	ldmia sp!, {r4, pc}
_020D5774:
	mov r0, #1
	bl sub_020D57D4
_020D577C:
	bl sub_020D5B90
	mov r4, #1
_020D5784:
	mov r0, r4
	bl sub_020D5604
	bl sub_020D5BB8
	cmp r0, #0
	beq _020D5784
	ldmia sp!, {r4, pc}
	arm_func_end sub_020D5714

	arm_func_start sub_020D579C
sub_020D579C: ; 0x020D579C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl OS_DisableInterrupts
	ldr r1, _020D57D0 ; =0x021E1A60
	ldr r2, [r1, #0xc]
	cmp r2, #0
	streq r4, [r1, #8]
	strne r4, [r2]
	str r4, [r1, #0xc]
	mov r1, #0
	str r1, [r4]
	bl OS_RestoreInterrupts
	ldmia sp!, {r4, pc}
	.align 2, 0
_020D57D0: .word 0x021E1A60
	arm_func_end sub_020D579C

	arm_func_start sub_020D57D4
sub_020D57D4: ; 0x020D57D4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	bl OS_DisableInterrupts
	ldr r4, _020D5984 ; =0x021E1A60
	mov sb, r0
	ldr r1, [r4, #8]
	cmp r1, #0
	bne _020D5800
	bl OS_RestoreInterrupts
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020D5800:
	ldr r1, [r4, #0x1c]
	cmp r1, #8
	blt _020D5858
	tst sl, #1
	bne _020D5820
	bl OS_RestoreInterrupts
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020D5820:
	mov r5, #1
_020D5824:
	mov r0, r5
	bl sub_020D5604
	ldr r0, [r4, #0x1c]
	cmp r0, #8
	bge _020D5824
	ldr r0, _020D5984 ; =0x021E1A60
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _020D5858
	mov r0, sb
	bl OS_RestoreInterrupts
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020D5858:
	ldr r0, _020D5988 ; =0x021E1D40
	mov r1, #0x1800
	bl DC_FlushRange
	ldr r1, _020D5984 ; =0x021E1A60
	mov r0, #7
	ldr r1, [r1, #8]
	mov r2, #0
	bl PXI_SendWordByFifo
	cmp r0, #0
	bge _020D5918
	tst sl, #1
	bne _020D5898
	mov r0, sb
	bl OS_RestoreInterrupts
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020D5898:
	mov fp, #0
	mov r5, #7
	mov r8, fp
	ldr r7, _020D5988 ; =0x021E1D40
	mov r6, #0x1800
	ldr r4, _020D5984 ; =0x021E1A60
	b _020D58F4
_020D58B4:
	mov r0, sb
	bl OS_RestoreInterrupts
	mov r0, r8
	bl sub_020D5604
	bl OS_DisableInterrupts
	mov sb, r0
	mov r0, r7
	mov r1, r6
	bl DC_FlushRange
	ldr r0, [r4, #8]
	cmp r0, #0
	bne _020D58F4
	mov r0, sb
	bl OS_RestoreInterrupts
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020D58F4:
	ldr r0, [r4, #0x1c]
	cmp r0, #8
	bge _020D58B4
	ldr r1, [r4, #8]
	mov r0, r5
	mov r2, fp
	bl PXI_SendWordByFifo
	cmp r0, #0
	blt _020D58B4
_020D5918:
	ldr r0, _020D5984 ; =0x021E1A60
	ldr r2, _020D598C ; =0x021E1A84
	ldr r3, [r0, #0x18]
	ldr r4, [r0, #8]
	add r1, r3, #1
	str r4, [r2, r3, lsl #2]
	str r1, [r0, #0x18]
	cmp r1, #8
	movgt r1, #0
	strgt r1, [r0, #0x18]
	ldr r1, _020D5984 ; =0x021E1A60
	mov r0, #0
	str r0, [r1, #8]
	str r0, [r1, #0xc]
	ldr r2, [r1, #0x1c]
	mov r0, sb
	add r2, r2, #1
	str r2, [r1, #0x1c]
	ldr r2, [r1, #0x20]
	add r2, r2, #1
	str r2, [r1, #0x20]
	bl OS_RestoreInterrupts
	tst sl, #2
	beq _020D597C
	bl sub_020D5B90
_020D597C:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020D5984: .word 0x021E1A60
_020D5988: .word 0x021E1D40
_020D598C: .word 0x021E1A84
	arm_func_end sub_020D57D4

	arm_func_start sub_020D5990
sub_020D5990: ; 0x020D5990
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl sub_020D5A28
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r4, #0
_020D59A8:
	mov r0, r4
	bl sub_020D5604
	cmp r0, #0
	bne _020D59A8
	mov r0, r5
	bl sub_020D5A28
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	bl sub_020D5B90
	mov r0, r5
	bl sub_020D5A28
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r4, #1
_020D59E0:
	mov r0, r4
	bl sub_020D5604
	mov r0, r5
	bl sub_020D5A28
	cmp r0, #0
	beq _020D59E0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020D5990

	arm_func_start sub_020D59FC
sub_020D59FC: ; 0x020D59FC
	stmdb sp!, {r4, lr}
	bl OS_DisableInterrupts
	ldr r1, _020D5A24 ; =0x021E1A60
	ldr r2, [r1, #8]
	cmp r2, #0
	ldreq r4, [r1, #4]
	ldrne r4, [r1, #0x20]
	bl OS_RestoreInterrupts
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_020D5A24: .word 0x021E1A60
	arm_func_end sub_020D59FC

	arm_func_start sub_020D5A28
sub_020D5A28: ; 0x020D5A28
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl OS_DisableInterrupts
	ldr r1, _020D5A74 ; =0x021E1A60
	ldr r1, [r1, #4]
	cmp r4, r1
	bls _020D5A58
	sub r1, r4, r1
	cmp r1, #0x80000000
	movlo r4, #0
	movhs r4, #1
	b _020D5A68
_020D5A58:
	sub r1, r1, r4
	cmp r1, #0x80000000
	movlo r4, #1
	movhs r4, #0
_020D5A68:
	bl OS_RestoreInterrupts
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_020D5A74: .word 0x021E1A60
	arm_func_end sub_020D5A28

	arm_func_start sub_020D5A78
sub_020D5A78: ; 0x020D5A78
	stmdb sp!, {r4, lr}
	bl OS_DisableInterrupts
	ldr r1, _020D5AB0 ; =0x021E1A60
	mov r4, #0
	ldr r1, [r1]
	cmp r1, #0
	beq _020D5AA4
_020D5A94:
	ldr r1, [r1]
	add r4, r4, #1
	cmp r1, #0
	bne _020D5A94
_020D5AA4:
	bl OS_RestoreInterrupts
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_020D5AB0: .word 0x021E1A60
	arm_func_end sub_020D5A78

	arm_func_start sub_020D5AB4
sub_020D5AB4: ; 0x020D5AB4
	stmdb sp!, {r4, lr}
	bl OS_DisableInterrupts
	ldr r1, _020D5AEC ; =0x021E1A60
	mov r4, #0
	ldr r1, [r1, #8]
	cmp r1, #0
	beq _020D5AE0
_020D5AD0:
	ldr r1, [r1]
	add r4, r4, #1
	cmp r1, #0
	bne _020D5AD0
_020D5AE0:
	bl OS_RestoreInterrupts
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_020D5AEC: .word 0x021E1A60
	arm_func_end sub_020D5AB4

	arm_func_start sub_020D5AF0
sub_020D5AF0: ; 0x020D5AF0
	stmdb sp!, {r4, lr}
	bl sub_020D5A78
	mov r4, r0
	bl sub_020D5AB4
	rsb r1, r4, #0x100
	sub r0, r1, r0
	ldmia sp!, {r4, pc}
	arm_func_end sub_020D5AF0

	arm_func_start sub_020D5B0C
sub_020D5B0C: ; 0x020D5B0C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	bl OS_DisableInterrupts
	mov r4, r0
	mov r0, r5
	bl sub_020D5CC0
	mov r0, r4
	bl OS_RestoreInterrupts
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020D5B0C

	arm_func_start sub_020D5B30
sub_020D5B30: ; 0x020D5B30
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _020D5B8C ; =sub_020D5B0C
	mov r0, #7
	bl PXI_SetFifoRecvCallback
	bl sub_020D5C00
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, #7
	mov r1, #1
	bl PXI_IsCallbackReady
	cmp r0, #0
	ldmneia sp!, {r4, r5, r6, pc}
	mov r6, #0x64
	mov r5, #7
	mov r4, #1
_020D5B6C:
	mov r0, r6
	bl OS_SpinWait
	mov r0, r5
	mov r1, r4
	bl PXI_IsCallbackReady
	cmp r0, #0
	beq _020D5B6C
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020D5B8C: .word sub_020D5B0C
	arm_func_end sub_020D5B30

	arm_func_start sub_020D5B90
sub_020D5B90: ; 0x020D5B90
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, #7
	mov r4, #0
_020D5B9C:
	mov r0, r5
	mov r1, r4
	mov r2, r4
	bl PXI_SendWordByFifo
	cmp r0, #0
	blt _020D5B9C
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020D5B90

	arm_func_start sub_020D5BB8
sub_020D5BB8: ; 0x020D5BB8
	stmdb sp!, {r4, lr}
	bl OS_DisableInterrupts
	ldr r1, _020D5BFC ; =0x021E1A60
	ldr r4, [r1]
	cmp r4, #0
	bne _020D5BDC
	bl OS_RestoreInterrupts
	mov r0, #0
	ldmia sp!, {r4, pc}
_020D5BDC:
	ldr r2, [r4]
	str r2, [r1]
	cmp r2, #0
	moveq r2, #0
	streq r2, [r1, #0x10]
	bl OS_RestoreInterrupts
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_020D5BFC: .word 0x021E1A60
	arm_func_end sub_020D5BB8

	arm_func_start sub_020D5C00
sub_020D5C00: ; 0x020D5C00
	stmdb sp!, {r4, lr}
	bl OS_IsRunOnEmulator
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
	bl OS_DisableInterrupts
	ldr r1, _020D5C3C ; =0x04FFF200
	mov r2, #0x10
	str r2, [r1]
	ldr r4, [r1]
	bl OS_RestoreInterrupts
	cmp r4, #0
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_020D5C3C: .word 0x04FFF200
	arm_func_end sub_020D5C00

	arm_func_start sub_020D5C40
sub_020D5C40: ; 0x020D5C40
	mov r1, #0
	ldr r2, _020D5C6C ; =0x021E3540
	mov r0, r1
_020D5C4C:
	str r0, [r2]
	str r0, [r2, #4]
	add r1, r1, #1
	strb r0, [r2, #8]
	cmp r1, #8
	add r2, r2, #0xc
	blt _020D5C4C
	bx lr
	.align 2, 0
_020D5C6C: .word 0x021E3540
	arm_func_end sub_020D5C40

	arm_func_start sub_020D5C70
sub_020D5C70: ; 0x020D5C70
	ldr r2, _020D5C8C ; =0x021E3540
	mov r1, #0xc
	mla r1, r0, r1, r2
	ldrb r0, [r1, #8]
	add r0, r0, #1
	strb r0, [r1, #8]
	bx lr
	.align 2, 0
_020D5C8C: .word 0x021E3540
	arm_func_end sub_020D5C70

	arm_func_start sub_020D5C90
sub_020D5C90: ; 0x020D5C90
	mov r3, #0xc
	mul r3, r0, r3
	ldr r0, _020D5CBC ; =0x021E3540
	str r1, [r0, r3]
	add r1, r0, r3
	str r2, [r1, #4]
	ldrb r0, [r1, #8]
	add r0, r0, #1
	strb r0, [r1, #8]
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_020D5CBC: .word 0x021E3540
	arm_func_end sub_020D5C90

	arm_func_start sub_020D5CC0
sub_020D5CC0: ; 0x020D5CC0
	stmdb sp!, {r3, lr}
	ldr r3, _020D5D00 ; =0x021E3540
	and r2, r0, #0xff
	mov r1, #0xc
	mla r3, r2, r1, r3
	mov r1, r0, asr #8
	ldrb r0, [r3, #8]
	and r1, r1, #0xff
	cmp r1, r0
	ldmneia sp!, {r3, pc}
	ldr r1, [r3]
	cmp r1, #0
	ldmeqia sp!, {r3, pc}
	ldr r0, [r3, #4]
	blx r1
	ldmia sp!, {r3, pc}
	.align 2, 0
_020D5D00: .word 0x021E3540
	arm_func_end sub_020D5CC0

	arm_func_start sub_020D5D04
sub_020D5D04: ; 0x020D5D04
	stmdb sp!, {r3, lr}
	ldr r0, _020D5D2C ; =0x021E35A0
	mov r1, #4
	ldr r0, [r0]
	add r0, r0, #4
	bl DC_InvalidateRange
	ldr r0, _020D5D2C ; =0x021E35A0
	ldr r0, [r0]
	ldr r0, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020D5D2C: .word 0x021E35A0
	arm_func_end sub_020D5D04

	arm_func_start sub_020D5D30
sub_020D5D30: ; 0x020D5D30
	stmdb sp!, {r3, lr}
	ldr r0, _020D5D58 ; =0x021E35A0
	mov r1, #2
	ldr r0, [r0]
	add r0, r0, #8
	bl DC_InvalidateRange
	ldr r0, _020D5D58 ; =0x021E35A0
	ldr r0, [r0]
	ldrh r0, [r0, #8]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020D5D58: .word 0x021E35A0
	arm_func_end sub_020D5D30

	arm_func_start sub_020D5D5C
sub_020D5D5C: ; 0x020D5D5C
	stmdb sp!, {r3, r4, r5, lr}
	mov r2, #0x24
	mul r4, r0, r2
	ldr r0, _020D5DA0 ; =0x021E35A0
	mov r5, r1
	ldr r0, [r0]
	mov r1, #2
	add r0, r0, #0x20
	add r0, r0, r4
	add r0, r0, r5, lsl #1
	bl DC_InvalidateRange
	ldr r0, _020D5DA0 ; =0x021E35A0
	ldr r0, [r0]
	add r0, r0, r4
	add r0, r0, r5, lsl #1
	ldrsh r0, [r0, #0x20]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020D5DA0: .word 0x021E35A0
	arm_func_end sub_020D5D5C

	arm_func_start sub_020D5DA4
sub_020D5DA4: ; 0x020D5DA4
	stmdb sp!, {r3, lr}
	cmp r1, #0
	blt _020D5DB8
	cmp r1, #0xf
	ble _020D5DC0
_020D5DB8:
	mov r0, #0
	ldmia sp!, {r3, pc}
_020D5DC0:
	add r3, r0, #0x1000
	ldr r3, [r3, #0x1c4]
	mov lr, #1
	ldr ip, [r2]
	tst r3, lr, lsl r1
	moveq lr, #0
	mov r3, lr, lsl #0x1f
	bic ip, ip, #2
	orr ip, ip, r3, lsr #30
	mov r3, ip, lsl #0x1e
	str ip, [r2]
	movs r3, r3, asr #0x1f
	beq _020D5E94
	add r0, r0, r1, lsl #2
	add r0, r0, #0x1000
	ldr r0, [r0, #0x180]
	ldr r3, [r2]
	tst r0, #0x80000000
	movne lr, #1
	moveq lr, #0
	bic ip, r3, #1
	and r3, lr, #1
	orr r3, ip, r3
	str r3, [r2]
	and r1, r0, #0x7f
	strh r1, [r2, #4]
	ldrh r1, [r2, #4]
	and r3, r0, #0x300
	mov r3, r3, lsr #8
	mov r1, r1, lsl #4
	strh r1, [r2, #4]
	cmp r3, #3
	addls pc, pc, r3, lsl #2
	b _020D5E84
_020D5E48: ; jump table
	b _020D5E84 ; case 0
	b _020D5E58 ; case 1
	b _020D5E68 ; case 2
	b _020D5E78 ; case 3
_020D5E58:
	ldrh r1, [r2, #4]
	mov r1, r1, asr #1
	strh r1, [r2, #4]
	b _020D5E84
_020D5E68:
	ldrh r1, [r2, #4]
	mov r1, r1, asr #2
	strh r1, [r2, #4]
	b _020D5E84
_020D5E78:
	ldrh r1, [r2, #4]
	mov r1, r1, asr #4
	strh r1, [r2, #4]
_020D5E84:
	and r0, r0, #0x7f0000
	mov r0, r0, lsr #0x10
	strb r0, [r2, #6]
	b _020D5F2C
_020D5E94:
	mov r3, #0x54
	mla r0, r1, r3, r0
	ldrb r1, [r0, #3]
	bic r3, ip, #1
	mov r1, r1, lsl #0x1f
	mov r1, r1, lsr #0x1f
	and r1, r1, #1
	orr r1, r3, r1
	str r1, [r2]
	ldrb r1, [r0, #2]
	str r1, [r2, #8]
	ldrh r3, [r0, #0x24]
	and r1, r3, #0xff
	strh r1, [r2, #4]
	ldrh r1, [r2, #4]
	mov r3, r3, asr #8
	cmp r3, #3
	mov r1, r1, lsl #4
	strh r1, [r2, #4]
	addls pc, pc, r3, lsl #2
	b _020D5F24
_020D5EE8: ; jump table
	b _020D5F24 ; case 0
	b _020D5EF8 ; case 1
	b _020D5F08 ; case 2
	b _020D5F18 ; case 3
_020D5EF8:
	ldrh r1, [r2, #4]
	mov r1, r1, asr #1
	strh r1, [r2, #4]
	b _020D5F24
_020D5F08:
	ldrh r1, [r2, #4]
	mov r1, r1, asr #2
	strh r1, [r2, #4]
	b _020D5F24
_020D5F18:
	ldrh r1, [r2, #4]
	mov r1, r1, asr #4
	strh r1, [r2, #4]
_020D5F24:
	ldrb r0, [r0, #0x23]
	strb r0, [r2, #6]
_020D5F2C:
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end sub_020D5DA4

	arm_func_start sub_020D5F34
sub_020D5F34: ; 0x020D5F34
	stmdb sp!, {r4, lr}
	cmp r1, #0
	blt _020D5F48
	cmp r1, #0xf
	ble _020D5F50
_020D5F48:
	mov r0, #0
	ldmia sp!, {r4, pc}
_020D5F50:
	cmp r2, #0
	blt _020D5F60
	cmp r2, #0xf
	ble _020D5F68
_020D5F60:
	mov r0, #0
	ldmia sp!, {r4, pc}
_020D5F68:
	mov ip, #0x24
	mla ip, r1, ip, r0
	add r1, ip, r2
	ldrb r2, [r1, #0x548]
	cmp r2, #0xff
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	add r1, r0, #0x780
	add ip, r1, r2, lsl #6
	ldrh r2, [ip, #2]
	add r1, r0, #0x1000
	strh r2, [r3]
	ldrb r2, [ip, #4]
	strb r2, [r3, #2]
	ldrb r2, [ip, #5]
	strb r2, [r3, #3]
	ldrsb r2, [ip, #6]
	strb r2, [r3, #4]
	ldrb r2, [ip, #7]
	strb r2, [r3, #5]
	ldrsb r2, [ip, #8]
	add r2, r2, #0x40
	strb r2, [r3, #6]
	ldrsb r2, [ip, #0x13]
	strb r2, [r3, #7]
	ldr r2, [ip, #0x3c]
	ldr r1, [r1, #0x1c0]
	cmp r2, #0
	moveq r4, #0
	subne r1, r2, r1
	addne r4, r0, r1
	mov r1, #0
	strb r1, [r3, #9]
	cmp r4, #0
	beq _020D6038
	add r1, r0, #0x1000
	mov ip, #0
_020D5FFC:
	ldrb r2, [r3, #9]
	ldrb lr, [r4]
	add r2, r3, r2
	strb lr, [r2, #0xa]
	ldrb r2, [r3, #9]
	add r2, r2, #1
	strb r2, [r3, #9]
	ldr r2, [r4, #0x50]
	ldr lr, [r1, #0x1c0]
	cmp r2, #0
	moveq r4, ip
	subne r2, r2, lr
	addne r4, r0, r2
	cmp r4, #0
	bne _020D5FFC
_020D6038:
	mov r0, #1
	ldmia sp!, {r4, pc}
	arm_func_end sub_020D5F34

	arm_func_start sub_020D6040
sub_020D6040: ; 0x020D6040
	stmdb sp!, {r3, lr}
	ldr r0, _020D6064 ; =0x021E35A0
	mov r1, #4
	ldr r0, [r0]
	bl DC_InvalidateRange
	ldr r0, _020D6064 ; =0x021E35A0
	ldr r0, [r0]
	ldr r0, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020D6064: .word 0x021E35A0
	arm_func_end sub_020D6040

	arm_func_start sub_020D6068
sub_020D6068: ; 0x020D6068
	stmdb sp!, {r4, lr}
	mov ip, #0
	str ip, [r0, #4]
	strh ip, [r0, #8]
	strh ip, [r0, #0xa]
	mov r4, r0
	str ip, [r0]
	mvn r2, #0
	mov r3, ip
_020D608C:
	mov lr, r3
	str r3, [r4, #0x40]
_020D6094:
	add r1, r4, lr, lsl #1
	add lr, lr, #1
	strh r2, [r1, #0x20]
	cmp lr, #0x10
	blt _020D6094
	add ip, ip, #1
	cmp ip, #0x10
	add r4, r4, #0x24
	blt _020D608C
	mov r3, #0
	mvn r2, #0
_020D60C0:
	add r1, r0, r3, lsl #1
	add r1, r1, #0x200
	add r3, r3, #1
	strh r2, [r1, #0x60]
	cmp r3, #0x10
	blt _020D60C0
	mov r1, #0x280
	bl DC_FlushRange
	ldmia sp!, {r4, pc}
	arm_func_end sub_020D6068

	arm_func_start sub_020D60E4
sub_020D60E4: ; 0x020D60E4
	ldr r1, _020D614C ; =0xFFFFFD2D
	cmp r0, r1
	movlt r0, r1
	blt _020D60FC
	cmp r0, #0
	movgt r0, #0
_020D60FC:
	add r1, r0, #0xd3
	mvn r2, #0xef
	cmp r0, r2
	ldr r3, _020D6150 ; =0x0210DE50
	add r1, r1, #0x200
	ldrb r3, [r3, r1]
	movlt r0, #3
	blt _020D613C
	add r1, r2, #0x78
	cmp r0, r1
	movlt r0, #2
	blt _020D613C
	add r1, r2, #0xb4
	cmp r0, r1
	movlt r0, #1
	movge r0, #0
_020D613C:
	orr r0, r3, r0, lsl #8
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bx lr
	.align 2, 0
_020D614C: .word 0xFFFFFD2D
_020D6150: .word 0x0210DE50
	arm_func_end sub_020D60E4

	arm_func_start sub_020D6154
sub_020D6154: ; 0x020D6154
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl sub_020D5508
	add r3, r6, r5, lsl #3
	ldr r2, [r3, #0x18]
	cmp r2, #0
	beq _020D61E4
	cmp r4, r2
	bne _020D6188
	bl sub_020D551C
	ldmia sp!, {r4, r5, r6, pc}
_020D6188:
	add r1, r6, #0x18
	ldr r0, [r2, #0x18]
	add ip, r1, r5, lsl #3
	cmp ip, r0
	bne _020D61B4
	ldr r0, [r3, #0x1c]
	mov r1, #0x3c
	str r0, [r2, #0x18]
	ldr r0, [r3, #0x18]
	bl DC_StoreRange
	b _020D61E4
_020D61B4:
	cmp r0, #0
	beq _020D61D0
_020D61BC:
	ldr r1, [r0, #4]
	cmp ip, r1
	movne r0, r1
	cmpne r1, #0
	bne _020D61BC
_020D61D0:
	add r1, r6, r5, lsl #3
	ldr r2, [r1, #0x1c]
	mov r1, #8
	str r2, [r0, #4]
	bl DC_StoreRange
_020D61E4:
	add r0, r6, #0x18
	ldr r1, [r4, #0x18]
	add r0, r0, r5, lsl #3
	str r0, [r4, #0x18]
	add r0, r6, r5, lsl #3
	str r1, [r0, #0x1c]
	str r4, [r0, #0x18]
	bl sub_020D551C
	mov r0, r6
	mov r1, #0x3c
	bl DC_StoreRange
	mov r0, r4
	mov r1, #0x3c
	bl DC_StoreRange
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020D6154

	arm_func_start sub_020D6220
sub_020D6220: ; 0x020D6220
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r7, r0
	bl sub_020D5508
	add r5, r7, #0x18
	mov r6, #0
	mov r8, #8
	mov r4, #0x3c
_020D623C:
	add r1, r7, r6, lsl #3
	ldr r0, [r1, #0x18]
	cmp r0, #0
	beq _020D62A0
	ldr r3, [r0, #0x18]
	cmp r5, r3
	bne _020D626C
	ldr r2, [r1, #0x1c]
	mov r1, r4
	str r2, [r0, #0x18]
	bl DC_StoreRange
	b _020D62A0
_020D626C:
	cmp r3, #0
	beq _020D6288
_020D6274:
	ldr r0, [r3, #4]
	cmp r5, r0
	movne r3, r0
	cmpne r0, #0
	bne _020D6274
_020D6288:
	add r0, r7, r6, lsl #3
	ldr r2, [r0, #0x1c]
	mov r0, r3
	mov r1, r8
	str r2, [r3, #4]
	bl DC_StoreRange
_020D62A0:
	add r6, r6, #1
	cmp r6, #4
	add r5, r5, #8
	blt _020D623C
	bl sub_020D551C
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_020D6220

	arm_func_start sub_020D62B8
sub_020D62B8: ; 0x020D62B8
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	bl sub_020D5508
	ldr r0, [r4, #0x18]
	cmp r0, #0
	beq _020D62F8
	mov r5, #0
	mov r4, #8
_020D62D8:
	ldr r6, [r0, #4]
	mov r1, r4
	str r5, [r0]
	str r5, [r0, #4]
	bl DC_StoreRange
	mov r0, r6
	cmp r6, #0
	bne _020D62D8
_020D62F8:
	bl sub_020D551C
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020D62B8

	arm_func_start sub_020D6300
sub_020D6300: ; 0x020D6300
	sub sp, sp, #8
	mov r1, #0
	str r1, [r0]
	str r1, [sp]
	str r1, [sp, #4]
	str r1, [r0, #4]
	add sp, sp, #8
	bx lr
	arm_func_end sub_020D6300

	arm_func_start sub_020D6320
sub_020D6320: ; 0x020D6320
	stmdb sp!, {r3, r4, r5, lr}
	ldr r4, [r2]
	ldr r3, [r0, #0x38]
	cmp r4, r3
	bhs _020D64C8
	mov ip, #0
_020D6338:
	add r3, r0, r4, lsl #2
	ldr r4, [r3, #0x3c]
	and r3, r4, #0xff
	strb r4, [r1]
	cmp r3, #0x10
	mov r4, r4, lsr #8
	bgt _020D6380
	cmp r3, #0x10
	bge _020D63CC
	cmp r3, #5
	addls pc, pc, r3, lsl #2
	b _020D64AC
_020D6368: ; jump table
	b _020D64AC ; case 0
	b _020D638C ; case 1
	b _020D638C ; case 2
	b _020D638C ; case 3
	b _020D638C ; case 4
	b _020D638C ; case 5
_020D6380:
	cmp r3, #0x11
	beq _020D6440
	b _020D64AC
_020D638C:
	add r5, r0, r4
	ldrh r4, [r0, r4]
	ldrh r3, [r5, #2]
	mov r0, #1
	strh r4, [r1, #2]
	strh r3, [r1, #4]
	ldrh r4, [r5, #4]
	ldrh r3, [r5, #6]
	strh r4, [r1, #6]
	strh r3, [r1, #8]
	ldrh r3, [r5, #8]
	strh r3, [r1, #0xa]
	ldr r1, [r2]
	add r1, r1, #1
	str r1, [r2]
	ldmia sp!, {r3, r4, r5, pc}
_020D63CC:
	add r5, r0, r4
	b _020D6420
_020D63D4:
	mov r0, #0xc
	mla ip, lr, r0, r5
	ldrh r4, [ip, #2]
	ldrh r3, [ip, #4]
	mov r0, #1
	strh r4, [r1]
	strh r3, [r1, #2]
	ldrh r4, [ip, #6]
	ldrh r3, [ip, #8]
	strh r4, [r1, #4]
	strh r3, [r1, #6]
	ldrh r4, [ip, #0xa]
	ldrh r3, [ip, #0xc]
	strh r4, [r1, #8]
	strh r3, [r1, #0xa]
	ldr r1, [r2, #4]
	add r1, r1, #1
	str r1, [r2, #4]
	ldmia sp!, {r3, r4, r5, pc}
_020D6420:
	ldrb r4, [r5, #1]
	ldrb r3, [r5]
	ldr lr, [r2, #4]
	sub r3, r4, r3
	add r3, r3, #1
	cmp lr, r3
	blo _020D63D4
	b _020D64AC
_020D6440:
	add r4, r0, r4
	b _020D64A0
_020D6448:
	ldrb lr, [r4, r3]
	cmp lr, #0
	beq _020D64AC
	mov r0, #0xc
	mla lr, r3, r0, r4
	ldrh ip, [lr, #8]
	ldrh r3, [lr, #0xa]
	mov r0, #1
	strh ip, [r1]
	strh r3, [r1, #2]
	ldrh ip, [lr, #0xc]
	ldrh r3, [lr, #0xe]
	strh ip, [r1, #4]
	strh r3, [r1, #6]
	ldrh ip, [lr, #0x10]
	ldrh r3, [lr, #0x12]
	strh ip, [r1, #8]
	strh r3, [r1, #0xa]
	ldr r1, [r2, #4]
	add r1, r1, #1
	str r1, [r2, #4]
	ldmia sp!, {r3, r4, r5, pc}
_020D64A0:
	ldr r3, [r2, #4]
	cmp r3, #8
	blo _020D6448
_020D64AC:
	ldr r3, [r2]
	add r3, r3, #1
	stmia r2, {r3, ip}
	ldr r4, [r2]
	ldr r3, [r0, #0x38]
	cmp r4, r3
	blo _020D6338
_020D64C8:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020D6320

	arm_func_start sub_020D64D0
sub_020D64D0: ; 0x020D64D0
	ldr r0, [r0, #0x38]
	bx lr
	arm_func_end sub_020D64D0

	arm_func_start sub_020D64D8
sub_020D64D8: ; 0x020D64D8
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl sub_020D5508
	add r0, r6, #0x3c
	add r2, r6, r5, lsl #2
	add r0, r0, r5, lsl #2
	mov r1, #4
	str r4, [r2, #0x3c]
	bl DC_StoreRange
	bl sub_020D551C
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020D64D8

	arm_func_start sub_020D650C
sub_020D650C: ; 0x020D650C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl sub_020D5508
	add r0, r5, r4, lsl #2
	ldr r4, [r0, #0x3c]
	cmp r4, #0
	beq _020D6538
	cmp r4, #0x2000000
	addlo r4, r5, r4
	b _020D653C
_020D6538:
	mov r4, #0
_020D653C:
	bl sub_020D551C
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020D650C

	arm_func_start PXI_Init
PXI_Init: ; 0x020D6548
	ldr ip, _020D6550 ; =sub_020D6554
	bx ip
	.align 2, 0
_020D6550: .word sub_020D6554
	arm_func_end PXI_Init

	arm_func_start sub_020D6554
sub_020D6554: ; 0x020D6554
	stmdb sp!, {r3, r4, r5, lr}
	bl OS_DisableInterrupts
	ldr r1, _020D6638 ; =0x021E35A4
	mov r4, r0
	ldrh r0, [r1]
	cmp r0, #0
	bne _020D662C
	mov r2, #1
	strh r2, [r1]
	mov r2, #0
	ldr r0, _020D663C ; =0x027FFC00
	mov r1, r2
	str r2, [r0, #0x388]
	ldr r0, _020D6640 ; =0x021E35A8
_020D658C:
	str r1, [r0, r2, lsl #2]
	add r2, r2, #1
	cmp r2, #0x20
	blt _020D658C
	ldr r2, _020D6644 ; =0x0000C408
	ldr r1, _020D6648 ; =0x04000184
	mov r0, #0x40000
	strh r2, [r1]
	bl OS_ResetRequestIrqMask
	ldr r1, _020D664C ; =sub_020D674C
	mov r0, #0x40000
	bl OS_SetIrqFunction
	mov r0, #0x40000
	bl OS_EnableIrqMask
	mov r5, #0
	ldr r3, _020D6650 ; =0x04000180
	mov r1, r5
	mov r2, #0x3e8
_020D65D4:
	ldrh r0, [r3]
	ands lr, r0, #0xf
	mov r0, lr, lsl #8
	strh r0, [r3]
	bne _020D65F0
	cmp r5, #4
	bgt _020D662C
_020D65F0:
	ldrh r0, [r3]
	mov ip, r2
	and r0, r0, #0xf
	cmp r0, lr
	bne _020D6624
_020D6604:
	cmp ip, #0
	movle r5, r1
	ble _020D6624
	ldrh r0, [r3]
	sub ip, ip, #1
	and r0, r0, #0xf
	cmp r0, lr
	beq _020D6604
_020D6624:
	add r5, r5, #1
	b _020D65D4
_020D662C:
	mov r0, r4
	bl OS_RestoreInterrupts
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020D6638: .word 0x021E35A4
_020D663C: .word 0x027FFC00
_020D6640: .word 0x021E35A8
_020D6644: .word 0x0000C408
_020D6648: .word 0x04000184
_020D664C: .word sub_020D674C
_020D6650: .word 0x04000180
	arm_func_end sub_020D6554

	arm_func_start PXI_SetFifoRecvCallback
PXI_SetFifoRecvCallback: ; 0x020D6654
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	mov r5, r1
	bl OS_DisableInterrupts
	ldr r1, _020D6698 ; =0x021E35A8
	ldr r3, _020D669C ; =0x027FFC00
	str r5, [r1, r4, lsl #2]
	cmp r5, #0
	ldrne r2, [r3, #0x388]
	mov r1, #1
	orrne r1, r2, r1, lsl r4
	mvneq r1, r1, lsl r4
	ldreq r2, [r3, #0x388]
	andeq r1, r2, r1
	str r1, [r3, #0x388]
	bl OS_RestoreInterrupts
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020D6698: .word 0x021E35A8
_020D669C: .word 0x027FFC00
	arm_func_end PXI_SetFifoRecvCallback

	arm_func_start PXI_IsCallbackReady
PXI_IsCallbackReady: ; 0x020D66A0
	ldr r2, _020D66C0 ; =0x027FFC00
	mov r3, #1
	add r1, r2, r1, lsl #2
	ldr r1, [r1, #0x388]
	tst r1, r3, lsl r0
	moveq r3, #0
	mov r0, r3
	bx lr
	.align 2, 0
_020D66C0: .word 0x027FFC00
	arm_func_end PXI_IsCallbackReady

	arm_func_start PXI_SendWordByFifo
PXI_SendWordByFifo: ; 0x020D66C4
	stmdb sp!, {r3, lr}
	ldr ip, [sp]
	ldr r3, _020D6748 ; =0x04000184
	bic ip, ip, #0x1f
	and r0, r0, #0x1f
	orr ip, ip, r0
	ldrh r0, [r3]
	bic ip, ip, #0x20
	mov r2, r2, lsl #0x1f
	orr r2, ip, r2, lsr #26
	and r2, r2, #0x3f
	orr r1, r2, r1, lsl #6
	str r1, [sp]
	tst r0, #0x4000
	beq _020D6714
	ldrh r1, [r3]
	mvn r0, #0
	orr r1, r1, #0xc000
	strh r1, [r3]
	ldmia sp!, {r3, pc}
_020D6714:
	bl OS_DisableInterrupts
	ldr r2, _020D6748 ; =0x04000184
	ldrh r1, [r2]
	tst r1, #2
	beq _020D6734
	bl OS_RestoreInterrupts
	mvn r0, #1
	ldmia sp!, {r3, pc}
_020D6734:
	ldr r1, [sp]
	str r1, [r2, #4]
	bl OS_RestoreInterrupts
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_020D6748: .word 0x04000184
	arm_func_end PXI_SendWordByFifo

	arm_func_start sub_020D674C
sub_020D674C: ; 0x020D674C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #4
	mvn r8, #3
	ldr r6, [sp]
	ldr sb, _020D685C ; =0x04000184
	ldr r4, _020D6860 ; =0x021E35A8
	add sl, r8, #1
	mov r7, #0x4100000
	mov r5, #0
_020D6770:
	ldrh r0, [sb]
	tst r0, #0x4000
	beq _020D6790
	ldrh r0, [sb]
	add r1, r8, #1
	orr r0, r0, #0xc000
	strh r0, [sb]
	b _020D67BC
_020D6790:
	bl OS_DisableInterrupts
	ldrh r1, [sb]
	tst r1, #0x100
	beq _020D67AC
	bl OS_RestoreInterrupts
	mov r1, r8
	b _020D67BC
_020D67AC:
	ldr r6, [r7]
	str r6, [sp]
	bl OS_RestoreInterrupts
	mov r1, r5
_020D67BC:
	cmp r1, r8
	addeq sp, sp, #4
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	cmp r1, sl
	beq _020D6770
	mov r0, r6, lsl #0x1b
	movs r0, r0, lsr #0x1b
	beq _020D6770
	ldr r3, [r4, r0, lsl #2]
	cmp r3, #0
	beq _020D67FC
	mov r2, r6, lsl #0x1a
	mov r1, r6, lsr #6
	mov r2, r2, lsr #0x1f
	blx r3
	b _020D6770
_020D67FC:
	mov r0, r6, lsl #0x1a
	movs r0, r0, lsr #0x1f
	bne _020D6770
	ldrh r0, [sb]
	orr r6, r6, #0x20
	str r6, [sp]
	tst r0, #0x4000
	beq _020D682C
	ldrh r0, [sb]
	orr r0, r0, #0xc000
	strh r0, [sb]
	b _020D6770
_020D682C:
	bl OS_DisableInterrupts
	ldrh r1, [sb]
	tst r1, #2
	beq _020D6844
	bl OS_RestoreInterrupts
	b _020D6770
_020D6844:
	mov r1, r6
	str r1, [sb, #4]
	bl OS_RestoreInterrupts
	b _020D6770
	arm_func_end sub_020D674C

	arm_func_start sub_020D6854
sub_020D6854: ; 0x020D6854
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_020D685C: .word 0x04000184
_020D6860: .word 0x021E35A8
	arm_func_end sub_020D6854

	arm_func_start sub_020D6864
sub_020D6864: ; 0x020D6864
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	mov r4, r1
	bl OS_DisableInterrupts
	ldr r1, [r5]
	mov r6, r0
	ldr r0, [r5, #4]
	cmp r1, #0
	strne r0, [r1, #4]
	cmp r0, #0
	strne r1, [r0]
	mov r0, #0
	str r0, [r5]
	str r0, [r5, #4]
	ldr r1, [r5, #0xc]
	add r0, r5, #0x18
	bic r1, r1, #0x4f
	str r1, [r5, #0xc]
	str r4, [r5, #0x14]
	bl OS_WakeupThread
	mov r0, r6
	bl OS_RestoreInterrupts
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020D6864

	arm_func_start sub_020D68C0
sub_020D68C0: ; 0x020D68C0
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	ldr r0, [r8, #0xc]
	ldr r5, [r8, #8]
	mov r7, r1
	mov r1, #1
	tst r0, #4
	mov r6, r1, lsl r7
	moveq r1, #0
	ldr r0, [r5, #0x1c]
	cmp r1, #0
	orrne r0, r0, #0x200
	orreq r0, r0, #0x100
	str r0, [r5, #0x1c]
	ldr r0, [r5, #0x58]
	tst r0, r6
	beq _020D6968
	ldr r2, [r5, #0x54]
	mov r0, r8
	mov r1, r7
	blx r2
	mov r4, r0
	cmp r4, #8
	addls pc, pc, r4, lsl #2
	b _020D696C
_020D6924: ; jump table
	b _020D6948 ; case 0
	b _020D6948 ; case 1
	b _020D696C ; case 2
	b _020D696C ; case 3
	b _020D6948 ; case 4
	b _020D696C ; case 5
	b _020D696C ; case 6
	b _020D696C ; case 7
	b _020D6950 ; case 8
_020D6948:
	str r4, [r8, #0x14]
	b _020D696C
_020D6950:
	ldr r1, [r5, #0x58]
	mvn r0, r6
	and r0, r1, r0
	str r0, [r5, #0x58]
	mov r4, #7
	b _020D696C
_020D6968:
	mov r4, #7
_020D696C:
	cmp r4, #7
	bne _020D6988
	ldr r1, _020D6A4C ; =0x0210E124
	mov r0, r8
	ldr r1, [r1, r7, lsl #2]
	blx r1
	mov r4, r0
_020D6988:
	cmp r4, #6
	bne _020D6A00
	ldr r0, [r8, #0xc]
	tst r0, #4
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	beq _020D6A44
	bl OS_DisableInterrupts
	ldr r1, [r5, #0x1c]
	mov r7, r0
	tst r1, #0x200
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	beq _020D69F0
	mov r4, #0
	mov r6, #1
_020D69D0:
	add r0, r5, #0xc
	bl OS_SleepThread
	ldr r0, [r5, #0x1c]
	tst r0, #0x200
	movne r0, r6
	moveq r0, r4
	cmp r0, #0
	bne _020D69D0
_020D69F0:
	mov r0, r7
	ldr r4, [r8, #0x14]
	bl OS_RestoreInterrupts
	b _020D6A44
_020D6A00:
	ldr r0, [r8, #0xc]
	tst r0, #4
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	bne _020D6A34
	ldr r1, [r5, #0x1c]
	mov r0, r8
	bic r2, r1, #0x100
	mov r1, r4
	str r2, [r5, #0x1c]
	bl sub_020D6864
	b _020D6A44
_020D6A34:
	ldr r0, [r5, #0x1c]
	bic r0, r0, #0x200
	str r0, [r5, #0x1c]
	str r4, [r8, #0x14]
_020D6A44:
	mov r0, r4
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020D6A4C: .word 0x0210E124
	arm_func_end sub_020D68C0

	arm_func_start sub_020D6A50
sub_020D6A50: ; 0x020D6A50
	stmdb sp!, {r3, lr}
	cmp r2, #0
	mov lr, #0
	bls _020D6A98
_020D6A60:
	ldrb ip, [r0, lr]
	ldrb r3, [r1, lr]
	sub ip, ip, #0x41
	cmp ip, #0x19
	sub r3, r3, #0x41
	addls ip, ip, #0x20
	cmp r3, #0x19
	addls r3, r3, #0x20
	cmp ip, r3
	subne r0, ip, r3
	ldmneia sp!, {r3, pc}
	add lr, lr, #1
	cmp lr, r2
	blo _020D6A60
_020D6A98:
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_020D6A50

	arm_func_start sub_020D6AA0
sub_020D6AA0: ; 0x020D6AA0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r7, r0
	ldr r4, [r7]
	mov r6, r2
	ldr r2, [r4, #0x1c]
	mov r0, r4
	orr r2, r2, #0x200
	str r2, [r4, #0x1c]
	ldr r2, [r7, #4]
	ldr r5, [r4, #0x50]
	mov r3, r6
	blx r5
	cmp r0, #0
	cmpne r0, #1
	beq _020D6AE8
	cmp r0, #6
	beq _020D6AF8
	b _020D6B50
_020D6AE8:
	ldr r1, [r4, #0x1c]
	bic r1, r1, #0x200
	str r1, [r4, #0x1c]
	b _020D6B50
_020D6AF8:
	bl OS_DisableInterrupts
	ldr r1, [r4, #0x1c]
	mov r5, r0
	tst r1, #0x200
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	beq _020D6B40
	mov r8, #0
	mov sb, #1
_020D6B20:
	add r0, r4, #0xc
	bl OS_SleepThread
	ldr r0, [r4, #0x1c]
	tst r0, #0x200
	movne r0, sb
	moveq r0, r8
	cmp r0, #0
	bne _020D6B20
_020D6B40:
	mov r0, r5
	bl OS_RestoreInterrupts
	ldr r0, [r4, #0x24]
	ldr r0, [r0, #0x14]
_020D6B50:
	ldr r1, [r7, #4]
	add r1, r1, r6
	str r1, [r7, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end sub_020D6AA0

	arm_func_start sub_020D6B60
sub_020D6B60: ; 0x020D6B60
	ldr r3, [r0, #0xc]
	mov r2, #0
	orr r3, r3, #4
	str r3, [r0, #0xc]
	ldr r3, [r0, #8]
	ldr ip, _020D6B90 ; =sub_020D68C0
	str r3, [r0, #0x30]
	str r2, [r0, #0x38]
	strh r2, [r0, #0x36]
	strh r1, [r0, #0x34]
	mov r1, #2
	bx ip
	.align 2, 0
_020D6B90: .word sub_020D68C0
	arm_func_end sub_020D6B60

	arm_func_start sub_020D6B94
sub_020D6B94: ; 0x020D6B94
	stmdb sp!, {r3, lr}
	ldr r2, [r0, #0x2c]
	ldr r3, [r0, #0x38]
	ldr lr, [r0, #8]
	ldr r1, [r0, #0x30]
	add ip, r2, r3
	str ip, [r0, #0x2c]
	ldr ip, [lr, #0x48]
	mov r0, lr
	blx ip
	ldmia sp!, {r3, pc}
	arm_func_end sub_020D6B94

	arm_func_start sub_020D6BC0
sub_020D6BC0: ; 0x020D6BC0
	stmdb sp!, {r3, lr}
	ldr r2, [r0, #0x2c]
	ldr r3, [r0, #0x38]
	ldr lr, [r0, #8]
	ldr r1, [r0, #0x30]
	add ip, r2, r3
	str ip, [r0, #0x2c]
	ldr ip, [lr, #0x4c]
	mov r0, lr
	blx ip
	ldmia sp!, {r3, pc}
	arm_func_end sub_020D6BC0

	arm_func_start sub_020D6BEC
sub_020D6BEC: ; 0x020D6BEC
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x10
	mov r6, r0
	ldr r4, [r6, #8]
	add r5, r6, #0x30
	str r4, [sp]
	ldrh r1, [r5, #4]
	ldr r2, [r4, #0x34]
	add r0, sp, #0
	add r3, r2, r1, lsl #3
	add r1, sp, #8
	mov r2, #8
	str r3, [sp, #4]
	bl sub_020D6AA0
	movs r3, r0
	bne _020D6C74
	add ip, r6, #0x20
	ldmia r5, {r0, r1, r2}
	stmia ip, {r0, r1, r2}
	ldrh r0, [r5, #6]
	cmp r0, #0
	ldreq r0, [r5, #8]
	cmpeq r0, #0
	bne _020D6C64
	ldrh r0, [sp, #0xc]
	strh r0, [r6, #0x26]
	ldr r1, [r4, #0x34]
	ldr r0, [sp, #8]
	add r0, r1, r0
	str r0, [r6, #0x28]
_020D6C64:
	ldrh r1, [sp, #0xe]
	ldr r0, _020D6C80 ; =0x00000FFF
	and r0, r1, r0
	str r0, [r6, #0x2c]
_020D6C74:
	mov r0, r3
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020D6C80: .word 0x00000FFF
	arm_func_end sub_020D6BEC

	arm_func_start sub_020D6C84
sub_020D6C84: ; 0x020D6C84
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0xc
	mov r5, r0
	ldr r4, [r5, #0x30]
	ldr r1, [r5, #8]
	add r0, sp, #4
	str r1, [sp, #4]
	ldr r3, [r5, #0x28]
	add r1, sp, #0
	mov r2, #1
	str r3, [sp, #8]
	bl sub_020D6AA0
	cmp r0, #0
	addne sp, sp, #0xc
	ldmneia sp!, {r4, r5, pc}
	ldrb r1, [sp]
	and r2, r1, #0x7f
	mov r1, r1, asr #7
	str r2, [r4, #0x10]
	and r1, r1, #1
	str r1, [r4, #0xc]
	ldr r2, [r4, #0x10]
	cmp r2, #0
	addeq sp, sp, #0xc
	moveq r0, #1
	ldmeqia sp!, {r4, r5, pc}
	ldr r1, [r5, #0x34]
	cmp r1, #0
	bne _020D6D24
	add r0, sp, #4
	add r1, r4, #0x14
	bl sub_020D6AA0
	cmp r0, #0
	addne sp, sp, #0xc
	ldmneia sp!, {r4, r5, pc}
	ldr r1, [r4, #0x10]
	mov r2, #0
	add r1, r4, r1
	strb r2, [r1, #0x14]
	b _020D6D30
_020D6D24:
	ldr r1, [sp, #8]
	add r1, r1, r2
	str r1, [sp, #8]
_020D6D30:
	ldr r1, [r4, #0xc]
	cmp r1, #0
	beq _020D6D80
	add r0, sp, #4
	add r1, sp, #2
	mov r2, #2
	bl sub_020D6AA0
	cmp r0, #0
	addne sp, sp, #0xc
	ldmneia sp!, {r4, r5, pc}
	ldr r2, [r5, #8]
	ldr r1, _020D6DAC ; =0x00000FFF
	str r2, [r4]
	ldrh r3, [sp, #2]
	mov r2, #0
	and r1, r3, r1
	strh r1, [r4, #4]
	strh r2, [r4, #6]
	str r2, [r4, #8]
	b _020D6D9C
_020D6D80:
	ldr r1, [r5, #8]
	str r1, [r4]
	ldrh r1, [r5, #0x26]
	str r1, [r4, #4]
	ldrh r1, [r5, #0x26]
	add r1, r1, #1
	strh r1, [r5, #0x26]
_020D6D9C:
	ldr r1, [sp, #8]
	str r1, [r5, #0x28]
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_020D6DAC: .word 0x00000FFF
	arm_func_end sub_020D6C84

	arm_func_start sub_020D6DB0
sub_020D6DB0: ; 0x020D6DB0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x94
	mov sb, r0
	ldr r5, [sb, #0x3c]
	mov r1, #2
	ldr r6, [sb, #0x40]
	bl sub_020D68C0
	ldrb r3, [r5]
	cmp r3, #0
	beq _020D6F68
_020D6DD8:
	mov r8, #0
	mov r0, #1
	mov r1, r8
	b _020D6DEC
_020D6DE8:
	add r8, r8, #1
_020D6DEC:
	ldrb r7, [r5, r8]
	mov r2, r1
	cmp r7, #0
	cmpne r7, #0x2f
	cmpne r7, #0x5c
	movne r2, r0
	cmp r2, #0
	bne _020D6DE8
	cmp r7, #0
	cmpeq r6, #0
	movne r7, #1
	cmp r8, #0
	addeq sp, sp, #0x94
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	cmp r3, #0x2e
	bne _020D6E80
	cmp r8, #1
	addeq r5, r5, #1
	beq _020D6F4C
	ldrb r0, [r5, #1]
	cmp r8, #2
	moveq r1, #1
	movne r1, #0
	cmp r0, #0x2e
	moveq r0, #1
	movne r0, #0
	tst r1, r0
	beq _020D6E80
	ldrh r0, [sb, #0x24]
	cmp r0, #0
	beq _020D6E78
	ldr r1, [sb, #0x2c]
	mov r0, sb
	bl sub_020D6B60
_020D6E78:
	add r5, r5, #2
	b _020D6F4C
_020D6E80:
	cmp r8, #0x7f
	addgt sp, sp, #0x94
	movgt r0, #1
	ldmgtia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	add r1, sp, #0
	mov r0, #0
	str r1, [sb, #0x30]
	str r0, [sb, #0x34]
	add sl, sp, #0x14
	mov r4, #3
_020D6EA8:
	mov r0, sb
	mov r1, r4
	bl sub_020D68C0
	cmp r0, #0
	addne sp, sp, #0x94
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	ldr r0, [sp, #0xc]
	cmp r7, r0
	ldreq r0, [sp, #0x10]
	cmpeq r8, r0
	bne _020D6EA8
	mov r0, r5
	mov r1, sl
	mov r2, r8
	bl sub_020D6A50
	cmp r0, #0
	bne _020D6EA8
	cmp r7, #0
	beq _020D6F1C
	add r0, sp, #0
	add r3, sb, #0x30
	ldmia r0, {r0, r1, r2}
	stmia r3, {r0, r1, r2}
	mov r0, sb
	mov r1, #2
	add r5, r5, r8
	bl sub_020D68C0
	b _020D6F4C
_020D6F1C:
	cmp r6, #0
	addne sp, sp, #0x94
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	ldr r3, [sb, #0x44]
	ldr r2, [sp]
	ldr r1, [sp, #4]
	add sp, sp, #0x94
	str r2, [r3]
	mov r0, #0
	str r1, [r3, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
_020D6F4C:
	ldrb r0, [r5]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	ldrb r3, [r5, r0]!
	cmp r3, #0
	bne _020D6DD8
_020D6F68:
	cmp r6, #0
	addeq sp, sp, #0x94
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	ldr r3, [sb, #0x44]
	add r0, sb, #0x20
	ldmia r0, {r0, r1, r2}
	stmia r3, {r0, r1, r2}
	mov r0, #0
	add sp, sp, #0x94
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end sub_020D6DB0

	arm_func_start sub_020D6F94
sub_020D6F94: ; 0x020D6F94
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xe0
	mov sl, r0
	ldr r1, [sl, #8]
	add r0, sp, #4
	str r1, [sp]
	bl FS_InitFile
	ldr r0, [sl, #8]
	str r0, [sp, #0xc]
	ldr r0, [sl, #0xc]
	tst r0, #0x20
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	ldrneh sb, [sl, #0x24]
	movne r6, #0x10000
	bne _020D7078
	ldrh r0, [sl, #0x38]
	ldr r6, [sl, #0x20]
	cmp r0, #0
	ldrneh sb, [sl, #0x3a]
	bne _020D7078
	mov r7, #0
	mov r8, r7
	mov sb, #0x10000
	add r5, sp, #4
	mov r4, #3
	add fp, sp, #0x4c
_020D7004:
	mov r0, r5
	mov r1, r7
	bl sub_020D6B60
	mov r2, #1
	cmp r7, #0
	mov r0, r5
	mov r1, #3
	ldreq r8, [sp, #0x30]
	str fp, [sp, #0x34]
	str r2, [sp, #0x38]
	bl sub_020D68C0
	cmp r0, #0
	bne _020D7064
_020D7038:
	ldr r0, [sp, #0x58]
	cmp r0, #0
	ldreq r0, [sp, #0x50]
	cmpeq r0, r6
	ldreqh sb, [sp, #0x28]
	beq _020D7064
	mov r0, r5
	mov r1, r4
	bl sub_020D68C0
	cmp r0, #0
	beq _020D7038
_020D7064:
	cmp sb, #0x10000
	bne _020D7078
	add r7, r7, #1
	cmp r7, r8
	blo _020D7004
_020D7078:
	cmp sb, #0x10000
	bne _020D7094
	mov r0, #0
	strh r0, [sl, #0x38]
	add sp, sp, #0xe0
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020D7094:
	ldrh r0, [sl, #0x38]
	cmp r0, #0
	bne _020D7178
	ldr r0, [sp]
	mov r1, #0
	ldr r0, [r0]
	cmp r0, #0xff
	addls r8, r1, #1
	bls _020D70C4
	cmp r0, #0xff00
	addls r8, r1, #2
	addhi r8, r1, #3
_020D70C4:
	cmp r6, #0x10000
	ldrne r0, [sp, #0x5c]
	add r8, r8, #2
	addne r8, r8, r0
	mov r7, sb
	cmp sb, #0
	beq _020D716C
	add r0, sp, #4
	mov r1, sb
	bl sub_020D6B60
	add r5, sp, #4
	mov r4, #3
	add fp, sp, #0x4c
_020D70F8:
	ldr r1, [sp, #0x30]
	mov r0, r5
	bl sub_020D6B60
	mov r1, #1
	str r1, [sp, #0x38]
	mov r0, r5
	mov r1, #3
	str fp, [sp, #0x34]
	bl sub_020D68C0
	cmp r0, #0
	bne _020D7160
_020D7124:
	ldr r0, [sp, #0x58]
	cmp r0, #0
	beq _020D714C
	ldrh r0, [sp, #0x50]
	cmp r0, r7
	bne _020D714C
	ldr r0, [sp, #0x5c]
	add r0, r0, #1
	add r8, r8, r0
	b _020D7160
_020D714C:
	mov r0, r5
	mov r1, r4
	bl sub_020D68C0
	cmp r0, #0
	beq _020D7124
_020D7160:
	ldrh r7, [sp, #0x28]
	cmp r7, #0
	bne _020D70F8
_020D716C:
	add r0, r8, #1
	strh r0, [sl, #0x38]
	strh sb, [sl, #0x3a]
_020D7178:
	ldr r5, [sl, #0x30]
	cmp r5, #0
	addeq sp, sp, #0xe0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldrh r4, [sl, #0x38]
	ldr r0, [sl, #0x34]
	cmp r0, r4
	addlo sp, sp, #0xe0
	movlo r0, #1
	ldmloia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, [sp]
	mov r7, #0
	ldr r0, [r0]
	cmp r0, #0xff
	movls r8, #1
	bls _020D71C8
	cmp r0, #0xff00
	movls r8, #2
	movhi r8, #3
_020D71C8:
	ldr r0, [sp]
	mov r1, r5
	mov r2, r8
	bl MIi_CpuCopy8
	add r1, r7, r8
	ldr r0, _020D733C ; =_02110C98
	add r1, r5, r1
	mov r2, #2
	bl MIi_CpuCopy8
	add r0, sp, #4
	mov r1, sb
	bl sub_020D6B60
	cmp r6, #0x10000
	beq _020D7278
	add r3, sp, #0x4c
	mov r2, #0
	add r0, sp, #4
	mov r1, #3
	str r3, [sp, #0x34]
	str r2, [sp, #0x38]
	bl sub_020D68C0
	cmp r0, #0
	bne _020D7254
	add r8, sp, #4
	mov r7, #3
_020D722C:
	ldr r0, [sp, #0x58]
	cmp r0, #0
	ldreq r0, [sp, #0x50]
	cmpeq r0, r6
	beq _020D7254
	mov r0, r8
	mov r1, r7
	bl sub_020D68C0
	cmp r0, #0
	beq _020D722C
_020D7254:
	ldr r0, [sp, #0x5c]
	add r1, r5, r4
	add r6, r0, #1
	add r0, sp, #0x60
	mov r2, r6
	sub r1, r1, r6
	bl MIi_CpuCopy8
	sub r4, r4, r6
	b _020D7288
_020D7278:
	add r0, r5, r4
	mov r1, #0
	strb r1, [r0, #-1]
	sub r4, r4, #1
_020D7288:
	cmp sb, #0
	beq _020D7330
	add sl, sp, #4
	mov r6, #3
	add r8, sp, #0x4c
	mov r7, #0
	mov fp, #0x2f
_020D72A4:
	ldr r1, [sp, #0x30]
	mov r0, sl
	bl sub_020D6B60
	add r1, r5, r4
	str r8, [sp, #0x34]
	str r7, [sp, #0x38]
	strb fp, [r1, #-1]
	mov r0, sl
	mov r1, #3
	sub r4, r4, #1
	bl sub_020D68C0
	cmp r0, #0
	bne _020D7324
_020D72D8:
	ldr r0, [sp, #0x58]
	cmp r0, #0
	beq _020D7310
	ldrh r0, [sp, #0x50]
	cmp r0, sb
	bne _020D7310
	ldr sb, [sp, #0x5c]
	add r1, r5, r4
	add r0, sp, #0x60
	mov r2, sb
	sub r1, r1, sb
	bl MIi_CpuCopy8
	sub r4, r4, sb
	b _020D7324
_020D7310:
	mov r0, sl
	mov r1, r6
	bl sub_020D68C0
	cmp r0, #0
	beq _020D72D8
_020D7324:
	ldrh sb, [sp, #0x28]
	cmp sb, #0
	bne _020D72A4
_020D7330:
	mov r0, #0
	add sp, sp, #0xe0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020D733C: .word _02110C98
	arm_func_end sub_020D6F94

	arm_func_start sub_020D7340
sub_020D7340: ; 0x020D7340
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x10
	mov r5, r0
	ldr r1, [r5, #8]
	ldr r4, [r5, #0x34]
	ldr r0, [r1, #0x30]
	mov r2, r4, lsl #3
	cmp r0, r4, lsl #3
	addls sp, sp, #0x10
	movls r0, #1
	ldmlsia sp!, {r3, r4, r5, pc}
	str r1, [sp]
	ldr r1, [r1, #0x2c]
	add r0, sp, #0
	add r3, r1, r2
	add r1, sp, #8
	mov r2, #8
	str r3, [sp, #4]
	bl sub_020D6AA0
	cmp r0, #0
	addne sp, sp, #0x10
	ldmneia sp!, {r3, r4, r5, pc}
	ldr r1, [sp, #8]
	mov r0, r5
	str r1, [r5, #0x30]
	ldr r2, [sp, #0xc]
	mov r1, #7
	str r2, [r5, #0x34]
	str r4, [r5, #0x38]
	bl sub_020D68C0
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020D7340

	arm_func_start sub_020D73C0
sub_020D73C0: ; 0x020D73C0
	ldr r1, [r0, #0x30]
	str r1, [r0, #0x24]
	ldr r1, [r0, #0x30]
	str r1, [r0, #0x2c]
	ldr r1, [r0, #0x34]
	str r1, [r0, #0x28]
	ldr r1, [r0, #0x38]
	str r1, [r0, #0x20]
	mov r0, #0
	bx lr
	arm_func_end sub_020D73C0

	arm_func_start sub_020D73E8
sub_020D73E8: ; 0x020D73E8
	mov r0, #0
	bx lr
	arm_func_end sub_020D73E8

	arm_func_start sub_020D73F0
sub_020D73F0: ; 0x020D73F0
	stmdb sp!, {r3, lr}
	cmp r1, #3
	mov r3, #0
	bgt _020D7440
	mov ip, r3
	cmp r1, #0
	ble _020D7440
	mov lr, r3
_020D7410:
	ldrb r2, [r0, ip]
	cmp r2, #0
	beq _020D7440
	sub r2, r2, #0x41
	cmp r2, #0x19
	addls r2, r2, #0x61
	addhi r2, r2, #0x41
	add ip, ip, #1
	orr r3, r3, r2, lsl lr
	cmp ip, r1
	add lr, lr, #8
	blt _020D7410
_020D7440:
	mov r0, r3
	ldmia sp!, {r3, pc}
	arm_func_end sub_020D73F0

	arm_func_start sub_020D7448
sub_020D7448: ; 0x020D7448
	stmdb sp!, {r3, lr}
	ldr r0, [r0, #0x28]
	add r0, r0, r2
	mov r2, r3
	bl MIi_CpuCopy8
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_020D7448

	arm_func_start sub_020D7464
sub_020D7464: ; 0x020D7464
	stmdb sp!, {r3, lr}
	ldr ip, [r0, #0x28]
	mov r0, r1
	add r1, ip, r2
	mov r2, r3
	bl MIi_CpuCopy8
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_020D7464

	arm_func_start sub_020D7484
sub_020D7484: ; 0x020D7484
	stmdb sp!, {r3, lr}
	mov r0, r2
	mov r2, r3
	bl MIi_CpuCopy8
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_020D7484

	arm_func_start sub_020D749C
sub_020D749C: ; 0x020D749C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x48
	mov r6, r0
	bl OS_DisableInterrupts
	ldr r1, [r6, #0x1c]
	mov r4, r0
	tst r1, #0x20
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	beq _020D7530
	ldr r0, [r6, #0x1c]
	bic r0, r0, #0x20
	str r0, [r6, #0x1c]
	ldr r0, [r6, #0x24]
	cmp r0, #0
	beq _020D7530
	mov r8, #0
	mov sb, #1
	mov r7, #3
_020D74EC:
	ldr r1, [r0, #0xc]
	ldr r5, [r0, #4]
	tst r1, #2
	movne r1, sb
	moveq r1, r8
	cmp r1, #0
	beq _020D7524
	ldr r1, [r6, #0x24]
	cmp r1, r0
	mov r1, r7
	streq r5, [r6, #0x24]
	bl sub_020D6864
	cmp r5, #0
	ldreq r5, [r6, #0x24]
_020D7524:
	mov r0, r5
	cmp r5, #0
	bne _020D74EC
_020D7530:
	ldr r0, [r6, #0x1c]
	tst r0, #0x40
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	bne _020D7620
	ldr r0, [r6, #0x1c]
	tst r0, #8
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	bne _020D7620
	ldr r5, [r6, #0x24]
	cmp r5, #0
	beq _020D7620
	ldr r0, [r6, #0x1c]
	tst r0, #0x10
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	moveq r7, #1
	movne r7, #0
	cmp r7, #0
	ldrne r0, [r6, #0x1c]
	orrne r0, r0, #0x10
	strne r0, [r6, #0x1c]
	mov r0, r4
	bl OS_RestoreInterrupts
	cmp r7, #0
	beq _020D75C4
	ldr r0, [r6, #0x58]
	tst r0, #0x200
	beq _020D75C4
	ldr r2, [r6, #0x54]
	mov r0, r5
	mov r1, #9
	blx r2
_020D75C4:
	bl OS_DisableInterrupts
	ldr r1, [r5, #0xc]
	mov r4, r0
	orr r0, r1, #0x40
	str r0, [r5, #0xc]
	ldr r0, [r5, #0xc]
	tst r0, #4
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	beq _020D760C
	add r0, r5, #0x18
	bl OS_WakeupThread
	mov r0, r4
	bl OS_RestoreInterrupts
	add sp, sp, #0x48
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_020D760C:
	mov r0, r4
	bl OS_RestoreInterrupts
	add sp, sp, #0x48
	mov r0, r5
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_020D7620:
	ldr r0, [r6, #0x1c]
	tst r0, #0x10
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	beq _020D766C
	ldr r0, [r6, #0x1c]
	bic r0, r0, #0x10
	str r0, [r6, #0x1c]
	ldr r0, [r6, #0x58]
	tst r0, #0x400
	beq _020D766C
	add r0, sp, #0
	bl FS_InitFile
	str r6, [sp, #8]
	ldr r2, [r6, #0x54]
	add r0, sp, #0
	mov r1, #0xa
	blx r2
_020D766C:
	ldr r0, [r6, #0x1c]
	tst r0, #0x40
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	beq _020D769C
	ldr r1, [r6, #0x1c]
	add r0, r6, #0x14
	bic r1, r1, #0x40
	orr r1, r1, #8
	str r1, [r6, #0x1c]
	bl OS_WakeupThread
_020D769C:
	mov r0, r4
	bl OS_RestoreInterrupts
	mov r0, #0
	add sp, sp, #0x48
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end sub_020D749C

	arm_func_start sub_020D76B0
sub_020D76B0: ; 0x020D76B0
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	movs r6, r0
	ldr r4, [r6, #8]
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	mov r7, #0
	mov r8, #1
_020D76C8:
	bl OS_DisableInterrupts
	ldr r1, [r6, #0xc]
	mov r5, r0
	orr r0, r1, #0x40
	str r0, [r6, #0xc]
	ldr r0, [r6, #0xc]
	tst r0, #4
	movne r0, r8
	moveq r0, r7
	cmp r0, #0
	beq _020D7708
	add r0, r6, #0x18
	bl OS_WakeupThread
	mov r0, r5
	bl OS_RestoreInterrupts
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020D7708:
	ldr r1, [r6, #0xc]
	mov r0, r5
	orr r1, r1, #8
	str r1, [r6, #0xc]
	bl OS_RestoreInterrupts
	ldr r1, [r6, #0x10]
	mov r0, r6
	bl sub_020D68C0
	cmp r0, #6
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	mov r0, r4
	bl sub_020D749C
	movs r6, r0
	bne _020D76C8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_020D76B0

	arm_func_start sub_020D7744
sub_020D7744: ; 0x020D7744
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r1, [r4, #0x10]
	bl sub_020D68C0
	mov r1, r0
	mov r0, r4
	bl sub_020D6864
	ldr r0, [r4, #8]
	bl sub_020D749C
	cmp r0, #0
	beq _020D7774
	bl sub_020D76B0
_020D7774:
	ldr r0, [r4, #0x14]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end sub_020D7744

	arm_func_start sub_020D7788
sub_020D7788: ; 0x020D7788
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r0
	ldr r4, [r6, #8]
	mov r2, #1
	str r1, [r6, #0x10]
	mov r0, #2
	str r0, [r6, #0x14]
	ldr r0, [r6, #0xc]
	mov r7, r2, lsl r1
	orr r0, r0, #1
	str r0, [r6, #0xc]
	bl OS_DisableInterrupts
	ldr r1, [r4, #0x1c]
	mov r5, r0
	tst r1, #0x80
	beq _020D77E4
	mov r0, r6
	mov r1, #3
	bl sub_020D6864
	mov r0, r5
	bl OS_RestoreInterrupts
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020D77E4:
	tst r7, #0x1fc
	ldrne r0, [r6, #0xc]
	orrne r0, r0, #4
	strne r0, [r6, #0xc]
	ldr r1, [r6]
	ldr r2, [r6, #4]
	cmp r1, #0
	strne r2, [r1, #4]
	cmp r2, #0
	add r0, r4, #0x20
	strne r1, [r2]
	ldr r1, [r0, #4]
	cmp r1, #0
	beq _020D782C
_020D781C:
	mov r0, r1
	ldr r1, [r1, #4]
	cmp r1, #0
	bne _020D781C
_020D782C:
	str r6, [r0, #4]
	str r0, [r6]
	mov r1, #0
	str r1, [r6, #4]
	ldr r0, [r4, #0x1c]
	tst r0, #8
	movne r1, #1
	cmp r1, #0
	bne _020D78DC
	ldr r0, [r4, #0x1c]
	tst r0, #0x10
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	bne _020D78DC
	ldr r1, [r4, #0x1c]
	mov r0, r5
	orr r1, r1, #0x10
	str r1, [r4, #0x1c]
	bl OS_RestoreInterrupts
	ldr r0, [r4, #0x58]
	tst r0, #0x200
	beq _020D7898
	ldr r2, [r4, #0x54]
	mov r0, r6
	mov r1, #9
	blx r2
_020D7898:
	bl OS_DisableInterrupts
	ldr r1, [r6, #0xc]
	orr r1, r1, #0x40
	str r1, [r6, #0xc]
	ldr r1, [r6, #0xc]
	tst r1, #4
	movne r1, #1
	moveq r1, #0
	cmp r1, #0
	bne _020D78D4
	bl OS_RestoreInterrupts
	mov r0, r6
	bl sub_020D76B0
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020D78D4:
	bl OS_RestoreInterrupts
	b _020D7920
_020D78DC:
	ldr r0, [r6, #0xc]
	tst r0, #4
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	bne _020D7904
	mov r0, r5
	bl OS_RestoreInterrupts
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020D7904:
	add r0, r6, #0x18
	bl OS_SleepThread
	ldr r0, [r6, #0xc]
	tst r0, #0x40
	beq _020D7904
	mov r0, r5
	bl OS_RestoreInterrupts
_020D7920:
	mov r0, r6
	bl sub_020D7744
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020D7788

	arm_func_start sub_020D792C
sub_020D792C: ; 0x020D792C
	stmdb sp!, {r4, lr}
	mov r1, #0
	mov r2, #0x5c
	mov r4, r0
	bl MI_CpuFill8
	mov r0, #0
	str r0, [r4, #0x10]
	str r0, [r4, #0xc]
	str r0, [r4, #0x18]
	str r0, [r4, #0x14]
	ldmia sp!, {r4, pc}
	arm_func_end sub_020D792C

	arm_func_start sub_020D7958
sub_020D7958: ; 0x020D7958
	stmdb sp!, {r3, r4, r5, lr}
	bl sub_020D73F0
	mov r4, r0
	bl OS_DisableInterrupts
	ldr r1, _020D7994 ; =0x021E3628
	ldr r5, [r1]
	b _020D7978
_020D7974:
	ldr r5, [r5, #4]
_020D7978:
	cmp r5, #0
	ldrne r1, [r5]
	cmpne r1, r4
	bne _020D7974
	bl OS_RestoreInterrupts
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020D7994: .word 0x021E3628
	arm_func_end sub_020D7958

	arm_func_start sub_020D7998
sub_020D7998: ; 0x020D7998
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r6, r1
	mov r5, r2
	mov r7, r0
	mov r8, #0
	bl OS_DisableInterrupts
	mov r4, r0
	mov r0, r6
	mov r1, r5
	bl sub_020D7958
	cmp r0, #0
	bne _020D7A38
	ldr r0, _020D7A48 ; =0x021E3628
	ldr r1, [r0]
	cmp r1, #0
	bne _020D79F4
	str r7, [r0]
	str r7, [r0, #4]
	mov r1, r8
	str r1, [r0, #0xc]
	strh r1, [r0, #0xa]
	strh r1, [r0, #8]
	b _020D7A18
_020D79F4:
	ldr r0, [r1, #4]
	cmp r0, #0
	beq _020D7A10
_020D7A00:
	mov r1, r0
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _020D7A00
_020D7A10:
	str r7, [r1, #4]
	str r1, [r7, #8]
_020D7A18:
	mov r0, r6
	mov r1, r5
	bl sub_020D73F0
	str r0, [r7]
	ldr r0, [r7, #0x1c]
	mov r8, #1
	orr r0, r0, #1
	str r0, [r7, #0x1c]
_020D7A38:
	mov r0, r4
	bl OS_RestoreInterrupts
	mov r0, r8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020D7A48: .word 0x021E3628
	arm_func_end sub_020D7998

	arm_func_start sub_020D7A4C
sub_020D7A4C: ; 0x020D7A4C
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	bl OS_DisableInterrupts
	ldr r2, [r4, #4]
	mov r3, #0
	cmp r2, #0
	ldrne r1, [r4, #8]
	strne r1, [r2, #8]
	ldr r2, [r4, #8]
	cmp r2, #0
	ldrne r1, [r4, #4]
	strne r1, [r2, #4]
	str r3, [r4]
	str r3, [r4, #8]
	str r3, [r4, #4]
	ldr r2, [r4, #0x1c]
	ldr r1, _020D7ACC ; =0x021E3628
	bic r2, r2, #1
	str r2, [r4, #0x1c]
	ldr r2, [r1, #4]
	cmp r2, r4
	bne _020D7AC4
	ldr r2, [r1]
	str r2, [r1, #4]
	str r3, [r1, #0xc]
	strh r3, [r1, #0xa]
	strh r3, [r1, #8]
_020D7AC4:
	bl OS_RestoreInterrupts
	ldmia sp!, {r4, pc}
	.align 2, 0
_020D7ACC: .word 0x021E3628
	arm_func_end sub_020D7A4C

	arm_func_start sub_020D7AD0
sub_020D7AD0: ; 0x020D7AD0
	str r1, [r0, #0x28]
	str r3, [r0, #0x30]
	str r2, [r0, #0x3c]
	ldr r3, [sp, #4]
	str r2, [r0, #0x2c]
	ldr ip, [sp, #8]
	ldr r1, [sp]
	str r3, [r0, #0x38]
	str r1, [r0, #0x40]
	str r1, [r0, #0x34]
	cmp ip, #0
	ldreq ip, _020D7B38 ; =sub_020D7448
	ldr r1, [sp, #0xc]
	str ip, [r0, #0x48]
	cmp r1, #0
	ldreq r1, _020D7B3C ; =sub_020D7464
	str r1, [r0, #0x4c]
	ldr r2, [r0, #0x48]
	mov r1, #0
	str r2, [r0, #0x50]
	str r1, [r0, #0x44]
	ldr r1, [r0, #0x1c]
	orr r1, r1, #2
	str r1, [r0, #0x1c]
	mov r0, #1
	bx lr
	.align 2, 0
_020D7B38: .word sub_020D7448
_020D7B3C: .word sub_020D7464
	arm_func_end sub_020D7AD0

	arm_func_start sub_020D7B40
sub_020D7B40: ; 0x020D7B40
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r6, r0
	bl OS_DisableInterrupts
	ldr r1, [r6, #0x1c]
	mov r4, r0
	tst r1, #2
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	beq _020D7BF0
	mov r0, r6
	ldr r1, [r6, #0x1c]
	bl sub_020D7DB0
	ldr r1, [r6, #0x1c]
	mov r5, r0
	orr r0, r1, #0x80
	str r0, [r6, #0x1c]
	ldr r0, [r6, #0x24]
	cmp r0, #0
	beq _020D7BAC
	mov r7, #3
_020D7B94:
	ldr r8, [r0, #4]
	mov r1, r7
	bl sub_020D6864
	mov r0, r8
	cmp r8, #0
	bne _020D7B94
_020D7BAC:
	mov r0, #0
	str r0, [r6, #0x24]
	cmp r5, #0
	beq _020D7BC4
	mov r0, r6
	bl sub_020D7E4C
_020D7BC4:
	mov r0, #0
	str r0, [r6, #0x28]
	str r0, [r6, #0x2c]
	str r0, [r6, #0x30]
	str r0, [r6, #0x34]
	str r0, [r6, #0x38]
	str r0, [r6, #0x40]
	str r0, [r6, #0x3c]
	ldr r0, [r6, #0x1c]
	bic r0, r0, #0xa2
	str r0, [r6, #0x1c]
_020D7BF0:
	mov r0, r4
	bl OS_RestoreInterrupts
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_020D7B40

	arm_func_start sub_020D7C00
sub_020D7C00: ; 0x020D7C00
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x4c
	mov r7, r0
	ldr r3, [r7, #0x30]
	ldr r0, [r7, #0x38]
	mov r6, r1
	add r0, r3, r0
	add r0, r0, #0x3f
	bic r4, r0, #0x1f
	cmp r4, r2
	bhi _020D7D14
	add r1, r6, #0x1f
	add r0, sp, #4
	bic r5, r1, #0x1f
	bl FS_InitFile
	ldr r2, [r7, #0x2c]
	mvn r0, #0
	str r0, [sp]
	ldr r3, [r7, #0x30]
	add r0, sp, #4
	mov r1, r7
	add r3, r2, r3
	bl sub_020D81C0
	cmp r0, #0
	beq _020D7C94
	ldr r2, [r7, #0x30]
	add r0, sp, #4
	mov r1, r5
	bl FS_ReadFile
	cmp r0, #0
	bge _020D7C8C
	ldr r2, [r7, #0x30]
	mov r0, r5
	mov r1, #0
	bl MI_CpuFill8
_020D7C8C:
	add r0, sp, #4
	bl FS_CloseFile
_020D7C94:
	str r5, [r7, #0x2c]
	ldr ip, [r7, #0x30]
	ldr r2, [r7, #0x34]
	mvn r0, #0
	str r0, [sp]
	ldr r3, [r7, #0x38]
	add r0, sp, #4
	mov r1, r7
	add r3, r2, r3
	add r5, r5, ip
	bl sub_020D81C0
	cmp r0, #0
	beq _020D7CF8
	ldr r2, [r7, #0x38]
	add r0, sp, #4
	mov r1, r5
	bl FS_ReadFile
	cmp r0, #0
	bge _020D7CF0
	ldr r2, [r7, #0x38]
	mov r0, r5
	mov r1, #0
	bl MI_CpuFill8
_020D7CF0:
	add r0, sp, #4
	bl FS_CloseFile
_020D7CF8:
	str r5, [r7, #0x34]
	ldr r0, _020D7D20 ; =sub_020D7484
	str r6, [r7, #0x44]
	str r0, [r7, #0x50]
	ldr r0, [r7, #0x1c]
	orr r0, r0, #4
	str r0, [r7, #0x1c]
_020D7D14:
	mov r0, r4
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, r6, r7, pc}
	.align 2, 0
_020D7D20: .word sub_020D7484
	arm_func_end sub_020D7C00

	arm_func_start sub_020D7D24
sub_020D7D24: ; 0x020D7D24
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, [r5, #0x1c]
	mov r4, #0
	tst r0, #2
	movne r0, #1
	moveq r0, r4
	cmp r0, #0
	beq _020D7DA8
	mov r0, r5
	bl sub_020D7DB0
	ldr r1, [r5, #0x1c]
	tst r1, #4
	movne r1, #1
	moveq r1, #0
	cmp r1, #0
	beq _020D7D98
	ldr r2, [r5, #0x1c]
	mov r1, #0
	bic r2, r2, #4
	str r2, [r5, #0x1c]
	ldr r4, [r5, #0x44]
	str r1, [r5, #0x44]
	ldr r1, [r5, #0x3c]
	str r1, [r5, #0x2c]
	ldr r1, [r5, #0x40]
	str r1, [r5, #0x34]
	ldr r1, [r5, #0x48]
	str r1, [r5, #0x50]
_020D7D98:
	cmp r0, #0
	beq _020D7DA8
	mov r0, r5
	bl sub_020D7E4C
_020D7DA8:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020D7D24

	arm_func_start sub_020D7DB0
sub_020D7DB0: ; 0x020D7DB0
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r6, r0
	bl OS_DisableInterrupts
	ldr r1, [r6, #0x1c]
	mov r4, r0
	tst r1, #8
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	moveq r5, #1
	movne r5, #0
	cmp r5, #0
	beq _020D7E3C
	ldr r0, [r6, #0x1c]
	tst r0, #0x10
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	ldr r0, [r6, #0x1c]
	beq _020D7E34
	orr r0, r0, #0x40
	str r0, [r6, #0x1c]
	mov r7, #0
	mov r8, #1
_020D7E10:
	add r0, r6, #0x14
	bl OS_SleepThread
	ldr r0, [r6, #0x1c]
	tst r0, #0x40
	movne r0, r8
	moveq r0, r7
	cmp r0, #0
	bne _020D7E10
	b _020D7E3C
_020D7E34:
	orr r0, r0, #8
	str r0, [r6, #0x1c]
_020D7E3C:
	mov r0, r4
	bl OS_RestoreInterrupts
	mov r0, r5
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_020D7DB0

	arm_func_start sub_020D7E4C
sub_020D7E4C: ; 0x020D7E4C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r0
	mov r5, #0
	bl OS_DisableInterrupts
	ldr r1, [r4, #0x1c]
	mov r6, r0
	tst r1, #8
	movne r0, #1
	moveq r0, r5
	cmp r0, #0
	moveq r7, #1
	movne r7, #0
	cmp r7, #0
	bne _020D7E9C
	ldr r1, [r4, #0x1c]
	mov r0, r4
	bic r1, r1, #8
	str r1, [r4, #0x1c]
	bl sub_020D749C
	mov r5, r0
_020D7E9C:
	mov r0, r6
	bl OS_RestoreInterrupts
	cmp r5, #0
	beq _020D7EB4
	mov r0, r5
	bl sub_020D76B0
_020D7EB4:
	mov r0, r7
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020D7E4C

	arm_func_start sub_020D7EBC
sub_020D7EBC: ; 0x020D7EBC
	cmp r2, #0
	moveq r1, #0
	beq _020D7ED0
	cmp r1, #0
	moveq r2, #0
_020D7ED0:
	str r1, [r0, #0x54]
	str r2, [r0, #0x58]
	bx lr
	arm_func_end sub_020D7EBC

	arm_func_start sub_020D7EDC
sub_020D7EDC: ; 0x020D7EDC
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	ldr r0, [r4, #0x1c]
	mov r6, r1
	tst r0, #0x100
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	beq _020D7F30
	ldr r1, [r4, #0x1c]
	ldr r0, [r4, #0x24]
	bic r2, r1, #0x100
	mov r1, r6
	str r2, [r4, #0x1c]
	bl sub_020D6864
	mov r0, r4
	bl sub_020D749C
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	bl sub_020D76B0
	ldmia sp!, {r4, r5, r6, pc}
_020D7F30:
	ldr r5, [r4, #0x24]
	bl OS_DisableInterrupts
	str r6, [r5, #0x14]
	ldr r1, [r4, #0x1c]
	mov r5, r0
	bic r1, r1, #0x200
	add r0, r4, #0xc
	str r1, [r4, #0x1c]
	bl OS_WakeupThread
	mov r0, r5
	bl OS_RestoreInterrupts
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020D7EDC

	arm_func_start sub_020D7F60
sub_020D7F60: ; 0x020D7F60
	stmdb sp!, {r3, lr}
	ldr r1, _020D7F84 ; =0x021E3638
	ldr r2, [r1]
	cmp r2, #0
	ldmneia sp!, {r3, pc}
	mov r2, #1
	str r2, [r1]
	bl sub_020D8590
	ldmia sp!, {r3, pc}
	.align 2, 0
_020D7F84: .word 0x021E3638
	arm_func_end sub_020D7F60

	arm_func_start sub_020D7F88
sub_020D7F88: ; 0x020D7F88
	ldr r0, _020D7F94 ; =0x021E3638
	ldr r0, [r0]
	bx lr
	.align 2, 0
_020D7F94: .word 0x021E3638
	arm_func_end sub_020D7F88

	arm_func_start FS_InitFile
FS_InitFile: ; 0x020D7F98
	mov r2, #0
	str r2, [r0]
	str r2, [r0, #4]
	str r2, [r0, #0x1c]
	str r2, [r0, #0x18]
	str r2, [r0, #8]
	mov r1, #0xe
	str r1, [r0, #0x10]
	str r2, [r0, #0xc]
	bx lr
	arm_func_end FS_InitFile

	arm_func_start sub_020D7FC0
sub_020D7FC0: ; 0x020D7FC0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0xc
	mov r7, r1
	ldrb r1, [r7]
	mov r8, r0
	mov r6, r2
	cmp r1, #0x2f
	mov r5, r3
	cmpne r1, #0x5c
	bne _020D800C
	ldr r0, _020D8100 ; =0x021E362C
	mov r1, #0
	ldr r0, [r0]
	strh r1, [sp, #4]
	str r0, [sp]
	str r1, [sp, #8]
	strh r1, [sp, #6]
	add r7, r7, #1
	b _020D80B0
_020D800C:
	ldr r0, _020D8100 ; =0x021E362C
	add r3, sp, #0
	ldmia r0, {r0, r1, r2}
	stmia r3, {r0, r1, r2}
	mov r4, #0
_020D8020:
	ldrb r0, [r7, r4]
	cmp r0, #0
	cmpne r0, #0x2f
	cmpne r0, #0x5c
	beq _020D80B0
	cmp r0, #0x3a
	bne _020D80A4
	mov r0, r7
	mov r1, r4
	bl sub_020D7958
	cmp r0, #0
	addeq sp, sp, #0xc
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, pc}
	ldr r1, [r0, #0x1c]
	tst r1, #2
	movne r1, #1
	moveq r1, #0
	cmp r1, #0
	addeq sp, sp, #0xc
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, pc}
	mov r1, #0
	str r0, [sp]
	str r1, [sp, #8]
	strh r1, [sp, #6]
	strh r1, [sp, #4]
	add r0, r4, #1
	ldrb r0, [r7, r0]!
	cmp r0, #0x2f
	cmpne r0, #0x5c
	addeq r7, r7, #1
	b _020D80B0
_020D80A4:
	add r4, r4, #1
	cmp r4, #3
	ble _020D8020
_020D80B0:
	ldr r1, [sp]
	add r0, sp, #0
	str r1, [r8, #8]
	str r7, [r8, #0x3c]
	add r3, r8, #0x30
	ldmia r0, {r0, r1, r2}
	stmia r3, {r0, r1, r2}
	cmp r5, #0
	moveq r0, #0
	streq r0, [r8, #0x40]
	streq r6, [r8, #0x44]
	beq _020D80EC
	mov r0, #1
	str r0, [r8, #0x40]
	str r5, [r8, #0x44]
_020D80EC:
	mov r0, r8
	mov r1, #4
	bl sub_020D7788
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020D8100: .word 0x021E362C
	arm_func_end sub_020D7FC0

	arm_func_start sub_020D8104
sub_020D8104: ; 0x020D8104
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	ldr r4, [r7, #0x2c]
	ldr r0, [r7, #0x28]
	mov r6, r2
	str r1, [r7, #0x30]
	sub r0, r0, r4
	cmp r6, r0
	movgt r6, r0
	cmp r6, #0
	movlt r6, #0
	str r2, [r7, #0x34]
	mov r5, r3
	str r6, [r7, #0x38]
	cmp r5, #0
	ldreq r0, [r7, #0xc]
	mov r1, #0
	orreq r0, r0, #4
	streq r0, [r7, #0xc]
	mov r0, r7
	bl sub_020D7788
	cmp r5, #0
	bne _020D8178
	mov r0, r7
	bl FS_WaitAsync
	cmp r0, #0
	ldrne r0, [r7, #0x2c]
	subne r6, r0, r4
	mvneq r6, #0
_020D8178:
	mov r0, r6
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020D8104

	arm_func_start sub_020D8180
sub_020D8180: ; 0x020D8180
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x48
	mov r5, r0
	add r0, sp, #0
	mov r4, r1
	bl FS_InitFile
	add r0, sp, #0
	mov r1, r4
	mov r2, r5
	mov r3, #0
	bl sub_020D7FC0
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	add sp, sp, #0x48
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020D8180

	arm_func_start sub_020D81C0
sub_020D81C0: ; 0x020D81C0
	stmdb sp!, {r4, lr}
	mov r4, r0
	str r1, [r4, #8]
	ldr ip, [sp, #8]
	mov r1, #7
	str ip, [r4, #0x38]
	str r2, [r4, #0x30]
	str r3, [r4, #0x34]
	bl sub_020D7788
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r1, [r4, #0xc]
	mov r0, #1
	orr r1, r1, #0x10
	bic r1, r1, #0x20
	str r1, [r4, #0xc]
	ldmia sp!, {r4, pc}
	arm_func_end sub_020D81C0

	arm_func_start sub_020D8208
sub_020D8208: ; 0x020D8208
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, lr}
	ldr r1, [sp, #0xc]
	mov r4, r0
	cmp r1, #0
	moveq r0, #0
	ldmeqia sp!, {r4, lr}
	addeq sp, sp, #0x10
	bxeq lr
	str r1, [r4, #8]
	str r1, [r4, #0x30]
	ldr r2, [sp, #0x10]
	mov r1, #6
	str r2, [r4, #0x34]
	bl sub_020D7788
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, lr}
	addeq sp, sp, #0x10
	bxeq lr
	ldr r1, [r4, #0xc]
	mov r0, #1
	orr r1, r1, #0x10
	bic r1, r1, #0x20
	str r1, [r4, #0xc]
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end sub_020D8208

	arm_func_start FS_OpenFile
FS_OpenFile: ; 0x020D8278
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	mov r4, r0
	add r0, sp, #0
	bl sub_020D8180
	cmp r0, #0
	beq _020D82B4
	add r1, sp, #0
	mov r0, r4
	ldmia r1, {r1, r2}
	bl sub_020D8208
	cmp r0, #0
	addne sp, sp, #8
	movne r0, #1
	ldmneia sp!, {r4, pc}
_020D82B4:
	mov r0, #0
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	arm_func_end FS_OpenFile

	arm_func_start FS_CloseFile
FS_CloseFile: ; 0x020D82C0
	stmdb sp!, {r4, lr}
	mov r1, #8
	mov r4, r0
	bl sub_020D7788
	cmp r0, #0
	mov r0, #0
	ldmeqia sp!, {r4, pc}
	str r0, [r4, #8]
	mov r0, #0xe
	str r0, [r4, #0x10]
	ldr r1, [r4, #0xc]
	mov r0, #1
	bic r1, r1, #0x30
	str r1, [r4, #0xc]
	ldmia sp!, {r4, pc}
	arm_func_end FS_CloseFile

	arm_func_start FS_WaitAsync
FS_WaitAsync: ; 0x020D82FC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r6, r0
	mov r5, #0
	bl OS_DisableInterrupts
	ldr r1, [r6, #0xc]
	mov r4, r0
	tst r1, #1
	movne r0, #1
	moveq r0, r5
	cmp r0, #0
	beq _020D838C
	ldr r0, [r6, #0xc]
	tst r0, #0x44
	moveq r5, #1
	movne r5, #0
	cmp r5, #0
	beq _020D8364
	ldr r0, [r6, #0xc]
	orr r0, r0, #4
	str r0, [r6, #0xc]
_020D834C:
	add r0, r6, #0x18
	bl OS_SleepThread
	ldr r0, [r6, #0xc]
	tst r0, #0x40
	beq _020D834C
	b _020D838C
_020D8364:
	mov r7, #0
	mov r8, #1
_020D836C:
	add r0, r6, #0x18
	bl OS_SleepThread
	ldr r0, [r6, #0xc]
	tst r0, #1
	movne r0, r8
	moveq r0, r7
	cmp r0, #0
	bne _020D836C
_020D838C:
	mov r0, r4
	bl OS_RestoreInterrupts
	cmp r5, #0
	beq _020D83A8
	mov r0, r6
	bl sub_020D7744
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020D83A8:
	ldr r0, [r6, #0x14]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end FS_WaitAsync

	arm_func_start sub_020D83BC
sub_020D83BC: ; 0x020D83BC
	ldr ip, _020D83C8 ; =sub_020D8104
	mov r3, #1
	bx ip
	.align 2, 0
_020D83C8: .word sub_020D8104
	arm_func_end sub_020D83BC

	arm_func_start FS_ReadFile
FS_ReadFile: ; 0x020D83CC
	ldr ip, _020D83D8 ; =sub_020D8104
	mov r3, #0
	bx ip
	.align 2, 0
_020D83D8: .word sub_020D8104
	arm_func_end FS_ReadFile

	arm_func_start FS_SeekFile
FS_SeekFile: ; 0x020D83DC
	cmp r2, #0
	beq _020D83F8
	cmp r2, #1
	beq _020D8404
	cmp r2, #2
	beq _020D8410
	b _020D841C
_020D83F8:
	ldr r2, [r0, #0x24]
	add r1, r1, r2
	b _020D8424
_020D8404:
	ldr r2, [r0, #0x2c]
	add r1, r1, r2
	b _020D8424
_020D8410:
	ldr r2, [r0, #0x28]
	add r1, r1, r2
	b _020D8424
_020D841C:
	mov r0, #0
	bx lr
_020D8424:
	ldr r2, [r0, #0x24]
	cmp r1, r2
	movlt r1, r2
	ldr r2, [r0, #0x28]
	cmp r1, r2
	movgt r1, r2
	str r1, [r0, #0x2c]
	mov r0, #1
	bx lr
	arm_func_end FS_SeekFile

	arm_func_start sub_020D8448
sub_020D8448: ; 0x020D8448
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x54
	mov r4, r0
	add r0, sp, #0xc
	bl FS_InitFile
	add r0, sp, #0xc
	add r3, sp, #0
	mov r1, r4
	mov r2, #0
	bl sub_020D7FC0
	cmp r0, #0
	addeq sp, sp, #0x54
	moveq r0, #0
	ldmeqia sp!, {r3, r4, pc}
	ldr r3, _020D849C ; =0x021E362C
	add r0, sp, #0
	ldmia r0, {r0, r1, r2}
	stmia r3, {r0, r1, r2}
	mov r0, #1
	add sp, sp, #0x54
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_020D849C: .word 0x021E362C
	arm_func_end sub_020D8448

	arm_func_start sub_020D84A0
sub_020D84A0: ; 0x020D84A0
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl CARD_IsPulledOut
	cmp r0, #0
	movne r1, #5
	moveq r1, #0
	mov r0, r4
	bl sub_020D7EDC
	ldmia sp!, {r4, pc}
	arm_func_end sub_020D84A0

	arm_func_start sub_020D84C4
sub_020D84C4: ; 0x020D84C4
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	ldr ip, _020D8504 ; =sub_020D84A0
	mov lr, r1
	str ip, [sp]
	str r0, [sp, #4]
	mov r1, #1
	ldr r0, _020D8508 ; =0x021E363C
	str r1, [sp, #8]
	mov r1, r2
	ldr r0, [r0, #4]
	mov r2, lr
	bl sub_020DD754
	mov r0, #6
	add sp, sp, #0xc
	ldmia sp!, {pc}
	.align 2, 0
_020D8504: .word sub_020D84A0
_020D8508: .word 0x021E363C
	arm_func_end sub_020D84C4

	arm_func_start sub_020D850C
sub_020D850C: ; 0x020D850C
	mov r0, #1
	bx lr
	arm_func_end sub_020D850C

	arm_func_start sub_020D8514
sub_020D8514: ; 0x020D8514
	stmdb sp!, {r3, lr}
	cmp r1, #1
	beq _020D856C
	cmp r1, #9
	beq _020D8534
	cmp r1, #0xa
	beq _020D8550
	b _020D8574
_020D8534:
	ldr r0, _020D857C ; =0x021E363C
	ldr r0, [r0]
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl CARD_LockRom
	mov r0, #0
	ldmia sp!, {r3, pc}
_020D8550:
	ldr r0, _020D857C ; =0x021E363C
	ldr r0, [r0]
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_020DC988
	mov r0, #0
	ldmia sp!, {r3, pc}
_020D856C:
	mov r0, #4
	ldmia sp!, {r3, pc}
_020D8574:
	mov r0, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_020D857C: .word 0x021E363C
	arm_func_end sub_020D8514

	arm_func_start sub_020D8580
sub_020D8580: ; 0x020D8580
	mov r0, #1
	bx lr
	arm_func_end sub_020D8580

	arm_func_start sub_020D8588
sub_020D8588: ; 0x020D8588
	mov r0, #4
	bx lr
	arm_func_end sub_020D8588

	arm_func_start sub_020D8590
sub_020D8590: ; 0x020D8590
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	ldr r1, _020D86B0 ; =0x021E363C
	str r0, [r1, #4]
	bl OS_GetLockID
	ldr r1, _020D86B0 ; =0x021E363C
	mov r2, #0
	str r0, [r1]
	str r2, [r1, #8]
	str r2, [r1, #0xc]
	str r2, [r1, #0x10]
	str r2, [r1, #0x14]
	bl CARD_Init
	ldr r0, _020D86B4 ; =0x021E3654
	bl sub_020D792C
	ldr r0, _020D86B4 ; =0x021E3654
	ldr r1, _020D86B8 ; =_02110C9C
	mov r2, #3
	bl sub_020D7998
	ldr r4, _020D86BC ; =0x027FFC40
	ldrh r0, [r4]
	cmp r0, #2
	bne _020D8648
	ldr r3, _020D86B0 ; =0x021E363C
	mvn r2, #0
	str r2, [r3, #8]
	mov ip, #0
	str ip, [r3, #0xc]
	str r2, [r3, #0x10]
	ldr r0, _020D86B4 ; =0x021E3654
	ldr r1, _020D86C0 ; =sub_020D8588
	str ip, [r3, #0x14]
	bl sub_020D7EBC
	mov r1, #0
	str r1, [sp]
	ldr r0, _020D86C4 ; =sub_020D8580
	str r1, [sp, #4]
	str r0, [sp, #8]
	ldr ip, _020D86C8 ; =sub_020D850C
	ldr r0, _020D86B4 ; =0x021E3654
	mov r2, r1
	mov r3, r1
	str ip, [sp, #0xc]
	bl sub_020D7AD0
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
_020D8648:
	ldr r0, _020D86B4 ; =0x021E3654
	ldr r1, _020D86CC ; =sub_020D8514
	ldr r2, _020D86D0 ; =0x00000602
	bl sub_020D7EBC
	ldr r1, [r4, #0x200]
	mvn r0, #0
	cmp r1, r0
	cmpne r1, #0
	ldrne r2, [r4, #0x208]
	cmpne r2, r0
	cmpne r2, #0
	addeq sp, sp, #0x10
	ldmeqia sp!, {r4, pc}
	str r1, [sp]
	ldr r0, [r4, #0x204]
	ldr r1, _020D86D4 ; =sub_020D84C4
	str r0, [sp, #4]
	ldr r0, _020D86C8 ; =sub_020D850C
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	ldr r3, [r4, #0x20c]
	ldr r0, _020D86B4 ; =0x021E3654
	mov r1, #0
	bl sub_020D7AD0
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_020D86B0: .word 0x021E363C
_020D86B4: .word 0x021E3654
_020D86B8: .word _02110C9C
_020D86BC: .word 0x027FFC40
_020D86C0: .word sub_020D8588
_020D86C4: .word sub_020D8580
_020D86C8: .word sub_020D850C
_020D86CC: .word sub_020D8514
_020D86D0: .word 0x00000602
_020D86D4: .word sub_020D84C4
	arm_func_end sub_020D8590

	arm_func_start FS_SetDefaultDMA
FS_SetDefaultDMA: ; 0x020D86D8
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	bl OS_DisableInterrupts
	mov r4, r0
	ldr r1, _020D8720 ; =0x021E363C
	ldr r0, _020D8724 ; =0x021E3654
	ldr r5, [r1, #4]
	bl sub_020D7DB0
	ldr r1, _020D8720 ; =0x021E363C
	cmp r0, #0
	str r6, [r1, #4]
	beq _020D8710
	ldr r0, _020D8724 ; =0x021E3654
	bl sub_020D7E4C
_020D8710:
	mov r0, r4
	bl OS_RestoreInterrupts
	mov r0, r5
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020D8720: .word 0x021E363C
_020D8724: .word 0x021E3654
	arm_func_end FS_SetDefaultDMA

	arm_func_start sub_020D8728
sub_020D8728: ; 0x020D8728
	ldr ip, _020D8740 ; =sub_020D7C00
	mov r3, r0
	mov r2, r1
	ldr r0, _020D8744 ; =0x021E3654
	mov r1, r3
	bx ip
	.align 2, 0
_020D8740: .word sub_020D7C00
_020D8744: .word 0x021E3654
	arm_func_end sub_020D8728

	arm_func_start FSi_GetOverlayBinarySize
FSi_GetOverlayBinarySize: ; 0x020D8748
	ldr r1, [r0, #0x1c]
	mov r2, r1, lsr #0x18
	tst r2, #1
	movne r0, r1, lsl #8
	movne r0, r0, lsr #8
	ldreq r0, [r0, #8]
	bx lr
	arm_func_end FSi_GetOverlayBinarySize

	arm_func_start FS_ClearOverlayImage
FS_ClearOverlayImage: ; 0x020D8764
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, [r0, #0xc]
	ldmib r0, {r4, r5}
	add r6, r5, r1
	mov r0, r4
	mov r1, r6
	bl IC_InvalidateRange
	mov r0, r4
	mov r1, r6
	bl DC_InvalidateRange
	add r0, r4, r5
	sub r2, r6, r5
	mov r1, #0
	bl MI_CpuFill8
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end FS_ClearOverlayImage

	arm_func_start FS_GetOverlayFileID
FS_GetOverlayFileID: ; 0x020D87A0
	sub sp, sp, #8
	ldr r1, [r1, #0x18]
	ldr r2, _020D87C4 ; =0x021E3654
	str r1, [sp, #4]
	str r2, [r0]
	str r2, [sp]
	str r1, [r0, #4]
	add sp, sp, #8
	bx lr
	.align 2, 0
_020D87C4: .word 0x021E3654
	arm_func_end FS_GetOverlayFileID

	arm_func_start FSi_LoadOverlayInfoCore
FSi_LoadOverlayInfoCore: ; 0x020D87C8
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x54
	movs sb, r1
	ldreq r7, [sp, #0x74]
	ldreq r6, [sp, #0x70]
	ldrne r7, [sp, #0x7c]
	ldrne r6, [sp, #0x78]
	cmp r7, r2, lsl #5
	mov r4, r0
	mov r8, r3
	mov r5, r2, lsl #5
	addls sp, sp, #0x54
	movls r0, #0
	ldmlsia sp!, {r4, r5, r6, r7, r8, sb, pc}
	add r0, sp, #0xc
	bl FS_InitFile
	mvn ip, #0
	add r0, sp, #0xc
	mov r1, r8
	add r2, r6, r5
	add r3, r6, r7
	str ip, [sp]
	bl sub_020D81C0
	cmp r0, #0
	addeq sp, sp, #0x54
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, pc}
	add r0, sp, #0xc
	mov r1, r4
	mov r2, #0x20
	bl FS_ReadFile
	cmp r0, #0x20
	add r0, sp, #0xc
	beq _020D8860
	bl FS_CloseFile
	add sp, sp, #0x54
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
_020D8860:
	bl FS_CloseFile
	add r0, sp, #4
	mov r1, r4
	str sb, [r4, #0x20]
	bl FS_GetOverlayFileID
	add r1, sp, #4
	add r0, sp, #0xc
	ldmia r1, {r1, r2}
	bl sub_020D8208
	cmp r0, #0
	addeq sp, sp, #0x54
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, pc}
	ldr r1, [sp, #0x30]
	add r0, sp, #0xc
	str r1, [r4, #0x24]
	ldr r2, [sp, #0x34]
	ldr r1, [sp, #0x30]
	sub r1, r2, r1
	str r1, [r4, #0x28]
	bl FS_CloseFile
	mov r0, #1
	add sp, sp, #0x54
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	arm_func_end FSi_LoadOverlayInfoCore

	arm_func_start FS_LoadOverlayInfo
FS_LoadOverlayInfo: ; 0x020D88C0
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x60
	movs r4, r1
	mov r5, r0
	ldreq r0, _020D89AC ; =0x021E3644
	ldrne r0, _020D89B0 ; =0x021E364C
	ldr ip, [r0]
	cmp ip, #0
	beq _020D8970
	ldr r0, [r0, #4]
	mov r3, r2, lsl #5
	cmp r0, r2, lsl #5
	addls sp, sp, #0x60
	movls r0, #0
	ldmlsia sp!, {r3, r4, r5, pc}
	mov r1, r5
	add r0, ip, r3
	mov r2, #0x20
	bl MIi_CpuCopy8
	add r0, sp, #0x18
	str r4, [r5, #0x20]
	bl FS_InitFile
	add r0, sp, #0x10
	mov r1, r5
	bl FS_GetOverlayFileID
	add r1, sp, #0x10
	add r0, sp, #0x18
	ldmia r1, {r1, r2}
	bl sub_020D8208
	cmp r0, #0
	addeq sp, sp, #0x60
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r1, [sp, #0x3c]
	add r0, sp, #0x18
	str r1, [r5, #0x24]
	ldr r2, [sp, #0x40]
	ldr r1, [sp, #0x3c]
	sub r1, r2, r1
	str r1, [r5, #0x28]
	bl FS_CloseFile
	add sp, sp, #0x60
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
_020D8970:
	ldr ip, _020D89B4 ; =0x027FFE50
	ldr r3, _020D89B8 ; =0x021E3654
	ldr r1, [ip]
	mov r0, r5
	str r1, [sp]
	ldr r5, [ip, #4]
	mov r1, r4
	str r5, [sp, #4]
	ldr r4, [ip, #8]
	str r4, [sp, #8]
	ldr r4, [ip, #0xc]
	str r4, [sp, #0xc]
	bl FSi_LoadOverlayInfoCore
	add sp, sp, #0x60
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020D89AC: .word 0x021E3644
_020D89B0: .word 0x021E364C
_020D89B4: .word 0x027FFE50
_020D89B8: .word 0x021E3654
	arm_func_end FS_LoadOverlayInfo

	arm_func_start FS_LoadOverlayImageAsync
FS_LoadOverlayImageAsync: ; 0x020D89BC
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	mov r5, r1
	mov r6, r0
	mov r0, r5
	bl FS_InitFile
	add r0, sp, #0
	mov r1, r6
	bl FS_GetOverlayFileID
	add r1, sp, #0
	mov r0, r5
	ldmia r1, {r1, r2}
	bl sub_020D8208
	cmp r0, #0
	addeq sp, sp, #8
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, r6
	bl FSi_GetOverlayBinarySize
	mov r4, r0
	mov r0, r6
	bl FS_ClearOverlayImage
	ldr r1, [r6, #4]
	mov r0, r5
	mov r2, r4
	bl sub_020D83BC
	cmp r4, r0
	addeq sp, sp, #8
	moveq r0, #1
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, r5
	bl FS_CloseFile
	mov r0, #0
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end FS_LoadOverlayImageAsync

	arm_func_start FS_LoadOverlayImage
FS_LoadOverlayImage: ; 0x020D8A48
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x50
	mov r5, r0
	add r0, sp, #8
	bl FS_InitFile
	add r0, sp, #0
	mov r1, r5
	bl FS_GetOverlayFileID
	add r1, sp, #0
	add r0, sp, #8
	ldmia r1, {r1, r2}
	bl sub_020D8208
	cmp r0, #0
	addeq sp, sp, #0x50
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r5
	bl FSi_GetOverlayBinarySize
	mov r4, r0
	mov r0, r5
	bl FS_ClearOverlayImage
	ldr r1, [r5, #4]
	add r0, sp, #8
	mov r2, r4
	bl FS_ReadFile
	cmp r4, r0
	add r0, sp, #8
	beq _020D8AC8
	bl FS_CloseFile
	add sp, sp, #0x50
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_020D8AC8:
	bl FS_CloseFile
	mov r0, #1
	add sp, sp, #0x50
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end FS_LoadOverlayImage

	arm_func_start FSi_CompareDigest
FSi_CompareDigest: ; 0x020D8AD8
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x58
	mov r4, r0
	mov r6, r1
	mov r5, r2
	add r0, sp, #0x44
	mov r1, #0
	mov r2, #0x14
	bl MI_CpuFill8
	ldr r2, _020D8B68 ; =_02110CA0
	add r1, sp, #4
	ldmia r2, {r0, r2}
	bl MIi_CpuCopy8
	ldr r3, _020D8B68 ; =_02110CA0
	mov r1, r6
	ldr ip, [r3, #4]
	mov r2, r5
	add r0, sp, #0x44
	add r3, sp, #4
	str ip, [sp]
	bl sub_020D9714
	add r3, sp, #0x44
	mov r2, #0
_020D8B34:
	ldr r1, [r3]
	ldr r0, [r4, r2]
	cmp r1, r0
	bne _020D8B54
	add r2, r2, #4
	cmp r2, #0x14
	add r3, r3, #4
	blo _020D8B34
_020D8B54:
	cmp r2, #0x14
	moveq r0, #1
	movne r0, #0
	add sp, sp, #0x58
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020D8B68: .word _02110CA0
	arm_func_end FSi_CompareDigest

	arm_func_start FS_StartOverlay
FS_StartOverlay: ; 0x020D8B6C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl FSi_GetOverlayBinarySize
	ldr r1, _020D8C50 ; =0x027FFC40
	mov r4, r0
	ldrh r0, [r1]
	cmp r0, #2
	bne _020D8BFC
	ldr r1, [r5, #0x1c]
	mov r0, #0
	mov r1, r1, lsr #0x18
	tst r1, #2
	beq _020D8BDC
	ldr r1, _020D8C54 ; =SDK_OVERLAY_DIGEST_END
	ldr r3, _020D8C58 ; =SDK_OVERLAY_DIGEST
	ldr r2, _020D8C5C ; =0x66666667
	sub ip, r1, r3
	smull r1, lr, r2, ip
	mov r1, ip, lsr #0x1f
	ldr r2, [r5]
	add lr, r1, lr, asr #3
	cmp r2, lr
	bhs _020D8BDC
	mov r0, #0x14
	mla r0, r2, r0, r3
	ldr r1, [r5, #4]
	mov r2, r4
	bl FSi_CompareDigest
_020D8BDC:
	cmp r0, #0
	bne _020D8BFC
	ldr r0, [r5, #4]
	mov r2, r4
	mov r1, #0
	bl MI_CpuFill8
	bl OS_Terminate
	ldmia sp!, {r3, r4, r5, pc}
_020D8BFC:
	ldr r0, [r5, #0x1c]
	mov r0, r0, lsr #0x18
	tst r0, #1
	beq _020D8C18
	ldr r0, [r5, #4]
	add r0, r0, r4
	bl MIi_UncompressBackward
_020D8C18:
	ldmib r5, {r0, r1}
	bl DC_FlushRange
	ldr r4, [r5, #0x10]
	ldr r5, [r5, #0x14]
	cmp r4, r5
	ldmhsia sp!, {r3, r4, r5, pc}
_020D8C30:
	ldr r0, [r4]
	cmp r0, #0
	beq _020D8C40
	blx r0
_020D8C40:
	add r4, r4, #4
	cmp r4, r5
	blo _020D8C30
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020D8C50: .word 0x027FFC40
_020D8C54: .word SDK_OVERLAY_DIGEST_END
_020D8C58: .word SDK_OVERLAY_DIGEST
_020D8C5C: .word 0x66666667
	arm_func_end FS_StartOverlay

	arm_func_start FS_EndOverlay
FS_EndOverlay: ; 0x020D8C60
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov fp, r0
_020D8C68:
	ldr r1, [fp, #8]
	ldr r0, [fp, #0xc]
	mov r4, #0
	ldr r6, [fp, #4]
	add r0, r1, r0
	mov r5, r4
	add r7, r6, r0
	bl OS_DisableInterrupts
	ldr r1, _020D8D4C ; =0x021E58E8
	mov ip, r4
	ldr lr, [r1]
	mov r8, lr
	cmp lr, #0
	beq _020D8D14
	mov r2, r4
_020D8CA4:
	ldr sl, [r8, #8]
	ldr sb, [r8]
	cmp sl, #0
	ldr r3, [r8, #4]
	bne _020D8CC8
	cmp r3, r6
	blo _020D8CC8
	cmp r3, r7
	blo _020D8CD8
_020D8CC8:
	cmp sl, r6
	blo _020D8D04
	cmp sl, r7
	bhs _020D8D04
_020D8CD8:
	cmp r5, #0
	strne r8, [r5]
	moveq r4, r8
	cmp lr, r8
	streq sb, [r1]
	moveq lr, sb
	str r2, [r8]
	cmp ip, #0
	mov r5, r8
	strne sb, [ip]
	b _020D8D08
_020D8D04:
	mov ip, r8
_020D8D08:
	mov r8, sb
	cmp sb, #0
	bne _020D8CA4
_020D8D14:
	bl OS_RestoreInterrupts
	cmp r4, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020D8D20:
	ldr r1, [r4, #4]
	ldr r5, [r4]
	cmp r1, #0
	beq _020D8D38
	ldr r0, [r4, #8]
	blx r1
_020D8D38:
	mov r4, r5
	cmp r5, #0
	bne _020D8D20
	b _020D8C68
_020D8D48:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020D8D4C: .word 0x021E58E8
	arm_func_end FS_EndOverlay

	arm_func_start FS_UnloadOverlayImage
FS_UnloadOverlayImage: ; 0x020D8D50
	stmdb sp!, {r3, lr}
	bl FS_EndOverlay
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end FS_UnloadOverlayImage

	arm_func_start FS_LoadOverlay
FS_LoadOverlay: ; 0x020D8D60
	stmdb sp!, {lr}
	sub sp, sp, #0x2c
	mov r3, r0
	mov r2, r1
	add r0, sp, #0
	mov r1, r3
	bl FS_LoadOverlayInfo
	cmp r0, #0
	beq _020D8D94
	add r0, sp, #0
	bl FS_LoadOverlayImage
	cmp r0, #0
	bne _020D8DA0
_020D8D94:
	add sp, sp, #0x2c
	mov r0, #0
	ldmia sp!, {pc}
_020D8DA0:
	add r0, sp, #0
	bl FS_StartOverlay
	mov r0, #1
	add sp, sp, #0x2c
	ldmia sp!, {pc}
	arm_func_end FS_LoadOverlay

	arm_func_start FS_UnloadOverlay
FS_UnloadOverlay: ; 0x020D8DB4
	stmdb sp!, {lr}
	sub sp, sp, #0x2c
	mov r3, r0
	mov r2, r1
	add r0, sp, #0
	mov r1, r3
	bl FS_LoadOverlayInfo
	cmp r0, #0
	beq _020D8DE8
	add r0, sp, #0
	bl FS_UnloadOverlayImage
	cmp r0, #0
	bne _020D8DF4
_020D8DE8:
	add sp, sp, #0x2c
	mov r0, #0
	ldmia sp!, {pc}
_020D8DF4:
	mov r0, #1
	add sp, sp, #0x2c
	ldmia sp!, {pc}
	arm_func_end FS_UnloadOverlay

	arm_func_start sub_020D8E00
sub_020D8E00: ; 0x020D8E00
	ldr r2, _020D8E30 ; =0x67452301
	ldr r1, _020D8E34 ; =0xEFCDAB89
	str r2, [r0]
	ldr r2, _020D8E38 ; =0x98BADCFE
	str r1, [r0, #4]
	ldr r1, _020D8E3C ; =0x10325476
	str r2, [r0, #8]
	str r1, [r0, #0xc]
	mov r1, #0
	str r1, [r0, #0x10]
	str r1, [r0, #0x14]
	bx lr
	.align 2, 0
_020D8E30: .word 0x67452301
_020D8E34: .word 0xEFCDAB89
_020D8E38: .word 0x98BADCFE
_020D8E3C: .word 0x10325476
	arm_func_end sub_020D8E00

	arm_func_start sub_020D8E40
sub_020D8E40: ; 0x020D8E40
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r6, r0
	ldr r3, [r6, #0x10]
	mov r4, r2
	and ip, r3, #0x3f
	ldr r0, [r6, #0x14]
	adds r3, r3, r4
	str r3, [r6, #0x10]
	adc r0, r0, #0
	rsb r7, ip, #0x40
	mov r5, r1
	str r0, [r6, #0x14]
	cmp r7, r4
	bls _020D8E94
	cmp r4, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	add r1, r6, #0x18
	mov r0, r5
	add r1, r1, ip
	bl MIi_CpuCopy8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020D8E94:
	add r1, r6, #0x18
	mov r0, r5
	mov r2, r7
	add r1, r1, ip
	bl MIi_CpuCopy8
	mov r0, r6
	bl sub_020D8FC0
	sub r4, r4, r7
	mov r8, r4, lsr #6
	cmp r8, #0
	add r7, r5, r7
	ble _020D8EF0
	mov r5, #0x40
_020D8EC8:
	mov r0, r7
	mov r2, r5
	add r1, r6, #0x18
	bl MIi_CpuCopy8
	mov r0, r6
	add r7, r7, #0x40
	bl sub_020D8FC0
	sub r8, r8, #1
	cmp r8, #0
	bgt _020D8EC8
_020D8EF0:
	ands r2, r4, #0x3f
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	mov r0, r7
	add r1, r6, #0x18
	bl MIi_CpuCopy8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_020D8E40

	arm_func_start sub_020D8F08
sub_020D8F08: ; 0x020D8F08
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r1
	ldr r1, [r4, #0x14]
	ldr r3, [r4, #0x10]
	mov r5, r0
	mov r6, r1, lsl #3
	ldr r1, _020D8FBC ; =_02110CA8
	mov r0, r4
	mov r2, #1
	orr r6, r6, r3, lsr #29
	mov r7, r3, lsl #3
	bl sub_020D8E40
	ldr r0, [r4, #0x10]
	mov r1, #0
	and r3, r0, #0x3f
	rsb r2, r3, #0x40
	cmp r2, #8
	bhs _020D8F6C
	add r0, r4, #0x18
	add r0, r0, r3
	bl MI_CpuFill8
	mov r0, r4
	bl sub_020D8FC0
	mov r3, #0
	mov r2, #0x40
_020D8F6C:
	cmp r2, #8
	bls _020D8F88
	add r0, r4, #0x18
	add r0, r0, r3
	sub r2, r2, #8
	mov r1, #0
	bl MI_CpuFill8
_020D8F88:
	str r7, [r4, #0x50]
	mov r0, r4
	str r6, [r4, #0x54]
	bl sub_020D8FC0
	mov r0, r4
	mov r1, r5
	mov r2, #0x10
	bl MIi_CpuCopy8
	mov r0, r4
	mov r1, #0
	mov r2, #0x58
	bl MI_CpuFill8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020D8FBC: .word _02110CA8
	arm_func_end sub_020D8F08

	arm_func_start sub_020D8FC0
sub_020D8FC0: ; 0x020D8FC0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldmia r0, {r2, r3, ip, lr}
	add r4, r0, #0x18
	ldr r5, _020D936C ; =_02110D6C
	mov r7, r4
	mov r8, #0
_020D8FD8:
	mvn r1, r3
	and r6, r3, ip
	and r1, r1, lr
	orr r1, r6, r1
	ldr r6, [r7]
	add r1, r2, r1
	ldr r2, [r5]
	add r1, r6, r1
	add r2, r2, r1
	mov r1, r2, lsr #0x19
	orr r1, r1, r2, lsl #7
	add r2, r3, r1
	mvn r1, r2
	and r6, r2, r3
	and r1, r1, ip
	orr r1, r6, r1
	ldr r6, [r7, #4]
	add r1, lr, r1
	ldr sb, [r5, #4]
	add r1, r6, r1
	add r6, sb, r1
	mov r1, r6, lsr #0x14
	orr r1, r1, r6, lsl #12
	add lr, r2, r1
	mvn r1, lr
	and r6, lr, r2
	and r1, r1, r3
	orr r1, r6, r1
	ldr sb, [r7, #8]
	add r6, ip, r1
	ldr r1, [r7, #0xc]
	add sb, sb, r6
	ldr sl, [r5, #8]
	ldr r6, [r5, #0xc]
	add sl, sl, sb
	mov sb, sl, lsr #0xf
	orr sb, sb, sl, lsl #17
	add ip, lr, sb
	add r5, r5, #0x10
	add r7, r7, #0x10
	and sl, ip, lr
	mvn sb, ip
	and sb, sb, r2
	orr sb, sl, sb
	add r3, r3, sb
	add r1, r1, r3
	add r3, r6, r1
	mov r1, r3, lsr #0xa
	orr r1, r1, r3, lsl #22
	add r3, ip, r1
	add r8, r8, #1
	cmp r8, #4
	blt _020D8FD8
	ldr r1, _020D9370 ; =_02110CAC
	mov r6, #0
_020D90B4:
	mvn r7, lr
	ldr sb, [r1]
	and r8, r3, lr
	and r7, ip, r7
	orr r7, r8, r7
	ldr r8, [r4, sb, lsl #2]
	add r2, r2, r7
	ldr r7, [r5]
	add r2, r8, r2
	add r7, r7, r2
	mov r2, r7, lsr #0x1b
	orr r2, r2, r7, lsl #5
	add r2, r3, r2
	mvn r8, ip
	ldr r7, [r1, #4]
	and sb, r2, ip
	and r8, r3, r8
	orr sl, sb, r8
	mvn r8, r3
	ldr sb, [r1, #8]
	ldr fp, [r4, r7, lsl #2]
	add r7, lr, sl
	add r7, fp, r7
	ldr sl, [r5, #4]
	ldr sb, [r4, sb, lsl #2]
	add sl, sl, r7
	ldr r7, [r1, #0xc]
	and r8, r2, r8
	ldr r7, [r4, r7, lsl #2]
	mov fp, sl, lsr #0x17
	orr sl, fp, sl, lsl #9
	add lr, r2, sl
	ldr sl, [r5, #8]
	and fp, lr, r3
	orr r8, fp, r8
	add r8, ip, r8
	add r8, sb, r8
	add sb, sl, r8
	mov r8, sb, lsr #0x12
	orr r8, r8, sb, lsl #14
	add ip, lr, r8
	mvn r8, r2
	and sb, lr, r8
	ldr r8, [r5, #0xc]
	add r5, r5, #0x10
	add r1, r1, #0x10
	and sl, ip, r2
	orr sb, sl, sb
	add r3, r3, sb
	add r3, r7, r3
	add r7, r8, r3
	mov r3, r7, lsr #0xc
	orr r3, r3, r7, lsl #20
	add r3, ip, r3
	add r6, r6, #1
	cmp r6, #4
	blt _020D90B4
	mov r6, #0
_020D919C:
	ldr r8, [r1]
	eor r7, r3, ip
	eor r7, lr, r7
	ldr r8, [r4, r8, lsl #2]
	add r2, r2, r7
	ldr r7, [r5]
	add r2, r8, r2
	add r7, r7, r2
	mov r2, r7, lsr #0x1c
	orr r2, r2, r7, lsl #4
	add r2, r3, r2
	ldr r8, [r1, #4]
	eor r7, r2, r3
	eor r7, ip, r7
	ldr r8, [r4, r8, lsl #2]
	add r7, lr, r7
	ldr sb, [r1, #8]
	ldr sl, [r5, #4]
	add r7, r8, r7
	add r8, sl, r7
	mov r7, r8, lsr #0x15
	orr r7, r7, r8, lsl #11
	add lr, r2, r7
	eor r8, lr, r2
	ldr r7, [r1, #0xc]
	ldr sb, [r4, sb, lsl #2]
	eor r8, r3, r8
	add r8, ip, r8
	add sb, sb, r8
	ldr sl, [r5, #8]
	ldr r8, [r4, r7, lsl #2]
	add sb, sl, sb
	mov r7, sb, lsr #0x10
	orr r7, r7, sb, lsl #16
	add ip, lr, r7
	eor r7, ip, lr
	eor r7, r2, r7
	add r3, r3, r7
	add r3, r8, r3
	ldr r7, [r5, #0xc]
	add r5, r5, #0x10
	add r7, r7, r3
	add r1, r1, #0x10
	mov r3, r7, lsr #9
	orr r3, r3, r7, lsl #23
	add r3, ip, r3
	add r6, r6, #1
	cmp r6, #4
	blt _020D919C
	mov r8, #0
_020D9264:
	mvn r6, lr
	ldr r7, [r1]
	orr r6, r3, r6
	eor r6, ip, r6
	ldr r7, [r4, r7, lsl #2]
	add r2, r2, r6
	ldr r6, [r5]
	add r2, r7, r2
	add r6, r6, r2
	mov r2, r6, lsr #0x1a
	orr r2, r2, r6, lsl #6
	add r2, r3, r2
	mvn r6, ip
	ldr sb, [r1, #4]
	orr r6, r2, r6
	eor r7, r3, r6
	ldr r6, [r1, #8]
	ldr sb, [r4, sb, lsl #2]
	add r7, lr, r7
	ldr sl, [r5, #4]
	add r7, sb, r7
	add sb, sl, r7
	mov r7, sb, lsr #0x16
	orr sb, r7, sb, lsl #10
	ldr r7, [r1, #0xc]
	add lr, r2, sb
	mvn sb, r3
	ldr r6, [r4, r6, lsl #2]
	orr sb, lr, sb
	eor sb, r2, sb
	add sb, ip, sb
	add sb, r6, sb
	ldr sl, [r5, #8]
	ldr r6, [r4, r7, lsl #2]
	add sb, sl, sb
	mov r7, sb, lsr #0x11
	orr sb, r7, sb, lsl #15
	ldr r7, [r5, #0xc]
	add ip, lr, sb
	add r5, r5, #0x10
	add r1, r1, #0x10
	mvn sb, r2
	orr sb, ip, sb
	eor sb, lr, sb
	add r3, r3, sb
	add r3, r6, r3
	add r6, r7, r3
	mov r3, r6, lsr #0xb
	orr r3, r3, r6, lsl #21
	add r3, ip, r3
	add r8, r8, #1
	cmp r8, #4
	blt _020D9264
	ldr r1, [r0]
	add r1, r1, r2
	str r1, [r0]
	ldr r1, [r0, #4]
	add r1, r1, r3
	str r1, [r0, #4]
	ldr r1, [r0, #8]
	add r1, r1, ip
	str r1, [r0, #8]
	ldr r1, [r0, #0xc]
	add r1, r1, lr
	str r1, [r0, #0xc]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020D936C: .word _02110D6C
_020D9370: .word _02110CAC
	arm_func_end sub_020D8FC0

	arm_func_start sub_020D9374
sub_020D9374: ; 0x020D9374
	ldr r1, _020D93B0 ; =0x67452301
	ldr r2, _020D93B4 ; =0xEFCDAB89
	str r1, [r0]
	ldr r1, _020D93B8 ; =0x98BADCFE
	str r2, [r0, #4]
	ldr r2, _020D93BC ; =0x10325476
	str r1, [r0, #8]
	ldr r1, _020D93C0 ; =0xC3D2E1F0
	str r2, [r0, #0xc]
	str r1, [r0, #0x10]
	mov r1, #0
	str r1, [r0, #0x14]
	str r1, [r0, #0x18]
	str r1, [r0, #0x1c]
	bx lr
	.align 2, 0
_020D93B0: .word 0x67452301
_020D93B4: .word 0xEFCDAB89
_020D93B8: .word 0x98BADCFE
_020D93BC: .word 0x10325476
_020D93C0: .word 0xC3D2E1F0
	arm_func_end sub_020D9374

	arm_func_start sub_020D93C4
sub_020D93C4: ; 0x020D93C4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	movs r8, r2
	mov sb, r1
	add r6, sl, #0x20
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, [sl, #0x14]
	add r1, r0, r8, lsl #3
	cmp r1, r0
	ldrlo r0, [sl, #0x18]
	addlo r0, r0, #1
	strlo r0, [sl, #0x18]
	ldr r0, [sl, #0x18]
	add r0, r0, r8, lsr #29
	str r0, [sl, #0x18]
	str r1, [sl, #0x14]
	ldr r1, [sl, #0x1c]
	cmp r1, #0
	beq _020D947C
	add r0, r1, r8
	cmp r0, #0x40
	blo _020D945C
	rsb r4, r1, #0x40
	mov r0, sb
	mov r2, r4
	add r1, r6, r1
	bl MIi_CpuCopy8
	ldr r1, _020D9514 ; =_02110E70
	mov r0, sl
	ldr r3, [r1]
	mov r1, r6
	mov r2, #0x40
	sub r8, r8, r4
	add sb, sb, r4
	blx r3
	mov r0, #0
	str r0, [sl, #0x1c]
	b _020D947C
_020D945C:
	mov r0, sb
	mov r2, r8
	add r1, r6, r1
	bl MIi_CpuCopy8
	ldr r0, [sl, #0x1c]
	add r0, r0, r8
	str r0, [sl, #0x1c]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020D947C:
	cmp r8, #0x40
	blo _020D94F4
	bic r7, r8, #0x3f
	tst sb, #3
	sub r8, r8, r7
	bne _020D94B4
	ldr r1, _020D9514 ; =_02110E70
	mov r0, sl
	ldr r3, [r1]
	mov r1, sb
	mov r2, r7
	blx r3
	add sb, sb, r7
	b _020D94F4
_020D94B4:
	mov r5, #0x40
	ldr r4, _020D9514 ; =_02110E70
	mov fp, r5
_020D94C0:
	mov r0, sb
	mov r1, r6
	mov r2, r5
	bl MIi_CpuCopy8
	ldr r3, [r4]
	mov r0, sl
	mov r1, r6
	add sb, sb, #0x40
	mov r2, fp
	blx r3
	sub r7, r7, #0x40
	cmp r7, #0
	bgt _020D94C0
_020D94F4:
	str r8, [sl, #0x1c]
	cmp r8, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, sb
	mov r1, r6
	mov r2, r8
	bl MIi_CpuCopy8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020D9514: .word _02110E70
	arm_func_end sub_020D93C4

	arm_func_start sub_020D9518
sub_020D9518: ; 0x020D9518
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, [sp, #0x10]
	mov r6, r1
	ldr r3, [r0, #0x1c]
	add r4, r0, #0x20
	tst r3, #3
	mov r2, r3, asr #2
	moveq r0, #0
	streq r0, [r4, r2, lsl #2]
	ldr r1, [sp, #0x10]
	mov r0, #0x80
	add r5, r1, #0x20
	strb r0, [r5, r3]
	add r3, r3, #1
	tst r3, #3
	beq _020D9570
	mov r0, #0
_020D9560:
	strb r0, [r5, r3]
	add r3, r3, #1
	tst r3, #3
	bne _020D9560
_020D9570:
	ldr r0, [sp, #0x10]
	add r2, r2, #1
	ldr r0, [r0, #0x1c]
	cmp r0, #0x38
	blt _020D95BC
	cmp r2, #0x10
	bge _020D95A0
	mov r0, #0
_020D9590:
	str r0, [r4, r2, lsl #2]
	add r2, r2, #1
	cmp r2, #0x10
	blt _020D9590
_020D95A0:
	ldr r1, _020D9710 ; =_02110E70
	ldr r0, [sp, #0x10]
	ldr r3, [r1]
	mov r1, r4
	mov r2, #0x40
	blx r3
	mov r2, #0
_020D95BC:
	cmp r2, #0xe
	bge _020D95D8
	mov r0, #0
_020D95C8:
	str r0, [r4, r2, lsl #2]
	add r2, r2, #1
	cmp r2, #0xe
	blt _020D95C8
_020D95D8:
	ldr r0, [sp, #0x10]
	ldr r3, _020D9710 ; =_02110E70
	ldr r2, [r0, #0x14]
	mov r1, r4
	strb r2, [r5, #0x3f]
	mov r0, r2, lsr #8
	strb r0, [r5, #0x3e]
	mov r0, r2, lsr #0x10
	strb r0, [r5, #0x3d]
	mov r0, r2, lsr #0x18
	strb r0, [r5, #0x3c]
	ldr r0, [sp, #0x10]
	mov r2, #0x40
	ldr r4, [r0, #0x18]
	strb r4, [r5, #0x3b]
	mov r0, r4, lsr #8
	strb r0, [r5, #0x3a]
	mov r0, r4, lsr #0x10
	strb r0, [r5, #0x39]
	mov r0, r4, lsr #0x18
	strb r0, [r5, #0x38]
	ldr r0, [sp, #0x10]
	ldr r3, [r3]
	blx r3
	ldr r0, [sp, #0x10]
	ldr r1, [r0]
	mov r0, r1, lsr #0x18
	strb r0, [r6]
	mov r0, r1, lsr #0x10
	strb r0, [r6, #1]
	mov r0, r1, lsr #8
	strb r0, [r6, #2]
	strb r1, [r6, #3]
	ldr r0, [sp, #0x10]
	ldr r1, [r0, #4]
	mov r0, r1, lsr #0x18
	strb r0, [r6, #4]
	mov r0, r1, lsr #0x10
	strb r0, [r6, #5]
	mov r0, r1, lsr #8
	strb r0, [r6, #6]
	strb r1, [r6, #7]
	ldr r0, [sp, #0x10]
	ldr r1, [r0, #8]
	mov r0, r1, lsr #0x18
	strb r0, [r6, #8]
	mov r0, r1, lsr #0x10
	strb r0, [r6, #9]
	mov r0, r1, lsr #8
	strb r0, [r6, #0xa]
	strb r1, [r6, #0xb]
	ldr r0, [sp, #0x10]
	ldr r1, [r0, #0xc]
	mov r0, r1, lsr #0x18
	strb r0, [r6, #0xc]
	mov r0, r1, lsr #0x10
	strb r0, [r6, #0xd]
	mov r0, r1, lsr #8
	strb r0, [r6, #0xe]
	strb r1, [r6, #0xf]
	ldr r0, [sp, #0x10]
	ldr r1, [r0, #0x10]
	mov r0, r1, lsr #0x18
	strb r0, [r6, #0x10]
	mov r0, r1, lsr #0x10
	strb r0, [r6, #0x11]
	mov r0, r1, lsr #8
	strb r0, [r6, #0x12]
	strb r1, [r6, #0x13]
	ldr r3, [sp, #0x10]
	mov r0, #0
	add r1, sp, #0x10
	mov r2, #4
	str r0, [r3, #0x1c]
	bl MIi_CpuClear32
	ldmia sp!, {r4, r5, r6, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_020D9710: .word _02110E70
	arm_func_end sub_020D9518

	arm_func_start sub_020D9714
sub_020D9714: ; 0x020D9714
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0xa0
	ldr lr, _020D9798 ; =0x0210E188
	add ip, sp, #8
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	mov r4, ip
	ldmia lr!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	ldmia lr, {r0, r1, r2}
	stmia ip, {r0, r1, r2}
	add lr, sp, #0x38
	add ip, sp, #0x24
	str lr, [sp, #0x10]
	ldr lr, _020D979C ; =sub_020D9374
	str ip, [sp, #0x14]
	ldr ip, _020D97A0 ; =sub_020D93C4
	str lr, [sp, #0x18]
	ldr lr, _020D97A4 ; =sub_020D9518
	str ip, [sp, #0x1c]
	ldr ip, [sp, #0xb8]
	str lr, [sp, #0x20]
	str ip, [sp]
	mov r3, r5
	mov r0, r8
	mov r1, r7
	mov r2, r6
	str r4, [sp, #4]
	bl sub_020D97A8
	add sp, sp, #0xa0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020D9798: .word 0x0210E188
_020D979C: .word sub_020D9374
_020D97A0: .word sub_020D93C4
_020D97A4: .word sub_020D9518
	arm_func_end sub_020D9714

	arm_func_start sub_020D97A8
sub_020D97A8: ; 0x020D97A8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0xc0
	ldr r5, [sp, #0xe0]
	ldr r4, [sp, #0xe4]
	mov r8, r1
	movs sb, r0
	mov r7, r2
	cmpne r8, #0
	mov r6, r3
	cmpne r7, #0
	cmpne r6, #0
	cmpne r5, #0
	cmpne r4, #0
	addeq sp, sp, #0xc0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldr r0, [r4, #4]
	cmp r5, r0
	ble _020D9828
	ldr r0, [r4, #8]
	ldr r1, [r4, #0x10]
	blx r1
	ldr r0, [r4, #8]
	ldr r3, [r4, #0x14]
	mov r1, r6
	mov r2, r5
	blx r3
	ldr r0, [r4, #8]
	ldr r2, [r4, #0x18]
	add r1, sp, #0x80
	blx r2
	ldr r5, [r4]
	add r6, sp, #0x80
_020D9828:
	cmp r5, #0
	mov r2, #0
	ble _020D9850
	add r1, sp, #0x40
_020D9838:
	ldrb r0, [r6, r2]
	add r2, r2, #1
	cmp r2, r5
	eor r0, r0, #0x36
	strb r0, [r1], #1
	blt _020D9838
_020D9850:
	ldr r0, [r4, #4]
	cmp r2, r0
	bge _020D987C
	add r0, sp, #0x40
	add r3, r0, r2
	mov r1, #0x36
_020D9868:
	strb r1, [r3], #1
	ldr r0, [r4, #4]
	add r2, r2, #1
	cmp r2, r0
	blt _020D9868
_020D987C:
	ldr r0, [r4, #8]
	ldr r1, [r4, #0x10]
	blx r1
	ldr r0, [r4, #8]
	ldr r2, [r4, #4]
	ldr r3, [r4, #0x14]
	add r1, sp, #0x40
	blx r3
	ldr r0, [r4, #8]
	ldr r3, [r4, #0x14]
	mov r1, r8
	mov r2, r7
	blx r3
	ldr r0, [r4, #8]
	ldr r1, [r4, #0xc]
	ldr r2, [r4, #0x18]
	blx r2
	cmp r5, #0
	mov r3, #0
	ble _020D98E8
	add r1, sp, #0
_020D98D0:
	ldrb r0, [r6, r3]
	add r3, r3, #1
	cmp r3, r5
	eor r0, r0, #0x5c
	strb r0, [r1], #1
	blt _020D98D0
_020D98E8:
	ldr r0, [r4, #4]
	cmp r3, r0
	bge _020D9914
	add r0, sp, #0
	add r2, r0, r3
	mov r1, #0x5c
_020D9900:
	strb r1, [r2], #1
	ldr r0, [r4, #4]
	add r3, r3, #1
	cmp r3, r0
	blt _020D9900
_020D9914:
	ldr r0, [r4, #8]
	ldr r1, [r4, #0x10]
	blx r1
	ldr r0, [r4, #8]
	ldr r2, [r4, #4]
	ldr r3, [r4, #0x14]
	add r1, sp, #0
	blx r3
	ldr r0, [r4, #8]
	ldr r1, [r4, #0xc]
	ldr r2, [r4]
	ldr r3, [r4, #0x14]
	blx r3
	ldr r0, [r4, #8]
	ldr r2, [r4, #0x18]
	mov r1, sb
	blx r2
	add sp, sp, #0xc0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
	arm_func_end sub_020D97A8
_020D9960: .word 0x00FF00FF
_020D9964: .word 0x5A827999
_020D9968: .word 0x6ED9EBA1
_020D996C: .word 0x8F1BBCDC
_020D9970: .word 0xCA62C1D6
	arm_func_end sub_020D97A8

	arm_func_start sub_020D9974
sub_020D9974: ; 0x020D9974
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, ip, lr}
	ldmia r0, {r3, sb, sl, fp, ip}
	sub sp, sp, #0x84
	str r2, [sp, #0x80]
_020D9984:
	ldr r8, _020D9964 ; =0x5A827999
	ldr r7, _020D9960 ; =0x00FF00FF
	mov r6, sp
	mov r5, #0
_020D9994:
	ldr r4, [r1], #4
	add r2, r8, ip
	add r2, r2, r3, ror #27
	and lr, r4, r7
	and r4, r7, r4, ror #24
	orr r4, r4, lr, ror #8
	str r4, [r6, #0x40]
	str r4, [r6], #4
	add r2, r2, r4
	eor r4, sl, fp
	and r4, r4, sb
	eor r4, r4, fp
	add r2, r2, r4
	mov sb, sb, ror #2
	mov ip, fp
	mov fp, sl
	mov sl, sb
	mov sb, r3
	mov r3, r2
	add r5, r5, #4
	cmp r5, #0x40
	blt _020D9994
	mov r7, #0
	mov r6, sp
_020D99F4:
	ldr r2, [r6]
	ldr r5, [r6, #8]
	ldr r4, [r6, #0x20]
	ldr lr, [r6, #0x34]
	eor r2, r2, r5
	eor r4, r4, lr
	eor r2, r2, r4
	mov r2, r2, ror #0x1f
	str r2, [r6, #0x40]
	str r2, [r6], #4
	add r2, r2, ip
	add r2, r2, r8
	add r2, r2, r3, ror #27
	eor r4, sl, fp
	and r4, r4, sb
	eor r4, r4, fp
	add r2, r2, r4
	mov sb, sb, ror #2
	mov ip, fp
	mov fp, sl
	mov sl, sb
	mov sb, r3
	mov r3, r2
	add r7, r7, #4
	cmp r7, #0x10
	blt _020D99F4
	ldr r8, _020D9968 ; =0x6ED9EBA1
	mov r7, #0
_020D9A64:
	ldr r2, [r6]
	ldr r4, [r6, #8]
	ldr lr, [r6, #0x20]
	ldr r5, [r6, #0x34]
	eor r2, r2, r4
	eor lr, lr, r5
	eor r2, r2, lr
	mov r2, r2, ror #0x1f
	str r2, [r6, #0x40]
	str r2, [r6], #4
	add r2, r2, ip
	add r2, r2, r8
	add r2, r2, r3, ror #27
	eor lr, sb, sl
	eor lr, lr, fp
	add r2, r2, lr
	mov sb, sb, ror #2
	mov ip, fp
	mov fp, sl
	mov sl, sb
	mov sb, r3
	mov r3, r2
	add r7, r7, #1
	cmp r7, #0xc
	moveq r6, sp
	cmp r7, #0x14
	blt _020D9A64
	ldr r8, _020D996C ; =0x8F1BBCDC
	mov r7, #0
_020D9AD8:
	ldr r2, [r6]
	ldr lr, [r6, #8]
	ldr r5, [r6, #0x20]
	ldr r4, [r6, #0x34]
	eor r2, r2, lr
	eor r5, r5, r4
	eor r2, r2, r5
	mov r2, r2, ror #0x1f
	str r2, [r6, #0x40]
	str r2, [r6], #4
	add r2, r2, ip
	add r2, r2, r8
	add r2, r2, r3, ror #27
	orr r5, sb, sl
	and r5, r5, fp
	and r4, sb, sl
	orr r5, r5, r4
	add r2, r2, r5
	mov sb, sb, ror #2
	mov ip, fp
	mov fp, sl
	mov sl, sb
	mov sb, r3
	mov r3, r2
	add r7, r7, #1
	cmp r7, #8
	moveq r6, sp
	cmp r7, #0x14
	blt _020D9AD8
	ldr r8, _020D9970 ; =0xCA62C1D6
	mov r7, #0
_020D9B54:
	ldr r2, [r6]
	ldr r5, [r6, #8]
	ldr r4, [r6, #0x20]
	ldr lr, [r6, #0x34]
	eor r2, r2, r5
	eor r4, r4, lr
	eor r2, r2, r4
	mov r2, r2, ror #0x1f
	str r2, [r6, #0x40]
	str r2, [r6], #4
	add r2, r2, ip
	add r2, r2, r8
	add r2, r2, r3, ror #27
	eor r4, sb, sl
	eor r4, r4, fp
	add r2, r2, r4
	mov sb, sb, ror #2
	mov ip, fp
	mov fp, sl
	mov sl, sb
	mov sb, r3
	mov r3, r2
	add r7, r7, #1
	cmp r7, #4
	moveq r6, sp
	cmp r7, #0x14
	blt _020D9B54
	ldmia r0, {r2, r4, r6, r7, lr}
	add r3, r3, r2
	add sb, sb, r4
	add sl, sl, r6
	add fp, fp, r7
	add ip, ip, lr
	stmia r0, {r3, sb, sl, fp, ip}
	ldr lr, [sp, #0x80]
	subs lr, lr, #0x40
	str lr, [sp, #0x80]
	bgt _020D9984
	add sp, sp, #0x84
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, ip, pc}
	arm_func_end sub_020D9974

	arm_func_start CP_SaveContext
CP_SaveContext: ; 0x020D9BF4
	ldr r1, _020D9C30 ; =0x04000290
	stmdb sp!, {r4}
	ldmia r1, {r2, r3, r4, ip}
	stmia r0!, {r2, r3, r4, ip}
	ldrh ip, [r1, #-0x10]
	add r1, r1, #0x28
	ldmia r1, {r2, r3}
	stmia r0!, {r2, r3}
	and ip, ip, #3
	ldrh r2, [r1, #-8]
	strh ip, [r0]
	and r2, r2, #1
	strh r2, [r0, #2]
	ldmia sp!, {r4}
	bx lr
	.align 2, 0
_020D9C30: .word 0x04000290
	arm_func_end CP_SaveContext

	arm_func_start CPi_RestoreContext
CPi_RestoreContext: ; 0x020D9C34
	stmdb sp!, {r4}
	ldr r1, _020D9C6C ; =0x04000290
	ldmia r0, {r2, r3, r4, ip}
	stmia r1, {r2, r3, r4, ip}
	ldrh r2, [r0, #0x18]
	ldrh r3, [r0, #0x1a]
	strh r2, [r1, #-0x10]
	strh r3, [r1, #0x20]
	add r0, r0, #0x10
	add r1, r1, #0x28
	ldmia r0, {r2, r3}
	stmia r1, {r2, r3}
	ldmia sp!, {r4}
	bx lr
	.align 2, 0
_020D9C6C: .word 0x04000290
	arm_func_end CPi_RestoreContext

	arm_func_start sub_020D9C70
sub_020D9C70: ; 0x020D9C70
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	mov r0, r1, lsl #0x10
	mov r3, r0, lsr #0x10
	and r0, r3, #0x7f00
	mov r0, r0, lsl #8
	cmp r2, #0
	mov r0, r0, lsr #0x10
	beq _020D9CCC
	ldr r1, _020D9EE8 ; =0x021E36B0
	mov r2, #1
	ldrh r3, [r1, #0x38]
	orr r2, r3, r2, lsl r0
	strh r2, [r1, #0x38]
	ldr r3, [r1, #4]
	cmp r3, #0
	addeq sp, sp, #8
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r1, #4
	mov r2, #0
	blx r3
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020D9CCC:
	cmp r0, #0x10
	bne _020D9D84
	ldr r1, _020D9EE8 ; =0x021E36B0
	ldrh r2, [r1, #0x10]
	add r2, r2, #1
	strh r2, [r1, #0x10]
	ldrh r3, [r1, #0x10]
	ldrh r2, [r1, #0x18]
	cmp r3, r2
	movhs r2, #0
	strhsh r2, [r1, #0x10]
	ldr r2, _020D9EEC ; =0x027FFFAA
	ldr r1, _020D9EE8 ; =0x021E36B0
	ldrh r3, [r2]
	ldrh r2, [r2, #2]
	ldrh lr, [r1, #0x10]
	strh r3, [sp, #4]
	strh r2, [sp, #6]
	ldr r5, [sp, #4]
	ldr r7, [r1, #0x14]
	mov r2, r5, lsl #7
	mov r3, r2, lsr #0x1f
	mov r4, r5, lsl #8
	mov r2, r5, lsl #5
	mov ip, r5, lsl #0x14
	mov r2, r2, lsr #0x1e
	mov r6, lr, lsl #3
	mov r5, ip, lsr #0x14
	strh r5, [r7, r6]
	add r5, r7, lr, lsl #3
	mov r4, r4, lsr #0x14
	strh r4, [r5, #2]
	and r3, r3, #0xff
	strh r3, [r5, #4]
	and r2, r2, #0xff
	strh r2, [r5, #6]
	ldr r3, [r1, #4]
	cmp r3, #0
	addeq sp, sp, #8
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldrh r2, [r1, #0x10]
	mov r1, #0
	and r2, r2, #0xff
	blx r3
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020D9D84:
	tst r1, #0x1000000
	addeq sp, sp, #8
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	and r1, r3, #0xff
	cmp r1, #4
	addls pc, pc, r1, lsl #2
	b _020D9EDC
_020D9DA0: ; jump table
	b _020D9DB4 ; case 0
	b _020D9EDC ; case 1
	b _020D9E88 ; case 2
	b _020D9E90 ; case 3
	b _020D9E80 ; case 4
_020D9DB4:
	cmp r0, #0
	beq _020D9DD8
	cmp r0, #1
	beq _020D9E38
	cmp r0, #2
	ldreq r1, _020D9EE8 ; =0x021E36B0
	moveq r2, #0
	streqh r2, [r1, #0x36]
	b _020D9E44
_020D9DD8:
	ldr r2, _020D9EEC ; =0x027FFFAA
	ldr r1, _020D9EE8 ; =0x021E36B0
	ldrh r4, [r2]
	ldrh r3, [r2, #2]
	mov r2, #0
	strh r4, [sp]
	strh r3, [sp, #2]
	ldr r4, [sp]
	mov r3, r4, lsl #0x14
	mov r5, r3, lsr #0x14
	mov lr, r4, lsl #8
	mov r3, r4, lsl #7
	mov ip, r3, lsr #0x1f
	mov r3, r4, lsl #5
	mov r3, r3, lsr #0x1e
	strh r5, [r1, #8]
	mov lr, lr, lsr #0x14
	strh lr, [r1, #0xa]
	and ip, ip, #0xff
	strh ip, [r1, #0xc]
	and r3, r3, #0xff
	strh r3, [r1, #0xe]
	strh r2, [r1, #0x36]
	b _020D9E44
_020D9E38:
	ldr r1, _020D9EE8 ; =0x021E36B0
	mov r2, #2
	strh r2, [r1, #0x36]
_020D9E44:
	ldr r1, _020D9EE8 ; =0x021E36B0
	mov r2, #1
	ldrh r3, [r1, #0x3a]
	mvn r2, r2, lsl r0
	and r2, r3, r2
	strh r2, [r1, #0x3a]
	ldr r3, [r1, #4]
	cmp r3, #0
	addeq sp, sp, #8
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r1, #0
	mov r2, r1
	blx r3
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020D9E80:
	mov r4, #3
	b _020D9E94
_020D9E88:
	mov r4, #1
	b _020D9E94
_020D9E90:
	mov r4, #2
_020D9E94:
	ldr r1, _020D9EE8 ; =0x021E36B0
	mov ip, #1
	ldrh r3, [r1, #0x38]
	mvn r2, ip, lsl r0
	orr r3, r3, ip, lsl r0
	strh r3, [r1, #0x38]
	ldrh r3, [r1, #0x3a]
	and r2, r3, r2
	strh r2, [r1, #0x3a]
	ldr r3, [r1, #4]
	cmp r3, #0
	addeq sp, sp, #8
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	and r1, r4, #0xff
	mov r2, #0
	blx r3
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020D9EDC:
	bl OS_Terminate
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020D9EE8: .word 0x021E36B0
_020D9EEC: .word 0x027FFFAA
	arm_func_end sub_020D9C70

	arm_func_start sub_020D9EF0
sub_020D9EF0: ; 0x020D9EF0
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _020D9F60 ; =0x021E36B0
	ldrh r1, [r0]
	cmp r1, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r1, #1
	strh r1, [r0]
	bl PXI_Init
	ldr r0, _020D9F60 ; =0x021E36B0
	mov r1, #0
	strh r1, [r0, #0x10]
	str r1, [r0, #4]
	str r1, [r0, #0x14]
	strh r1, [r0, #0x36]
	strh r1, [r0, #0x34]
	strh r1, [r0, #0x3a]
	strh r1, [r0, #0x38]
	mov r5, #6
	mov r4, #1
_020D9F3C:
	mov r0, r5
	mov r1, r4
	bl PXI_IsCallbackReady
	cmp r0, #0
	beq _020D9F3C
	ldr r1, _020D9F64 ; =sub_020D9C70
	mov r0, #6
	bl PXI_SetFifoRecvCallback
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020D9F60: .word 0x021E36B0
_020D9F64: .word sub_020D9C70
	arm_func_end sub_020D9EF0

	arm_func_start sub_020D9F68
sub_020D9F68: ; 0x020D9F68
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x14
	ldr ip, _020D9FF8 ; =0x027FFC80
	mov r4, r0
	ldrh r1, [ip, #0x58]
	ldrh r2, [ip, #0x5a]
	ldrh r0, [ip, #0x5e]
	cmp r1, #0
	ldrh lr, [ip, #0x60]
	cmpeq r0, #0
	cmpeq r2, #0
	ldrb r3, [ip, #0x5c]
	ldrb r5, [ip, #0x5d]
	ldrb r6, [ip, #0x62]
	ldrb ip, [ip, #0x63]
	cmpeq lr, #0
	beq _020D9FCC
	str r5, [sp]
	stmib sp, {r0, lr}
	str r6, [sp, #0xc]
	mov r0, r4
	str ip, [sp, #0x10]
	bl sub_020DA4F4
	cmp r0, #0
	beq _020D9FEC
_020D9FCC:
	mov r0, #0
	strh r0, [r4]
	strh r0, [r4, #2]
	strh r0, [r4, #4]
	strh r0, [r4, #6]
	add sp, sp, #0x14
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, pc}
_020D9FEC:
	mov r0, #1
	add sp, sp, #0x14
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_020D9FF8: .word 0x027FFC80
	arm_func_end sub_020D9F68

	arm_func_start sub_020D9FFC
sub_020D9FFC: ; 0x020D9FFC
	stmdb sp!, {r4, lr}
	movs r4, r0
	bne _020DA018
	ldr r0, _020DA118 ; =0x021E36B0
	mov r1, #0
	strh r1, [r0, #0x34]
	ldmia sp!, {r4, pc}
_020DA018:
	bl OS_DisableInterrupts
	ldrsh r2, [r4, #4]
	cmp r2, #0
	beq _020DA07C
	ldr r3, _020DA11C ; =0x04000280
	mov r1, #0
	strh r1, [r3]
	mov r1, #0x10000000
	str r1, [r3, #0x10]
	str r2, [r3, #0x18]
	mov r1, #0
	str r1, [r3, #0x1c]
	ldrsh r2, [r4]
	ldr r1, _020DA118 ; =0x021E36B0
	str r2, [r1, #0x1c]
	ldrsh r2, [r4, #4]
	str r2, [r1, #0x20]
_020DA05C:
	ldrh r1, [r3]
	tst r1, #0x8000
	bne _020DA05C
	ldr r2, _020DA120 ; =0x040002A0
	ldr r1, _020DA118 ; =0x021E36B0
	ldr r2, [r2]
	str r2, [r1, #0x24]
	b _020DA090
_020DA07C:
	ldr r1, _020DA118 ; =0x021E36B0
	mov r2, #0
	str r2, [r1, #0x1c]
	str r2, [r1, #0x20]
	str r2, [r1, #0x24]
_020DA090:
	ldrsh r2, [r4, #6]
	cmp r2, #0
	beq _020DA0F0
	ldr r3, _020DA11C ; =0x04000280
	mov r1, #0
	strh r1, [r3]
	mov r1, #0x10000000
	str r1, [r3, #0x10]
	str r2, [r3, #0x18]
	mov r1, #0
	str r1, [r3, #0x1c]
	ldrsh r2, [r4, #2]
	ldr r1, _020DA118 ; =0x021E36B0
	str r2, [r1, #0x28]
	ldrsh r2, [r4, #6]
	str r2, [r1, #0x2c]
_020DA0D0:
	ldrh r1, [r3]
	tst r1, #0x8000
	bne _020DA0D0
	ldr r2, _020DA120 ; =0x040002A0
	ldr r1, _020DA118 ; =0x021E36B0
	ldr r2, [r2]
	str r2, [r1, #0x30]
	b _020DA104
_020DA0F0:
	ldr r1, _020DA118 ; =0x021E36B0
	mov r2, #0
	str r2, [r1, #0x28]
	str r2, [r1, #0x2c]
	str r2, [r1, #0x30]
_020DA104:
	bl OS_RestoreInterrupts
	ldr r0, _020DA118 ; =0x021E36B0
	mov r1, #1
	strh r1, [r0, #0x34]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020DA118: .word 0x021E36B0
_020DA11C: .word 0x04000280
_020DA120: .word 0x040002A0
	arm_func_end sub_020D9FFC

	arm_func_start sub_020DA124
sub_020DA124: ; 0x020DA124
	stmdb sp!, {r4, lr}
	bl OS_DisableInterrupts
	mov r4, r0
	mov r0, #6
	mov r1, #0x3000000
	mov r2, #0
	bl PXI_SendWordByFifo
	cmp r0, #0
	movge r0, #1
	movlt r0, #0
	cmp r0, #0
	bne _020DA18C
	mov r0, r4
	bl OS_RestoreInterrupts
	ldr r0, _020DA1B4 ; =0x021E36B0
	ldrh r1, [r0, #0x38]
	orr r1, r1, #1
	strh r1, [r0, #0x38]
	ldr r3, [r0, #4]
	cmp r3, #0
	ldmeqia sp!, {r4, pc}
	mov r0, #0
	mov r2, r0
	mov r1, #4
	blx r3
	ldmia sp!, {r4, pc}
_020DA18C:
	ldr r1, _020DA1B4 ; =0x021E36B0
	mov r0, r4
	ldrh r2, [r1, #0x3a]
	orr r2, r2, #1
	strh r2, [r1, #0x3a]
	ldrh r2, [r1, #0x38]
	bic r2, r2, #1
	strh r2, [r1, #0x38]
	bl OS_RestoreInterrupts
	ldmia sp!, {r4, pc}
	.align 2, 0
_020DA1B4: .word 0x021E36B0
	arm_func_end sub_020DA124

	arm_func_start sub_020DA1B8
sub_020DA1B8: ; 0x020DA1B8
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #1
	bl sub_020DA804
	ldr r1, _020DA204 ; =0x021E36B0
	ldrh r0, [r1, #0x38]
	tst r0, #1
	movne r0, #1
	ldmneia sp!, {r4, pc}
	ldrh r3, [r1, #8]
	ldrh r2, [r1, #0xa]
	mov r0, #0
	strh r3, [r4]
	strh r2, [r4, #2]
	ldrh r2, [r1, #0xc]
	ldrh r1, [r1, #0xe]
	strh r2, [r4, #4]
	strh r1, [r4, #6]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020DA204: .word 0x021E36B0
	arm_func_end sub_020DA1B8

	arm_func_start sub_020DA208
sub_020DA208: ; 0x020DA208
	stmdb sp!, {r3, r4, r5, lr}
	ldr ip, _020DA304 ; =0x021E36B0
	mov lr, #0
	str r2, [ip, #0x14]
	mov r5, r1
	strh lr, [ip, #0x10]
	strh r5, [ip, #0x12]
	mov r4, r0
	strh r3, [ip, #0x18]
	cmp r3, #0
	bls _020DA250
	mov r1, lr
_020DA238:
	ldr r0, [ip, #0x14]
	add r0, r0, lr, lsl #3
	add lr, lr, #1
	strh r1, [r0, #4]
	cmp lr, r3
	blo _020DA238
_020DA250:
	bl OS_DisableInterrupts
	and r1, r5, #0xff
	orr r1, r1, #0x100
	mov r5, r0
	orr r1, r1, #0x2000000
	mov r0, #6
	mov r2, #0
	bl PXI_SendWordByFifo
	cmp r0, #0
	movlt r0, #0
	blt _020DA29C
	orr r1, r4, #0x10000
	orr r1, r1, #0x1000000
	mov r0, #6
	mov r2, #0
	bl PXI_SendWordByFifo
	cmp r0, #0
	movlt r0, #0
	movge r0, #1
_020DA29C:
	tst r0, #0xff
	bne _020DA2DC
	mov r0, r5
	bl OS_RestoreInterrupts
	ldr r0, _020DA304 ; =0x021E36B0
	ldrh r1, [r0, #0x38]
	orr r1, r1, #2
	strh r1, [r0, #0x38]
	ldr r3, [r0, #4]
	cmp r3, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #1
	mov r1, #4
	mov r2, #0
	blx r3
	ldmia sp!, {r3, r4, r5, pc}
_020DA2DC:
	ldr r1, _020DA304 ; =0x021E36B0
	mov r0, r5
	ldrh r2, [r1, #0x3a]
	orr r2, r2, #2
	strh r2, [r1, #0x3a]
	ldrh r2, [r1, #0x38]
	bic r2, r2, #2
	strh r2, [r1, #0x38]
	bl OS_RestoreInterrupts
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020DA304: .word 0x021E36B0
	arm_func_end sub_020DA208

	arm_func_start sub_020DA308
sub_020DA308: ; 0x020DA308
	stmdb sp!, {r4, lr}
	bl OS_DisableInterrupts
	mov r4, r0
	ldr r1, _020DA398 ; =0x03000200
	mov r0, #6
	mov r2, #0
	bl PXI_SendWordByFifo
	cmp r0, #0
	movge r0, #1
	movlt r0, #0
	cmp r0, #0
	bne _020DA370
	mov r0, r4
	bl OS_RestoreInterrupts
	ldr r0, _020DA39C ; =0x021E36B0
	ldrh r1, [r0, #0x38]
	orr r1, r1, #4
	strh r1, [r0, #0x38]
	ldr r3, [r0, #4]
	cmp r3, #0
	ldmeqia sp!, {r4, pc}
	mov r0, #2
	mov r1, #4
	mov r2, #0
	blx r3
	ldmia sp!, {r4, pc}
_020DA370:
	ldr r1, _020DA39C ; =0x021E36B0
	mov r0, r4
	ldrh r2, [r1, #0x3a]
	orr r2, r2, #4
	strh r2, [r1, #0x3a]
	ldrh r2, [r1, #0x38]
	bic r2, r2, #4
	strh r2, [r1, #0x38]
	bl OS_RestoreInterrupts
	ldmia sp!, {r4, pc}
	.align 2, 0
_020DA398: .word 0x03000200
_020DA39C: .word 0x021E36B0
	arm_func_end sub_020DA308

	arm_func_start sub_020DA3A0
sub_020DA3A0: ; 0x020DA3A0
	stmdb sp!, {r4, lr}
	ldr ip, _020DA4E0 ; =0x021E36B0
	mov r1, #3
	strh r1, [r0, #6]
	ldrh r1, [ip, #0x12]
	ldrh r2, [ip, #0x10]
	cmp r1, #1
	ldrneh r1, [ip, #0x18]
	cmpne r1, #1
	bne _020DA3FC
	ldr r1, _020DA4E0 ; =0x021E36B0
	mov ip, r2, lsl #3
	ldr r1, [r1, #0x14]
	add r3, r1, r2, lsl #3
	ldrh r2, [r1, ip]
	ldrh r1, [r3, #2]
	strh r2, [r0]
	strh r1, [r0, #2]
	ldrh r2, [r3, #4]
	ldrh r1, [r3, #6]
	strh r2, [r0, #4]
	strh r1, [r0, #6]
	ldmia sp!, {r4, pc}
_020DA3FC:
	mov r1, #0
	b _020DA4BC
_020DA404:
	subs lr, r2, r1
	ldr r3, [ip, #0x14]
	addmi lr, lr, r4
	add r3, r3, lr, lsl #3
	ldrh lr, [r3, #4]
	cmp lr, #0
	bne _020DA444
	ldrh r2, [r3]
	ldrh r1, [r3, #2]
	strh r2, [r0]
	strh r1, [r0, #2]
	ldrh r2, [r3, #4]
	ldrh r1, [r3, #6]
	strh r2, [r0, #4]
	strh r1, [r0, #6]
	ldmia sp!, {r4, pc}
_020DA444:
	ldrh lr, [r0, #6]
	tst lr, #1
	beq _020DA474
	ldrh lr, [r3, #6]
	tst lr, #1
	bne _020DA474
	ldrh lr, [r3]
	cmp r1, #0
	strh lr, [r0]
	ldrneh lr, [r0, #6]
	bicne lr, lr, #1
	strneh lr, [r0, #6]
_020DA474:
	ldrh lr, [r0, #6]
	tst lr, #2
	beq _020DA4A4
	ldrh lr, [r3, #6]
	tst lr, #2
	bne _020DA4A4
	ldrh r3, [r3, #2]
	cmp r1, #0
	strh r3, [r0, #2]
	ldrneh r3, [r0, #6]
	bicne r3, r3, #2
	strneh r3, [r0, #6]
_020DA4A4:
	ldrh r3, [r0, #6]
	cmp r3, #0
	moveq r1, #1
	streqh r1, [r0, #4]
	ldmeqia sp!, {r4, pc}
	add r1, r1, #1
_020DA4BC:
	ldrh r3, [ip, #0x12]
	cmp r1, r3
	ldrlth r4, [ip, #0x18]
	sublt r3, r4, #1
	cmplt r1, r3
	blt _020DA404
	mov r1, #1
	strh r1, [r0, #4]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020DA4E0: .word 0x021E36B0
	arm_func_end sub_020DA3A0

	arm_func_start sub_020DA4E4
sub_020DA4E4: ; 0x020DA4E4
	ldr r0, _020DA4F0 ; =0x021E36B0
	ldrh r0, [r0, #0x10]
	bx lr
	.align 2, 0
_020DA4F0: .word 0x021E36B0
	arm_func_end sub_020DA4E4

	arm_func_start sub_020DA4F4
sub_020DA4F4: ; 0x020DA4F4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sb, r1
	mov r8, r2
	cmp sb, #0x1000
	cmplo r8, #0x1000
	ldrloh r4, [sp, #0x2c]
	mov r7, r3
	mov sl, r0
	cmplo r4, #0x1000
	ldrloh r3, [sp, #0x30]
	cmplo r3, #0x1000
	movhs r0, #1
	ldmhsia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp r7, #0x100
	ldrloh r2, [sp, #0x34]
	cmplo r2, #0x100
	ldrloh r1, [sp, #0x28]
	cmplo r1, #0xc0
	ldrloh r0, [sp, #0x38]
	cmplo r0, #0xc0
	movhs r0, #1
	ldmhsia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp r7, r2
	cmpne r1, r0
	cmpne sb, r4
	cmpne r8, r3
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	bl OS_DisableInterrupts
	ldrh lr, [sp, #0x2c]
	ldrh ip, [sp, #0x34]
	ldr r3, _020DA6D8 ; =0x04000280
	sub r1, sb, lr
	mov r2, #0
	ldrh r4, [sp, #0x38]
	ldrh r5, [sp, #0x28]
	ldrh r6, [sp, #0x30]
	strh r2, [r3]
	mov r1, r1, lsl #8
	str r1, [r3, #0x10]
	sub r1, r7, ip
	str r1, [r3, #0x18]
	mov r1, r2
	sub r2, r5, r4
	str r1, [r3, #0x1c]
	sub r1, r8, r6
	str r2, [sp]
_020DA5B0:
	ldrh r2, [r3]
	tst r2, #0x8000
	bne _020DA5B0
	mov fp, r1, lsl #8
	ldr r1, _020DA6DC ; =0x040002A0
	ldr r2, [r1]
	mov r1, #0
	strh r1, [r3]
	ldr r1, _020DA6DC ; =0x040002A0
	cmp r2, #0x8000
	str fp, [r1, #-0x10]
	sub r3, r1, #8
	ldr r1, [sp]
	mov fp, #0
	stmia r3, {r1, fp}
	bge _020DA600
	mov r1, fp
	sub r1, r1, #0x8000
	cmp r2, r1
	bge _020DA60C
_020DA600:
	bl OS_RestoreInterrupts
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020DA60C:
	strh r2, [sl, #4]
	ldrsh r2, [sl, #4]
	add r1, r7, ip
	add r3, sb, lr
	mul r1, r2, r1
	rsb r1, r1, r3, lsl #8
	mov r1, r1, lsl #9
	mov r2, r1, asr #0x10
	cmp r2, #0x8000
	bge _020DA644
	mov r1, fp
	sub r1, r1, #0x8000
	cmp r2, r1
	bge _020DA650
_020DA644:
	bl OS_RestoreInterrupts
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020DA650:
	ldr r1, _020DA6DC ; =0x040002A0
	strh r2, [sl]
	sub r2, r1, #0x20
_020DA65C:
	ldrh r1, [r2]
	tst r1, #0x8000
	bne _020DA65C
	ldr r1, _020DA6DC ; =0x040002A0
	ldr r7, [r1]
	bl OS_RestoreInterrupts
	cmp r7, #0x8000
	bge _020DA68C
	mov r1, #0x8000
	rsb r1, r1, #0
	cmp r7, r1
	bge _020DA694
_020DA68C:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020DA694:
	strh r7, [sl, #6]
	ldrsh r2, [sl, #6]
	add r0, r5, r4
	add r3, r8, r6
	mul r0, r2, r0
	rsb r0, r0, r3, lsl #8
	mov r0, r0, lsl #9
	mov r0, r0, asr #0x10
	cmp r0, #0x8000
	bge _020DA6C4
	cmp r0, r1
	bge _020DA6CC
_020DA6C4:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020DA6CC:
	strh r0, [sl, #2]
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020DA6D8: .word 0x04000280
_020DA6DC: .word 0x040002A0
	arm_func_end sub_020DA4F4

	arm_func_start sub_020DA6E0
sub_020DA6E0: ; 0x020DA6E0
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, _020DA7FC ; =0x021E36B0
	ldrh r2, [r2, #0x34]
	cmp r2, #0
	bne _020DA718
	ldrh r3, [r1]
	ldrh r2, [r1, #2]
	strh r3, [r0]
	strh r2, [r0, #2]
	ldrh r2, [r1, #4]
	ldrh r1, [r1, #6]
	strh r2, [r0, #4]
	strh r1, [r0, #6]
	ldmia sp!, {r4, r5, r6, pc}
_020DA718:
	ldrh r3, [r1, #4]
	ldr r2, _020DA800 ; =0x021E36CC
	strh r3, [r0, #4]
	ldrh r3, [r1, #6]
	strh r3, [r0, #6]
	ldrh r3, [r1, #4]
	cmp r3, #0
	bne _020DA748
	mov r1, #0
	strh r1, [r0]
	strh r1, [r0, #2]
	ldmia sp!, {r4, r5, r6, pc}
_020DA748:
	ldrh r4, [r1]
	ldr r3, [r2]
	ldr lr, [r2, #8]
	mov r4, r4, lsl #2
	subs ip, r4, r3
	mov r3, r3, asr #0x1f
	rsc r3, r3, r4, asr #31
	umull r6, r5, lr, ip
	mla r5, lr, r3, r5
	mov r3, lr, asr #0x1f
	mla r5, r3, ip, r5
	mov r3, r6, lsr #0x16
	orr r3, r3, r5, lsl #10
	strh r3, [r0]
	ldrsh r3, [r0]
	cmp r3, #0
	movlt r3, #0
	strlth r3, [r0]
	blt _020DA7A0
	cmp r3, #0xff
	movgt r3, #0xff
	strgth r3, [r0]
_020DA7A0:
	ldrh r3, [r1, #2]
	ldr r1, [r2, #0xc]
	ldr ip, [r2, #0x14]
	mov r2, r3, lsl #2
	subs r3, r2, r1
	mov r1, r1, asr #0x1f
	rsc r1, r1, r2, asr #31
	umull r4, lr, ip, r3
	mla lr, ip, r1, lr
	mov r1, ip, asr #0x1f
	mla lr, r1, r3, lr
	mov r1, r4, lsr #0x16
	orr r1, r1, lr, lsl #10
	strh r1, [r0, #2]
	ldrsh r1, [r0, #2]
	cmp r1, #0
	movlt r1, #0
	strlth r1, [r0, #2]
	ldmltia sp!, {r4, r5, r6, pc}
	cmp r1, #0xbf
	movgt r1, #0xbf
	strgth r1, [r0, #2]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020DA7FC: .word 0x021E36B0
_020DA800: .word 0x021E36CC
	arm_func_end sub_020DA6E0

	arm_func_start sub_020DA804
sub_020DA804: ; 0x020DA804
	ldr r1, _020DA818 ; =0x021E36B0
_020DA808:
	ldrh r2, [r1, #0x3a]
	tst r2, r0
	bne _020DA808
	bx lr
	.align 2, 0
_020DA818: .word 0x021E36B0
	arm_func_end sub_020DA804

	arm_func_start sub_020DA81C
sub_020DA81C: ; 0x020DA81C
	ldr r1, _020DA82C ; =0x021E36B0
	ldrh r1, [r1, #0x38]
	and r0, r1, r0
	bx lr
	.align 2, 0
_020DA82C: .word 0x021E36B0
	arm_func_end sub_020DA81C

	arm_func_start MIC_Init
MIC_Init: ; 0x020DA830
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _020DA894 ; =0x021E36EC
	ldrh r1, [r0]
	cmp r1, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r1, #1
	strh r1, [r0]
	mov r1, #0
	str r1, [r0, #4]
	str r1, [r0, #8]
	bl PXI_Init
	mov r5, #9
	mov r4, #1
_020DA864:
	mov r0, r5
	mov r1, r4
	bl PXI_IsCallbackReady
	cmp r0, #0
	beq _020DA864
	ldr r2, _020DA898 ; =0x027FFF90
	mov r3, #0
	ldr r1, _020DA89C ; =sub_020DAAA8
	mov r0, #9
	str r3, [r2]
	bl PXI_SetFifoRecvCallback
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020DA894: .word 0x021E36EC
_020DA898: .word 0x027FFF90
_020DA89C: .word sub_020DAAA8
	arm_func_end MIC_Init

	arm_func_start sub_020DA8A0
sub_020DA8A0: ; 0x020DA8A0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	ldr r0, [r7, #4]
	mov r6, r1
	tst r0, #0x1f
	mov r5, r2
	movne r0, #2
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, [r7, #8]
	tst r0, #0x1f
	movne r0, #2
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r0, #0
	moveq r0, #2
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, [r7, #0xc]
	cmp r0, #0x400
	movlo r0, #2
	ldmloia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, [r7]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _020DA944
_020DA8FC: ; jump table
	b _020DA914 ; case 0
	b _020DA91C ; case 1
	b _020DA924 ; case 2
	b _020DA92C ; case 3
	b _020DA934 ; case 4
	b _020DA93C ; case 5
_020DA914:
	mov r1, #0
	b _020DA94C
_020DA91C:
	mov r1, #1
	b _020DA94C
_020DA924:
	mov r1, #2
	b _020DA94C
_020DA92C:
	mov r1, #3
	b _020DA94C
_020DA934:
	mov r1, #5
	b _020DA94C
_020DA93C:
	mov r1, #7
	b _020DA94C
_020DA944:
	mov r0, #2
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020DA94C:
	ldr r0, [r7, #0x10]
	cmp r0, #0
	orrne r0, r1, #0x10
	andne r0, r0, #0xff
	andeq r0, r1, #0xff
	and r4, r0, #0xff
	bl OS_DisableInterrupts
	ldr r1, _020DA9C8 ; =0x021E36EC
	ldr r2, [r1, #4]
	cmp r2, #0
	beq _020DA984
	bl OS_RestoreInterrupts
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020DA984:
	mov r2, #1
	str r2, [r1, #4]
	bl OS_RestoreInterrupts
	ldr r0, _020DA9C8 ; =0x021E36EC
	mov r3, r4
	str r6, [r0, #8]
	str r5, [r0, #0xc]
	ldr r1, [r7, #0x14]
	str r1, [r0, #0x14]
	ldr r1, [r7, #0x18]
	str r1, [r0, #0x18]
	ldmib r7, {r0, r1, r2}
	bl sub_020DABD0
	cmp r0, #0
	movne r0, #0
	moveq r0, #3
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020DA9C8: .word 0x021E36EC
	arm_func_end sub_020DA8A0

	arm_func_start sub_020DA9CC
sub_020DA9CC: ; 0x020DA9CC
	stmdb sp!, {r3, lr}
	ldr r1, _020DA9FC ; =sub_020DACFC
	mov r2, #0
	bl sub_020DA8A0
	ldr r1, _020DAA00 ; =0x021E36EC
	cmp r0, #0
	str r0, [r1, #0x10]
	bne _020DA9F0
	bl sub_020DAD0C
_020DA9F0:
	ldr r0, _020DAA00 ; =0x021E36EC
	ldr r0, [r0, #0x10]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020DA9FC: .word sub_020DACFC
_020DAA00: .word 0x021E36EC
	arm_func_end sub_020DA9CC

	arm_func_start sub_020DAA04
sub_020DAA04: ; 0x020DAA04
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl OS_DisableInterrupts
	ldr r1, _020DAA5C ; =0x021E36EC
	ldr r2, [r1, #4]
	cmp r2, #0
	beq _020DAA30
	bl OS_RestoreInterrupts
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
_020DAA30:
	mov r2, #1
	str r2, [r1, #4]
	bl OS_RestoreInterrupts
	ldr r0, _020DAA5C ; =0x021E36EC
	str r5, [r0, #8]
	str r4, [r0, #0xc]
	bl sub_020DACD4
	cmp r0, #0
	movne r0, #0
	moveq r0, #3
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020DAA5C: .word 0x021E36EC
	arm_func_end sub_020DAA04

	arm_func_start sub_020DAA60
sub_020DAA60: ; 0x020DAA60
	stmdb sp!, {r3, lr}
	ldr r0, _020DAA90 ; =sub_020DACFC
	mov r1, #0
	bl sub_020DAA04
	ldr r1, _020DAA94 ; =0x021E36EC
	cmp r0, #0
	str r0, [r1, #0x10]
	bne _020DAA84
	bl sub_020DAD0C
_020DAA84:
	ldr r0, _020DAA94 ; =0x021E36EC
	ldr r0, [r0, #0x10]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020DAA90: .word sub_020DACFC
_020DAA94: .word 0x021E36EC
	arm_func_end sub_020DAA60

	arm_func_start sub_020DAA98
sub_020DAA98: ; 0x020DAA98
	ldr r0, _020DAAA4 ; =0x027FFF90
	ldr r0, [r0]
	bx lr
	.align 2, 0
_020DAAA4: .word 0x027FFF90
	arm_func_end sub_020DAA98

	arm_func_start sub_020DAAA8
sub_020DAAA8: ; 0x020DAAA8
	stmdb sp!, {r4, lr}
	mov r4, r1
	cmp r2, #0
	beq _020DAAF0
	ldr r0, _020DABC8 ; =0x021E36EC
	ldr r1, [r0, #4]
	cmp r1, #0
	movne r1, #0
	strne r1, [r0, #4]
	ldr r0, _020DABC8 ; =0x021E36EC
	ldr r2, [r0, #8]
	cmp r2, #0
	beq _020DAAF0
	mov r1, #0
	str r1, [r0, #8]
	ldr r1, [r0, #0xc]
	mov r0, #6
	blx r2
_020DAAF0:
	and r0, r4, #0x7f00
	and r1, r4, #0xff
	mov r0, r0, lsl #8
	cmp r1, #4
	mov r2, r0, lsr #0x10
	addls pc, pc, r1, lsl #2
	b _020DAB48
_020DAB0C: ; jump table
	b _020DAB20 ; case 0
	b _020DAB28 ; case 1
	b _020DAB30 ; case 2
	b _020DAB38 ; case 3
	b _020DAB40 ; case 4
_020DAB20:
	mov r0, #0
	b _020DAB4C
_020DAB28:
	mov r0, #4
	b _020DAB4C
_020DAB30:
	mov r0, #2
	b _020DAB4C
_020DAB38:
	mov r0, #5
	b _020DAB4C
_020DAB40:
	mov r0, #1
	b _020DAB4C
_020DAB48:
	mov r0, #6
_020DAB4C:
	cmp r2, #0x51
	bne _020DAB70
	ldr r1, _020DABC8 ; =0x021E36EC
	ldr r2, [r1, #0x14]
	cmp r2, #0
	ldmeqia sp!, {r4, pc}
	ldr r1, [r1, #0x18]
	blx r2
	ldmia sp!, {r4, pc}
_020DAB70:
	cmp r2, #0x40
	bne _020DAB90
	ldr r1, _020DABC8 ; =0x021E36EC
	ldr r2, [r1, #0x1c]
	cmp r2, #0
	ldrne r1, _020DABCC ; =0x027FFF94
	ldrneh r1, [r1]
	strneh r1, [r2]
_020DAB90:
	ldr r1, _020DABC8 ; =0x021E36EC
	ldr r2, [r1, #4]
	cmp r2, #0
	movne r2, #0
	strne r2, [r1, #4]
	ldr r1, _020DABC8 ; =0x021E36EC
	ldr r3, [r1, #8]
	cmp r3, #0
	ldmeqia sp!, {r4, pc}
	mov r2, #0
	str r2, [r1, #8]
	ldr r1, [r1, #0xc]
	blx r3
	ldmia sp!, {r4, pc}
	.align 2, 0
_020DABC8: .word 0x021E36EC
_020DABCC: .word 0x027FFF94
	arm_func_end sub_020DAAA8

	arm_func_start sub_020DABD0
sub_020DABD0: ; 0x020DABD0
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	orr r1, r3, #0x4100
	mov r6, r0
	mov r4, r2
	orr r1, r1, #0x2000000
	mov r0, #9
	mov r2, #0
	bl PXI_SendWordByFifo
	cmp r0, #0
	movlt r0, #0
	ldmltia sp!, {r4, r5, r6, pc}
	mov r0, r6, lsr #0x10
	orr r1, r0, #0x10000
	mov r0, #9
	mov r2, #0
	bl PXI_SendWordByFifo
	cmp r0, #0
	movlt r0, #0
	ldmltia sp!, {r4, r5, r6, pc}
	mov r0, r6, lsl #0x10
	mov r0, r0, lsr #0x10
	orr r1, r0, #0x20000
	mov r0, #9
	mov r2, #0
	bl PXI_SendWordByFifo
	cmp r0, #0
	movlt r0, #0
	ldmltia sp!, {r4, r5, r6, pc}
	mov r0, r5, lsr #0x10
	orr r1, r0, #0x30000
	mov r0, #9
	mov r2, #0
	bl PXI_SendWordByFifo
	cmp r0, #0
	movlt r0, #0
	ldmltia sp!, {r4, r5, r6, pc}
	mov r0, r5, lsl #0x10
	mov r0, r0, lsr #0x10
	orr r1, r0, #0x40000
	mov r0, #9
	mov r2, #0
	bl PXI_SendWordByFifo
	cmp r0, #0
	movlt r0, #0
	ldmltia sp!, {r4, r5, r6, pc}
	mov r0, r4, lsr #0x10
	orr r1, r0, #0x50000
	mov r0, #9
	mov r2, #0
	bl PXI_SendWordByFifo
	cmp r0, #0
	movlt r0, #0
	ldmltia sp!, {r4, r5, r6, pc}
	ldr r1, _020DACD0 ; =0x01060000
	mov r0, r4, lsl #0x10
	orr r1, r1, r0, lsr #16
	mov r0, #9
	mov r2, #0
	bl PXI_SendWordByFifo
	cmp r0, #0
	movge r0, #1
	movlt r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020DACD0: .word 0x01060000
	arm_func_end sub_020DABD0

	arm_func_start sub_020DACD4
sub_020DACD4: ; 0x020DACD4
	stmdb sp!, {r3, lr}
	ldr r1, _020DACF8 ; =0x03004200
	mov r0, #9
	mov r2, #0
	bl PXI_SendWordByFifo
	cmp r0, #0
	movge r0, #1
	movlt r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_020DACF8: .word 0x03004200
	arm_func_end sub_020DACD4

	arm_func_start sub_020DACFC
sub_020DACFC: ; 0x020DACFC
	ldr r1, _020DAD08 ; =0x021E36EC
	str r0, [r1, #0x10]
	bx lr
	.align 2, 0
_020DAD08: .word 0x021E36EC
	arm_func_end sub_020DACFC

	arm_func_start sub_020DAD0C
sub_020DAD0C: ; 0x020DAD0C
	ldr ip, _020DAD20 ; =0x021E36F0
_020DAD10:
	ldr r0, [ip]
	cmp r0, #1
	beq _020DAD10
	bx lr
	.align 2, 0
_020DAD20: .word 0x021E36F0
	arm_func_end sub_020DAD0C

	arm_func_start sub_020DAD24
sub_020DAD24: ; 0x020DAD24
	stmdb sp!, {r3, lr}
	bl OS_DisableInterrupts
	ldr r1, _020DAD5C ; =0x021E370C
	ldr r2, [r1, #0x1c]
	cmp r2, #0
	beq _020DAD48
	bl OS_RestoreInterrupts
	mov r0, #0
	ldmia sp!, {r3, pc}
_020DAD48:
	mov r2, #1
	str r2, [r1, #0x1c]
	bl OS_RestoreInterrupts
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_020DAD5C: .word 0x021E370C
	arm_func_end sub_020DAD24

	arm_func_start sub_020DAD60
sub_020DAD60: ; 0x020DAD60
	stmdb sp!, {r4, lr}
	ldr r0, _020DAD98 ; =0x021E370C
	ldr r4, _020DAD9C ; =0x021E3728
	ldr r0, [r0, #0x1c]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
_020DAD78:
	bl OS_GetCpsrIrq
	cmp r0, #0x80
	bne _020DAD88
	bl sub_020D674C
_020DAD88:
	ldr r0, [r4]
	cmp r0, #0
	bne _020DAD78
	ldmia sp!, {r4, pc}
	.align 2, 0
_020DAD98: .word 0x021E370C
_020DAD9C: .word 0x021E3728
	arm_func_end sub_020DAD60

	arm_func_start sub_020DADA0
sub_020DADA0: ; 0x020DADA0
	str r0, [r1]
	bx lr
	arm_func_end sub_020DADA0

	arm_func_start sub_020DADA8
sub_020DADA8: ; 0x020DADA8
	stmdb sp!, {r3, lr}
	ldr r2, _020DADE4 ; =0x021E370C
	ldr r1, [r2, #0x1c]
	ldr ip, [r2, #0x20]
	cmp r1, #0
	ldr r1, [r2, #0x24]
	movne r3, #0
	strne r3, [r2, #0x1c]
	cmp ip, #0
	ldmeqia sp!, {r3, pc}
	ldr r2, _020DADE4 ; =0x021E370C
	mov r3, #0
	str r3, [r2, #0x20]
	blx ip
	ldmia sp!, {r3, pc}
	.align 2, 0
_020DADE4: .word 0x021E370C
	arm_func_end sub_020DADA8

	arm_func_start PM_Init
PM_Init: ; 0x020DADE8
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _020DAE78 ; =0x021E370C
	ldrh r1, [r0]
	cmp r1, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r1, #1
	strh r1, [r0]
	mov r1, #0
	str r1, [r0, #0x1c]
	str r1, [r0, #0x20]
	bl PXI_Init
	mov r5, #8
	mov r4, #1
_020DAE1C:
	mov r0, r5
	mov r1, r4
	bl PXI_IsCallbackReady
	cmp r0, #0
	beq _020DAE1C
	ldr r1, _020DAE7C ; =sub_020DAE8C
	mov r0, #8
	bl PXI_SetFifoRecvCallback
	mov r3, #0
	ldr r0, _020DAE80 ; =0x021E3750
	mov r2, r3
_020DAE48:
	mov r1, r3, lsl #3
	add r3, r3, #1
	strh r2, [r0, r1]
	cmp r3, #5
	blt _020DAE48
	ldr r0, _020DAE84 ; =0x021E3738
	bl OS_InitMutex
	ldr r1, _020DAE88 ; =0x027FFC3C
	ldr r0, _020DAE78 ; =0x021E370C
	ldr r1, [r1]
	str r1, [r0, #0x10]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020DAE78: .word 0x021E370C
_020DAE7C: .word sub_020DAE8C
_020DAE80: .word 0x021E3750
_020DAE84: .word 0x021E3738
_020DAE88: .word 0x027FFC3C
	arm_func_end PM_Init

	arm_func_start sub_020DAE8C
sub_020DAE8C: ; 0x020DAE8C
	stmdb sp!, {r3, lr}
	cmp r2, #0
	beq _020DAEA4
	mov r0, #2
	bl sub_020DADA8
	ldmia sp!, {r3, pc}
_020DAEA4:
	and r0, r1, #0x7f00
	mov r0, r0, lsl #8
	mov r2, r0, lsr #0x10
	and r0, r1, #0xff
	cmp r2, #0x70
	blo _020DAEF4
	cmp r2, #0x74
	bhi _020DAEF4
	ldr r1, _020DAF48 ; =0x021E3754
	sub r2, r2, #0x70
	ldr r1, [r1, r2, lsl #3]
	and r0, r0, #0xff
	cmp r1, #0
	strneh r0, [r1]
	mov r1, r2, lsl #3
	ldr r0, _020DAF4C ; =0x021E3750
	mov r2, #1
	strh r2, [r0, r1]
	mov r0, #0
	b _020DAF40
_020DAEF4:
	cmp r2, #0x60
	bne _020DAF0C
	ldr r1, _020DAF50 ; =0x021E370C
	mov r2, #1
	str r2, [r1, #4]
	b _020DAF40
_020DAF0C:
	cmp r2, #0x62
	bne _020DAF24
	ldr r1, _020DAF50 ; =0x021E370C
	mov r2, #1
	str r2, [r1, #8]
	b _020DAF40
_020DAF24:
	cmp r2, #0x67
	bne _020DAF40
	ldr r1, _020DAF50 ; =0x021E370C
	ldr r1, [r1, #0x28]
	cmp r1, #0
	strne r0, [r1]
	mov r0, #0
_020DAF40:
	bl sub_020DADA8
	ldmia sp!, {r3, pc}
	.align 2, 0
_020DAF48: .word 0x021E3754
_020DAF4C: .word 0x021E3750
_020DAF50: .word 0x021E370C
	arm_func_end sub_020DAE8C

	arm_func_start sub_020DAF54
sub_020DAF54: ; 0x020DAF54
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl sub_020DAD24
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r1, _020DAFDC ; =0x021E370C
	mov r2, #0
	ldr r0, _020DAFE0 ; =0x03006000
	str r2, [r1, #4]
	bl sub_020DB410
	ldr r0, _020DAFDC ; =0x021E370C
_020DAF88:
	ldr r1, [r0, #4]
	cmp r1, #0
	beq _020DAF88
	ldr ip, _020DAFDC ; =0x021E370C
	mov r0, #0
	str r0, [ip, #4]
	mov r2, r0
	mov r1, #2
	mov r3, #1
	str r0, [ip, #8]
	bl sub_020DB67C
	and r0, r5, #0xff
	orr r0, r0, #0x6100
	orr r0, r0, #0x2000000
	bl sub_020DB410
	ldr r1, _020DAFE4 ; =0x01010000
	mov r0, r4, lsl #0x10
	orr r0, r1, r0, lsr #16
	bl sub_020DB410
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020DAFDC: .word 0x021E370C
_020DAFE0: .word 0x03006000
_020DAFE4: .word 0x01010000
	arm_func_end sub_020DAF54

	arm_func_start sub_020DAFE8
sub_020DAFE8: ; 0x020DAFE8
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl sub_020DAD24
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, r6, lsr #0x10
	and r0, r0, #0xff
	ldr r1, _020DB040 ; =0x021E370C
	orr r0, r0, #0x6300
	str r5, [r1, #0x20]
	orr r0, r0, #0x2000000
	str r4, [r1, #0x24]
	bl sub_020DB410
	ldr r1, _020DB044 ; =0x01010000
	mov r0, r6, lsl #0x10
	orr r0, r1, r0, lsr #16
	bl sub_020DB410
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020DB040: .word 0x021E370C
_020DB044: .word 0x01010000
	arm_func_end sub_020DAFE8

	arm_func_start sub_020DB048
sub_020DB048: ; 0x020DB048
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r0
	mov r4, r1
	mov r7, r2
	mov r6, r3
	bl sub_020DAD24
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r1, _020DB0A8 ; =0x021E370C
	and r0, r5, #0xff
	str r7, [r1, #0x20]
	orr r0, r0, #0x6500
	ldr r2, _020DB0AC ; =0x021E3750
	str r6, [r1, #0x24]
	mov r3, r5, lsl #3
	mov ip, #0
	ldr r1, _020DB0B0 ; =0x021E3754
	strh ip, [r2, r3]
	orr r0, r0, #0x3000000
	str r4, [r1, r5, lsl #3]
	bl sub_020DB410
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020DB0A8: .word 0x021E370C
_020DB0AC: .word 0x021E3750
_020DB0B0: .word 0x021E3754
	arm_func_end sub_020DB048

	arm_func_start sub_020DB0B4
sub_020DB0B4: ; 0x020DB0B4
	stmdb sp!, {r3, lr}
	ldr r2, _020DB0D8 ; =sub_020DADA0
	add r3, sp, #0
	bl sub_020DB048
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl sub_020DAD60
	ldr r0, [sp]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020DB0D8: .word sub_020DADA0
	arm_func_end sub_020DB0B4

	arm_func_start sub_020DB0DC
sub_020DB0DC: ; 0x020DB0DC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl sub_020DAD24
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	and r0, r7, #0xff
	ldr r1, _020DB134 ; =0x021E370C
	orr r0, r0, #0x6400
	str r5, [r1, #0x20]
	orr r0, r0, #0x2000000
	str r4, [r1, #0x24]
	bl sub_020DB410
	ldr r1, _020DB138 ; =0x01010000
	mov r0, r6, lsl #0x10
	orr r0, r1, r0, lsr #16
	bl sub_020DB410
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020DB134: .word 0x021E370C
_020DB138: .word 0x01010000
	arm_func_end sub_020DB0DC

	arm_func_start sub_020DB13C
sub_020DB13C: ; 0x020DB13C
	stmdb sp!, {r3, lr}
	ldr r2, _020DB160 ; =sub_020DADA0
	add r3, sp, #0
	bl sub_020DB0DC
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl sub_020DAD60
	ldr r0, [sp]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020DB160: .word sub_020DADA0
	arm_func_end sub_020DB13C

	arm_func_start sub_020DB164
sub_020DB164: ; 0x020DB164
	stmdb sp!, {r3, lr}
	cmp r0, #1
	beq _020DB184
	cmp r0, #2
	beq _020DB194
	cmp r0, #3
	beq _020DB18C
	b _020DB19C
_020DB184:
	mov r0, #1
	b _020DB1A0
_020DB18C:
	mov r0, #2
	b _020DB1A0
_020DB194:
	mov r0, #3
	b _020DB1A0
_020DB19C:
	mov r0, #0
_020DB1A0:
	cmp r0, #0
	ldreq r0, _020DB1B4 ; =0x0000FFFF
	ldmeqia sp!, {r3, pc}
	bl sub_020DAFE8
	ldmia sp!, {r3, pc}
	.align 2, 0
_020DB1B4: .word 0x0000FFFF
	arm_func_end sub_020DB164

	arm_func_start sub_020DB1B8
sub_020DB1B8: ; 0x020DB1B8
	stmdb sp!, {r3, lr}
	ldr r1, _020DB1DC ; =sub_020DADA0
	add r2, sp, #0
	bl sub_020DB164
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl sub_020DAD60
	ldr r0, [sp]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020DB1DC: .word sub_020DADA0
	arm_func_end sub_020DB1B8

	arm_func_start sub_020DB1E0
sub_020DB1E0: ; 0x020DB1E0
	stmdb sp!, {r3, lr}
	cmp r0, #0
	mov ip, #0
	bne _020DB204
	cmp r1, #1
	moveq ip, #6
	cmp r1, #0
	moveq ip, #7
	b _020DB238
_020DB204:
	cmp r0, #1
	bne _020DB220
	cmp r1, #1
	moveq ip, #4
	cmp r1, #0
	moveq ip, #5
	b _020DB238
_020DB220:
	cmp r0, #2
	bne _020DB238
	cmp r1, #1
	moveq ip, #8
	cmp r1, #0
	moveq ip, #9
_020DB238:
	cmp ip, #0
	ldreq r0, _020DB258 ; =0x0000FFFF
	ldmeqia sp!, {r3, pc}
	mov r1, r2
	mov r0, ip
	mov r2, r3
	bl sub_020DAFE8
	ldmia sp!, {r3, pc}
	.align 2, 0
_020DB258: .word 0x0000FFFF
	arm_func_end sub_020DB1E0

	arm_func_start PM_SetBackLight
PM_SetBackLight: ; 0x020DB25C
	stmdb sp!, {r3, lr}
	ldr r2, _020DB280 ; =sub_020DADA0
	add r3, sp, #0
	bl sub_020DB1E0
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl sub_020DAD60
	ldr r0, [sp]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020DB280: .word sub_020DADA0
	arm_func_end PM_SetBackLight

	arm_func_start sub_020DB284
sub_020DB284: ; 0x020DB284
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	mov r7, r0
	ldr r0, _020DB32C ; =0x00996A00
	mov r6, r1
	bl OS_SpinWait
	bl sub_020DB794
	cmp r0, #1
	beq _020DB314
	add r0, sp, #4
	add r1, sp, #0
	bl PM_GetBackLight
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _020DB2CC
	mov r0, #0
	mov r1, r0
	bl PM_SetBackLight
_020DB2CC:
	ldr r0, [sp]
	cmp r0, #0
	beq _020DB2E4
	mov r0, #1
	mov r1, #0
	bl PM_SetBackLight
_020DB2E4:
	mov r0, #1
	bl sub_020DB774
	cmp r0, #0
	bne _020DB314
	ldr r5, _020DB32C ; =0x00996A00
	mov r4, #1
_020DB2FC:
	mov r0, r5
	bl OS_SpinWait
	mov r0, r4
	bl sub_020DB774
	cmp r0, #0
	beq _020DB2FC
_020DB314:
	mov r1, r7
	mov r2, r6
	mov r0, #0xe
	bl sub_020DAFE8
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020DB32C: .word 0x00996A00
	arm_func_end sub_020DB284

	arm_func_start PM_ForceToPowerOff
PM_ForceToPowerOff: ; 0x020DB330
	stmdb sp!, {r3, lr}
	ldr r0, _020DB354 ; =sub_020DADA0
	add r1, sp, #0
	bl sub_020DB284
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl sub_020DAD60
	ldr r0, [sp]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020DB354: .word sub_020DADA0
	arm_func_end PM_ForceToPowerOff

	arm_func_start PM_SetAmp
PM_SetAmp: ; 0x020DB358
	ldr r1, _020DB368 ; =0x021E370C
	ldr ip, _020DB36C ; =sub_020DB370
	str r0, [r1, #0x14]
	bx ip
	.align 2, 0
_020DB368: .word 0x021E370C
_020DB36C: .word sub_020DB370
	arm_func_end PM_SetAmp

	arm_func_start sub_020DB370
sub_020DB370: ; 0x020DB370
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_020DB794
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	mov r0, r4, lsl #0x10
	mov r1, r0, lsr #0x10
	mov r0, #2
	bl sub_020DB13C
	ldmia sp!, {r4, pc}
	arm_func_end sub_020DB370

	arm_func_start PM_SetAmpGain
PM_SetAmpGain: ; 0x020DB39C
	ldr ip, _020DB3B0 ; =sub_020DB13C
	mov r0, r0, lsl #0x10
	mov r1, r0, lsr #0x10
	mov r0, #3
	bx ip
	.align 2, 0
_020DB3B0: .word sub_020DB13C
	arm_func_end PM_SetAmpGain

	arm_func_start PM_GetBackLight
PM_GetBackLight: ; 0x020DB3B4
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	add r1, sp, #0
	mov r0, #0
	bl sub_020DB0B4
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	cmp r5, #0
	beq _020DB3F0
	ldrh r1, [sp]
	tst r1, #8
	movne r1, #1
	moveq r1, #0
	str r1, [r5]
_020DB3F0:
	cmp r4, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrh r1, [sp]
	tst r1, #4
	movne r1, #1
	moveq r1, #0
	str r1, [r4]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end PM_GetBackLight

	arm_func_start sub_020DB410
sub_020DB410: ; 0x020DB410
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, #8
	mov r4, #0
_020DB420:
	mov r0, r5
	mov r1, r6
	mov r2, r4
	bl PXI_SendWordByFifo
	cmp r0, #0
	bne _020DB420
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020DB410

	arm_func_start PM_GoSleepMode
PM_GoSleepMode: ; 0x020DB43C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x18
	ldr r3, _020DB660 ; =0x021E370C
	mov sl, r0
	ldr r0, [r3, #0xc]
	mov sb, r1
	mov fp, r2
	mov r4, #0
	bl sub_020DB938
	ldr r1, _020DB664 ; =0x04000208
	mov r0, r4
	ldrh r8, [r1]
	strh r0, [r1]
	bl OS_DisableInterrupts
	str r0, [sp, #8]
	ldr r0, _020DB668 ; =0x003FFFFF
	bl OS_DisableIrqMask
	str r0, [sp, #4]
	bl OS_IsTickAvailable
	cmp r0, #0
	movne r0, #8
	moveq r0, r4
	orr r0, r0, #0x40000
	bl OS_SetIrqMask
	ldr r0, [sp, #8]
	bl OS_RestoreInterrupts
	ldr r2, _020DB664 ; =0x04000208
	mov r0, #1
	ldrh r1, [r2]
	tst sl, #8
	strh r0, [r2]
	beq _020DB4CC
	ldr r0, _020DB66C ; =0x027FFC40
	ldrh r0, [r0]
	cmp r0, #2
	biceq sl, sl, #8
_020DB4CC:
	tst sl, #0x10
	beq _020DB4E0
	bl sub_020E1134
	cmp r0, #0
	biceq sl, sl, #0x10
_020DB4E0:
	mov r1, #0x4000000
	add r0, r1, #0x1000
	ldr r5, [r1]
	ldr r6, [r0]
	bl sub_020DB794
	str r0, [sp]
	add r0, sp, #0x14
	add r1, sp, #0x10
	bl PM_GetBackLight
	mov r0, #2
	mov r1, #0
	bl PM_SetBackLight
	ldr r2, _020DB670 ; =0x027FFC3C
	ldr r0, [r2]
	str r0, [sp, #0xc]
_020DB51C:
	ldr r1, [r2]
	ldr r0, [sp, #0xc]
	cmp r0, r1
	beq _020DB51C
	ldr r0, [r2]
	mov r2, #0x4000000
	str r0, [sp, #0xc]
	ldr r0, [r2]
	add r1, r2, #0x1000
	bic r0, r0, #0x30000
	str r0, [r2]
	ldr r0, [r1]
	bic r0, r0, #0x10000
	str r0, [r1]
	ldr r2, _020DB670 ; =0x027FFC3C
_020DB558:
	ldr r1, [r2]
	ldr r0, [sp, #0xc]
	cmp r0, r1
	beq _020DB558
	ldr r0, [r2]
	str r0, [sp, #0xc]
	ldr r2, _020DB670 ; =0x027FFC3C
_020DB574:
	ldr r1, [r2]
	ldr r0, [sp, #0xc]
	cmp r0, r1
	beq _020DB574
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x10]
	orr r0, sl, r0, lsl #5
	orr r0, r0, r1, lsl #6
	mov r0, r0, lsl #0x10
	mov r7, r0, lsr #0x10
	orr r0, sb, fp
	mov r0, r0, lsl #0x10
	mov sb, r0, lsr #0x10
_020DB5A8:
	mov r0, r7
	mov r1, sb
	bl sub_020DAF54
	cmp r0, #0
	bne _020DB5A8
	bl OS_Halt
	tst sl, #8
	beq _020DB5D8
	ldr r0, _020DB674 ; =0x04000214
	ldr r0, [r0]
	tst r0, #0x100000
	movne r4, #1
_020DB5D8:
	cmp r4, #0
	bne _020DB618
	ldr r0, [sp]
	cmp r0, #1
	mov r0, #1
	bne _020DB604
	mov r1, r0
	mov r2, r0
	mov r3, r0
	bl sub_020DB67C
	b _020DB608
_020DB604:
	bl sub_020DB1B8
_020DB608:
	mov r0, #0x4000000
	str r5, [r0]
	add r0, r0, #0x1000
	str r6, [r0]
_020DB618:
	ldr r0, _020DB678 ; =0x00708100
	bl OS_SpinWait
	bl OS_DisableInterrupts
	ldr r0, [sp, #4]
	bl OS_SetIrqMask
	ldr r0, [sp, #8]
	bl OS_RestoreInterrupts
	ldr r1, _020DB664 ; =0x04000208
	cmp r4, #0
	ldrh r0, [r1]
	strh r8, [r1]
	beq _020DB64C
	bl PM_ForceToPowerOff
_020DB64C:
	ldr r0, _020DB660 ; =0x021E370C
	ldr r0, [r0, #0x18]
	bl sub_020DB938
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020DB660: .word 0x021E370C
_020DB664: .word 0x04000208
_020DB668: .word 0x003FFFFF
_020DB66C: .word 0x027FFC40
_020DB670: .word 0x027FFC3C
_020DB674: .word 0x04000214
_020DB678: .word 0x00708100
	arm_func_end PM_GoSleepMode

	arm_func_start sub_020DB67C
sub_020DB67C: ; 0x020DB67C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	mov r4, r3
	cmp r0, #0
	beq _020DB70C
	cmp r0, #1
	bne _020DB760
	cmp r2, #0
	bne _020DB6C0
	ldr r1, _020DB768 ; =0x027FFC3C
	ldr r0, _020DB76C ; =0x021E370C
	ldr r1, [r1]
	ldr r0, [r0, #0x10]
	sub r0, r1, r0
	cmp r0, #7
	movls r0, #0
	ldmlsia sp!, {r3, r4, r5, pc}
_020DB6C0:
	cmp r5, #0
	beq _020DB6EC
	cmp r4, #0
	beq _020DB6DC
	mov r0, r5
	bl sub_020DB1B8
	b _020DB6EC
_020DB6DC:
	mov r1, #0
	mov r0, r5
	mov r2, r1
	bl sub_020DB164
_020DB6EC:
	ldr r2, _020DB770 ; =0x04000304
	ldr r0, _020DB76C ; =0x021E370C
	ldrh r1, [r2]
	orr r1, r1, #1
	strh r1, [r2]
	ldr r0, [r0, #0x14]
	bl sub_020DB370
	b _020DB760
_020DB70C:
	mov r0, #0
	bl sub_020DB370
	ldr r3, _020DB770 ; =0x04000304
	ldr r1, _020DB768 ; =0x027FFC3C
	ldrh r2, [r3]
	ldr r0, _020DB76C ; =0x021E370C
	cmp r5, #0
	bic r2, r2, #1
	strh r2, [r3]
	ldr r1, [r1]
	str r1, [r0, #0x10]
	beq _020DB760
	cmp r4, #0
	beq _020DB750
	mov r0, r5
	bl sub_020DB1B8
	b _020DB760
_020DB750:
	mov r1, #0
	mov r0, r5
	mov r2, r1
	bl sub_020DB164
_020DB760:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020DB768: .word 0x027FFC3C
_020DB76C: .word 0x021E370C
_020DB770: .word 0x04000304
	arm_func_end sub_020DB67C

	arm_func_start sub_020DB774
sub_020DB774: ; 0x020DB774
	ldr ip, _020DB790 ; =sub_020DB67C
	mov r1, #0
	cmp r0, #1
	movne r0, #0
	mov r2, r1
	mov r3, #1
	bx ip
	.align 2, 0
_020DB790: .word sub_020DB67C
	arm_func_end sub_020DB774

	arm_func_start sub_020DB794
sub_020DB794: ; 0x020DB794
	ldr r0, _020DB7AC ; =0x04000304
	ldrh r0, [r0]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	bx lr
	.align 2, 0
_020DB7AC: .word 0x04000304
	arm_func_end sub_020DB794

	arm_func_start sub_020DB7B0
sub_020DB7B0: ; 0x020DB7B0
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl sub_020DAD24
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r4, r5, r6, pc}
	and r0, r6, #0xff
	ldr r1, _020DB7F4 ; =0x021E370C
	orr r0, r0, #0x6600
	str r5, [r1, #0x20]
	orr r0, r0, #0x3000000
	str r4, [r1, #0x24]
	bl sub_020DB410
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020DB7F4: .word 0x021E370C
	arm_func_end sub_020DB7B0

	arm_func_start sub_020DB7F8
sub_020DB7F8: ; 0x020DB7F8
	stmdb sp!, {r3, lr}
	ldr r1, _020DB81C ; =sub_020DADA0
	add r2, sp, #0
	bl sub_020DB7B0
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl sub_020DAD60
	ldr r0, [sp]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020DB81C: .word sub_020DADA0
	arm_func_end sub_020DB7F8

	arm_func_start sub_020DB820
sub_020DB820: ; 0x020DB820
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl sub_020DAD24
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r1, _020DB860 ; =0x021E370C
	ldr r0, _020DB864 ; =0x03006700
	str r5, [r1, #0x20]
	str r4, [r1, #0x24]
	str r6, [r1, #0x28]
	bl sub_020DB410
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020DB860: .word 0x021E370C
_020DB864: .word 0x03006700
	arm_func_end sub_020DB820

	arm_func_start sub_020DB868
sub_020DB868: ; 0x020DB868
	stmdb sp!, {r3, lr}
	ldr r1, _020DB88C ; =sub_020DADA0
	add r2, sp, #0
	bl sub_020DB820
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl sub_020DAD60
	ldr r0, [sp]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020DB88C: .word sub_020DADA0
	arm_func_end sub_020DB868

	arm_func_start sub_020DB890
sub_020DB890: ; 0x020DB890
	cmp r0, #0
	ldrne r2, [r0]
	strne r2, [r1, #8]
	strne r1, [r0]
	bx lr
	arm_func_end sub_020DB890

	arm_func_start sub_020DB8A4
sub_020DB8A4: ; 0x020DB8A4
	cmp r0, #0
	bxeq lr
	ldr r2, [r0]
	cmp r2, #0
	bne _020DB8C8
	mov r2, #0
	str r2, [r1, #8]
	str r1, [r0]
	bx lr
_020DB8C8:
	ldr r0, [r2, #8]
	cmp r0, #0
	beq _020DB8E4
_020DB8D4:
	mov r2, r0
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _020DB8D4
_020DB8E4:
	str r0, [r1, #8]
	str r1, [r2, #8]
	bx lr
	arm_func_end sub_020DB8A4

	arm_func_start sub_020DB8F0
sub_020DB8F0: ; 0x020DB8F0
	cmp r0, #0
	ldrne r2, [r0]
	movne r3, r2
	cmpne r2, #0
	bxeq lr
_020DB904:
	cmp r2, r1
	bne _020DB924
	cmp r2, r3
	ldreq r1, [r2, #8]
	streq r1, [r0]
	ldrne r0, [r2, #8]
	strne r0, [r3, #8]
	bx lr
_020DB924:
	mov r3, r2
	ldr r2, [r2, #8]
	cmp r2, #0
	bne _020DB904
	bx lr
	arm_func_end sub_020DB8F0

	arm_func_start sub_020DB938
sub_020DB938: ; 0x020DB938
	stmdb sp!, {r4, lr}
	movs r4, r0
	ldmeqia sp!, {r4, pc}
_020DB944:
	ldr r0, [r4, #4]
	ldr r1, [r4]
	blx r1
	ldr r4, [r4, #8]
	cmp r4, #0
	bne _020DB944
	ldmia sp!, {r4, pc}
	arm_func_end sub_020DB938

	arm_func_start sub_020DB960
sub_020DB960: ; 0x020DB960
	ldr ip, _020DB970 ; =sub_020DB890
	mov r1, r0
	ldr r0, _020DB974 ; =0x021E3718
	bx ip
	.align 2, 0
_020DB970: .word sub_020DB890
_020DB974: .word 0x021E3718
	arm_func_end sub_020DB960

	arm_func_start sub_020DB978
sub_020DB978: ; 0x020DB978
	ldr ip, _020DB988 ; =sub_020DB8A4
	mov r1, r0
	ldr r0, _020DB98C ; =0x021E3724
	bx ip
	.align 2, 0
_020DB988: .word sub_020DB8A4
_020DB98C: .word 0x021E3724
	arm_func_end sub_020DB978

	arm_func_start sub_020DB990
sub_020DB990: ; 0x020DB990
	ldr ip, _020DB9A0 ; =sub_020DB8F0
	mov r1, r0
	ldr r0, _020DB9A4 ; =0x021E3718
	bx ip
	.align 2, 0
_020DB9A0: .word sub_020DB8F0
_020DB9A4: .word 0x021E3718
	arm_func_end sub_020DB990

	arm_func_start sub_020DB9A8
sub_020DB9A8: ; 0x020DB9A8
	ldr ip, _020DB9B8 ; =sub_020DB8F0
	mov r1, r0
	ldr r0, _020DB9BC ; =0x021E3724
	bx ip
	.align 2, 0
_020DB9B8: .word sub_020DB8F0
_020DB9BC: .word 0x021E3724
	arm_func_end sub_020DB9A8

	arm_func_start RTC_Init
RTC_Init: ; 0x020DB9C0
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _020DBA24 ; =0x021E3778
	ldrh r1, [r0]
	cmp r1, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r1, #1
	strh r1, [r0]
	mov r1, #0
	str r1, [r0, #0xc]
	str r1, [r0, #0x10]
	str r1, [r0, #0x28]
	str r1, [r0, #0x14]
	str r1, [r0, #0x18]
	bl PXI_Init
	mov r5, #5
	mov r4, #1
_020DBA00:
	mov r0, r5
	mov r1, r4
	bl PXI_IsCallbackReady
	cmp r0, #0
	beq _020DBA00
	ldr r1, _020DBA28 ; =sub_020DBC34
	mov r0, #5
	bl PXI_SetFifoRecvCallback
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020DBA24: .word 0x021E3778
_020DBA28: .word sub_020DBC34
	arm_func_end RTC_Init

	arm_func_start sub_020DBA2C
sub_020DBA2C: ; 0x020DBA2C
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl OS_DisableInterrupts
	ldr r1, _020DBA98 ; =0x021E3778
	ldr r2, [r1, #0xc]
	cmp r2, #0
	beq _020DBA5C
	bl OS_RestoreInterrupts
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
_020DBA5C:
	mov r2, #1
	str r2, [r1, #0xc]
	bl OS_RestoreInterrupts
	ldr r0, _020DBA98 ; =0x021E3778
	mov r1, #0
	str r1, [r0, #0x20]
	str r1, [r0, #0x24]
	str r6, [r0, #0x14]
	str r5, [r0, #0x10]
	str r4, [r0, #0x1c]
	bl sub_020DC22C
	cmp r0, #0
	movne r0, #0
	moveq r0, #3
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020DBA98: .word 0x021E3778
	arm_func_end sub_020DBA2C

	arm_func_start sub_020DBA9C
sub_020DBA9C: ; 0x020DBA9C
	stmdb sp!, {r3, lr}
	ldr r1, _020DBACC ; =sub_020DC1F4
	mov r2, #0
	bl sub_020DBA2C
	ldr r1, _020DBAD0 ; =0x021E3778
	cmp r0, #0
	str r0, [r1, #0x2c]
	bne _020DBAC0
	bl sub_020DC204
_020DBAC0:
	ldr r0, _020DBAD0 ; =0x021E3778
	ldr r0, [r0, #0x2c]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020DBACC: .word sub_020DC1F4
_020DBAD0: .word 0x021E3778
	arm_func_end sub_020DBA9C

	arm_func_start sub_020DBAD4
sub_020DBAD4: ; 0x020DBAD4
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl OS_DisableInterrupts
	ldr r1, _020DBB44 ; =0x021E3778
	ldr r2, [r1, #0xc]
	cmp r2, #0
	beq _020DBB04
	bl OS_RestoreInterrupts
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
_020DBB04:
	mov r2, #1
	str r2, [r1, #0xc]
	bl OS_RestoreInterrupts
	ldr r0, _020DBB44 ; =0x021E3778
	mov r1, #1
	str r1, [r0, #0x20]
	mov r1, #0
	str r1, [r0, #0x24]
	str r6, [r0, #0x14]
	str r5, [r0, #0x10]
	str r4, [r0, #0x1c]
	bl sub_020DC23C
	cmp r0, #0
	movne r0, #0
	moveq r0, #3
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020DBB44: .word 0x021E3778
	arm_func_end sub_020DBAD4

	arm_func_start sub_020DBB48
sub_020DBB48: ; 0x020DBB48
	stmdb sp!, {r3, lr}
	ldr r1, _020DBB78 ; =sub_020DC1F4
	mov r2, #0
	bl sub_020DBAD4
	ldr r1, _020DBB7C ; =0x021E3778
	cmp r0, #0
	str r0, [r1, #0x2c]
	bne _020DBB6C
	bl sub_020DC204
_020DBB6C:
	ldr r0, _020DBB7C ; =0x021E3778
	ldr r0, [r0, #0x2c]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020DBB78: .word sub_020DC1F4
_020DBB7C: .word 0x021E3778
	arm_func_end sub_020DBB48

	arm_func_start RTC_GetDateTimeAsync
RTC_GetDateTimeAsync: ; 0x020DBB80
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl OS_DisableInterrupts
	ldr r1, _020DBBF8 ; =0x021E3778
	ldr r2, [r1, #0xc]
	cmp r2, #0
	beq _020DBBB4
	bl OS_RestoreInterrupts
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020DBBB4:
	mov r2, #1
	str r2, [r1, #0xc]
	bl OS_RestoreInterrupts
	ldr r0, _020DBBF8 ; =0x021E3778
	mov r1, #2
	str r1, [r0, #0x20]
	mov r1, #0
	str r1, [r0, #0x24]
	str r7, [r0, #0x14]
	str r6, [r0, #0x18]
	str r5, [r0, #0x10]
	str r4, [r0, #0x1c]
	bl sub_020DC21C
	cmp r0, #0
	movne r0, #0
	moveq r0, #3
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020DBBF8: .word 0x021E3778
	arm_func_end RTC_GetDateTimeAsync

	arm_func_start sub_020DBBFC
sub_020DBBFC: ; 0x020DBBFC
	stmdb sp!, {r3, lr}
	ldr r2, _020DBC2C ; =sub_020DC1F4
	mov r3, #0
	bl RTC_GetDateTimeAsync
	ldr r1, _020DBC30 ; =0x021E3778
	cmp r0, #0
	str r0, [r1, #0x2c]
	bne _020DBC20
	bl sub_020DC204
_020DBC20:
	ldr r0, _020DBC30 ; =0x021E3778
	ldr r0, [r0, #0x2c]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020DBC2C: .word sub_020DC1F4
_020DBC30: .word 0x021E3778
	arm_func_end sub_020DBBFC

	arm_func_start sub_020DBC34
sub_020DBC34: ; 0x020DBC34
	stmdb sp!, {r3, r4, r5, lr}
	cmp r2, #0
	beq _020DBC90
	ldr r0, _020DC174 ; =0x021E3778
	ldr r1, [r0, #0x24]
	cmp r1, #0
	movne r1, #0
	strne r1, [r0, #0x24]
	ldr r0, _020DC174 ; =0x021E3778
	ldr r1, [r0, #0xc]
	cmp r1, #0
	movne r1, #0
	strne r1, [r0, #0xc]
	ldr r0, _020DC174 ; =0x021E3778
	ldr r2, [r0, #0x10]
	cmp r2, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r1, #0
	str r1, [r0, #0x10]
	ldr r1, [r0, #0x1c]
	mov r0, #6
	blx r2
	ldmia sp!, {r3, r4, r5, pc}
_020DBC90:
	and r0, r1, #0x7f00
	mov r0, r0, lsr #8
	and r0, r0, #0xff
	cmp r0, #0x30
	and r2, r1, #0xff
	bne _020DBCC0
	ldr r0, _020DC174 ; =0x021E3778
	ldr r0, [r0, #0x28]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	blx r0
	ldmia sp!, {r3, r4, r5, pc}
_020DBCC0:
	cmp r2, #0
	bne _020DC0E4
	ldr r0, _020DC174 ; =0x021E3778
	mov r4, #0
	ldr r1, [r0, #0x20]
	cmp r1, #0xf
	addls pc, pc, r1, lsl #2
	b _020DC0D0
_020DBCE0: ; jump table
	b _020DBD20 ; case 0
	b _020DBD7C ; case 1
	b _020DBDCC ; case 2
	b _020DC12C ; case 3
	b _020DC12C ; case 4
	b _020DC12C ; case 5
	b _020DBE74 ; case 6
	b _020DBEA4 ; case 7
	b _020DBEC8 ; case 8
	b _020DBF70 ; case 9
	b _020DC024 ; case 10
	b _020DC12C ; case 11
	b _020DC12C ; case 12
	b _020DC12C ; case 13
	b _020DC12C ; case 14
	b _020DC12C ; case 15
_020DBD20:
	ldr r1, _020DC178 ; =0x027FFDE8
	ldr r5, [r0, #0x14]
	ldr r0, [r1]
	mov r0, r0, lsl #0x18
	mov r0, r0, lsr #0x18
	bl sub_020DC184
	ldr r1, _020DC178 ; =0x027FFDE8
	str r0, [r5]
	ldr r0, [r1]
	mov r0, r0, lsl #0x13
	mov r0, r0, lsr #0x1b
	bl sub_020DC184
	ldr r1, _020DC178 ; =0x027FFDE8
	str r0, [r5, #4]
	ldr r0, [r1]
	mov r0, r0, lsl #0xa
	mov r0, r0, lsr #0x1a
	bl sub_020DC184
	str r0, [r5, #8]
	mov r0, r5
	bl sub_020DC5A0
	str r0, [r5, #0xc]
	b _020DC12C
_020DBD7C:
	ldr r1, _020DC17C ; =0x027FFDEC
	ldr r5, [r0, #0x14]
	ldr r0, [r1]
	mov r0, r0, lsl #0x1a
	mov r0, r0, lsr #0x1a
	bl sub_020DC184
	ldr r1, _020DC17C ; =0x027FFDEC
	str r0, [r5]
	ldr r0, [r1]
	mov r0, r0, lsl #0x11
	mov r0, r0, lsr #0x19
	bl sub_020DC184
	ldr r1, _020DC17C ; =0x027FFDEC
	str r0, [r5, #4]
	ldr r0, [r1]
	mov r0, r0, lsl #9
	mov r0, r0, lsr #0x19
	bl sub_020DC184
	str r0, [r5, #8]
	b _020DC12C
_020DBDCC:
	ldr r1, _020DC178 ; =0x027FFDE8
	ldr r5, [r0, #0x14]
	ldr r0, [r1]
	and r0, r0, #0xff
	bl sub_020DC184
	ldr r1, _020DC178 ; =0x027FFDE8
	str r0, [r5]
	ldr r0, [r1]
	mov r0, r0, lsl #0x13
	mov r0, r0, lsr #0x1b
	bl sub_020DC184
	ldr r1, _020DC178 ; =0x027FFDE8
	str r0, [r5, #4]
	ldr r0, [r1]
	mov r0, r0, lsl #0xa
	mov r0, r0, lsr #0x1a
	bl sub_020DC184
	str r0, [r5, #8]
	mov r0, r5
	bl sub_020DC5A0
	ldr r1, _020DC17C ; =0x027FFDEC
	str r0, [r5, #0xc]
	ldr r0, [r1]
	ldr r1, _020DC174 ; =0x021E3778
	mov r0, r0, lsl #0x1a
	mov r0, r0, lsr #0x1a
	ldr r5, [r1, #0x18]
	bl sub_020DC184
	ldr r1, _020DC17C ; =0x027FFDEC
	str r0, [r5]
	ldr r0, [r1]
	mov r0, r0, lsl #0x11
	mov r0, r0, lsr #0x19
	bl sub_020DC184
	ldr r1, _020DC17C ; =0x027FFDEC
	str r0, [r5, #4]
	ldr r0, [r1]
	mov r0, r0, lsl #9
	mov r0, r0, lsr #0x19
	bl sub_020DC184
	str r0, [r5, #8]
	b _020DC12C
_020DBE74:
	ldr r1, _020DC180 ; =0x027FFDEA
	ldr r2, [r0, #0x14]
	ldrh r0, [r1]
	mov r0, r0, lsl #0x1c
	mov r0, r0, lsr #0x1c
	cmp r0, #4
	bne _020DBE9C
	mov r0, #1
	str r0, [r2]
	b _020DC12C
_020DBE9C:
	str r4, [r2]
	b _020DC12C
_020DBEA4:
	ldr r1, _020DC180 ; =0x027FFDEA
	ldr r2, [r0, #0x14]
	ldrh r0, [r1]
	mov r0, r0, lsl #0x19
	movs r0, r0, lsr #0x1f
	movne r0, #1
	strne r0, [r2]
	streq r4, [r2]
	b _020DC12C
_020DBEC8:
	ldr r1, _020DC17C ; =0x027FFDEC
	ldr r5, [r0, #0x14]
	ldr r0, [r1]
	mov r0, r0, lsl #0x1d
	mov r0, r0, lsr #0x1d
	str r0, [r5]
	ldr r0, [r1]
	mov r0, r0, lsl #0x12
	mov r0, r0, lsr #0x1a
	bl sub_020DC184
	ldr r1, _020DC17C ; =0x027FFDEC
	str r0, [r5, #4]
	ldr r0, [r1]
	mov r0, r0, lsl #9
	mov r0, r0, lsr #0x19
	bl sub_020DC184
	str r0, [r5, #8]
	mov r1, r4
	ldr r0, _020DC17C ; =0x027FFDEC
	str r1, [r5, #0xc]
	ldr r0, [r0]
	mov r0, r0, lsl #0x18
	movs r0, r0, lsr #0x1f
	ldrne r0, [r5, #0xc]
	addne r0, r0, #1
	strne r0, [r5, #0xc]
	ldr r0, _020DC17C ; =0x027FFDEC
	ldr r0, [r0]
	mov r0, r0, lsl #0x10
	movs r0, r0, lsr #0x1f
	ldrne r0, [r5, #0xc]
	addne r0, r0, #2
	strne r0, [r5, #0xc]
	ldr r0, _020DC17C ; =0x027FFDEC
	ldr r0, [r0]
	mov r0, r0, lsl #8
	movs r0, r0, lsr #0x1f
	beq _020DC12C
	ldr r0, [r5, #0xc]
	add r0, r0, #4
	str r0, [r5, #0xc]
	b _020DC12C
_020DBF70:
	ldr r3, [r0, #0x24]
	cmp r3, #0
	bne _020DC01C
	ldr r1, [r0, #0x14]
	ldr r2, _020DC180 ; =0x027FFDEA
	ldr r1, [r1]
	cmp r1, #1
	ldrh r1, [r2]
	bne _020DBFDC
	mov r1, r1, lsl #0x1c
	mov r1, r1, lsr #0x1c
	cmp r1, #4
	beq _020DC12C
	add r1, r3, #1
	str r1, [r0, #0x24]
	ldrh r0, [r2]
	bic r0, r0, #0xf
	orr r0, r0, #4
	strh r0, [r2]
	bl sub_020DC24C
	cmp r0, #0
	bne _020DC12C
	ldr r0, _020DC174 ; =0x021E3778
	mov r1, r4
	str r1, [r0, #0x24]
	mov r4, #3
	b _020DC12C
_020DBFDC:
	mov r1, r1, lsl #0x1c
	movs r1, r1, lsr #0x1c
	beq _020DC12C
	add r1, r3, #1
	str r1, [r0, #0x24]
	ldrh r0, [r2]
	bic r0, r0, #0xf
	strh r0, [r2]
	bl sub_020DC24C
	cmp r0, #0
	bne _020DC12C
	ldr r0, _020DC174 ; =0x021E3778
	mov r1, r4
	str r1, [r0, #0x24]
	mov r4, #3
	b _020DC12C
_020DC01C:
	str r4, [r0, #0x24]
	b _020DC12C
_020DC024:
	ldr r3, [r0, #0x24]
	cmp r3, #0
	bne _020DC0C8
	ldr r1, [r0, #0x14]
	ldr r2, _020DC180 ; =0x027FFDEA
	ldr r1, [r1]
	cmp r1, #1
	ldrh r1, [r2]
	bne _020DC088
	mov r1, r1, lsl #0x19
	movs r1, r1, lsr #0x1f
	bne _020DC12C
	add r1, r3, #1
	str r1, [r0, #0x24]
	ldrh r0, [r2]
	orr r0, r0, #0x40
	strh r0, [r2]
	bl sub_020DC24C
	cmp r0, #0
	bne _020DC12C
	ldr r0, _020DC174 ; =0x021E3778
	mov r1, r4
	str r1, [r0, #0x24]
	mov r4, #3
	b _020DC12C
_020DC088:
	mov r1, r1, lsl #0x19
	movs r1, r1, lsr #0x1f
	beq _020DC12C
	add r1, r3, #1
	str r1, [r0, #0x24]
	ldrh r0, [r2]
	bic r0, r0, #0x40
	strh r0, [r2]
	bl sub_020DC24C
	cmp r0, #0
	bne _020DC12C
	ldr r0, _020DC174 ; =0x021E3778
	mov r1, r4
	str r1, [r0, #0x24]
	mov r4, #3
	b _020DC12C
_020DC0C8:
	str r4, [r0, #0x24]
	b _020DC12C
_020DC0D0:
	ldr r0, _020DC174 ; =0x021E3778
	mov r1, #0
	str r1, [r0, #0x24]
	mov r4, #4
	b _020DC12C
_020DC0E4:
	ldr r0, _020DC174 ; =0x021E3778
	mov r1, #0
	str r1, [r0, #0x24]
	cmp r2, #4
	addls pc, pc, r2, lsl #2
	b _020DC128
_020DC0FC: ; jump table
	b _020DC128 ; case 0
	b _020DC110 ; case 1
	b _020DC118 ; case 2
	b _020DC120 ; case 3
	b _020DC128 ; case 4
_020DC110:
	mov r4, #4
	b _020DC12C
_020DC118:
	mov r4, #5
	b _020DC12C
_020DC120:
	mov r4, #1
	b _020DC12C
_020DC128:
	mov r4, #6
_020DC12C:
	ldr r0, _020DC174 ; =0x021E3778
	ldr r1, [r0, #0x24]
	cmp r1, #0
	ldmneia sp!, {r3, r4, r5, pc}
	ldr r1, [r0, #0xc]
	cmp r1, #0
	movne r1, #0
	strne r1, [r0, #0xc]
	ldr r0, _020DC174 ; =0x021E3778
	ldr r2, [r0, #0x10]
	cmp r2, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r1, #0
	str r1, [r0, #0x10]
	ldr r1, [r0, #0x1c]
	mov r0, r4
	blx r2
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020DC174: .word 0x021E3778
_020DC178: .word 0x027FFDE8
_020DC17C: .word 0x027FFDEC
_020DC180: .word 0x027FFDEA
	arm_func_end sub_020DBC34

	arm_func_start sub_020DC184
sub_020DC184: ; 0x020DC184
	stmdb sp!, {r3, r4, r5, lr}
	mov ip, #0
	mov r2, ip
	mov r3, ip
_020DC194:
	mov r1, r0, lsr r3
	and r1, r1, #0xf
	cmp r1, #0xa
	movhs r0, #0
	ldmhsia sp!, {r3, r4, r5, pc}
	add r2, r2, #1
	cmp r2, #8
	add r3, r3, #4
	blt _020DC194
	mov r5, #0
	mov r4, r5
	mov lr, #1
	mov r2, #0xa
_020DC1C8:
	mov r1, r0, lsr r4
	and r3, r1, #0xf
	mul r1, lr, r2
	mla ip, lr, r3, ip
	add r5, r5, #1
	mov lr, r1
	cmp r5, #8
	add r4, r4, #4
	blt _020DC1C8
	mov r0, ip
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020DC184

	arm_func_start sub_020DC1F4
sub_020DC1F4: ; 0x020DC1F4
	ldr r1, _020DC200 ; =0x021E3778
	str r0, [r1, #0x2c]
	bx lr
	.align 2, 0
_020DC200: .word 0x021E3778
	arm_func_end sub_020DC1F4

	arm_func_start sub_020DC204
sub_020DC204: ; 0x020DC204
	ldr ip, _020DC218 ; =0x021E3784
_020DC208:
	ldr r0, [ip]
	cmp r0, #1
	beq _020DC208
	bx lr
	.align 2, 0
_020DC218: .word 0x021E3784
	arm_func_end sub_020DC204

	arm_func_start sub_020DC21C
sub_020DC21C: ; 0x020DC21C
	ldr ip, _020DC228 ; =sub_020DC25C
	mov r0, #0x10
	bx ip
	.align 2, 0
_020DC228: .word sub_020DC25C
	arm_func_end sub_020DC21C

	arm_func_start sub_020DC22C
sub_020DC22C: ; 0x020DC22C
	ldr ip, _020DC238 ; =sub_020DC25C
	mov r0, #0x11
	bx ip
	.align 2, 0
_020DC238: .word sub_020DC25C
	arm_func_end sub_020DC22C

	arm_func_start sub_020DC23C
sub_020DC23C: ; 0x020DC23C
	ldr ip, _020DC248 ; =sub_020DC25C
	mov r0, #0x12
	bx ip
	.align 2, 0
_020DC248: .word sub_020DC25C
	arm_func_end sub_020DC23C

	arm_func_start sub_020DC24C
sub_020DC24C: ; 0x020DC24C
	ldr ip, _020DC258 ; =sub_020DC25C
	mov r0, #0x27
	bx ip
	.align 2, 0
_020DC258: .word sub_020DC25C
	arm_func_end sub_020DC24C

	arm_func_start sub_020DC25C
sub_020DC25C: ; 0x020DC25C
	stmdb sp!, {r3, lr}
	mov r0, r0, lsl #8
	and r1, r0, #0x7f00
	mov r0, #5
	mov r2, #0
	bl PXI_SendWordByFifo
	cmp r0, #0
	movge r0, #1
	movlt r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_020DC25C

	arm_func_start sub_020DC284
sub_020DC284: ; 0x020DC284
	ldr r3, [r0]
	cmp r3, #0x64
	bhs _020DC2D4
	ldr r2, [r0, #4]
	cmp r2, #1
	blo _020DC2D4
	cmp r2, #0xc
	bhi _020DC2D4
	ldr r1, [r0, #8]
	cmp r1, #1
	blo _020DC2D4
	cmp r1, #0x1f
	bhi _020DC2D4
	ldr r0, [r0, #0xc]
	cmp r0, #7
	bge _020DC2D4
	cmp r2, #1
	blo _020DC2D4
	cmp r2, #0xc
	bls _020DC2DC
_020DC2D4:
	mvn r0, #0
	bx lr
_020DC2DC:
	ldr r0, _020DC310 ; =_02110F84
	sub r1, r1, #1
	ldr r0, [r0, r2, lsl #2]
	cmp r2, #3
	add r2, r1, r0
	blo _020DC2FC
	tst r3, #3
	addeq r2, r2, #1
_020DC2FC:
	ldr r0, _020DC314 ; =0x0000016D
	add r1, r3, #3
	mla r0, r3, r0, r2
	add r0, r0, r1, lsr #2
	bx lr
	.align 2, 0
_020DC310: .word _02110F84
_020DC314: .word 0x0000016D
	arm_func_end sub_020DC284

	arm_func_start sub_020DC318
sub_020DC318: ; 0x020DC318
	mov r1, #0x3c
	ldmia r0, {r2, r3}
	mla r3, r2, r1, r3
	ldr r0, [r0, #8]
	mla r0, r3, r1, r0
	bx lr
	arm_func_end sub_020DC318

	arm_func_start RTC_ConvertDateTimeToSecond
RTC_ConvertDateTimeToSecond: ; 0x020DC330
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	bl sub_020DC284
	mov r4, r0
	mvn r0, #0
	cmp r4, r0
	moveq r1, r0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r5
	bl sub_020DC318
	mvn r2, #0
	cmp r0, r2
	moveq r1, r2
	beq _020DC388
	ldr r1, _020DC390 ; =0x00015180
	mov r2, #0
	umull ip, r3, r4, r1
	mla r3, r4, r2, r3
	mov r2, r4, asr #0x1f
	mla r3, r2, r1, r3
	adds r2, r0, ip
	adc r1, r3, r0, asr #31
_020DC388:
	mov r0, r2
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020DC390: .word 0x00015180
	arm_func_end RTC_ConvertDateTimeToSecond

	arm_func_start sub_020DC394
sub_020DC394: ; 0x020DC394
	stmdb sp!, {r4, lr}
	ldr r2, _020DC484 ; =0x00008EAC
	cmp r1, #0
	movlt r1, #0
	cmp r1, r2
	movgt r1, r2
	ldr r3, _020DC488 ; =0x92492493
	add lr, r1, #6
	smull r2, r4, r3, lr
	add r4, lr, r4
	mov r2, lr, lsr #0x1f
	add r4, r2, r4, asr #2
	mov ip, #7
	smull r2, r3, ip, r4
	sub r4, lr, r2
	ldr r2, _020DC48C ; =0x0000016D
	str r4, [r0, #0xc]
	mov r3, #0
_020DC3DC:
	tst r3, #3
	addeq ip, r2, #1
	movne ip, r2
	mov r4, r1
	subs r1, r1, ip
	movmi r1, r4
	bmi _020DC404
	add r3, r3, #1
	cmp r3, #0x63
	blo _020DC3DC
_020DC404:
	ldr r2, _020DC48C ; =0x0000016D
	str r3, [r0]
	cmp r1, r2
	movgt r1, r2
	tst r3, #3
	bne _020DC448
	cmp r1, #0x3c
	bge _020DC444
	cmp r1, #0x1f
	movlt r2, #1
	subge r1, r1, #0x1f
	movge r2, #2
	str r2, [r0, #4]
	add r1, r1, #1
	str r1, [r0, #8]
	ldmia sp!, {r4, pc}
_020DC444:
	sub r1, r1, #1
_020DC448:
	ldr r3, _020DC490 ; =_02110F88
	mov r4, #0xb
_020DC450:
	ldr r2, [r3, r4, lsl #2]
	cmp r1, r2
	blt _020DC478
	add r2, r4, #1
	str r2, [r0, #4]
	ldr r2, [r3, r4, lsl #2]
	sub r1, r1, r2
	add r1, r1, #1
	str r1, [r0, #8]
	ldmia sp!, {r4, pc}
_020DC478:
	subs r4, r4, #1
	bpl _020DC450
	ldmia sp!, {r4, pc}
	.align 2, 0
_020DC484: .word 0x00008EAC
_020DC488: .word 0x92492493
_020DC48C: .word 0x0000016D
_020DC490: .word _02110F88
	arm_func_end sub_020DC394

	arm_func_start sub_020DC494
sub_020DC494: ; 0x020DC494
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, _020DC50C ; =0x0001517F
	cmp r1, #0
	movlt r1, #0
	cmp r1, r2
	movgt r1, r2
	ldr lr, _020DC510 ; =0x88888889
	mov ip, r1, lsr #0x1f
	smull r3, r2, lr, r1
	smull r3, r6, lr, r1
	add r2, r1, r2
	add r2, ip, r2, asr #5
	smull r3, r5, lr, r2
	smull r3, r4, lr, r2
	add r6, r1, r6
	add r6, ip, r6, asr #5
	mov lr, #0x3c
	smull r3, ip, lr, r6
	sub r6, r1, r3
	add r5, r2, r5
	mov ip, r2, lsr #0x1f
	add r5, ip, r5, asr #5
	smull r1, r3, lr, r5
	add r4, r2, r4
	str r6, [r0, #8]
	sub r5, r2, r1
	str r5, [r0, #4]
	add r4, ip, r4, asr #5
	str r4, [r0]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020DC50C: .word 0x0001517F
_020DC510: .word 0x88888889
	arm_func_end sub_020DC494

	arm_func_start sub_020DC514
sub_020DC514: ; 0x020DC514
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r2
	mov r4, r3
	subs r2, r5, #0
	sbcs r2, r4, #0
	mov r2, #0
	mov r7, r0
	mov r6, r1
	movlt r5, r2
	movlt r4, r2
	blt _020DC554
	ldr r1, _020DC598 ; =0xBC19137F
	subs r0, r1, r5
	sbcs r0, r2, r4
	movlt r5, r1
	movlt r4, r2
_020DC554:
	ldr r2, _020DC59C ; =0x00015180
	mov r0, r5
	mov r1, r4
	mov r3, #0
	bl _ll_mod
	mov r1, r0
	mov r0, r6
	bl sub_020DC494
	ldr r2, _020DC59C ; =0x00015180
	mov r0, r5
	mov r1, r4
	mov r3, #0
	bl _ll_sdiv
	mov r1, r0
	mov r0, r7
	bl sub_020DC394
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020DC598: .word 0xBC19137F
_020DC59C: .word 0x00015180
	arm_func_end sub_020DC514

	arm_func_start sub_020DC5A0
sub_020DC5A0: ; 0x020DC5A0
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, [r0, #4]
	ldr r2, [r0]
	sub r1, r1, #2
	cmp r1, #1
	add ip, r2, #0x7d0
	sublt ip, ip, #1
	ldr r6, _020DC650 ; =0x51EB851F
	ldr lr, [r0, #8]
	smull r3, r2, r6, ip
	smull r4, r3, r6, ip
	mov r5, ip, lsr #0x1f
	add r3, r5, r3, asr #5
	add r2, r5, r2, asr #5
	mov r5, #0x64
	smull r2, r4, r5, r2
	sub r2, ip, r2
	addlt r1, r1, #0xc
	mov r0, #0x1a
	mul r0, r1, r0
	sub r1, r0, #2
	ldr r0, _020DC654 ; =0x66666667
	mov r5, r1, lsr #0x1f
	smull r1, ip, r0, r1
	add ip, r5, ip, asr #2
	mov r4, r2, asr #1
	add r0, lr, ip
	add r1, r2, r4, lsr #30
	add r2, r2, r0
	mov r6, r3, asr #1
	add r0, r3, r6, lsr #30
	add r1, r2, r1, asr #2
	add r1, r1, r0, asr #2
	add r0, r3, r3, lsl #2
	add r4, r1, r0
	ldr r3, _020DC658 ; =0x92492493
	mov r1, r4, lsr #0x1f
	smull r2, r0, r3, r4
	add r0, r4, r0
	add r0, r1, r0, asr #2
	mov r2, #7
	smull r0, r1, r2, r0
	sub r0, r4, r0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020DC650: .word 0x51EB851F
_020DC654: .word 0x66666667
_020DC658: .word 0x92492493
	arm_func_end sub_020DC5A0

	arm_func_start sub_020DC65C
sub_020DC65C: ; 0x020DC65C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r4, _020DC694 ; =0x021E3820
	mov r5, r0
	ldr r1, [r4, #0x108]
	add r0, r4, #0x44
	bl OS_SetThreadPriority
	ldr r1, [r4, #0x114]
	add r0, r4, #0x44
	orr r1, r1, #8
	str r0, [r4, #0x104]
	str r5, [r4, #0x40]
	str r1, [r4, #0x114]
	bl OS_WakeupThreadDirect
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020DC694: .word 0x021E3820
	arm_func_end sub_020DC65C

	arm_func_start sub_020DC698
sub_020DC698: ; 0x020DC698
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r4, _020DC718 ; =0x021E3820
	mov r8, r0
	mov r7, r1
	bl OS_DisableInterrupts
	ldr r1, [r4, #8]
	mov r5, r0
	cmp r1, r8
	bne _020DC6D0
	ldr r0, [r4, #0x18]
	cmp r0, r7
	beq _020DC6F4
	bl OS_Terminate
	b _020DC6F4
_020DC6D0:
	mvn r6, #2
	b _020DC6E0
_020DC6D8:
	add r0, r4, #0x10
	bl OS_SleepThread
_020DC6E0:
	ldr r0, [r4, #8]
	cmp r0, r6
	bne _020DC6D8
	str r8, [r4, #8]
	str r7, [r4, #0x18]
_020DC6F4:
	ldr r0, [r4, #0xc]
	ldr r1, [r4]
	add r2, r0, #1
	mov r0, r5
	str r2, [r4, #0xc]
	mov r2, #0
	str r2, [r1]
	bl OS_RestoreInterrupts
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020DC718: .word 0x021E3820
	arm_func_end sub_020DC698

	arm_func_start sub_020DC71C
sub_020DC71C: ; 0x020DC71C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r4, _020DC7A4 ; =0x021E3820
	mov r7, r0
	mov r6, r1
	bl OS_DisableInterrupts
	ldr r1, [r4, #8]
	mov r5, r0
	cmp r1, r7
	bne _020DC74C
	ldr r0, [r4, #0xc]
	cmp r0, #0
	bne _020DC754
_020DC74C:
	bl OS_Terminate
	b _020DC78C
_020DC754:
	ldr r0, [r4, #0x18]
	cmp r0, r6
	beq _020DC764
	bl OS_Terminate
_020DC764:
	ldr r0, [r4, #0xc]
	subs r0, r0, #1
	str r0, [r4, #0xc]
	bne _020DC78C
	mvn r2, #2
	mov r1, #0
	add r0, r4, #0x10
	str r2, [r4, #8]
	str r1, [r4, #0x18]
	bl OS_WakeupThread
_020DC78C:
	ldr r1, [r4]
	mov r2, #0
	mov r0, r5
	str r2, [r1]
	bl OS_RestoreInterrupts
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020DC7A4: .word 0x021E3820
	arm_func_end sub_020DC71C

	arm_func_start sub_020DC7A8
sub_020DC7A8: ; 0x020DC7A8
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r4, _020DC89C ; =0x021E3820
	ldr r1, _020DC8A0 ; =0x021E37C0
	mvn r2, #2
	mov r0, #0
	str r2, [r4, #8]
	mov r2, #0x60
	str r0, [r4, #0xc]
	str r0, [r4, #0x18]
	str r1, [r4]
	bl MIi_CpuClearFast
	ldr r0, _020DC8A0 ; =0x021E37C0
	mov r1, #0x60
	bl DC_FlushRange
	mvn r1, #0
	ldr r0, _020DC8A4 ; =0x027FFC40
	str r1, [r4, #0x118]
	str r1, [r4, #0x11c]
	ldrh r0, [r0]
	cmp r0, #2
	moveq r0, #1
	movne r0, #0
	cmp r0, #0
	bne _020DC81C
	ldr r0, _020DC8A8 ; =0x027FFE00
	mov r2, #0x160
	sub r1, r0, #0x380
	bl MIi_CpuCopy8
_020DC81C:
	mov r2, #0
	mov r0, #4
	str r0, [r4, #0x108]
	str r2, [r4, #0x14]
	str r2, [r4, #0x10]
	str r2, [r4, #0x110]
	str r2, [r4, #0x10c]
	mov r0, #0x400
	str r0, [sp]
	ldr ip, [r4, #0x108]
	ldr r1, _020DC8AC ; =sub_020DD900
	ldr r3, _020DC8B0 ; =0x021E3E40
	add r0, r4, #0x44
	str ip, [sp, #4]
	bl OS_CreateThread
	add r0, r4, #0x44
	bl OS_WakeupThreadDirect
	ldr r1, _020DC8B4 ; =sub_020DD8CC
	mov r0, #0xb
	bl PXI_SetFifoRecvCallback
	ldr r0, _020DC8A4 ; =0x027FFC40
	ldrh r0, [r0]
	cmp r0, #2
	moveq r0, #1
	movne r0, #0
	cmp r0, #0
	addne sp, sp, #8
	ldmneia sp!, {r4, pc}
	mov r0, #1
	bl sub_020DC8E0
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_020DC89C: .word 0x021E3820
_020DC8A0: .word 0x021E37C0
_020DC8A4: .word 0x027FFC40
_020DC8A8: .word 0x027FFE00
_020DC8AC: .word sub_020DD900
_020DC8B0: .word 0x021E3E40
_020DC8B4: .word sub_020DD8CC
	arm_func_end sub_020DC7A8

	arm_func_start sub_020DC8B8
sub_020DC8B8: ; 0x020DC8B8
	ldr r0, _020DC8C4 ; =0x021E37A8
	ldr r0, [r0]
	bx lr
	.align 2, 0
_020DC8C4: .word 0x021E37A8
	arm_func_end sub_020DC8B8

	arm_func_start sub_020DC8C8
sub_020DC8C8: ; 0x020DC8C8
	stmdb sp!, {r3, lr}
	bl sub_020DC8B8
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl OS_Terminate
	ldmia sp!, {r3, pc}
	arm_func_end sub_020DC8C8

	arm_func_start sub_020DC8E0
sub_020DC8E0: ; 0x020DC8E0
	ldr r1, _020DC8EC ; =0x021E37A8
	str r0, [r1]
	bx lr
	.align 2, 0
_020DC8EC: .word 0x021E37A8
	arm_func_end sub_020DC8E0

	arm_func_start sub_020DC8F0
sub_020DC8F0: ; 0x020DC8F0
	stmdb sp!, {r3, r4, r5, lr}
	ldr r4, _020DC938 ; =0x021E3820
	bl OS_DisableInterrupts
	mov r5, r0
	b _020DC90C
_020DC904:
	add r0, r4, #0x10c
	bl OS_SleepThread
_020DC90C:
	ldr r0, [r4, #0x114]
	tst r0, #4
	bne _020DC904
	mov r0, r5
	bl OS_RestoreInterrupts
	ldr r0, [r4]
	ldr r0, [r0]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020DC938: .word 0x021E3820
	arm_func_end sub_020DC8F0

	arm_func_start sub_020DC93C
sub_020DC93C: ; 0x020DC93C
	ldr r0, _020DC954 ; =0x021E3820
	ldr r0, [r0, #0x114]
	tst r0, #4
	moveq r0, #1
	movne r0, #0
	bx lr
	.align 2, 0
_020DC954: .word 0x021E3820
	arm_func_end sub_020DC93C

	arm_func_start CARD_GetResultCode
CARD_GetResultCode: ; 0x020DC958
	ldr r0, _020DC968 ; =0x021E3820
	ldr r0, [r0]
	ldr r0, [r0]
	bx lr
	.align 2, 0
_020DC968: .word 0x021E3820
	arm_func_end CARD_GetResultCode

	arm_func_start CARD_LockRom
CARD_LockRom: ; 0x020DC96C
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r1, #1
	bl sub_020DC698
	mov r0, r4
	bl OS_LockCard
	ldmia sp!, {r4, pc}
	arm_func_end CARD_LockRom

	arm_func_start sub_020DC988
sub_020DC988: ; 0x020DC988
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl OS_UnlockCard
	mov r0, r4
	mov r1, #1
	bl sub_020DC71C
	ldmia sp!, {r4, pc}
	arm_func_end sub_020DC988

	arm_func_start CARD_LockBackup
CARD_LockBackup: ; 0x020DC9A4
	ldr ip, _020DC9B0 ; =sub_020DC698
	mov r1, #2
	bx ip
	.align 2, 0
_020DC9B0: .word sub_020DC698
	arm_func_end CARD_LockBackup

	arm_func_start CARD_UnlockBackup
CARD_UnlockBackup: ; 0x020DC9B4
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl CARD_TryWaitBackupAsync
	cmp r0, #0
	bne _020DC9CC
	bl CARD_WaitBackupAsync
_020DC9CC:
	mov r0, r4
	mov r1, #2
	bl sub_020DC71C
	ldmia sp!, {r4, pc}
	arm_func_end CARD_UnlockBackup

	arm_func_start sub_020DC9DC
sub_020DC9DC: ; 0x020DC9DC
	ldr r2, _020DC9EC ; =0x021E3820
	str r0, [r2, #0x118]
	str r1, [r2, #0x11c]
	bx lr
	.align 2, 0
_020DC9EC: .word 0x021E3820
	arm_func_end sub_020DC9DC

	arm_func_start sub_020DC9F0
sub_020DC9F0: ; 0x020DC9F0
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _020DCD54 ; =0x021E3820
	mov r5, r0
	ldr r4, [r1]
	mov r1, #0
	add r0, r4, #0x18
	mov r2, #0x48
	bl MI_CpuFill8
	ldr r0, _020DCD58 ; =0x0000203F
	str r5, [r4, #4]
	str r0, [r4, #0x58]
	cmp r5, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r5, asr #8
	and r0, r0, #0xff
	mov r3, #1
	mov ip, r3, lsl r0
	and r2, r5, #0xff
	mov r1, r5, asr #0x10
	str ip, [r4, #0x18]
	mov r0, #0xff
	strb r0, [r4, #0x54]
	cmp r2, #1
	and r0, r1, #0xff
	bne _020DCB2C
	cmp ip, #0x2000
	bhi _020DCA6C
	bhs _020DCAA8
	cmp ip, #0x200
	beq _020DCA88
	b _020DCD34
_020DCA6C:
	cmp ip, #0x10000
	bhi _020DCA7C
	beq _020DCACC
	b _020DCD34
_020DCA7C:
	cmp ip, #0x20000
	beq _020DCAF0
	b _020DCD34
_020DCA88:
	mov r0, #0x10
	str r0, [r4, #0x24]
	str r3, [r4, #0x28]
	mov r0, #5
	str r0, [r4, #0x2c]
	mov r0, #0xf0
	strb r0, [r4, #0x54]
	b _020DCB10
_020DCAA8:
	mov r0, #0x20
	str r0, [r4, #0x24]
	mov r0, #2
	str r0, [r4, #0x28]
	mov r0, #5
	str r0, [r4, #0x2c]
	mov r0, #0
	strb r0, [r4, #0x54]
	b _020DCB10
_020DCACC:
	mov r0, #0x80
	str r0, [r4, #0x24]
	mov r0, #2
	str r0, [r4, #0x28]
	mov r0, #0xa
	str r0, [r4, #0x2c]
	mov r0, #0
	strb r0, [r4, #0x54]
	b _020DCB10
_020DCAF0:
	mov r0, #0x100
	str r0, [r4, #0x24]
	mov r0, #3
	str r0, [r4, #0x28]
	mov r0, #5
	str r0, [r4, #0x2c]
	mov r0, #0
	strb r0, [r4, #0x54]
_020DCB10:
	ldr r0, [r4, #0x24]
	str r0, [r4, #0x1c]
	ldr r0, [r4, #0x58]
	orr r0, r0, #0x40
	orr r0, r0, #0x4300
	str r0, [r4, #0x58]
	ldmia sp!, {r3, r4, r5, pc}
_020DCB2C:
	cmp r2, #2
	bne _020DCCF4
	cmp ip, #0x100000
	bhi _020DCB5C
	bhs _020DCB80
	cmp ip, #0x40000
	bhi _020DCB50
	beq _020DCB80
	b _020DCD34
_020DCB50:
	cmp ip, #0x80000
	beq _020DCB80
	b _020DCD34
_020DCB5C:
	cmp ip, #0x400000
	bhi _020DCB74
	bhs _020DCBF8
	cmp ip, #0x200000
	beq _020DCBAC
	b _020DCD34
_020DCB74:
	cmp ip, #0x800000
	beq _020DCC48
	b _020DCD34
_020DCB80:
	mov r0, #0x19
	str r0, [r4, #0x30]
	mov r1, #0x12c
	str r1, [r4, #0x34]
	ldr r0, _020DCD5C ; =0x00001388
	str r1, [r4, #0x50]
	str r0, [r4, #0x40]
	ldr r0, [r4, #0x58]
	orr r0, r0, #0x480
	str r0, [r4, #0x58]
	b _020DCCC4
_020DCBAC:
	mov r0, #0x17
	str r0, [r4, #0x30]
	mov r1, #0x12c
	str r1, [r4, #0x34]
	mov r1, #0x1f4
	ldr r0, _020DCD5C ; =0x00001388
	str r1, [r4, #0x40]
	str r0, [r4, #0x44]
	mov r1, r0, lsl #1
	ldr r0, _020DCD60 ; =0x0000EA60
	str r1, [r4, #0x38]
	str r0, [r4, #0x3c]
	mov r0, #0
	strb r0, [r4, #0x54]
	ldr r0, [r4, #0x58]
	orr r0, r0, #0x80
	orr r0, r0, #0x5400
	str r0, [r4, #0x58]
	b _020DCCC4
_020DCBF8:
	mov r0, #0x258
	str r0, [r4, #0x40]
	add r0, r0, #0x960
	str r0, [r4, #0x44]
	mov r0, #0x46
	str r0, [r4, #0x48]
	mov r0, #0x96
	str r0, [r4, #0x4c]
	ldr r1, _020DCD64 ; =0x000059D8
	ldr r0, _020DCD68 ; =0x000C3500
	str r1, [r4, #0x38]
	str r0, [r4, #0x3c]
	mov r0, #0
	strb r0, [r4, #0x54]
	mov r0, #0x1000
	str r0, [r4, #0x20]
	ldr r0, [r4, #0x58]
	orr r0, r0, #0xd000
	str r0, [r4, #0x58]
	b _020DCCC4
_020DCC48:
	cmp r0, #0
	bne _020DCC88
	mov r0, #0x3e8
	str r0, [r4, #0x40]
	add r0, r0, #0x7d0
	str r0, [r4, #0x44]
	ldr r1, _020DCD6C ; =0x000109A0
	ldr r0, _020DCD70 ; =0x00027100
	str r1, [r4, #0x38]
	str r0, [r4, #0x3c]
	mov r0, #0
	strb r0, [r4, #0x54]
	ldr r0, [r4, #0x58]
	orr r0, r0, #0x5000
	str r0, [r4, #0x58]
	b _020DCCC4
_020DCC88:
	cmp r0, #1
	bne _020DCCC4
	mov r0, #0x3e8
	str r0, [r4, #0x40]
	add r0, r0, #0x7d0
	str r0, [r4, #0x44]
	ldr r1, _020DCD6C ; =0x000109A0
	ldr r0, _020DCD70 ; =0x00027100
	str r1, [r4, #0x38]
	str r0, [r4, #0x3c]
	mov r0, #0x84
	strb r0, [r4, #0x54]
	ldr r0, [r4, #0x58]
	orr r0, r0, #0x5000
	str r0, [r4, #0x58]
_020DCCC4:
	mov r0, #0x10000
	str r0, [r4, #0x1c]
	mov r0, #0x100
	str r0, [r4, #0x24]
	mov r0, #3
	str r0, [r4, #0x28]
	mov r0, #5
	str r0, [r4, #0x2c]
	ldr r0, [r4, #0x58]
	orr r0, r0, #0xb40
	str r0, [r4, #0x58]
	ldmia sp!, {r3, r4, r5, pc}
_020DCCF4:
	cmp r2, #3
	bne _020DCD34
	cmp ip, #0x2000
	cmpne ip, #0x8000
	bne _020DCD34
	str ip, [r4, #0x24]
	str ip, [r4, #0x1c]
	mov r0, #2
	str r0, [r4, #0x28]
	mov r0, #0
	strb r0, [r4, #0x54]
	ldr r0, [r4, #0x58]
	orr r0, r0, #0x40
	orr r0, r0, #0x4300
	str r0, [r4, #0x58]
	ldmia sp!, {r3, r4, r5, pc}
_020DCD34:
	mov r1, #0
	str r1, [r4, #4]
	str r1, [r4, #0x18]
	ldr r0, _020DCD54 ; =0x021E3820
	mov r1, #3
	ldr r0, [r0]
	str r1, [r0]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020DCD54: .word 0x021E3820
_020DCD58: .word 0x0000203F
_020DCD5C: .word 0x00001388
_020DCD60: .word 0x0000EA60
_020DCD64: .word 0x000059D8
_020DCD68: .word 0x000C3500
_020DCD6C: .word 0x000109A0
_020DCD70: .word 0x00027100
	arm_func_end sub_020DC9F0

	arm_func_start sub_020DCD74
sub_020DCD74: ; 0x020DCD74
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sb, r0
	ldr r7, [sb, #0x2c]
	ldr r0, _020DCF5C ; =_version_NINTENDO_BACKUP
	ldr r4, [sb, #0x34]
	ldr sl, [sb, #0x30]
	mov r5, #0x100
	bl OSi_ReferSymbol
	cmp r7, #0xb
	bne _020DCDA8
	bl sub_020DD04C
	mov r5, r0
	b _020DCDB8
_020DCDA8:
	cmp r7, #0xf
	ldreq r0, _020DCF60 ; =0x021E3820
	ldreq r0, [r0]
	ldreq r5, [r0, #0x20]
_020DCDB8:
	add r6, sb, #0x120
	mov fp, #9
_020DCDC0:
	ldr r8, [sb, #0x24]
	ldr r0, [sb]
	cmp r5, r8
	movlo r8, r5
	str r8, [r0, #0x14]
	ldr r0, [sb, #0x114]
	tst r0, #0x40
	beq _020DCDFC
	ldr r0, [sb, #0x114]
	mov r1, #7
	bic r0, r0, #0x40
	str r0, [sb, #0x114]
	ldr r0, [sb]
	str r1, [r0]
	b _020DCF08
_020DCDFC:
	cmp r4, #3
	addls pc, pc, r4, lsl #2
	b _020DCE8C
_020DCE08: ; jump table
	b _020DCE18 ; case 0
	b _020DCE3C ; case 1
	b _020DCE3C ; case 2
	b _020DCE74 ; case 3
_020DCE18:
	mov r0, r6
	mov r1, r8
	bl DC_InvalidateRange
	ldr r1, [sb, #0x1c]
	ldr r0, [sb]
	str r1, [r0, #0xc]
	ldr r0, [sb]
	str r6, [r0, #0x10]
	b _020DCE8C
_020DCE3C:
	ldr r0, [sb, #0x1c]
	mov r1, r6
	mov r2, r8
	bl MIi_CpuCopy8
	mov r0, r6
	mov r1, r8
	bl DC_FlushRange
	bl DC_WaitWriteBufferEmpty
	ldr r0, [sb]
	str r6, [r0, #0xc]
	ldr r1, [sb, #0x20]
	ldr r0, [sb]
	str r1, [r0, #0x10]
	b _020DCE8C
_020DCE74:
	ldr r1, [sb, #0x1c]
	ldr r0, [sb]
	str r1, [r0, #0xc]
	ldr r1, [sb, #0x20]
	ldr r0, [sb]
	str r1, [r0, #0x10]
_020DCE8C:
	mov r0, sb
	mov r1, r7
	mov r2, sl
	bl sub_020DD950
	cmp r0, #0
	beq _020DCF08
	cmp r4, #2
	bne _020DCEC8
	mov r0, sb
	mov r1, fp
	mov r2, #1
	bl sub_020DD950
	cmp r0, #0
	beq _020DCF08
	b _020DCEE0
_020DCEC8:
	cmp r4, #0
	bne _020DCEE0
	ldr r1, [sb, #0x20]
	mov r0, r6
	mov r2, r8
	bl MIi_CpuCopy8
_020DCEE0:
	ldr r0, [sb, #0x1c]
	add r0, r0, r8
	str r0, [sb, #0x1c]
	ldr r0, [sb, #0x20]
	add r0, r0, r8
	str r0, [sb, #0x20]
	ldr r0, [sb, #0x24]
	subs r0, r0, r8
	str r0, [sb, #0x24]
	bne _020DCDC0
_020DCF08:
	ldr r6, [sb, #0x38]
	ldr r5, [sb, #0x3c]
	bl OS_DisableInterrupts
	ldr r1, [sb, #0x114]
	mov r4, r0
	bic r0, r1, #0x4c
	str r0, [sb, #0x114]
	add r0, sb, #0x10c
	bl OS_WakeupThread
	ldr r0, [sb, #0x114]
	tst r0, #0x10
	beq _020DCF40
	add r0, sb, #0x44
	bl OS_WakeupThreadDirect
_020DCF40:
	mov r0, r4
	bl OS_RestoreInterrupts
	cmp r6, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, r5
	blx r6
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020DCF5C: .word _version_NINTENDO_BACKUP
_020DCF60: .word 0x021E3820
	arm_func_end sub_020DCD74

	arm_func_start CARDi_RequestStreamCommand
CARDi_RequestStreamCommand: ; 0x020DCF64
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r0
	ldr r4, _020DD03C ; =0x021E3820
	ldr r0, _020DD040 ; =_version_NINTENDO_BACKUP
	mov r8, r1
	mov r7, r2
	mov r6, r3
	bl OSi_ReferSymbol
	bl OS_DisableInterrupts
	ldr r1, [r4, #0x114]
	mov r5, r0
	tst r1, #4
	beq _020DCFAC
_020DCF98:
	add r0, r4, #0x10c
	bl OS_SleepThread
	ldr r0, [r4, #0x114]
	tst r0, #4
	bne _020DCF98
_020DCFAC:
	ldr r0, [r4, #0x114]
	ldr r1, [sp, #0x20]
	orr r2, r0, #4
	mov r0, r5
	str r2, [r4, #0x114]
	str r6, [r4, #0x38]
	str r1, [r4, #0x3c]
	bl OS_RestoreInterrupts
	ldr r3, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	ldr r1, [sp, #0x30]
	ldr r0, [sp, #0x24]
	str sb, [r4, #0x1c]
	str r8, [r4, #0x20]
	str r7, [r4, #0x24]
	str r3, [r4, #0x2c]
	str r2, [r4, #0x30]
	str r1, [r4, #0x34]
	cmp r0, #0
	beq _020DD00C
	ldr r0, _020DD044 ; =sub_020DCD74
	bl sub_020DC65C
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_020DD00C:
	ldr r0, _020DD048 ; =OSi_ThreadInfo
	ldr r1, _020DD03C ; =0x021E3820
	ldr r2, [r0, #4]
	mov r0, r4
	str r2, [r1, #0x104]
	bl sub_020DCD74
	ldr r0, [r4]
	ldr r0, [r0]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_020DD03C: .word 0x021E3820
_020DD040: .word _version_NINTENDO_BACKUP
_020DD044: .word sub_020DCD74
_020DD048: .word OSi_ThreadInfo
	arm_func_end CARDi_RequestStreamCommand

	arm_func_start sub_020DD04C
sub_020DD04C: ; 0x020DD04C
	ldr r0, _020DD05C ; =0x021E3820
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	bx lr
	.align 2, 0
_020DD05C: .word 0x021E3820
	arm_func_end sub_020DD04C

	arm_func_start CARD_IdentifyBackup
CARD_IdentifyBackup: ; 0x020DD060
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r0
	ldr r0, _020DD18C ; =_version_NINTENDO_BACKUP
	ldr r4, _020DD190 ; =0x021E3820
	bl OSi_ReferSymbol
	cmp r6, #0
	bne _020DD080
	bl OS_Terminate
_020DD080:
	bl sub_020DC8C8
	bl OS_DisableInterrupts
	ldr r1, [r4, #0x114]
	mov r5, r0
	tst r1, #4
	beq _020DD0AC
_020DD098:
	add r0, r4, #0x10c
	bl OS_SleepThread
	ldr r0, [r4, #0x114]
	tst r0, #4
	bne _020DD098
_020DD0AC:
	ldr r0, [r4, #0x114]
	mov r1, #0
	orr r2, r0, #4
	mov r0, r5
	str r2, [r4, #0x114]
	str r1, [r4, #0x38]
	str r1, [r4, #0x3c]
	bl OS_RestoreInterrupts
	mov r0, r6
	bl sub_020DC9F0
	ldr r0, _020DD194 ; =OSi_ThreadInfo
	ldr r1, _020DD190 ; =0x021E3820
	ldr r2, [r0, #4]
	mov r0, r4
	str r2, [r1, #0x104]
	mov r1, #2
	mov r2, #1
	bl sub_020DD950
	ldr r0, [r4]
	mov r1, #0
	str r1, [r0, #0xc]
	ldr r0, [r4]
	add r1, r4, #0x120
	str r1, [r0, #0x10]
	ldr r1, [r4]
	mov r2, #1
	mov r0, r4
	str r2, [r1, #0x14]
	mov r1, #6
	bl sub_020DD950
	ldr r7, [r4, #0x38]
	ldr r6, [r4, #0x3c]
	bl OS_DisableInterrupts
	mov r5, r0
	ldr r1, [r4, #0x114]
	add r0, r4, #0x10c
	bic r1, r1, #0x4c
	str r1, [r4, #0x114]
	bl OS_WakeupThread
	ldr r0, [r4, #0x114]
	tst r0, #0x10
	beq _020DD15C
	add r0, r4, #0x44
	bl OS_WakeupThreadDirect
_020DD15C:
	mov r0, r5
	bl OS_RestoreInterrupts
	cmp r7, #0
	beq _020DD174
	mov r0, r6
	blx r7
_020DD174:
	ldr r0, [r4]
	ldr r0, [r0]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020DD18C: .word _version_NINTENDO_BACKUP
_020DD190: .word 0x021E3820
_020DD194: .word OSi_ThreadInfo
	arm_func_end CARD_IdentifyBackup

	arm_func_start CARD_WaitBackupAsync
CARD_WaitBackupAsync: ; 0x020DD198
	ldr ip, _020DD1A0 ; =sub_020DC8F0
	bx ip
	.align 2, 0
_020DD1A0: .word sub_020DC8F0
	arm_func_end CARD_WaitBackupAsync

	arm_func_start CARD_TryWaitBackupAsync
CARD_TryWaitBackupAsync: ; 0x020DD1A4
	ldr ip, _020DD1AC ; =sub_020DC93C
	bx ip
	.align 2, 0
_020DD1AC: .word sub_020DC93C
	arm_func_end CARD_TryWaitBackupAsync

	arm_func_start sub_020DD1B0
sub_020DD1B0: ; 0x020DD1B0
	stmdb sp!, {r3, lr}
	bl OS_DisableInterrupts
	ldr r1, _020DD1D0 ; =0x021E3820
	ldr r2, [r1, #0x114]
	orr r2, r2, #0x40
	str r2, [r1, #0x114]
	bl OS_RestoreInterrupts
	ldmia sp!, {r3, pc}
	.align 2, 0
_020DD1D0: .word 0x021E3820
	arm_func_end sub_020DD1B0

	arm_func_start sub_020DD1D4
sub_020DD1D4: ; 0x020DD1D4
	stmdb sp!, {r3, r4, r5, lr}
	ldr r4, _020DD25C ; =0x021E3820
	mov r1, #0x200
	ldr r3, [r4, #0x1c]
	rsb r1, r1, #0
	ldr r2, [r0, #8]
	and r3, r3, r1
	cmp r3, r2
	bne _020DD248
	ldr r2, [r4, #0x1c]
	ldr r1, [r4, #0x24]
	sub r3, r2, r3
	rsb r5, r3, #0x200
	cmp r5, r1
	movhi r5, r1
	add r0, r0, #0x20
	ldr r1, [r4, #0x20]
	mov r2, r5
	add r0, r0, r3
	bl MIi_CpuCopy8
	ldr r2, [r4, #0x1c]
	ldr r1, [r4, #0x20]
	ldr r0, [r4, #0x24]
	add r2, r2, r5
	add r1, r1, r5
	sub r0, r0, r5
	str r2, [r4, #0x1c]
	str r1, [r4, #0x20]
	str r0, [r4, #0x24]
_020DD248:
	ldr r0, [r4, #0x24]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020DD25C: .word 0x021E3820
	arm_func_end sub_020DD1D4

	arm_func_start sub_020DD260
sub_020DD260: ; 0x020DD260
	ldr r3, _020DD2B8 ; =0x040001A4
_020DD264:
	ldr r2, [r3]
	tst r2, #0x80000000
	bne _020DD264
	ldr r3, _020DD2BC ; =0x040001A1
	mov r2, #0xc0
	strb r2, [r3]
	mov r2, r0, lsr #0x18
	strb r2, [r3, #7]
	mov r2, r0, lsr #0x10
	strb r2, [r3, #8]
	mov r2, r0, lsr #8
	strb r2, [r3, #9]
	strb r0, [r3, #0xa]
	mov r0, r1, lsr #0x18
	strb r0, [r3, #0xb]
	mov r0, r1, lsr #0x10
	strb r0, [r3, #0xc]
	mov r0, r1, lsr #8
	strb r0, [r3, #0xd]
	strb r1, [r3, #0xe]
	bx lr
	.align 2, 0
_020DD2B8: .word 0x040001A4
_020DD2BC: .word 0x040001A1
	arm_func_end sub_020DD260

	arm_func_start sub_020DD2C0
sub_020DD2C0: ; 0x020DD2C0
	stmdb sp!, {r3, r4, r5, lr}
	ldr r4, _020DD304 ; =0x021E3820
	ldr r1, _020DD308 ; =0x04100010
	ldr r0, [r4, #0x28]
	ldr r2, [r4, #0x20]
	mov r3, #0x200
	ldr r5, _020DD30C ; =0x021E3E60
	bl sub_020D4CE8
	ldr r1, [r4, #0x1c]
	mov r0, r1, lsr #8
	orr r0, r0, #0xb7000000
	mov r1, r1, lsl #0x18
	bl sub_020DD260
	ldr r1, [r5, #4]
	ldr r0, _020DD310 ; =0x040001A4
	str r1, [r0]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020DD304: .word 0x021E3820
_020DD308: .word 0x04100010
_020DD30C: .word 0x021E3E60
_020DD310: .word 0x040001A4
	arm_func_end sub_020DD2C0

	arm_func_start sub_020DD314
sub_020DD314: ; 0x020DD314
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r0, _020DD3E0 ; =0x021E3820
	ldr r0, [r0, #0x28]
	bl MI_StopDma
	ldr r3, _020DD3E0 ; =0x021E3820
	ldr r0, [r3, #0x24]
	ldr r2, [r3, #0x1c]
	ldr r1, [r3, #0x20]
	subs r0, r0, #0x200
	str r0, [r3, #0x24]
	movne r0, #1
	add r2, r2, #0x200
	add r1, r1, #0x200
	moveq r0, #0
	str r2, [r3, #0x1c]
	str r1, [r3, #0x20]
	cmp r0, #0
	bne _020DD3D8
	mov r0, #0x80000
	bl OS_DisableIrqMask
	mov r0, #0x80000
	bl OS_ResetRequestIrqMask
	ldr r4, _020DD3E0 ; =0x021E3820
	bl sub_020DD660
	bl sub_020DDBC0
	ldr r0, [r4]
	mov r1, #0
	str r1, [r0]
	ldr r5, [r4, #0x38]
	ldr r6, [r4, #0x3c]
	bl OS_DisableInterrupts
	ldr r1, [r4, #0x114]
	mov r7, r0
	bic r0, r1, #0x4c
	str r0, [r4, #0x114]
	add r0, r4, #0x10c
	bl OS_WakeupThread
	ldr r0, [r4, #0x114]
	tst r0, #0x10
	beq _020DD3BC
	add r0, r4, #0x44
	bl OS_WakeupThreadDirect
_020DD3BC:
	mov r0, r7
	bl OS_RestoreInterrupts
	cmp r5, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r6
	blx r5
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020DD3D8:
	bl sub_020DD2C0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020DD3E0: .word 0x021E3820
	arm_func_end sub_020DD314

	arm_func_start sub_020DD3E4
sub_020DD3E4: ; 0x020DD3E4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r4, _020DD55C ; =0x021E3820
	mov r6, #0
	ldr sb, [r4, #0x20]
	mov fp, r0
	mov r7, r6
	mov r8, r6
	mov r1, r6
	ands sl, sb, #0x1f
	ldr r5, [r4, #0x24]
	bne _020DD41C
	ldr r0, [r4, #0x28]
	cmp r0, #3
	movls r1, #1
_020DD41C:
	cmp r1, #0
	beq _020DD470
	bl OS_GetDTCMParam
	ldr r1, _020DD560 ; =OS_IrqHandler
	add r3, sb, r5
	cmp r3, r1
	mov r1, #1
	mov r2, #0
	bls _020DD448
	cmp sb, #0x2000000
	movlo r2, r1
_020DD448:
	cmp r2, #0
	bne _020DD468
	cmp r0, r3
	bhs _020DD464
	add r0, r0, #0x4000
	cmp r0, sb
	bhi _020DD468
_020DD464:
	mov r1, #0
_020DD468:
	cmp r1, #0
	moveq r8, #1
_020DD470:
	cmp r8, #0
	beq _020DD48C
	ldr r1, [r4, #0x1c]
	ldr r0, _020DD564 ; =0x000001FF
	orr r1, r1, r5
	tst r1, r0
	moveq r7, #1
_020DD48C:
	ldr r0, _020DD568 ; =_02110FB8
	cmp r7, #0
	ldr r0, [r0]
	cmpne r5, #0
	ldr r0, [r0, #0x60]
	movne r6, #1
	bic r0, r0, #0x7000000
	orr r0, r0, #0xa1000000
	cmp r6, #0
	str r0, [fp, #4]
	beq _020DD554
	bl OS_DisableInterrupts
	ldr r1, [r4, #0x118]
	mov r7, r0
	cmp r5, r1
	bhs _020DD4DC
	mov r0, sb
	mov r1, r5
	bl IC_InvalidateRange
	b _020DD4E0
_020DD4DC:
	bl IC_InvalidateAll
_020DD4E0:
	ldr r0, [r4, #0x11c]
	cmp r5, r0
	bhs _020DD528
	cmp sl, #0
	beq _020DD514
	sub sb, sb, sl
	mov r0, sb
	mov r1, #0x20
	bl DC_StoreRange
	add r0, sb, r5
	mov r1, #0x20
	bl DC_StoreRange
	add r5, r5, #0x20
_020DD514:
	mov r0, sb
	mov r1, r5
	bl DC_InvalidateRange
	bl DC_WaitWriteBufferEmpty
	b _020DD52C
_020DD528:
	bl DC_FlushAll
_020DD52C:
	ldr r1, _020DD56C ; =sub_020DD314
	mov r0, #0x80000
	bl OS_SetIrqFunction
	mov r0, #0x80000
	bl OS_ResetRequestIrqMask
	mov r0, #0x80000
	bl OS_EnableIrqMask
	mov r0, r7
	bl OS_RestoreInterrupts
	bl sub_020DD2C0
_020DD554:
	mov r0, r6
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020DD55C: .word 0x021E3820
_020DD560: .word OS_IrqHandler
_020DD564: .word 0x000001FF
_020DD568: .word _02110FB8
_020DD56C: .word sub_020DD314
	arm_func_end sub_020DD3E4

	arm_func_start sub_020DD570
sub_020DD570: ; 0x020DD570
	stmdb sp!, {r4, r5, r6, lr}
	ldr r4, _020DD654 ; =0x021E3820
	mov r6, r0
_020DD57C:
	mov r0, #0x200
	ldr r1, [r4, #0x1c]
	rsb r0, r0, #0
	and r2, r1, r0
	cmp r2, r1
	bne _020DD5AC
	ldr r5, [r4, #0x20]
	tst r5, #3
	bne _020DD5AC
	ldr r0, [r4, #0x24]
	cmp r0, #0x200
	bhs _020DD5B4
_020DD5AC:
	str r2, [r6, #8]
	add r5, r6, #0x20
_020DD5B4:
	mov r0, r2, lsr #8
	orr r0, r0, #0xb7000000
	mov r1, r2, lsl #0x18
	bl sub_020DD260
	mov ip, #0
	ldr r0, [r6, #4]
	ldr r2, _020DD658 ; =0x040001A4
	mov lr, ip
	str r0, [r2]
	ldr r1, _020DD65C ; =0x04100010
_020DD5DC:
	ldr r3, [r2]
	tst r3, #0x800000
	beq _020DD5FC
	ldr r0, [r1]
	cmp lr, #0x200
	strlo r0, [r5, ip, lsl #2]
	addlo lr, lr, #4
	addlo ip, ip, #1
_020DD5FC:
	tst r3, #0x80000000
	bne _020DD5DC
	ldr r0, [r4, #0x20]
	cmp r5, r0
	bne _020DD640
	ldr r0, _020DD654 ; =0x021E3820
	ldr r1, [r0, #0x1c]
	add r1, r1, #0x200
	str r1, [r0, #0x1c]
	ldr r1, [r0, #0x20]
	add r1, r1, #0x200
	str r1, [r0, #0x20]
	ldr r1, [r0, #0x24]
	subs r1, r1, #0x200
	str r1, [r0, #0x24]
	ldmeqia sp!, {r4, r5, r6, pc}
	b _020DD57C
_020DD640:
	mov r0, r6
	bl sub_020DD1D4
	cmp r0, #0
	bne _020DD57C
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020DD654: .word 0x021E3820
_020DD658: .word 0x040001A4
_020DD65C: .word 0x04100010
	arm_func_end sub_020DD570

	arm_func_start sub_020DD660
sub_020DD660: ; 0x020DD660
	stmdb sp!, {r3, lr}
	mov r0, #0xb8000000
	mov r1, #0
	bl sub_020DD260
	ldr r1, _020DD6B0 ; =_02110FB8
	mov r0, #0x2000
	ldr r1, [r1]
	rsb r0, r0, #0
	ldr r2, [r1, #0x60]
	ldr r1, _020DD6B4 ; =0x040001A4
	bic r2, r2, #0x7000000
	orr r2, r2, #0xa7000000
	and r0, r2, r0
	str r0, [r1]
_020DD698:
	ldr r0, [r1]
	tst r0, #0x800000
	beq _020DD698
	ldr r0, _020DD6B8 ; =0x04100010
	ldr r0, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020DD6B0: .word _02110FB8
_020DD6B4: .word 0x040001A4
_020DD6B8: .word 0x04100010
	arm_func_end sub_020DD660

	arm_func_start sub_020DD6BC
sub_020DD6BC: ; 0x020DD6BC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r4, _020DD74C ; =0x021E3E60
	mov r0, r4
	bl sub_020DD1D4
	cmp r0, #0
	beq _020DD6E0
	ldr r1, [r4]
	mov r0, r4
	blx r1
_020DD6E0:
	ldr r4, _020DD750 ; =0x021E3820
	bl sub_020DD660
	bl sub_020DDBC0
	ldr r0, [r4]
	mov r1, #0
	str r1, [r0]
	ldr r5, [r4, #0x38]
	ldr r6, [r4, #0x3c]
	bl OS_DisableInterrupts
	ldr r1, [r4, #0x114]
	mov r7, r0
	bic r0, r1, #0x4c
	str r0, [r4, #0x114]
	add r0, r4, #0x10c
	bl OS_WakeupThread
	ldr r0, [r4, #0x114]
	tst r0, #0x10
	beq _020DD730
	add r0, r4, #0x44
	bl OS_WakeupThreadDirect
_020DD730:
	mov r0, r7
	bl OS_RestoreInterrupts
	cmp r5, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r6
	blx r5
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020DD74C: .word 0x021E3E60
_020DD750: .word 0x021E3820
	arm_func_end sub_020DD6BC

	arm_func_start sub_020DD754
sub_020DD754: ; 0x020DD754
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov sl, r0
	mov sb, r1
	mov r8, r2
	mov r7, r3
	ldr r4, _020DD838 ; =0x021E3E60
	ldr r5, _020DD83C ; =0x021E3820
	bl sub_020DC8C8
	bl OS_DisableInterrupts
	mov r6, r0
	b _020DD788
_020DD780:
	add r0, r5, #0x10c
	bl OS_SleepThread
_020DD788:
	ldr r0, [r5, #0x114]
	tst r0, #4
	bne _020DD780
	ldr r0, [r5, #0x114]
	ldr r2, [sp, #0x20]
	ldr r1, [sp, #0x24]
	orr r3, r0, #4
	mov r0, r6
	str r3, [r5, #0x114]
	str r2, [r5, #0x38]
	str r1, [r5, #0x3c]
	bl OS_RestoreInterrupts
	ldr r0, _020DD840 ; =0x021E3E40
	str sl, [r5, #0x28]
	ldr r0, [r0]
	str r8, [r5, #0x20]
	add r0, sb, r0
	str r0, [r5, #0x1c]
	str r7, [r5, #0x24]
	cmp sl, #3
	bhi _020DD7E4
	mov r0, sl
	bl MI_StopDma
_020DD7E4:
	mov r0, r4
	bl sub_020DD3E4
	cmp r0, #0
	beq _020DD808
	ldr r0, [sp, #0x28]
	cmp r0, #0
	ldmneia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	bl sub_020DD8B4
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_020DD808:
	ldr r0, [sp, #0x28]
	cmp r0, #0
	beq _020DD820
	ldr r0, _020DD844 ; =sub_020DD6BC
	bl sub_020DC65C
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_020DD820:
	ldr r1, _020DD848 ; =OSi_ThreadInfo
	mov r0, r5
	ldr r1, [r1, #4]
	str r1, [r5, #0x104]
	bl sub_020DD6BC
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_020DD838: .word 0x021E3E60
_020DD83C: .word 0x021E3820
_020DD840: .word 0x021E3E40
_020DD844: .word sub_020DD6BC
_020DD848: .word OSi_ThreadInfo
	arm_func_end sub_020DD754

	arm_func_start CARD_Init
CARD_Init: ; 0x020DD84C
	stmdb sp!, {r3, lr}
	ldr ip, _020DD8A8 ; =0x021E3820
	ldr r0, [ip, #0x114]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r2, #0
	ldr r0, _020DD8AC ; =0x021E3E40
	sub r1, r2, #1
	mov r3, #1
	str r3, [ip, #0x114]
	str r2, [ip, #0x24]
	str r2, [ip, #0x20]
	str r2, [ip, #0x1c]
	str r1, [ip, #0x28]
	str r2, [ip, #0x38]
	str r2, [ip, #0x3c]
	str r2, [r0]
	bl sub_020DC7A8
	bl sub_020DD8C0
	ldr r1, _020DD8B0 ; =0x021E3E60
	str r0, [r1]
	bl sub_020DDAA4
	ldmia sp!, {r3, pc}
	.align 2, 0
_020DD8A8: .word 0x021E3820
_020DD8AC: .word 0x021E3E40
_020DD8B0: .word 0x021E3E60
	arm_func_end CARD_Init

	arm_func_start sub_020DD8B4
sub_020DD8B4: ; 0x020DD8B4
	ldr ip, _020DD8BC ; =sub_020DC8F0
	bx ip
	.align 2, 0
_020DD8BC: .word sub_020DC8F0
	arm_func_end sub_020DD8B4

	arm_func_start sub_020DD8C0
sub_020DD8C0: ; 0x020DD8C0
	ldr r0, _020DD8C8 ; =sub_020DD570
	bx lr
	.align 2, 0
_020DD8C8: .word sub_020DD570
	arm_func_end sub_020DD8C0

	arm_func_start sub_020DD8CC
sub_020DD8CC: ; 0x020DD8CC
	stmdb sp!, {r3, lr}
	cmp r0, #0xb
	ldmneia sp!, {r3, pc}
	cmp r2, #0
	ldmeqia sp!, {r3, pc}
	ldr r2, _020DD8FC ; =0x021E3820
	ldr r1, [r2, #0x114]
	ldr r0, [r2, #0x104]
	bic r1, r1, #0x20
	str r1, [r2, #0x114]
	bl OS_WakeupThreadDirect
	ldmia sp!, {r3, pc}
	.align 2, 0
_020DD8FC: .word 0x021E3820
	arm_func_end sub_020DD8CC

	arm_func_start sub_020DD900
sub_020DD900: ; 0x020DD900
	stmdb sp!, {r4, r5, r6, lr}
	ldr r5, _020DD94C ; =0x021E3820
	mov r4, #0
_020DD90C:
	bl OS_DisableInterrupts
	ldr r1, [r5, #0x114]
	mov r6, r0
	tst r1, #8
	bne _020DD934
_020DD920:
	mov r0, r4
	bl OS_SleepThread
	ldr r0, [r5, #0x114]
	tst r0, #8
	beq _020DD920
_020DD934:
	mov r0, r6
	bl OS_RestoreInterrupts
	ldr r1, [r5, #0x40]
	mov r0, r5
	blx r1
	b _020DD90C
	.align 2, 0
_020DD94C: .word 0x021E3820
	arm_func_end sub_020DD900

	arm_func_start sub_020DD950
sub_020DD950: ; 0x020DD950
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	ldr r0, [sl, #0x114]
	mov sb, r1
	str r2, [sp]
	tst r0, #2
	bne _020DD9C4
	ldr r1, [sl, #0x114]
	mov r0, #0xb
	orr r2, r1, #2
	mov r1, #1
	str r2, [sl, #0x114]
	bl PXI_IsCallbackReady
	cmp r0, #0
	bne _020DD9B4
	mov r6, #0x64
	mov r5, #0xb
	mov r4, #1
_020DD998:
	mov r0, r6
	bl OS_SpinWait
	mov r0, r5
	mov r1, r4
	bl PXI_IsCallbackReady
	cmp r0, #0
	beq _020DD998
_020DD9B4:
	mov r0, sl
	mov r1, #0
	mov r2, #1
	bl sub_020DD950
_020DD9C4:
	ldr r0, [sl]
	mov r1, #0x60
	bl DC_FlushRange
	bl DC_WaitWriteBufferEmpty
	mov r7, #0xb
	mov r6, #1
	mov r5, r7
	mov r4, r6
	mov fp, #0
_020DD9E8:
	str sb, [sl, #4]
	ldr r0, [sl, #0x114]
	orr r0, r0, #0x20
	str r0, [sl, #0x114]
_020DD9F8:
	mov r0, r7
	mov r1, sb
	mov r2, r6
	bl PXI_SendWordByFifo
	cmp r0, #0
	blt _020DD9F8
	cmp sb, #0
	bne _020DDA34
	ldr r8, [sl]
_020DDA1C:
	mov r0, r5
	mov r1, r8
	mov r2, r4
	bl PXI_SendWordByFifo
	cmp r0, #0
	blt _020DDA1C
_020DDA34:
	bl OS_DisableInterrupts
	ldr r1, [sl, #0x114]
	mov r8, r0
	tst r1, #0x20
	beq _020DDA5C
_020DDA48:
	mov r0, fp
	bl OS_SleepThread
	ldr r0, [sl, #0x114]
	tst r0, #0x20
	bne _020DDA48
_020DDA5C:
	mov r0, r8
	bl OS_RestoreInterrupts
	ldr r0, [sl]
	mov r1, #0x60
	bl DC_InvalidateRange
	ldr r0, [sl]
	ldr r1, [r0]
	cmp r1, #4
	bne _020DDA94
	ldr r0, [sp]
	sub r0, r0, #1
	str r0, [sp]
	cmp r0, #0
	bgt _020DD9E8
_020DDA94:
	cmp r1, #0
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_020DD950

	arm_func_start sub_020DDAA4
sub_020DDAA4: ; 0x020DDAA4
	stmdb sp!, {r3, lr}
	bl PXI_Init
	ldr r1, _020DDAC8 ; =sub_020DDAD0
	mov r0, #0xe
	bl PXI_SetFifoRecvCallback
	ldr r0, _020DDACC ; =0x021E4080
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020DDAC8: .word sub_020DDAD0
_020DDACC: .word 0x021E4080
	arm_func_end sub_020DDAA4

	arm_func_start sub_020DDAD0
sub_020DDAD0: ; 0x020DDAD0
	stmdb sp!, {r3, lr}
	and r0, r1, #0x3f
	cmp r0, #0x11
	bne _020DDB18
	ldr r1, _020DDB20 ; =0x021E4080
	ldr r0, [r1]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #1
	str r0, [r1]
	ldr r1, [r1, #4]
	cmp r1, #0
	beq _020DDB08
	blx r1
_020DDB08:
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl sub_020DDB34
	ldmia sp!, {r3, pc}
_020DDB18:
	bl OS_Terminate
	ldmia sp!, {r3, pc}
	.align 2, 0
_020DDB20: .word 0x021E4080
	arm_func_end sub_020DDAD0

	arm_func_start CARD_IsPulledOut
CARD_IsPulledOut: ; 0x020DDB24
	ldr r0, _020DDB30 ; =0x021E4080
	ldr r0, [r0]
	bx lr
	.align 2, 0
_020DDB30: .word 0x021E4080
	arm_func_end CARD_IsPulledOut

	arm_func_start sub_020DDB34
sub_020DDB34: ; 0x020DDB34
	stmdb sp!, {r3, r4, r5, lr}
	mov r0, #0
	mov r5, #1
	bl MI_StopDma
	mov r0, r5
	bl MI_StopDma
	mov r0, #2
	bl MI_StopDma
	mov r0, #3
	bl MI_StopDma
	ldr r0, _020DDBB8 ; =0x027FFFA8
	ldrh r0, [r0]
	and r0, r0, #0x8000
	movs r0, r0, asr #0xf
	beq _020DDB9C
	bl PM_ForceToPowerOff
	cmp r0, #4
	bne _020DDB94
	ldr r4, _020DDBBC ; =0x000A3A47
_020DDB80:
	mov r0, r4
	bl OS_SpinWait
	bl PM_ForceToPowerOff
	cmp r0, #4
	beq _020DDB80
_020DDB94:
	cmp r0, #0
	moveq r5, #0
_020DDB9C:
	cmp r5, #0
	beq _020DDBB0
	mov r0, #1
	mov r1, r0
	bl sub_020DDC20
_020DDBB0:
	bl OS_Terminate
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020DDBB8: .word 0x027FFFA8
_020DDBBC: .word 0x000A3A47
	arm_func_end sub_020DDB34

	arm_func_start sub_020DDBC0
sub_020DDBC0: ; 0x020DDBC0
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr r2, _020DDC1C ; =0x027FFC10
	ldrh r1, [r2]
	cmp r1, #0
	subeq r1, r2, #0x410
	subne r1, r2, #0x10
	ldr r1, [r1]
	str r1, [sp]
	ldr r1, [sp]
	cmp r0, r1
	addeq sp, sp, #4
	ldmeqia sp!, {r3, r4, pc}
	bl OS_DisableInterrupts
	mov r4, r0
	mov r0, #0xe
	mov r1, #0x11
	mov r2, #0
	bl sub_020DDAD0
	mov r0, r4
	bl OS_RestoreInterrupts
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_020DDC1C: .word 0x027FFC10
	arm_func_end sub_020DDBC0

	arm_func_start sub_020DDC20
sub_020DDC20: ; 0x020DDC20
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r1, r7
	mov r0, #0xe
	mov r2, #0
	bl PXI_SendWordByFifo
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r5, #0xe
	mov r4, #0
_020DDC4C:
	mov r0, r6
	bl SVC_WaitByLoop
	mov r0, r5
	mov r1, r7
	mov r2, r4
	bl PXI_SendWordByFifo
	cmp r0, #0
	bne _020DDC4C
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020DDC20

	arm_func_start sub_020DDC70
sub_020DDC70: ; 0x020DDC70
	ldr r1, _020DDC7C ; =0x021E4088
	strb r0, [r1, #2]
	bx lr
	.align 2, 0
_020DDC7C: .word 0x021E4088
	arm_func_end sub_020DDC70

	arm_func_start sub_020DDC80
sub_020DDC80: ; 0x020DDC80
	ldr r1, _020DDC8C ; =0x021E4088
	strb r0, [r1, #1]
	bx lr
	.align 2, 0
_020DDC8C: .word 0x021E4088
	arm_func_end sub_020DDC80

	arm_func_start sub_020DDC90
sub_020DDC90: ; 0x020DDC90
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bl OS_GetTick
	mov r4, #0
	ldr r5, _020DDCEC ; =0x000082EA
	ldr sl, _020DDCF0 ; =0x021E4088
	mov r6, r0
	mov r7, r1
	mov sb, r4
	mov r8, #0xfa00
_020DDCB4:
	bl OS_GetTick
	subs r3, r0, r6
	sbc r2, r1, r7
	umull r0, r1, r3, r8
	mla r1, r3, sb, r1
	mla r1, r2, r8, r1
	mov r2, r5
	mov r3, r4
	bl _ll_udiv
	ldrb r2, [sl]
	cmp r1, r2, asr #31
	cmpeq r0, r2
	blo _020DDCB4
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_020DDCEC: .word 0x000082EA
_020DDCF0: .word 0x021E4088
	arm_func_end sub_020DDC90

	arm_func_start sub_020DDCF4
sub_020DDCF4: ; 0x020DDCF4
	stmdb sp!, {r3, lr}
	ldr r1, _020DDD38 ; =0x021E4088
	mov r0, #0x32
	strb r0, [r1, #2]
	strb r0, [r1, #1]
	strb r0, [r1]
	mov r2, #1
	ldr r0, _020DDD3C ; =_02110FBC
	str r2, [r1, #4]
	ldrh r1, [r0]
	ldr r0, _020DDD40 ; =0x0000FFFD
	cmp r1, r0
	ldmneia sp!, {r3, pc}
	bl OS_GetLockID
	ldr r1, _020DDD3C ; =_02110FBC
	strh r0, [r1]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020DDD38: .word 0x021E4088
_020DDD3C: .word _02110FBC
_020DDD40: .word 0x0000FFFD
	arm_func_end sub_020DDCF4

	arm_func_start sub_020DDD44
sub_020DDD44: ; 0x020DDD44
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r6, r0
	bl OS_GetTick
	mov fp, #0
	ldr sl, _020DDDE4 ; =0x000082EA
	ldr sb, _020DDDE8 ; =0x021E4088
	mov r4, r0
	mov r5, r1
	mov r8, fp
	mov r7, #0xfa00
_020DDD6C:
	bl OS_GetTick
	subs lr, r0, r4
	sbc ip, r1, r5
	mov r2, sl
	mov r3, fp
	umull r0, r1, lr, r7
	mla r1, lr, r8, r1
	mla r1, ip, r7, r1
	bl _ll_udiv
	ldrb r2, [sb, #1]
	cmp r1, r2, asr #31
	cmpeq r0, r2
	blo _020DDD6C
	ldr r0, [r6, #4]
	ldr r1, _020DDDEC ; =0x040001A2
	ldrb r0, [r0]
	strh r0, [r1]
	ldr r0, [r6, #4]
	sub r1, r1, #2
	add r0, r0, #1
	str r0, [r6, #4]
_020DDDC0:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _020DDDC0
	ldr r0, _020DDDEC ; =0x040001A2
	ldrh r0, [r0]
	strh r0, [sp]
	ldrh r0, [sp]
	and r0, r0, #0xff
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020DDDE4: .word 0x000082EA
_020DDDE8: .word 0x021E4088
_020DDDEC: .word 0x040001A2
	arm_func_end sub_020DDD44

	arm_func_start sub_020DDDF0
sub_020DDDF0: ; 0x020DDDF0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r6, r0
	bl OS_GetTick
	mov fp, #0
	ldr sl, _020DDE88 ; =0x000082EA
	ldr sb, _020DDE8C ; =0x021E4088
	mov r4, r0
	mov r5, r1
	mov r8, fp
	mov r7, #0xfa00
_020DDE18:
	bl OS_GetTick
	subs lr, r0, r4
	sbc ip, r1, r5
	mov r2, sl
	mov r3, fp
	umull r0, r1, lr, r7
	mla r1, lr, r8, r1
	mla r1, ip, r7, r1
	bl _ll_udiv
	ldrb r2, [sb, #2]
	cmp r1, r2, asr #31
	cmpeq r0, r2
	blo _020DDE18
	ldr r0, _020DDE90 ; =0x040001A2
	mov r1, #0
	strh r1, [r0]
	sub r1, r0, #2
_020DDE5C:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _020DDE5C
	ldr r1, _020DDE90 ; =0x040001A2
	ldr r0, [r6, #8]
	ldrh r1, [r1]
	strb r1, [r0]
	ldr r0, [r6, #8]
	add r0, r0, #1
	str r0, [r6, #8]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020DDE88: .word 0x000082EA
_020DDE8C: .word 0x021E4088
_020DDE90: .word 0x040001A2
	arm_func_end sub_020DDDF0

	arm_func_start sub_020DDE94
sub_020DDE94: ; 0x020DDE94
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r2, _020DDFC4 ; =0x021E409C
	ldr r1, _020DDFC8 ; =0x021E4088
	mov r6, r0
	str r2, [r1, #8]
	str r6, [r1, #0xc]
	mov r0, #1
	strb r0, [r2]
	mov r1, #0
	ldr r0, _020DDFCC ; =_02110FBC
	strb r1, [r6]
	ldrh r0, [r0]
	bl CARD_LockBackup
	ldr r0, _020DDFCC ; =_02110FBC
	ldrh r0, [r0]
	bl OS_LockCard
	ldr r2, _020DDFD0 ; =0x040001A0
_020DDED8:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _020DDED8
	ldr r1, _020DDFD4 ; =0x0000A042
	ldr r0, _020DDFD8 ; =0x021E408C
	strh r1, [r2]
	bl sub_020DDD44
	bl sub_020DDC90
	ldr r0, _020DDFD8 ; =0x021E408C
	bl sub_020DDDF0
	bl sub_020DDC90
	ldrb r4, [r6]
	ldr r0, _020DDFC8 ; =0x021E4088
	mov r5, #0
	str r5, [r0, #8]
	cmp r4, #0xb9
	movhi r4, #0
	str r6, [r0, #0xc]
	strb r5, [r6]
	cmp r4, #0
	beq _020DDF60
	sub sl, r4, #1
	ldr sb, _020DDFDC ; =0x0000A002
	ldr r8, _020DDFD0 ; =0x040001A0
	ldr r7, _020DDFD8 ; =0x021E408C
	b _020DDF54
_020DDF40:
	mov r0, r7
	cmp r5, sl
	streqh sb, [r8]
	bl sub_020DDDF0
	add r5, r5, #1
_020DDF54:
	cmp r5, r4
	blt _020DDF40
	b _020DDF74
_020DDF60:
	ldr r2, _020DDFDC ; =0x0000A002
	ldr r1, _020DDFD0 ; =0x040001A0
	ldr r0, _020DDFD8 ; =0x021E408C
	strh r2, [r1]
	bl sub_020DDDF0
_020DDF74:
	mov r5, #0
	b _020DDF8C
_020DDF7C:
	ldrb r0, [r6, r5]
	eor r0, r0, #0xaa
	strb r0, [r6, r5]
	add r5, r5, #1
_020DDF8C:
	cmp r5, r4
	blt _020DDF7C
	ldr r1, _020DDFD0 ; =0x040001A0
_020DDF98:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _020DDF98
	ldr r0, _020DDFCC ; =_02110FBC
	ldrh r0, [r0]
	bl OS_UnLockCard
	ldr r0, _020DDFCC ; =_02110FBC
	ldrh r0, [r0]
	bl CARD_UnlockBackup
	mov r0, r4
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_020DDFC4: .word 0x021E409C
_020DDFC8: .word 0x021E4088
_020DDFCC: .word _02110FBC
_020DDFD0: .word 0x040001A0
_020DDFD4: .word 0x0000A042
_020DDFD8: .word 0x021E408C
_020DDFDC: .word 0x0000A002
	arm_func_end sub_020DDE94

	arm_func_start sub_020DDFE0
sub_020DDFE0: ; 0x020DDFE0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r7, _020DE0AC ; =0x021E4158
	ldr r3, _020DE0B0 ; =0x021E4088
	mov r4, #0
	str r7, [r3, #8]
	ldr r2, _020DE0B4 ; =_02110FBC
	str r4, [r3, #0xc]
	mov r6, r0
	mov r3, #2
	ldrh r0, [r2]
	mov r5, r1
	strb r3, [r7]
	bl CARD_LockBackup
	ldr r0, _020DE0B4 ; =_02110FBC
	ldrh r0, [r0]
	bl OS_LockCard
	ldr r2, _020DE0B8 ; =0x040001A0
_020DE024:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _020DE024
	ldr r1, _020DE0BC ; =0x0000A042
	ldr r0, _020DE0C0 ; =0x021E408C
	strh r1, [r2]
	bl sub_020DDD44
	bl sub_020DDC90
	ldr r0, _020DE0B0 ; =0x021E4088
	mov r4, #0
	str r6, [r0, #8]
	sub sb, r5, #1
	ldr r8, _020DE0C4 ; =0x0000A002
	ldr r7, _020DE0B8 ; =0x040001A0
	ldr r6, _020DE0C0 ; =0x021E408C
	b _020DE078
_020DE064:
	mov r0, r6
	cmp r4, sb
	streqh r8, [r7]
	bl sub_020DDD44
	add r4, r4, #1
_020DE078:
	cmp r4, r5
	blt _020DE064
	ldr r1, _020DE0B8 ; =0x040001A0
_020DE084:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _020DE084
	ldr r0, _020DE0B4 ; =_02110FBC
	ldrh r0, [r0]
	bl OS_UnLockCard
	ldr r0, _020DE0B4 ; =_02110FBC
	ldrh r0, [r0]
	bl CARD_UnlockBackup
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_020DE0AC: .word 0x021E4158
_020DE0B0: .word 0x021E4088
_020DE0B4: .word _02110FBC
_020DE0B8: .word 0x040001A0
_020DE0BC: .word 0x0000A042
_020DE0C0: .word 0x021E408C
_020DE0C4: .word 0x0000A002
	arm_func_end sub_020DDFE0

	arm_func_start sub_020DE0C8
sub_020DE0C8: ; 0x020DE0C8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r3, _020DE228 ; =0x021E409C
	ldr r1, _020DE22C ; =0x021E4088
	add r2, sp, #0
	str r3, [r1, #8]
	str r2, [r1, #0xc]
	ldr r0, _020DE230 ; =_02110FBC
	mov r1, #8
	ldrh r0, [r0]
	strb r1, [r3]
	bl CARD_LockBackup
	ldr r0, _020DE230 ; =_02110FBC
	ldrh r0, [r0]
	bl OS_LockCard
	bl OS_GetTick
	mov fp, #0
	mov r4, r0
	mov r5, r1
	mov r6, #0x40
	mov r8, fp
	mov r7, #0x3e8
	mov sl, fp
	mov sb, #0x3c
_020DE124:
	bl OS_GetTick
	subs r0, r0, r4
	umull lr, ip, r0, r6
	mla ip, r0, fp, ip
	sbc r1, r1, r5
	mla ip, r1, r6, ip
	umull r0, r1, lr, r7
	mla r1, lr, r8, r1
	mla r1, ip, r7, r1
	ldr r2, _020DE234 ; =0x000082EA
	mov r3, #0
	bl _ll_udiv
	cmp r1, sl
	cmpeq r0, sb
	blo _020DE124
	ldr r2, _020DE238 ; =0x040001A0
_020DE164:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _020DE164
	ldr r1, _020DE23C ; =0x0000A042
	ldr r0, _020DE240 ; =0x021E408C
	strh r1, [r2]
	bl sub_020DDD44
	strb r0, [sp]
	bl OS_GetTick
	mov r4, r0
	mov r5, r1
	mov r6, #0x40
	mov r7, #0x3e8
	mov sb, #0
	mov r8, #0x32
_020DE1A0:
	bl OS_GetTick
	subs r0, r0, r4
	mov r3, #0
	sbc ip, r1, r5
	mov r1, r3
	umull fp, sl, r0, r6
	mla sl, r0, r1, sl
	mla sl, ip, r6, sl
	mov ip, r3
	umull r0, r1, fp, r7
	mla r1, fp, ip, r1
	mla r1, sl, r7, r1
	ldr r2, _020DE234 ; =0x000082EA
	bl _ll_udiv
	cmp r1, sb
	cmpeq r0, r8
	blo _020DE1A0
	ldr r2, _020DE244 ; =0x0000A002
	ldr r1, _020DE238 ; =0x040001A0
	ldr r0, _020DE240 ; =0x021E408C
	strh r2, [r1]
	bl sub_020DDDF0
	ldr r1, _020DE238 ; =0x040001A0
_020DE1FC:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _020DE1FC
	ldr r0, _020DE230 ; =_02110FBC
	ldrh r0, [r0]
	bl OS_UnLockCard
	ldr r0, _020DE230 ; =_02110FBC
	ldrh r0, [r0]
	bl CARD_UnlockBackup
	ldrb r0, [sp]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020DE228: .word 0x021E409C
_020DE22C: .word 0x021E4088
_020DE230: .word _02110FBC
_020DE234: .word 0x000082EA
_020DE238: .word 0x040001A0
_020DE23C: .word 0x0000A042
_020DE240: .word 0x021E408C
_020DE244: .word 0x0000A002
	arm_func_end sub_020DE0C8

	arm_func_start sub_020DE248
sub_020DE248: ; 0x020DE248
	stmdb sp!, {r3, lr}
	mov r2, #0xf00
	bl sub_020DE274
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r1, _020DE270 ; =0x021E4220
	mov r2, #0
	ldr r1, [r1, #4]
	strh r2, [r1, #0x16]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020DE270: .word 0x021E4220
	arm_func_end sub_020DE248

	arm_func_start sub_020DE274
sub_020DE274: ; 0x020DE274
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r6, r0
	mov r4, r1
	mov r7, r2
	bl OS_DisableInterrupts
	ldr r1, _020DE444 ; =0x021E4220
	mov r5, r0
	ldrh r1, [r1]
	cmp r1, #0
	beq _020DE2A8
	bl OS_RestoreInterrupts
	mov r0, #3
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_020DE2A8:
	cmp r6, #0
	bne _020DE2BC
	bl OS_RestoreInterrupts
	mov r0, #6
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_020DE2BC:
	cmp r4, #3
	bls _020DE2D0
	bl OS_RestoreInterrupts
	mov r0, #6
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_020DE2D0:
	tst r6, #0x1f
	beq _020DE2E4
	bl OS_RestoreInterrupts
	mov r0, #6
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_020DE2E4:
	bl PXI_Init
	mov r0, #0xa
	mov r1, #1
	bl PXI_IsCallbackReady
	cmp r0, #0
	bne _020DE30C
	mov r0, r5
	bl OS_RestoreInterrupts
	mov r0, #4
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_020DE30C:
	mov r0, r6
	mov r1, r7
	bl DC_InvalidateRange
	mov r0, r4
	mov r1, r6
	mov r3, r7
	mov r2, #0
	bl MI_DmaFill32
	ldr r0, _020DE444 ; =0x021E4220
	add r1, r6, #0x200
	str r6, [r0, #4]
	str r1, [r6]
	ldr r2, [r0, #4]
	ldr r1, [r2]
	add r1, r1, #0x300
	str r1, [r2, #4]
	ldr r2, [r0, #4]
	ldr r1, [r2, #4]
	add r1, r1, #0x800
	str r1, [r2, #0xc]
	ldr r1, [r0, #4]
	ldr r0, [r1, #0xc]
	add r0, r0, #0x100
	str r0, [r1, #0x10]
	bl sub_020DEB08
	ldr r1, _020DE444 ; =0x021E4220
	mov r3, #0
	ldr r0, [r1, #4]
	mov r2, r3
	strh r4, [r0, #0x14]
	ldr r0, [r1, #4]
	str r3, [r0, #0x14c]
	ldr r0, [r1, #4]
	add r0, r0, #0x100
	strh r3, [r0, #0x50]
	b _020DE3B8
_020DE39C:
	ldr r0, [r1, #4]
	add r0, r0, r3, lsl #2
	str r2, [r0, #0xcc]
	ldr r0, [r1, #4]
	add r0, r0, r3, lsl #2
	str r2, [r0, #0x10c]
	add r3, r3, #1
_020DE3B8:
	cmp r3, #0x10
	blt _020DE39C
	ldr r0, _020DE448 ; =0x021E4228
	ldr r1, _020DE44C ; =0x021E4248
	mov r2, #0xa
	bl OS_InitMessageQueue
	mov r6, #0
	mov r4, #0x8000
	ldr sl, _020DE450 ; =0x021E42C0
	mov sb, #2
	ldr r8, _020DE448 ; =0x021E4228
	mov r7, #1
	b _020DE414
_020DE3EC:
	mov r2, r6, lsl #8
	mov r1, sb
	add r0, sl, r6, lsl #8
	strh r4, [sl, r2]
	bl DC_StoreRange
	mov r0, r8
	mov r2, r7
	add r1, sl, r6, lsl #8
	bl OS_SendMessage
	add r6, r6, #1
_020DE414:
	cmp r6, #0xa
	blt _020DE3EC
	ldr r1, _020DE454 ; =sub_020DE75C
	mov r0, #0xa
	bl PXI_SetFifoRecvCallback
	ldr r1, _020DE444 ; =0x021E4220
	mov r2, #1
	mov r0, r5
	strh r2, [r1]
	bl OS_RestoreInterrupts
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_020DE444: .word 0x021E4220
_020DE448: .word 0x021E4228
_020DE44C: .word 0x021E4248
_020DE450: .word 0x021E42C0
_020DE454: .word sub_020DE75C
	arm_func_end sub_020DE274

	arm_func_start sub_020DE458
sub_020DE458: ; 0x020DE458
	stmdb sp!, {r4, lr}
	bl OS_DisableInterrupts
	mov r4, r0
	bl sub_020DE664
	cmp r0, #0
	beq _020DE480
	mov r0, r4
	bl OS_RestoreInterrupts
	mov r0, #3
	ldmia sp!, {r4, pc}
_020DE480:
	mov r0, #1
	mov r1, #0
	bl sub_020DE6C8
	cmp r0, #0
	ldmneia sp!, {r4, pc}
	bl sub_020DEB08
	mov r0, #0xa
	mov r1, #0
	bl PXI_SetFifoRecvCallback
	ldr r1, _020DE4C4 ; =0x021E4220
	mov r2, #0
	str r2, [r1, #4]
	mov r0, r4
	strh r2, [r1]
	bl OS_RestoreInterrupts
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_020DE4C4: .word 0x021E4220
	arm_func_end sub_020DE458

	arm_func_start sub_020DE4C8
sub_020DE4C8: ; 0x020DE4C8
	ldr r2, _020DE4DC ; =0x021E4220
	ldr r2, [r2, #4]
	add r0, r2, r0, lsl #2
	str r1, [r0, #0x18]
	bx lr
	.align 2, 0
_020DE4DC: .word 0x021E4220
	arm_func_end sub_020DE4C8

	arm_func_start sub_020DE4E0
sub_020DE4E0: ; 0x020DE4E0
	stmdb sp!, {r3, lr}
	ldr r0, _020DE534 ; =0x021E4228
	add r1, sp, #0
	mov r2, #0
	bl OS_ReceiveMessage
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	ldr r0, [sp]
	mov r1, #2
	bl DC_InvalidateRange
	ldr r1, [sp]
	ldrh r0, [r1]
	tst r0, #0x8000
	movne r0, r1
	ldmneia sp!, {r3, pc}
	ldr r0, _020DE534 ; =0x021E4228
	mov r2, #1
	bl OS_JamMessage
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_020DE534: .word 0x021E4228
	arm_func_end sub_020DE4E0

	arm_func_start sub_020DE538
sub_020DE538: ; 0x020DE538
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl sub_020DE4E0
	movs r4, r0
	moveq r0, #8
	ldmeqia sp!, {r3, r4, r5, lr}
	addeq sp, sp, #0x10
	bxeq lr
	strh r5, [r4]
	ldrh r5, [sp, #0x14]
	add r0, sp, #0x14
	bic r0, r0, #3
	mov r3, #0
	cmp r5, #0
	add r2, r0, #4
	ble _020DE598
_020DE57C:
	add r2, r2, #4
	ldr r1, [r2, #-4]
	add r0, r4, r3, lsl #2
	add r3, r3, #1
	str r1, [r0, #4]
	cmp r3, r5
	blt _020DE57C
_020DE598:
	mov r0, r4
	mov r1, #0x100
	bl DC_StoreRange
	mov r1, r4
	mov r0, #0xa
	mov r2, #0
	bl PXI_SendWordByFifo
	mov r5, r0
	ldr r0, _020DE5E0 ; =0x021E4228
	mov r1, r4
	mov r2, #1
	bl OS_SendMessage
	cmp r5, #0
	movlt r0, #8
	movge r0, #2
	ldmia sp!, {r3, r4, r5, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_020DE5E0: .word 0x021E4228
	arm_func_end sub_020DE538

	arm_func_start sub_020DE5E4
sub_020DE5E4: ; 0x020DE5E4
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r4, r1
	bl sub_020DE4E0
	movs r5, r0
	moveq r0, #8
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl MIi_CpuCopy8
	mov r0, r5
	mov r1, r4
	bl DC_StoreRange
	mov r1, r5
	mov r0, #0xa
	mov r2, #0
	bl PXI_SendWordByFifo
	mov r4, r0
	ldr r0, _020DE650 ; =0x021E4228
	mov r1, r5
	mov r2, #1
	bl OS_SendMessage
	cmp r4, #0
	movlt r0, #8
	movge r0, #2
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020DE650: .word 0x021E4228
	arm_func_end sub_020DE5E4

	arm_func_start sub_020DE654
sub_020DE654: ; 0x020DE654
	ldr r0, _020DE660 ; =0x021E4220
	ldr r0, [r0, #4]
	bx lr
	.align 2, 0
_020DE660: .word 0x021E4220
	arm_func_end sub_020DE654

	arm_func_start sub_020DE664
sub_020DE664: ; 0x020DE664
	ldr r0, _020DE67C ; =0x021E4220
	ldrh r0, [r0]
	cmp r0, #0
	movne r0, #0
	moveq r0, #3
	bx lr
	.align 2, 0
_020DE67C: .word 0x021E4220
	arm_func_end sub_020DE664

	arm_func_start sub_020DE680
sub_020DE680: ; 0x020DE680
	stmdb sp!, {r3, lr}
	bl sub_020DE664
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _020DE6C4 ; =0x021E4220
	mov r1, #2
	ldr r0, [r0, #4]
	ldr r0, [r0, #4]
	bl DC_InvalidateRange
	ldr r0, _020DE6C4 ; =0x021E4220
	ldr r0, [r0, #4]
	ldr r0, [r0, #4]
	ldrh r0, [r0]
	cmp r0, #1
	movls r0, #3
	movhi r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_020DE6C4: .word 0x021E4220
	arm_func_end sub_020DE680

	arm_func_start sub_020DE6C8
sub_020DE6C8: ; 0x020DE6C8
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, lr}
	bl sub_020DE664
	cmp r0, #0
	ldmneia sp!, {r3, lr}
	addne sp, sp, #0x10
	bxne lr
	ldr r0, _020DE758 ; =0x021E4220
	mov r1, #2
	ldr r0, [r0, #4]
	ldr r0, [r0, #4]
	bl DC_InvalidateRange
	ldr r0, _020DE758 ; =0x021E4220
	ldr r3, [sp, #8]
	ldr r0, [r0, #4]
	add r1, sp, #8
	ldr r2, [r0, #4]
	bic r0, r1, #3
	add ip, r0, #4
	ldrh lr, [r2]
	cmp r3, #0
	mov r0, #3
	ldmeqia sp!, {r3, lr}
	addeq sp, sp, #0x10
	bxeq lr
	mov r1, #0
_020DE730:
	add ip, ip, #4
	ldr r2, [ip, #-4]
	cmp r2, lr
	moveq r0, r1
	subs r3, r3, #1
	str r3, [sp, #8]
	bne _020DE730
	ldmia sp!, {r3, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_020DE758: .word 0x021E4220
	arm_func_end sub_020DE6C8

	arm_func_start sub_020DE75C
sub_020DE75C: ; 0x020DE75C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	ldr r0, _020DEAF4 ; =0x021E4220
	cmp r2, #0
	ldr r4, [r0, #4]
	mov sl, r1
	addne sp, sp, #8
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, [r4, #0x10]
	mov r1, #0x100
	bl DC_InvalidateRange
	ldrh r0, [r4, #0x16]
	cmp r0, #0
	bne _020DE7A0
	ldr r0, [r4, #4]
	mov r1, #0x800
	bl DC_InvalidateRange
_020DE7A0:
	ldr r0, [r4, #0x10]
	cmp sl, r0
	beq _020DE7B8
	mov r0, sl
	mov r1, #0x100
	bl DC_InvalidateRange
_020DE7B8:
	ldrh r0, [sl]
	cmp r0, #0x2c
	blo _020DE870
	cmp r0, #0x80
	bne _020DE7F4
	ldrh r0, [sl, #2]
	cmp r0, #0x13
	bne _020DE7DC
	bl OS_Terminate
_020DE7DC:
	ldr r1, [r4, #0xc8]
	cmp r1, #0
	beq _020DEAB4
	mov r0, sl
	blx r1
	b _020DEAB4
_020DE7F4:
	cmp r0, #0x82
	bne _020DE848
	ldrh r0, [sl, #6]
	add r1, r4, r0, lsl #2
	ldr r0, [r1, #0xcc]
	cmp r0, #0
	beq _020DEAB4
	ldr r0, [r1, #0x10c]
	str r0, [sl, #0x1c]
	ldr r0, [r4, #0x14c]
	strh r0, [sl, #0x22]
	ldr r1, [r4, #4]
	ldr r0, [sl, #8]
	ldrh r1, [r1, #0x72]
	bl DC_InvalidateRange
	ldrh r1, [sl, #6]
	mov r0, sl
	add r1, r4, r1, lsl #2
	ldr r1, [r1, #0xcc]
	blx r1
	b _020DEAB4
_020DE848:
	cmp r0, #0x81
	bne _020DEAB4
	mov r0, #0xf
	strh r0, [sl]
	ldr r1, [sl, #0x1c]
	cmp r1, #0
	beq _020DEAB4
	mov r0, sl
	blx r1
	b _020DEAB4
_020DE870:
	cmp r0, #0xe
	bne _020DE8B0
	ldrh r0, [sl, #4]
	add r0, r0, #0xf5
	add r0, r0, #0xff00
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	bhi _020DE8B0
	ldrh r0, [sl, #2]
	cmp r0, #0
	bne _020DE8B0
	ldr r1, [r4, #4]
	ldr r0, [sl, #8]
	ldrh r1, [r1, #0x72]
	bl DC_InvalidateRange
_020DE8B0:
	ldrh r1, [sl]
	cmp r1, #2
	ldreqh r0, [sl, #2]
	cmpeq r0, #0
	add r0, r4, r1, lsl #2
	bne _020DE8EC
	ldr r4, [r0, #0x18]
	bl sub_020DE458
	cmp r4, #0
	addeq sp, sp, #8
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, sl
	blx r4
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020DE8EC:
	ldr r1, [r0, #0x18]
	cmp r1, #0
	beq _020DE914
	mov r0, sl
	blx r1
	ldr r0, _020DEAF4 ; =0x021E4220
	ldrh r0, [r0]
	cmp r0, #0
	addeq sp, sp, #8
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020DE914:
	ldrh r0, [sl]
	cmp r0, #8
	cmpne r0, #0xc
	bne _020DEAB4
	cmp r0, #8
	bne _020DE958
	add r0, sl, #0xa
	str r0, [sp]
	ldrh r5, [sl, #8]
	ldrh r6, [sl, #0x10]
	ldrh r0, [sl, #0x12]
	add fp, sl, #0x14
	mov r7, #0
	str r0, [sp, #4]
	ldrh r8, [sl, #0x2c]
	ldrh sb, [sl, #0x2e]
	b _020DE988
_020DE958:
	cmp r0, #0xc
	bne _020DE988
	ldrh r5, [sl, #8]
	ldrh r7, [sl, #0xa]
	ldrh r0, [sl, #0xc]
	mov r6, #0
	mov fp, r6
	str r0, [sp, #4]
	add r0, sl, #0x10
	ldrh r8, [sl, #0x16]
	ldrh sb, [sl, #0x18]
	str r0, [sp]
_020DE988:
	cmp r5, #7
	cmpne r5, #9
	cmpne r5, #0x1a
	bne _020DEAB4
	cmp r5, #7
	ldreq r1, [r4, #0x14c]
	mov r0, #1
	orreq r0, r1, r0, lsl r6
	mvnne r0, r0, lsl r6
	ldrne r1, [r4, #0x14c]
	add r3, r4, #0x100
	andne r0, r1, r0
	str r0, [r4, #0x14c]
	ldr r0, _020DEAF8 ; =0x021E4270
	mov r1, #0
	mov r2, #0x44
	strh r7, [r3, #0x50]
	bl MI_CpuFill8
	ldr ip, _020DEAF4 ; =0x021E4220
	mov r1, #0x82
	strh r1, [ip, #0x50]
	mov r1, #0
	strh r1, [ip, #0x52]
	strh r5, [ip, #0x54]
	str r1, [ip, #0x58]
	str r1, [ip, #0x5c]
	strh r1, [ip, #0x60]
	strh r6, [ip, #0x62]
	strh r7, [ip, #0x70]
	ldr r2, [r4, #0x14c]
	ldr r1, _020DEAFC ; =0x0000FFFF
	strh r2, [ip, #0x72]
	strh r1, [ip, #0x6a]
	ldr r3, [sp, #4]
	ldr r0, [sp]
	ldr r1, _020DEB00 ; =0x021E4284
	mov r2, #6
	strh r3, [ip, #0x8c]
	bl MIi_CpuCopy8
	cmp fp, #0
	mov r2, #0x18
	beq _020DEA40
	ldr r1, _020DEB04 ; =0x021E4294
	mov r0, fp
	bl MIi_CpuCopy16
	b _020DEA4C
_020DEA40:
	ldr r1, _020DEB04 ; =0x021E4294
	mov r0, #0
	bl MIi_CpuClear16
_020DEA4C:
	cmp r7, #0
	moveq r1, r8
	movne r1, sb
	cmp r7, #0
	ldr r0, _020DEAF4 ; =0x021E4220
	ldr r7, _020DEAF4 ; =0x021E4220
	strh r1, [r0, #0x90]
	movne sb, r8
	ldr r5, _020DEAF8 ; =0x021E4270
	mov r6, #0
	strh sb, [r7, #0x92]
_020DEA78:
	strh r6, [r7, #0x56]
	add r2, r4, r6, lsl #2
	ldr r0, [r2, #0xcc]
	cmp r0, #0
	beq _020DEAA0
	ldr r1, [r2, #0x10c]
	mov r0, r5
	str r1, [r7, #0x6c]
	ldr r1, [r2, #0xcc]
	blx r1
_020DEAA0:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, lsr #0x10
	cmp r6, #0x10
	blo _020DEA78
_020DEAB4:
	ldr r0, [r4, #0x10]
	mov r1, #0x100
	bl DC_InvalidateRange
	bl sub_020DEB08
	ldr r0, [r4, #0x10]
	cmp sl, r0
	addeq sp, sp, #8
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldrh r2, [sl]
	mov r0, sl
	mov r1, #0x100
	orr r2, r2, #0x8000
	strh r2, [sl]
	bl DC_StoreRange
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020DEAF4: .word 0x021E4220
_020DEAF8: .word 0x021E4270
_020DEAFC: .word 0x0000FFFF
_020DEB00: .word 0x021E4284
_020DEB04: .word 0x021E4294
	arm_func_end sub_020DE75C

	arm_func_start sub_020DEB08
sub_020DEB08: ; 0x020DEB08
	ldr r1, _020DEB20 ; =0x027FFF96
	ldrh r0, [r1]
	tst r0, #1
	bicne r0, r0, #1
	strneh r0, [r1]
	bx lr
	.align 2, 0
_020DEB20: .word 0x027FFF96
	arm_func_end sub_020DEB08

	arm_func_start sub_020DEB24
sub_020DEB24: ; 0x020DEB24
	stmdb sp!, {r3, lr}
	bl sub_020DE664
	cmp r0, #0
	movne r0, #0
	ldreq r0, _020DEB44 ; =0x021E4220
	ldreq r0, [r0, #4]
	ldreq r0, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020DEB44: .word 0x021E4220
	arm_func_end sub_020DEB24

	arm_func_start sub_020DEB48
sub_020DEB48: ; 0x020DEB48
	stmdb sp!, {r4, lr}
	bl OS_DisableInterrupts
	ldr r1, _020DEB74 ; =0x021E4220
	ldr r1, [r1, #4]
	cmp r1, #0
	addne r1, r1, #0x100
	ldrneh r4, [r1, #0x50]
	moveq r4, #0
	bl OS_RestoreInterrupts
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_020DEB74: .word 0x021E4220
	arm_func_end sub_020DEB48

	arm_func_start sub_020DEB78
sub_020DEB78: ; 0x020DEB78
	stmdb sp!, {r4, lr}
	bl OS_DisableInterrupts
	ldr r1, _020DEBA4 ; =0x021E4220
	ldr r1, [r1, #4]
	cmp r1, #0
	ldrne r4, [r1, #0x14c]
	moveq r4, #0
	bl OS_RestoreInterrupts
	mov r0, r4, lsl #0x10
	mov r0, r0, lsr #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_020DEBA4: .word 0x021E4220
	arm_func_end sub_020DEB78

	arm_func_start sub_020DEBA8
sub_020DEBA8: ; 0x020DEBA8
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	bl OS_DisableInterrupts
	mov r5, r0
	bl sub_020DE664
	movs r4, r0
	beq _020DEBD4
	mov r0, r5
	bl OS_RestoreInterrupts
	mov r0, r4
	ldmia sp!, {r4, r5, r6, pc}
_020DEBD4:
	bl sub_020DE654
	str r6, [r0, #0xc8]
	mov r0, r5
	bl OS_RestoreInterrupts
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020DEBA8

	arm_func_start sub_020DEBEC
sub_020DEBEC: ; 0x020DEBEC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x44
	movs r5, r1
	mov r6, r0
	mov r4, r2
	beq _020DEC54
	add r0, sp, #0
	mov r1, #0
	mov r2, #0x44
	bl MI_CpuFill8
	mov r3, #0
	ldr r1, _020DECC0 ; =0x0000FFFF
	mov r7, #0x82
	mov r2, #0x19
	add r0, sp, #0x14
	strh r7, [sp]
	strh r3, [sp, #2]
	strh r2, [sp, #4]
	strh r6, [sp, #6]
	str r3, [sp, #8]
	str r3, [sp, #0xc]
	strh r3, [sp, #0x10]
	strh r1, [sp, #0x1a]
	str r4, [sp, #0x1c]
	strh r3, [sp, #0x12]
	bl OS_GetMacAddress
_020DEC54:
	bl OS_DisableInterrupts
	mov r8, r0
	bl sub_020DE664
	movs r7, r0
	beq _020DEC7C
	mov r0, r8
	bl OS_RestoreInterrupts
	add sp, sp, #0x44
	mov r0, r7
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_020DEC7C:
	bl sub_020DE654
	add r0, r0, r6, lsl #2
	str r5, [r0, #0xcc]
	str r4, [r0, #0x10c]
	cmp r5, #0
	beq _020DECAC
	bl sub_020DEB78
	strh r0, [sp, #0x22]
	bl sub_020DEB48
	strh r0, [sp, #0x20]
	add r0, sp, #0
	blx r5
_020DECAC:
	mov r0, r8
	bl OS_RestoreInterrupts
	mov r0, #0
	add sp, sp, #0x44
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020DECC0: .word 0x0000FFFF
	arm_func_end sub_020DEBEC

	arm_func_start sub_020DECC4
sub_020DECC4: ; 0x020DECC4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl sub_020DE654
	mov r4, r0
	bl sub_020DE664
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	cmp r5, #0
	moveq r0, #6
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, [r4, #4]
	mov r1, #0x7d0
	bl DC_InvalidateRange
	ldr r0, [r4, #4]
	mov r1, r5
	mov r2, #0x7d0
	bl MIi_CpuCopyFast
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020DECC4

	arm_func_start sub_020DED10
sub_020DED10: ; 0x020DED10
	stmdb sp!, {r4, lr}
	bl sub_020DE654
	mov r4, r0
	mov r0, #2
	mov r1, #7
	mov r2, #8
	bl sub_020DE6C8
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r4, pc}
	ldr r0, [r4, #4]
	mov r1, #4
	add r0, r0, #0xc
	bl DC_InvalidateRange
	ldr r1, [r4, #4]
	ldr r0, [r1, #0xc]
	cmp r0, #1
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	add r0, r1, #0x3c
	mov r1, #4
	bl DC_InvalidateRange
	ldr r0, [r4, #4]
	ldrh r0, [r0, #0x3c]
	add r0, r0, #0x1f
	bic r0, r0, #0x1f
	ldmia sp!, {r4, pc}
	arm_func_end sub_020DED10

	arm_func_start sub_020DED7C
sub_020DED7C: ; 0x020DED7C
	stmdb sp!, {r3, r4, r5, lr}
	bl sub_020DE654
	mov r4, r0
	mov r0, #2
	mov r1, #7
	mov r2, #8
	bl sub_020DE6C8
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	ldr r0, [r4, #4]
	mov r1, #4
	add r0, r0, #0xc
	bl DC_InvalidateRange
	ldr r1, [r4, #4]
	ldr r0, [r1, #0xc]
	cmp r0, #1
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	add r0, r1, #0x188
	mov r1, #2
	bl DC_InvalidateRange
	ldr r1, [r4, #4]
	add r0, r1, #0x100
	ldrh r0, [r0, #0x88]
	cmp r0, #0
	moveq r5, #1
	add r0, r1, #0x3e
	mov r1, #2
	movne r5, #0
	bl DC_InvalidateRange
	ldr r0, [r4, #4]
	cmp r5, #1
	ldrh r5, [r0, #0x3e]
	addne r0, r5, #0x51
	bicne r0, r0, #0x1f
	movne r0, r0, lsl #1
	ldmneia sp!, {r3, r4, r5, pc}
	add r0, r0, #0xf8
	mov r1, #2
	bl DC_InvalidateRange
	ldr r0, [r4, #4]
	add r1, r5, #0xc
	ldrh r0, [r0, #0xf8]
	mul r0, r1, r0
	add r0, r0, #0x29
	bic r0, r0, #0x1f
	mov r0, r0, lsl #1
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020DED7C

	arm_func_start sub_020DEE40
sub_020DEE40: ; 0x020DEE40
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x3c
	mov r5, r0
	mov r4, r1
	bl sub_020DE654
	mov r6, r0
	bl sub_020DE664
	cmp r0, #0
	addne sp, sp, #0x3c
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, pc}
	cmp r4, #1
	blo _020DEE7C
	cmp r4, #0xf
	bls _020DEE88
_020DEE7C:
	add sp, sp, #0x3c
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, pc}
_020DEE88:
	ldr r0, [r6, #4]
	mov r1, #2
	add r0, r0, #0x82
	add r0, r0, #0x100
	bl DC_InvalidateRange
	ldr r0, [r6, #4]
	mov r1, #1
	add r0, r0, #0x100
	ldrh r0, [r0, #0x82]
	tst r0, r1, lsl r4
	addeq sp, sp, #0x3c
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, pc}
	ldrh r0, [r5, #4]
	cmp r0, #0
	addeq sp, sp, #0x3c
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, pc}
	add r0, r5, #0xa
	str r0, [sp]
	mov r3, #0
	add r2, sp, #0
_020DEEE0:
	ldr r0, [r2, r3, lsl #2]
	ldrh r1, [r0, #4]
	cmp r4, r1
	addeq sp, sp, #0x3c
	ldmeqia sp!, {r3, r4, r5, r6, pc}
	add r3, r3, #1
	add r0, r2, r3, lsl #2
	ldrh r1, [r5, #6]
	ldr r0, [r0, #-4]
	add r0, r1, r0
	str r0, [r2, r3, lsl #2]
	ldrh r0, [r5, #4]
	cmp r3, r0
	blt _020DEEE0
	mov r0, #0
	add sp, sp, #0x3c
	ldmia sp!, {r3, r4, r5, r6, pc}
	arm_func_end sub_020DEE40

	arm_func_start sub_020DEF24
sub_020DEF24: ; 0x020DEF24
	stmdb sp!, {r3, lr}
	bl sub_020DE664
	cmp r0, #0
	movne r0, #0x8000
	ldreq r0, _020DEF40 ; =0x027FFCFA
	ldreqh r0, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020DEF40: .word 0x027FFCFA
	arm_func_end sub_020DEF24

	arm_func_start sub_020DEF44
sub_020DEF44: ; 0x020DEF44
	stmdb sp!, {r4, lr}
	bl sub_020DE654
	mov r4, r0
	bl sub_020DE664
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r4, pc}
	ldr r0, [r4, #4]
	mov r1, #2
	bl DC_InvalidateRange
	ldr r1, [r4, #4]
	ldrh r0, [r1]
	cmp r0, #9
	beq _020DEF8C
	cmp r0, #0xa
	cmpne r0, #0xb
	beq _020DEFB4
	b _020DEFCC
_020DEF8C:
	add r0, r1, #0x82
	add r0, r0, #0x100
	mov r1, #2
	bl DC_InvalidateRange
	ldr r1, [r4, #4]
	add r0, r1, #0x100
	ldrh r0, [r0, #0x82]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
_020DEFB4:
	add r0, r1, #0xbc
	mov r1, #2
	bl DC_InvalidateRange
	ldr r0, [r4, #4]
	ldrh r0, [r0, #0xbc]
	ldmia sp!, {r4, pc}
_020DEFCC:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end sub_020DEF44

	arm_func_start sub_020DEFD4
sub_020DEFD4: ; 0x020DEFD4
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	add r0, sp, #0
	bl OS_GetMacAddress
	mov r2, #0
	add r3, sp, #0
	mov r1, r2
_020DEFF0:
	ldrb r0, [r3], #1
	add r2, r2, #1
	cmp r2, #6
	add r0, r1, r0
	mov r0, r0, lsl #0x10
	mov r1, r0, lsr #0x10
	blt _020DEFF0
	ldr r0, _020DF05C ; =0x027FFC3C
	ldr ip, _020DF060 ; =0x66666667
	ldr r0, [r0]
	mov r3, #0x14
	add r0, r1, r0
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	rsb r0, r0, r0, lsl #3
	mov r0, r0, lsl #0x10
	mov r2, r0, lsr #0x10
	mov r1, r2, lsr #0x1f
	smull r2, lr, ip, r2
	add lr, r1, lr, asr #3
	smull r1, r2, r3, lr
	rsb lr, r1, r0, lsr #16
	add r0, lr, #0xc8
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_020DF05C: .word 0x027FFC3C
_020DF060: .word 0x66666667
	arm_func_end sub_020DEFD4

	arm_func_start sub_020DF064
sub_020DF064: ; 0x020DF064
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	add r0, sp, #0
	bl OS_GetMacAddress
	mov r1, #0
	add r3, sp, #0
	mov r2, r1
_020DF080:
	ldrb r0, [r3], #1
	add r1, r1, #1
	cmp r1, #6
	add r0, r2, r0
	mov r0, r0, lsl #0x10
	mov r2, r0, lsr #0x10
	blt _020DF080
	ldr r0, _020DF0F0 ; =0x027FFC3C
	mov r1, #0xd
	ldr r0, [r0]
	ldr r3, _020DF0F4 ; =0x66666667
	add r0, r2, r0
	mov r0, r0, lsl #0x10
	mov r2, r0, lsr #0x10
	mul r0, r2, r1
	mov r0, r0, lsl #0x10
	mov r2, r0, lsr #0x10
	mov r1, r2, lsr #0x1f
	smull r2, ip, r3, r2
	add ip, r1, ip, asr #2
	mov r3, #0xa
	smull r1, r2, r3, ip
	rsb ip, r1, r0, lsr #16
	add r0, ip, #0x1e
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_020DF0F0: .word 0x027FFC3C
_020DF0F4: .word 0x66666667
	arm_func_end sub_020DF064

	arm_func_start sub_020DF0F8
sub_020DF0F8: ; 0x020DF0F8
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x84
	ldrh r2, [r1, #0x3c]
	mov lr, r0
	cmp r2, #0
	beq _020DF140
	mov r0, #0
	add r5, sp, #0
	strb r0, [sp]
	mov r4, #8
_020DF120:
	ldmia r5!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs r4, r4, #1
	bne _020DF120
	ldr r0, [r5]
	add sp, sp, #0x84
	str r0, [lr]
	ldmia sp!, {r3, r4, r5, r6, pc}
_020DF140:
	ldrh r0, [r1, #0x3e]
	strb r0, [sp]
	ands r0, r0, #0xff
	bne _020DF178
	add r5, sp, #0
	mov r4, #8
_020DF158:
	ldmia r5!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs r4, r4, #1
	bne _020DF158
	ldr r0, [r5]
	add sp, sp, #0x84
	str r0, [lr]
	ldmia sp!, {r3, r4, r5, r6, pc}
_020DF178:
	cmp r0, #0x10
	movhi r0, #0x10
	strhib r0, [sp]
	ldrh r2, [r1]
	ldrb r0, [sp]
	mov r3, #0
	mov r2, r2, lsl #1
	sub r4, r2, #0x40
	cmp r0, #0
	add r0, r1, #0x40
	mov r2, r3
	and r1, r4, #0xff
	ble _020DF228
	add ip, sp, #0
_020DF1B0:
	ldrb r5, [r0]
	add r6, ip, r2, lsl #3
	add r4, r0, #2
	strb r5, [r6, #4]
	ldrb r5, [r0, #1]
	strb r5, [r6, #5]
	str r4, [r6, #8]
	ldrb r4, [r6, #5]
	add r4, r4, #2
	and r5, r4, #0xff
	add r3, r3, r5
	and r3, r3, #0xff
	cmp r3, r1
	bls _020DF214
	mov r0, #0
	strb r0, [sp]
	mov r4, #8
_020DF1F4:
	ldmia ip!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs r4, r4, #1
	bne _020DF1F4
	ldr r0, [ip]
	add sp, sp, #0x84
	str r0, [lr]
	ldmia sp!, {r3, r4, r5, r6, pc}
_020DF214:
	ldrb r4, [sp]
	add r2, r2, #1
	add r0, r0, r5
	cmp r2, r4
	blt _020DF1B0
_020DF228:
	add r4, sp, #0
	mov ip, #8
_020DF230:
	ldmia r4!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _020DF230
	ldr r0, [r4]
	str r0, [lr]
	add sp, sp, #0x84
	ldmia sp!, {r3, r4, r5, r6, pc}
	arm_func_end sub_020DF0F8

	arm_func_start sub_020DF250
sub_020DF250: ; 0x020DF250
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	ldr r0, _020DF2C0 ; =_02110FC0
	ldr r0, [r0]
	cmp r0, #0x10000
	bne _020DF298
	bl RTC_Init
	add r0, sp, #0
	bl sub_020DBB48
	cmp r0, #0
	bne _020DF298
	ldr r2, [sp, #8]
	ldr r0, [sp, #4]
	ldr r1, _020DF2C0 ; =_02110FC0
	add r0, r2, r0, lsl #8
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	str r0, [r1]
_020DF298:
	ldr r1, _020DF2C0 ; =_02110FC0
	ldr r0, [r1]
	add r0, r0, #1
	mov r0, r0, lsl #0x10
	mov r2, r0, lsr #0x10
	mov r0, r2, lsl #0x10
	str r2, [r1]
	mov r0, r0, lsr #0x10
	add sp, sp, #0xc
	ldmia sp!, {pc}
	.align 2, 0
_020DF2C0: .word _02110FC0
	arm_func_end sub_020DF250

	arm_func_start sub_020DF2C4
sub_020DF2C4: ; 0x020DF2C4
	ldr ip, _020DF2D0 ; =sub_020DF2D4
	mov r1, #0
	bx ip
	.align 2, 0
_020DF2D0: .word sub_020DF2D4
	arm_func_end sub_020DF2C4

	arm_func_start sub_020DF2D4
sub_020DF2D4: ; 0x020DF2D4
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r5, r0
	mov r4, r1
	mov r0, #1
	mov r1, #0
	bl sub_020DE6C8
	cmp r0, #0
	addne sp, sp, #8
	ldmneia sp!, {r3, r4, r5, pc}
	mov r1, r5
	mov r0, #3
	bl sub_020DE4C8
	bl sub_020DE654
	mov r3, r0
	ldr r1, [r3, #0x10]
	mov r0, #3
	stmia sp, {r1, r4}
	mov r1, #4
	ldmia r3, {r2, r3}
	bl sub_020DE538
	cmp r0, #0
	moveq r0, #2
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020DF2D4

	arm_func_start sub_020DF338
sub_020DF338: ; 0x020DF338
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #1
	mov r1, r0
	bl sub_020DE6C8
	cmp r0, #0
	ldmneia sp!, {r4, pc}
	mov r1, r4
	mov r0, #4
	bl sub_020DE4C8
	mov r0, #4
	mov r1, #0
	bl sub_020DE538
	cmp r0, #0
	moveq r0, #2
	ldmia sp!, {r4, pc}
	arm_func_end sub_020DF338

	arm_func_start sub_020DF378
sub_020DF378: ; 0x020DF378
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #1
	mov r1, r0
	bl sub_020DE6C8
	cmp r0, #0
	ldmneia sp!, {r4, pc}
	mov r1, r4
	mov r0, #5
	bl sub_020DE4C8
	mov r0, #5
	mov r1, #0
	bl sub_020DE538
	cmp r0, #0
	moveq r0, #2
	ldmia sp!, {r4, pc}
	arm_func_end sub_020DF378

	arm_func_start sub_020DF3B8
sub_020DF3B8: ; 0x020DF3B8
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #1
	mov r1, #2
	bl sub_020DE6C8
	cmp r0, #0
	ldmneia sp!, {r4, pc}
	mov r1, r4
	mov r0, #6
	bl sub_020DE4C8
	mov r0, #6
	mov r1, #0
	bl sub_020DE538
	cmp r0, #0
	moveq r0, #2
	ldmia sp!, {r4, pc}
	arm_func_end sub_020DF3B8

	arm_func_start sub_020DF3F8
sub_020DF3F8: ; 0x020DF3F8
	ldr ip, _020DF404 ; =sub_020DF420
	mov r3, #0
	bx ip
	.align 2, 0
_020DF404: .word sub_020DF420
	arm_func_end sub_020DF3F8

	arm_func_start sub_020DF408
sub_020DF408: ; 0x020DF408
	ldr ip, _020DF41C ; =sub_020DF420
	cmp r3, #0
	mov r3, #1
	orreq r3, r3, #2
	bx ip
	.align 2, 0
_020DF41C: .word sub_020DF420
	arm_func_end sub_020DF408

	arm_func_start sub_020DF420
sub_020DF420: ; 0x020DF420
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r5, r1
	mov r1, r2
	mov r4, r3
	bl sub_020DE248
	cmp r0, #0
	addne sp, sp, #8
	ldmneia sp!, {r3, r4, r5, pc}
	mov r1, r5
	mov r0, #0
	bl sub_020DE4C8
	bl sub_020DE654
	mov r3, r0
	ldr r1, [r3, #0x10]
	mov r0, #0
	stmia sp, {r1, r4}
	mov r1, #4
	ldmia r3, {r2, r3}
	bl sub_020DE538
	cmp r0, #0
	moveq r0, #2
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020DF420

	arm_func_start sub_020DF480
sub_020DF480: ; 0x020DF480
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_020DE680
	cmp r0, #0
	ldmneia sp!, {r4, pc}
	mov r1, r4
	mov r0, #1
	bl sub_020DE4C8
	mov r0, #1
	mov r1, #0
	bl sub_020DE538
	cmp r0, #0
	moveq r0, #2
	ldmia sp!, {r4, pc}
	arm_func_end sub_020DF480

	arm_func_start sub_020DF4B8
sub_020DF4B8: ; 0x020DF4B8
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #1
	mov r1, #2
	bl sub_020DE6C8
	cmp r0, #0
	ldmneia sp!, {r4, pc}
	mov r1, r4
	mov r0, #2
	bl sub_020DE4C8
	mov r0, #2
	mov r1, #0
	bl sub_020DE538
	cmp r0, #0
	moveq r0, #2
	ldmia sp!, {r4, pc}
	arm_func_end sub_020DF4B8

	arm_func_start sub_020DF4F8
sub_020DF4F8: ; 0x020DF4F8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r0, #1
	mov r1, #2
	bl sub_020DE6C8
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	cmp r4, #0
	moveq r0, #6
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrh r0, [r4, #4]
	cmp r0, #0
	beq _020DF540
	ldr r0, [r4]
	cmp r0, #0
	moveq r0, #6
	ldmeqia sp!, {r3, r4, r5, pc}
_020DF540:
	ldrh r1, [r4, #0x14]
	ldrh r0, [r4, #0x34]
	cmp r1, #0
	movne r2, #0x2a
	moveq r2, #0
	add r0, r0, r2
	cmp r0, #0x200
	bgt _020DF57C
	ldrh r0, [r4, #0x36]
	cmp r1, #0
	movne r1, #6
	moveq r1, #0
	add r0, r0, r1
	cmp r0, #0x200
	ble _020DF584
_020DF57C:
	mov r0, #6
	ldmia sp!, {r3, r4, r5, pc}
_020DF584:
	mov r0, r4
	bl sub_020DF5D4
	mov r1, r5
	mov r0, #7
	bl sub_020DE4C8
	mov r0, r4
	mov r1, #0x40
	bl DC_StoreRange
	ldrh r1, [r4, #4]
	cmp r1, #0
	beq _020DF5B8
	ldr r0, [r4]
	bl DC_StoreRange
_020DF5B8:
	mov r2, r4
	mov r0, #7
	mov r1, #1
	bl sub_020DE538
	cmp r0, #0
	moveq r0, #2
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020DF4F8

	arm_func_start sub_020DF5D4
sub_020DF5D4: ; 0x020DF5D4
	ldrh r1, [r0, #4]
	cmp r1, #0x70
	movhi r0, #0
	bxhi lr
	ldrh r1, [r0, #0x18]
	cmp r1, #0xa
	blo _020DF5F8
	cmp r1, #0x3e8
	bls _020DF600
_020DF5F8:
	mov r0, #0
	bx lr
_020DF600:
	ldrh r0, [r0, #0x32]
	cmp r0, #1
	blo _020DF614
	cmp r0, #0xe
	bls _020DF61C
_020DF614:
	mov r0, #0
	bx lr
_020DF61C:
	mov r0, #1
	bx lr
	arm_func_end sub_020DF5D4

	arm_func_start sub_020DF624
sub_020DF624: ; 0x020DF624
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r0, #1
	mov r1, #2
	bl sub_020DE6C8
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	bl sub_020DE654
	add r1, r0, #0x100
	mov r2, #0
	strh r2, [r1, #0x50]
	str r2, [r0, #0x14c]
	mov r1, r5
	mov r0, #8
	bl sub_020DE4C8
	mov r2, r4
	mov r0, #8
	mov r1, #1
	bl sub_020DE538
	cmp r0, #0
	moveq r0, #2
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020DF624

	arm_func_start sub_020DF680
sub_020DF680: ; 0x020DF680
	ldr ip, _020DF68C ; =sub_020DF624
	mov r1, #1
	bx ip
	.align 2, 0
_020DF68C: .word sub_020DF624
	arm_func_end sub_020DF680

	arm_func_start sub_020DF690
sub_020DF690: ; 0x020DF690
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #1
	mov r1, #7
	bl sub_020DE6C8
	cmp r0, #0
	ldmneia sp!, {r4, pc}
	mov r1, r4
	mov r0, #9
	bl sub_020DE4C8
	mov r0, #9
	mov r1, #0
	bl sub_020DE538
	cmp r0, #0
	moveq r0, #2
	ldmia sp!, {r4, pc}
	arm_func_end sub_020DF690

	arm_func_start sub_020DF6D0
sub_020DF6D0: ; 0x020DF6D0
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x10
	mov r5, r0
	mov r0, #3
	mov r4, r1
	mov r2, r0
	mov r1, #2
	mov r3, #5
	bl sub_020DE6C8
	cmp r0, #0
	addne sp, sp, #0x10
	ldmneia sp!, {r3, r4, r5, pc}
	cmp r4, #0
	addeq sp, sp, #0x10
	moveq r0, #6
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, [r4]
	cmp r0, #0
	addeq sp, sp, #0x10
	moveq r0, #6
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrh r0, [r4, #4]
	cmp r0, #1
	blo _020DF738
	cmp r0, #0xe
	bls _020DF744
_020DF738:
	add sp, sp, #0x10
	mov r0, #6
	ldmia sp!, {r3, r4, r5, pc}
_020DF744:
	mov r1, r5
	mov r0, #0xa
	bl sub_020DE4C8
	mov r0, #0xa
	strh r0, [sp]
	ldrh r2, [r4, #4]
	add r0, sp, #0
	mov r1, #0x10
	strh r2, [sp, #2]
	ldr r2, [r4]
	str r2, [sp, #4]
	ldrh r2, [r4, #6]
	strh r2, [sp, #8]
	ldrb r2, [r4, #8]
	strb r2, [sp, #0xa]
	ldrb r2, [r4, #9]
	strb r2, [sp, #0xb]
	ldrb r2, [r4, #0xa]
	strb r2, [sp, #0xc]
	ldrb r2, [r4, #0xb]
	strb r2, [sp, #0xd]
	ldrb r2, [r4, #0xc]
	strb r2, [sp, #0xe]
	ldrb r2, [r4, #0xd]
	strb r2, [sp, #0xf]
	bl sub_020DE5E4
	cmp r0, #0
	moveq r0, #2
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020DF6D0

	arm_func_start sub_020DF7BC
sub_020DF7BC: ; 0x020DF7BC
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x3c
	mov r5, r0
	mov r0, #3
	mov r4, r1
	mov r2, r0
	mov r1, #2
	mov r3, #5
	bl sub_020DE6C8
	cmp r0, #0
	addne sp, sp, #0x3c
	ldmneia sp!, {r4, r5, pc}
	cmp r4, #0
	addeq sp, sp, #0x3c
	moveq r0, #6
	ldmeqia sp!, {r4, r5, pc}
	ldr r0, [r4]
	cmp r0, #0
	addeq sp, sp, #0x3c
	moveq r0, #6
	ldmeqia sp!, {r4, r5, pc}
	ldrh r0, [r4, #4]
	cmp r0, #0x400
	addhi sp, sp, #0x3c
	movhi r0, #6
	ldmhiia sp!, {r4, r5, pc}
	ldrh r0, [r4, #0x12]
	cmp r0, #0x20
	addhi sp, sp, #0x3c
	movhi r0, #6
	ldmhiia sp!, {r4, r5, pc}
	ldrh r0, [r4, #0x10]
	cmp r0, #0
	cmpne r0, #1
	cmpne r0, #2
	cmpne r0, #3
	addne sp, sp, #0x3c
	movne r0, #6
	ldmneia sp!, {r4, r5, pc}
	add r0, r0, #0xfe
	add r0, r0, #0xff00
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	bhi _020DF884
	ldrh r0, [r4, #0x34]
	cmp r0, #0x20
	addhi sp, sp, #0x3c
	movhi r0, #6
	ldmhiia sp!, {r4, r5, pc}
_020DF884:
	mov r1, r5
	mov r0, #0x26
	bl sub_020DE4C8
	mov r0, #0x26
	strh r0, [sp]
	ldrh r2, [r4, #6]
	add r1, sp, #0xc
	add r0, r4, #0xa
	strh r2, [sp, #2]
	ldr r3, [r4]
	mov r2, #6
	str r3, [sp, #4]
	ldrh r3, [r4, #4]
	strh r3, [sp, #8]
	ldrh r3, [r4, #8]
	strh r3, [sp, #0xa]
	bl MIi_CpuCopy8
	ldrh r2, [r4, #0x10]
	add r1, sp, #0x16
	add r0, r4, #0x14
	strh r2, [sp, #0x12]
	ldrh r3, [r4, #0x34]
	mov r2, #0x20
	strh r3, [sp, #0x36]
	ldrh r3, [r4, #0x12]
	strh r3, [sp, #0x14]
	bl MIi_CpuCopy8
	add r0, sp, #0
	mov r1, #0x3c
	bl sub_020DE5E4
	cmp r0, #0
	moveq r0, #2
	add sp, sp, #0x3c
	ldmia sp!, {r4, r5, pc}
	arm_func_end sub_020DF7BC

	arm_func_start sub_020DF90C
sub_020DF90C: ; 0x020DF90C
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #1
	mov r1, #5
	bl sub_020DE6C8
	cmp r0, #0
	ldmneia sp!, {r4, pc}
	mov r1, r4
	mov r0, #0xb
	bl sub_020DE4C8
	mov r0, #0xb
	mov r1, #0
	bl sub_020DE538
	cmp r0, #0
	moveq r0, #2
	ldmia sp!, {r4, pc}
	arm_func_end sub_020DF90C

	arm_func_start sub_020DF94C
sub_020DF94C: ; 0x020DF94C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x28
	mov r7, r0
	mov r6, r1
	mov r0, #1
	mov r1, #2
	mov r5, r2
	mov r4, r3
	bl sub_020DE6C8
	cmp r0, #0
	addne sp, sp, #0x28
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r6, #0
	addeq sp, sp, #0x28
	moveq r0, #6
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldrh r1, [r6]
	mov r0, r6
	mov r1, r1, lsl #1
	bl DC_StoreRange
	bl sub_020DE654
	add r1, r0, #0x100
	mov r2, #0
	strh r2, [r1, #0x50]
	str r2, [r0, #0x14c]
	mov r1, r7
	mov r0, #0xc
	bl sub_020DE4C8
	mov r0, #0xc
	strh r0, [sp]
	str r6, [sp, #4]
	cmp r5, #0
	mov r2, #0x18
	beq _020DF9E4
	add r1, sp, #8
	mov r0, r5
	bl MIi_CpuCopy8
	b _020DF9F0
_020DF9E4:
	add r0, sp, #8
	mov r1, #0
	bl MI_CpuFill8
_020DF9F0:
	ldrh r2, [sp, #0x40]
	add r0, sp, #0
	mov r1, #0x28
	str r4, [sp, #0x20]
	strh r2, [sp, #0x26]
	bl sub_020DE5E4
	cmp r0, #0
	moveq r0, #2
	add sp, sp, #0x28
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020DF94C

	arm_func_start sub_020DFA18
sub_020DFA18: ; 0x020DFA18
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	mov r5, r0
	mov r4, r1
	bl sub_020DE654
	mov r1, #0xa
	mov r6, r0
	str r1, [sp]
	mov ip, #0xb
	mov r0, #5
	mov r1, #7
	mov r2, #9
	mov r3, #8
	str ip, [sp, #4]
	bl sub_020DE6C8
	cmp r0, #0
	addne sp, sp, #8
	ldmneia sp!, {r4, r5, r6, pc}
	ldr r1, [r6, #4]
	ldrh r0, [r1]
	cmp r0, #7
	cmpne r0, #9
	bne _020DFAC4
	cmp r4, #1
	blo _020DFA84
	cmp r4, #0xf
	bls _020DFA90
_020DFA84:
	add sp, sp, #8
	mov r0, #6
	ldmia sp!, {r4, r5, r6, pc}
_020DFA90:
	add r0, r1, #0x82
	add r0, r0, #0x100
	mov r1, #2
	bl DC_InvalidateRange
	ldr r0, [r6, #4]
	mov r1, #1
	add r0, r0, #0x100
	ldrh r0, [r0, #0x82]
	tst r0, r1, lsl r4
	bne _020DFAD4
	add sp, sp, #8
	mov r0, #7
	ldmia sp!, {r4, r5, r6, pc}
_020DFAC4:
	cmp r4, #0
	addne sp, sp, #8
	movne r0, #6
	ldmneia sp!, {r4, r5, r6, pc}
_020DFAD4:
	mov r1, r5
	mov r0, #0xd
	bl sub_020DE4C8
	mov r1, #1
	mov r2, r1, lsl r4
	mov r0, #0xd
	bl sub_020DE538
	cmp r0, #0
	moveq r0, #2
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020DFA18

	arm_func_start sub_020DFB00
sub_020DFB00: ; 0x020DFB00
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x40
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	bl sub_020DE654
	ldr r4, [r0, #4]
	mov r0, #2
	mov r1, #7
	mov r2, #8
	bl sub_020DE6C8
	cmp r0, #0
	addne sp, sp, #0x40
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	add r0, r4, #0x188
	mov r1, #2
	bl DC_InvalidateRange
	add r0, r4, #0xc6
	mov r1, #2
	bl DC_InvalidateRange
	add r0, r4, #0x100
	ldrh r0, [r0, #0x88]
	cmp r0, #0
	ldrneh r0, [r4, #0xc6]
	cmpne r0, #1
	addne sp, sp, #0x40
	movne r0, #3
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	add r0, r4, #0xc
	mov r1, #4
	bl DC_InvalidateRange
	ldr r0, [r4, #0xc]
	cmp r0, #1
	addeq sp, sp, #0x40
	moveq r0, #3
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	tst r6, #0x3f
	addne sp, sp, #0x40
	movne r0, #6
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldrh sb, [sp, #0x60]
	tst sb, #0x1f
	addne sp, sp, #0x40
	movne r0, #6
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	add r0, r4, #0x9c
	mov r1, #2
	bl DC_InvalidateRange
	ldrh r0, [r4, #0x9c]
	cmp r0, #0
	bne _020DFBF8
	bl sub_020DED7C
	cmp r6, r0
	addlt sp, sp, #0x40
	movlt r0, #6
	ldmltia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	bl sub_020DED10
	cmp sb, r0
	addlt sp, sp, #0x40
	movlt r0, #6
	ldmltia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_020DFBF8:
	mov r1, r8
	mov r0, #0xe
	bl sub_020DE4C8
	add r1, sp, #0
	mov r0, #0
	mov r2, #0x40
	bl MIi_CpuClear32
	mov r4, r6, lsr #1
	ldrh r3, [sp, #0x60]
	mov r6, #0xe
	add r1, sp, #0x14
	mov r0, #0
	mov r2, #0x1c
	strh r6, [sp]
	str r7, [sp, #4]
	str r4, [sp, #8]
	str r5, [sp, #0xc]
	str r3, [sp, #0x10]
	bl MIi_CpuClear32
	ldr r0, [sp, #0x64]
	add r1, sp, #0x30
	mov r2, #0x10
	bl MIi_CpuCopy32
	add r0, sp, #0
	mov r1, #0x40
	bl sub_020DE5E4
	cmp r0, #0
	moveq r0, #2
	add sp, sp, #0x40
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end sub_020DFB00

	arm_func_start sub_020DFC70
sub_020DFC70: ; 0x020DFC70
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x18
	mov r7, r1
	mov r8, r0
	mov r6, r2
	add r1, sp, #8
	mov r0, #0
	mov r2, #0x10
	mov r5, r3
	ldr r4, [sp, #0x34]
	bl MIi_CpuClear32
	ldr r1, [sp, #0x48]
	ldrh ip, [sp, #0x38]
	ldr r0, [sp, #0x44]
	ldr lr, _020DFD10 ; =0x00001E03
	ldr r3, [sp, #0x3c]
	ldr r2, [sp, #0x40]
	strb r1, [sp, #0x16]
	cmp r0, #0
	cmpne r4, #0
	strb r3, [sp, #0x14]
	strb r2, [sp, #0x15]
	ldrh r1, [sp, #0x30]
	str lr, [sp, #8]
	orrne r0, lr, #4
	strne r0, [sp, #8]
	strh ip, [sp, #0x12]
	strh r4, [sp, #0xc]
	strh r4, [sp, #0xe]
	strneh r4, [sp, #0x10]
	str r1, [sp]
	add r4, sp, #8
	mov r0, r8
	mov r1, r7
	mov r2, r6
	mov r3, r5
	str r4, [sp, #4]
	bl sub_020DFB00
	add sp, sp, #0x18
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020DFD10: .word 0x00001E03
	arm_func_end sub_020DFC70

	arm_func_start sub_020DFD14
sub_020DFD14: ; 0x020DFD14
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x18
	mov r6, r1
	mov r7, r0
	mov r5, r2
	add r1, sp, #8
	mov r0, #0
	mov r2, #0x10
	mov r4, r3
	bl MIi_CpuClear32
	ldrh ip, [sp, #0x34]
	mov r0, #3
	str r0, [sp, #8]
	ldrh lr, [sp, #0x30]
	strh ip, [sp, #0xc]
	strh ip, [sp, #0xe]
	mov r0, r7
	mov r1, r6
	mov r2, r5
	mov r3, r4
	add ip, sp, #8
	str lr, [sp]
	str ip, [sp, #4]
	bl sub_020DFB00
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020DFD14

	arm_func_start sub_020DFD7C
sub_020DFD7C: ; 0x020DFD7C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x14
	mov sb, r0
	mov r8, r1
	mov r7, r2
	mov r6, r3
	mov r4, #1
	bl sub_020DE654
	ldr r5, [r0, #4]
	mov r0, #2
	mov r1, #9
	mov r2, #0xa
	bl sub_020DE6C8
	cmp r0, #0
	addne sp, sp, #0x14
	ldmneia sp!, {r4, r5, r6, r7, r8, sb, pc}
	add r0, r5, #0x188
	mov r1, #2
	bl DC_InvalidateRange
	add r0, r5, #0x100
	ldrh r0, [r0, #0x88]
	cmp r0, #0
	bne _020DFDFC
	add r0, r5, #0x82
	add r0, r0, #0x100
	mov r1, #2
	bl DC_InvalidateRange
	add r2, r5, #0x100
	add r0, r5, #0x86
	mov r1, #2
	ldrh r4, [r2, #0x82]
	bl DC_InvalidateRange
_020DFDFC:
	cmp r7, #0
	addeq sp, sp, #0x14
	moveq r0, #6
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, pc}
	cmp r4, #0
	addeq sp, sp, #0x14
	moveq r0, #7
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, pc}
	add r0, r5, #0x7c
	mov r1, #2
	bl DC_InvalidateRange
	ldr r0, [r5, #0x7c]
	cmp r7, r0
	addeq sp, sp, #0x14
	moveq r0, #6
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, pc}
	cmp r6, #0x200
	addhi sp, sp, #0x14
	movhi r0, #6
	ldmhiia sp!, {r4, r5, r6, r7, r8, sb, pc}
	cmp r6, #0
	addeq sp, sp, #0x14
	moveq r0, #6
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, pc}
	mov r0, r7
	mov r1, r6
	bl DC_StoreRange
	ldrh r2, [sp, #0x30]
	ldrh r1, [sp, #0x34]
	ldrh r0, [sp, #0x38]
	str r2, [sp]
	str r1, [sp, #4]
	str r0, [sp, #8]
	str sb, [sp, #0xc]
	mov r2, r7
	mov r3, r6
	mov r0, #0xf
	mov r1, #7
	str r8, [sp, #0x10]
	bl sub_020DE538
	cmp r0, #0
	moveq r0, #2
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	arm_func_end sub_020DFD7C

	arm_func_start sub_020DFEAC
sub_020DFEAC: ; 0x020DFEAC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl sub_020DE654
	mov r4, r0
	mov r0, #2
	mov r1, #9
	mov r2, #0xa
	bl sub_020DE6C8
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	ldr r0, [r4, #4]
	mov r1, #4
	add r0, r0, #0xc
	bl DC_InvalidateRange
	ldr r0, [r4, #4]
	ldr r0, [r0, #0xc]
	cmp r0, #0
	moveq r0, #3
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r1, r5
	mov r0, #0x10
	bl sub_020DE4C8
	mov r0, #0x10
	mov r1, #0
	bl sub_020DE538
	cmp r0, #0
	moveq r0, #2
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020DFEAC

	arm_func_start sub_020DFF1C
sub_020DFF1C: ; 0x020DFF1C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	bl sub_020DE654
	mov r4, r0
	mov r0, #1
	mov r1, #8
	bl sub_020DE6C8
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, [r4, #4]
	mov r1, #4
	add r0, r0, #0x10
	bl DC_InvalidateRange
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x10]
	cmp r0, #1
	moveq r0, #3
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r5, #0x10
	movlo r0, #6
	ldmloia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r6, #0
	moveq r0, #6
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r6
	mov r1, r5
	bl DC_StoreRange
	mov r1, r7
	mov r0, #0x11
	bl sub_020DE4C8
	mov r2, r6
	mov r3, r5
	mov r0, #0x11
	mov r1, #2
	bl sub_020DE538
	cmp r0, #0
	moveq r0, #2
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020DFF1C

	arm_func_start sub_020DFFBC
sub_020DFFBC: ; 0x020DFFBC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x10
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl sub_020DE654
	mov r8, r0
	mov r0, #1
	mov r1, #0xb
	bl sub_020DE6C8
	cmp r0, #0
	addne sp, sp, #0x10
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r0, [r8, #4]
	mov r1, #4
	add r0, r0, #0x10
	bl DC_InvalidateRange
	ldr r0, [r8, #4]
	ldr r0, [r0, #0x10]
	cmp r0, #0
	addeq sp, sp, #0x10
	moveq r0, #3
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r0, _020E0084 ; =0x000005E4
	cmp r4, r0
	addhi sp, sp, #0x10
	movhi r0, #6
	ldmhiia sp!, {r4, r5, r6, r7, r8, pc}
	mov r0, r5
	mov r1, r4
	bl DC_StoreRange
	mov r1, r7
	mov r0, #0x12
	bl sub_020DE4C8
	add r1, sp, #8
	mov r0, r6
	mov r2, #6
	bl MIi_CpuCopy8
	str r5, [sp]
	str r4, [sp, #4]
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	mov r0, #0x12
	mov r1, #4
	bl sub_020DE538
	cmp r0, #0
	moveq r0, #2
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020E0084: .word 0x000005E4
	arm_func_end sub_020DFFBC

	arm_func_start sub_020E0088
sub_020E0088: ; 0x020E0088
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl sub_020DE654
	mov r4, r0
	mov r0, #1
	mov r1, #0xb
	bl sub_020DE6C8
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	ldr r0, [r4, #4]
	mov r1, #4
	add r0, r0, #0x10
	bl DC_InvalidateRange
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x10]
	cmp r0, #0
	moveq r0, #3
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r1, r5
	mov r0, #0x13
	bl sub_020DE4C8
	mov r0, #0x13
	mov r1, #0
	bl sub_020DE538
	cmp r0, #0
	moveq r0, #2
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020E0088

	arm_func_start sub_020E00F4
sub_020E00F4: ; 0x020E00F4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	mov sl, r0
	mov r7, r1
	mov r6, r2
	mov r0, #2
	mov r1, #9
	mov r2, #0xa
	mov r5, r3
	mov r8, #1
	bl sub_020DE6C8
	cmp r0, #0
	addne sp, sp, #0xc
	ldmneia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp sl, #0
	addeq sp, sp, #0xc
	moveq r0, #6
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp r7, #0x10
	addhs sp, sp, #0xc
	movhs r0, #6
	ldmhsia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp r6, #0
	addeq sp, sp, #0xc
	moveq r0, #6
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	bl sub_020DEB48
	movs r4, r0
	bne _020E0170
	bl sub_020DEB78
	mov r8, r0
_020E0170:
	mov r1, sl
	mov r0, #0
	mov r2, #0x820
	bl MIi_CpuClearFast
	add r0, sl, #0x800
	mov r2, #0
	strh r2, [r0, #8]
	strh r2, [r0, #0xa]
	strh r2, [r0, #0xc]
	strh r5, [r0, #0x10]
	strh r7, [r0, #0x16]
	strh r2, [r0, #0xe]
	mov r0, #1
	ldr r1, [sp, #0x30]
	orr r0, r6, r0, lsl r4
	cmp r1, #0
	mov r0, r0, lsl #0x10
	movne r2, #1
	add r1, sl, #0x800
	strh r2, [r1, #0x18]
	mov r0, r0, lsr #0x10
	strh r0, [r1, #0xe]
	bl sub_020E3714
	add r3, sl, #0x800
	mul r1, r5, r0
	strh r0, [r3, #0x12]
	strh r1, [r3, #0x14]
	ldrh r0, [r3, #0x14]
	cmp r0, #0x1fc
	bls _020E01FC
	mov r0, #0
	strh r0, [r3, #0xe]
	add sp, sp, #0xc
	mov r0, #6
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020E01FC:
	add r0, r0, #4
	strh r0, [r3, #0x14]
	mov r0, #1
	strh r0, [r3, #0x1c]
	cmp r4, #0
	bne _020E0314
	orr r4, r8, #1
	mov r2, #0
_020E021C:
	ldrh r1, [r3, #0xe]
	mov r0, r2, lsl #9
	add r2, r2, #1
	and r1, r1, r4
	strh r1, [sl, r0]
	cmp r2, #4
	blt _020E021C
	ldr r1, _020E0338 ; =sub_020E07B0
	mov r0, r7
	mov r2, sl
	bl sub_020DEBEC
	mov r7, sl
	mov sb, #0
	add r4, sl, #0x800
	mov r6, #1
	ldr fp, _020E033C ; =sub_020E06D8
	ldr r5, _020E0340 ; =0x0000FFFF
	b _020E02F8
_020E0264:
	ldrh r2, [r4, #8]
	mov r0, fp
	mov r1, sl
	add r2, r2, #1
	and r2, r2, #3
	strh r2, [r4, #8]
	ldrh r3, [r4, #0xe]
	mov r2, r7
	and r3, r3, r8
	mov r3, r3, lsl #0x10
	mov r3, r3, lsr #0x10
	str r3, [sp]
	ldrh r3, [r4, #0x16]
	stmib sp, {r3, r6}
	ldrh r3, [r4, #0x14]
	bl sub_020DFD7C
	cmp r0, #7
	bne _020E02CC
	add r0, sl, sb, lsl #1
	add r0, r0, #0x800
	strh r5, [r0]
	ldrh r0, [r4, #0xa]
	add r0, r0, #1
	and r0, r0, #3
	strh r0, [r4, #0xa]
	b _020E02F0
_020E02CC:
	cmp r0, #0
	cmpne r0, #2
	beq _020E02F0
	add r0, sl, #0x800
	mov r1, #5
	strh r1, [r0, #0x1c]
	add sp, sp, #0xc
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020E02F0:
	add r7, r7, #0x200
	add sb, sb, #1
_020E02F8:
	ldrh r0, [r4, #0x18]
	cmp r0, #1
	movne r0, #1
	moveq r0, #2
	cmp sb, r0
	blt _020E0264
	b _020E032C
_020E0314:
	ldr r1, _020E0344 ; =sub_020E08DC
	mov r4, #3
	mov r0, r7
	mov r2, sl
	strh r4, [r3, #0xa]
	bl sub_020DEBEC
_020E032C:
	mov r0, #0
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020E0338: .word sub_020E07B0
_020E033C: .word sub_020E06D8
_020E0340: .word 0x0000FFFF
_020E0344: .word sub_020E08DC
	arm_func_end sub_020E00F4

	arm_func_start sub_020E0348
sub_020E0348: ; 0x020E0348
	stmdb sp!, {r4, lr}
	movs r4, r0
	moveq r0, #6
	ldmeqia sp!, {r4, pc}
	add r0, r4, #0x800
	ldrh r1, [r0, #0xe]
	cmp r1, #0
	moveq r0, #3
	ldmeqia sp!, {r4, pc}
	ldrh r0, [r0, #0x16]
	mov r1, #0
	mov r2, r1
	bl sub_020DEBEC
	add r1, r4, #0x800
	mov r0, #0
	strh r0, [r1, #0xe]
	strh r0, [r1, #0x1c]
	ldmia sp!, {r4, pc}
	arm_func_end sub_020E0348

	arm_func_start sub_020E0390
sub_020E0390: ; 0x020E0390
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	mov sl, r0
	mov sb, r1
	mov r8, r2
	mov r0, #2
	mov r1, #9
	mov r2, #0xa
	bl sub_020DE6C8
	cmp r0, #0
	addne sp, sp, #0xc
	ldmneia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp sl, #0
	addeq sp, sp, #0xc
	moveq r0, #6
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp sb, #0
	addeq sp, sp, #0xc
	moveq r0, #6
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp r8, #0
	addeq sp, sp, #0xc
	moveq r0, #6
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	bl sub_020DEB48
	movs r5, r0
	bne _020E0404
	bl sub_020DEB78
	mov r4, r0
_020E0404:
	add r0, sl, #0x800
	ldrh r0, [r0, #0x1c]
	cmp r0, #5
	addeq sp, sp, #0xc
	moveq r0, #1
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp r0, #1
	cmpne r0, #4
	addne sp, sp, #0xc
	movne r0, #3
	ldmneia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp r5, #0
	mov r7, #5
	bne _020E05C8
	mov r5, #0
	mov fp, r5
	cmp r0, #4
	bne _020E04EC
	add ip, sl, #0x800
	mov r2, #1
	strh r2, [ip, #0x1c]
	ldrh r3, [ip, #0xe]
	ldrh r1, [ip, #8]
	ldr r0, _020E06D0 ; =sub_020E06D8
	and r3, r3, r4
	mov r3, r3, lsl #0x10
	mov r3, r3, lsr #0x10
	str r3, [sp]
	ldrh r3, [ip, #0x16]
	add r1, r1, #3
	and r6, r1, #3
	str r3, [sp, #4]
	str r2, [sp, #8]
	ldrh r3, [ip, #0x14]
	mov r1, sl
	add r2, sl, r6, lsl #9
	bl sub_020DFD7C
	cmp r0, #7
	bne _020E04C8
	add r0, sl, r6, lsl #1
	ldr r1, _020E06D4 ; =0x0000FFFF
	add r0, r0, #0x800
	strh r1, [r0]
	add r0, sl, #0x800
	ldrh r1, [r0, #0xa]
	add r1, r1, #1
	and r1, r1, #3
	strh r1, [r0, #0xa]
	b _020E04EC
_020E04C8:
	cmp r0, #0
	cmpne r0, #2
	beq _020E04EC
	add r0, sl, #0x800
	mov r1, r7
	strh r1, [r0, #0x1c]
	add sp, sp, #0xc
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020E04EC:
	add r0, sl, #0x800
	ldrh r2, [r0, #0xc]
	ldrh r1, [r0, #0xa]
	cmp r2, r1
	beq _020E0584
	mov r5, r2, lsl #9
	ldrh r3, [sl, r5]
	mov r1, r8
	mov r2, #0x200
	orr r3, r3, #1
	strh r3, [sl, r5]
	ldrh r0, [r0, #0xc]
	add r0, sl, r0, lsl #9
	bl MIi_CpuCopy16
	add r1, sl, #0x800
	ldrh r0, [r1, #0xc]
	mov r5, #1
	mov r7, #0
	add r0, sl, r0, lsl #1
	add r0, r0, #0x800
	ldrh r0, [r0]
	strh r0, [r1, #0x1a]
	ldrh r0, [r1, #0xc]
	add r0, r0, #1
	and r0, r0, #3
	strh r0, [r1, #0xc]
	ldrh r0, [r1, #0x18]
	cmp r0, #0
	bne _020E0580
	cmp r4, #0
	beq _020E0580
	ldrh r0, [r1, #8]
	mov r0, r0, lsl #9
	ldrh r0, [sl, r0]
	cmp r0, #1
	moveq fp, r5
	beq _020E0584
_020E0580:
	mov fp, #0
_020E0584:
	mov r0, sl
	mov r1, #0
	bl sub_020E0A9C
	cmp r5, #0
	beq _020E06C4
	mov r0, sl
	mov r2, sb
	mov r1, #0
	bl sub_020E09D0
	add r0, sl, #0x800
	ldrh r0, [r0, #0x18]
	cmp r0, #0
	bne _020E06C4
	mov r0, sl
	mov r1, fp
	bl sub_020E0A9C
	b _020E06C4
_020E05C8:
	cmp r0, #4
	mov r0, #0
	add r1, sl, #0x800
	moveq r0, #1
	streqh r0, [r1, #0x1c]
	beq _020E0648
	ldrh r2, [r1, #0xc]
	ldrh r1, [r1, #8]
	cmp r2, r1
	beq _020E0648
	mov r2, r2, lsl #9
	ldrh r1, [sl, r2]
	tst r1, #1
	orreq r1, r1, #1
	streqh r1, [sl, r2]
	beq _020E0648
	mov r1, r8
	add r0, sl, r2
	mov r2, #0x200
	bl MIi_CpuCopy16
	add r2, sl, #0x800
	ldrh r1, [r2, #0xc]
	mov r0, #1
	mov r7, #0
	add r1, sl, r1, lsl #1
	add r1, r1, #0x800
	ldrh r1, [r1]
	strh r1, [r2, #0x1a]
	ldrh r1, [r2, #0xc]
	add r1, r1, #1
	and r1, r1, #3
	strh r1, [r2, #0xc]
_020E0648:
	cmp r0, #0
	beq _020E06C4
	add r0, sl, #0x800
	ldrh r1, [r0, #0xa]
	ldrh r2, [r0, #0x10]
	mov r0, sb
	add r6, sl, r1, lsl #9
	add r1, r6, #0x20
	bl MIi_CpuCopy16
	add r3, sl, #0x800
	ldrh r1, [r3, #0xe]
	mov r4, #1
	ldr r0, _020E06D0 ; =sub_020E06D8
	str r1, [sp]
	ldrh r5, [r3, #0x16]
	mov r1, sl
	add r2, r6, #0x20
	str r5, [sp, #4]
	str r4, [sp, #8]
	ldrh r3, [r3, #0x10]
	bl sub_020DFD7C
	add r1, sl, #0x800
	ldrh r2, [r1, #0xa]
	cmp r0, #2
	cmpne r0, #0
	add r2, r2, #1
	and r2, r2, #3
	strh r2, [r1, #0xa]
	movne r0, #5
	strneh r0, [r1, #0x1c]
	movne r7, r4
_020E06C4:
	mov r0, r7
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020E06D0: .word sub_020E06D8
_020E06D4: .word 0x0000FFFF
	arm_func_end sub_020E0390

	arm_func_start sub_020E06D8
sub_020E06D8: ; 0x020E06D8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl sub_020DE654
	ldrh r2, [r5, #0xa]
	ldr r1, _020E07A8 ; =sub_020E07B0
	add r0, r0, r2, lsl #2
	ldr r2, [r0, #0xcc]
	ldr r4, [r0, #0x10c]
	cmp r2, r1
	ldrne r0, _020E07AC ; =sub_020E08DC
	cmpne r2, r0
	ldmneia sp!, {r3, r4, r5, pc}
	cmp r4, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, [r5, #0x20]
	cmp r4, r0
	ldmneia sp!, {r3, r4, r5, pc}
	bl sub_020DEB48
	ldrh r1, [r5, #2]
	cmp r1, #0
	bne _020E0764
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	add r1, r4, #0x800
	ldrh r0, [r1, #0xa]
	ldrh r2, [r5, #0x1a]
	add r0, r4, r0, lsl #1
	mov r2, r2, asr #1
	add r0, r0, #0x800
	strh r2, [r0]
	ldrh r0, [r1, #0xa]
	add r0, r0, #1
	and r0, r0, #3
	strh r0, [r1, #0xa]
	ldmia sp!, {r3, r4, r5, pc}
_020E0764:
	cmp r1, #0xa
	bne _020E0798
	cmp r0, #0
	beq _020E0788
	add r0, r4, #0x800
	ldrh r1, [r0, #0xa]
	add r1, r1, #3
	and r1, r1, #3
	strh r1, [r0, #0xa]
_020E0788:
	add r0, r4, #0x800
	mov r1, #4
	strh r1, [r0, #0x1c]
	ldmia sp!, {r3, r4, r5, pc}
_020E0798:
	add r0, r4, #0x800
	mov r1, #5
	strh r1, [r0, #0x1c]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020E07A8: .word sub_020E07B0
_020E07AC: .word sub_020E08DC
	arm_func_end sub_020E06D8

	arm_func_start sub_020E07B0
sub_020E07B0: ; 0x020E07B0
	stmdb sp!, {r4, r5, r6, lr}
	ldr r4, [r0, #0x1c]
	cmp r4, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldrh r1, [r0, #2]
	cmp r1, #0
	bne _020E08CC
	ldrh r1, [r0, #4]
	cmp r1, #0x15
	bgt _020E07FC
	bge _020E081C
	cmp r1, #9
	ldmgtia sp!, {r4, r5, r6, pc}
	cmp r1, #7
	ldmltia sp!, {r4, r5, r6, pc}
	beq _020E083C
	cmp r1, #9
	beq _020E084C
	ldmia sp!, {r4, r5, r6, pc}
_020E07FC:
	cmp r1, #0x1a
	ldmgtia sp!, {r4, r5, r6, pc}
	cmp r1, #0x19
	ldmltia sp!, {r4, r5, r6, pc}
	ldmeqia sp!, {r4, r5, r6, pc}
	cmp r1, #0x1a
	beq _020E084C
	ldmia sp!, {r4, r5, r6, pc}
_020E081C:
	ldrh r1, [r0, #0x12]
	ldr r2, [r0, #0xc]
	mov r0, r4
	bl sub_020E09D0
	mov r0, r4
	mov r1, #0
	bl sub_020E0A9C
	ldmia sp!, {r4, r5, r6, pc}
_020E083C:
	mov r0, r4
	mov r1, #0
	bl sub_020E0A9C
	ldmia sp!, {r4, r5, r6, pc}
_020E084C:
	ldrh r5, [r0, #0x12]
	mov r6, #1
	bl OS_DisableInterrupts
	add r1, r4, #0x800
	ldrh lr, [r1, #8]
	mvn ip, r6, lsl r5
	mov r3, lr, lsl #9
	ldrh r2, [r4, r3]
	and r2, r2, ip
	strh r2, [r4, r3]
	ldrh r1, [r1, #0x18]
	cmp r1, #1
	bne _020E089C
	add r1, lr, #1
	and r1, r1, #3
	mov r1, r1, lsl #0x10
	mov r2, r1, lsr #7
	ldrh r1, [r4, r2]
	and r1, r1, ip
	strh r1, [r4, r2]
_020E089C:
	bl OS_RestoreInterrupts
	mov r0, r4
	mov r1, #0
	bl sub_020E0A9C
	add r0, r4, #0x800
	ldrh r0, [r0, #0x18]
	cmp r0, #1
	ldmneia sp!, {r4, r5, r6, pc}
	mov r0, r4
	mov r1, #0
	bl sub_020E0A9C
	ldmia sp!, {r4, r5, r6, pc}
_020E08CC:
	add r0, r4, #0x800
	mov r1, #5
	strh r1, [r0, #0x1c]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020E07B0

	arm_func_start sub_020E08DC
sub_020E08DC: ; 0x020E08DC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	ldr r4, [r8, #0x1c]
	cmp r4, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldrh r0, [r8, #2]
	cmp r0, #0
	bne _020E09C0
	ldrh r0, [r8, #4]
	cmp r0, #0x15
	bgt _020E0924
	bge _020E093C
	cmp r0, #9
	ldmgtia sp!, {r4, r5, r6, r7, r8, pc}
	cmp r0, #7
	ldmltia sp!, {r4, r5, r6, r7, r8, pc}
	cmpne r0, #9
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020E0924:
	cmp r0, #0x1a
	ldmgtia sp!, {r4, r5, r6, r7, r8, pc}
	cmp r0, #0x19
	ldmltia sp!, {r4, r5, r6, r7, r8, pc}
	cmpne r0, #0x1a
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020E093C:
	ldr r7, [r8, #0xc]
	ldrh r5, [r8, #0x10]
	ldrh r6, [r7]
	bl sub_020DEB48
	add r1, r4, #0x800
	ldrh r1, [r1, #0x14]
	cmp r5, r1
	beq _020E0964
	cmp r5, #0x200
	movhi r5, #0x200
_020E0964:
	cmp r5, #4
	ldmloia sp!, {r4, r5, r6, r7, r8, pc}
	mov r1, #1
	tst r6, r1, lsl r0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	add r0, r4, #0x800
	ldrh r1, [r0, #8]
	mov r0, r7
	mov r2, r5
	add r1, r4, r1, lsl #9
	bl MIi_CpuCopy16
	add r1, r4, #0x800
	ldrh r0, [r1, #8]
	ldrh r2, [r8, #0x1a]
	add r0, r4, r0, lsl #1
	mov r2, r2, asr #1
	add r0, r0, #0x800
	strh r2, [r0]
	ldrh r0, [r1, #8]
	add r0, r0, #1
	and r0, r0, #3
	strh r0, [r1, #8]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020E09C0:
	add r0, r4, #0x800
	mov r1, #5
	strh r1, [r0, #0x1c]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_020E08DC

	arm_func_start sub_020E09D0
sub_020E09D0: ; 0x020E09D0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r0
	mov r3, r1
	mov r1, #1
	mov r4, r1, lsl r3
	add r0, r6, #0x800
	ldrh r1, [r0, #0xe]
	mov r7, r4, lsl #0x10
	mov r5, r2
	tst r1, r7, lsr #16
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldrh r4, [r0, #8]
	mov r2, r4, lsl #9
	ldrh r2, [r6, r2]
	tst r2, r7, lsr #16
	bne _020E0A34
	ldrh r0, [r0, #0x18]
	cmp r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	add r0, r4, #1
	and r4, r0, #3
	mov r0, r4, lsl #9
	ldrh r0, [r6, r0]
	tst r0, r7, lsr #16
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
_020E0A34:
	add r2, r6, r4, lsl #9
	mov r0, r6
	add r2, r2, #4
	bl sub_020E0C44
	mov r1, r0
	add r0, r6, #0x800
	cmp r5, #0
	ldrh r2, [r0, #0x10]
	beq _020E0A64
	mov r0, r5
	bl MIi_CpuCopy16
	b _020E0A6C
_020E0A64:
	mov r0, #0
	bl MIi_CpuClear16
_020E0A6C:
	bl OS_DisableInterrupts
	mov r4, r4, lsl #9
	ldrh r3, [r6, r4]
	mvn r1, r7, lsr #16
	add r2, r6, #2
	and r1, r3, r1
	strh r1, [r6, r4]
	ldrh r1, [r2, r4]
	orr r1, r1, r7, lsr #16
	strh r1, [r2, r4]
	bl OS_RestoreInterrupts
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020E09D0

	arm_func_start sub_020E0A9C
sub_020E0A9C: ; 0x020E0A9C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0xc
	mov sl, r0
	mov sb, r1
	bl OS_DisableInterrupts
	add r1, sl, #0x800
	ldrh r1, [r1, #8]
	mov r4, r0
	mov r1, r1, lsl #9
	ldrh r1, [sl, r1]
	cmp r1, #0
	bne _020E0BDC
	bl sub_020DEB78
	add r1, sl, #0x800
	ldrh r6, [r1, #8]
	ldrh r1, [r1, #0x18]
	mov r7, r0
	add r0, r6, #1
	and r5, r0, #3
	cmp r1, #1
	addeq r0, r5, #1
	andeq r8, r0, #3
	movne r8, r5
	add r1, sl, r8, lsl #9
	mov r0, #0
	mov r2, #0x200
	bl MIi_CpuClear16
	add r0, sl, #0x800
	ldrh r3, [r0, #0xe]
	orr r2, r7, #1
	mov r1, r8, lsl #9
	and r2, r3, r2
	strh r2, [sl, r1]
	strh r5, [r0, #8]
	ldrh r0, [r0, #0xe]
	mov r1, r6, lsl #9
	cmp sb, #1
	strh r0, [sl, r1]
	ldreqh r0, [sl, r1]
	biceq r0, r0, #1
	streqh r0, [sl, r1]
	mov r0, r4
	bl OS_RestoreInterrupts
	add r3, sl, #0x800
	ldrh r1, [r3, #0xe]
	mov r4, #1
	ldr r0, _020E0BE8 ; =sub_020E06D8
	and r1, r1, r7
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	str r1, [sp]
	ldrh r5, [r3, #0x16]
	mov r1, sl
	add r2, sl, r6, lsl #9
	str r5, [sp, #4]
	str r4, [sp, #8]
	ldrh r3, [r3, #0x14]
	bl sub_020DFD7C
	cmp r0, #7
	bne _020E0BB8
	add r0, sl, r6, lsl #1
	ldr r1, _020E0BEC ; =0x0000FFFF
	add r0, r0, #0x800
	strh r1, [r0]
	add r0, sl, #0x800
	ldrh r1, [r0, #0xa]
	add sp, sp, #0xc
	add r1, r1, #1
	and r1, r1, #3
	strh r1, [r0, #0xa]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
_020E0BB8:
	cmp r0, #0
	cmpne r0, #2
	addeq sp, sp, #0xc
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	add r0, sl, #0x800
	mov r1, #5
	strh r1, [r0, #0x1c]
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
_020E0BDC:
	bl OS_RestoreInterrupts
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_020E0BE8: .word sub_020E06D8
_020E0BEC: .word 0x0000FFFF
	arm_func_end sub_020E0A9C

	arm_func_start sub_020E0BF0
sub_020E0BF0: ; 0x020E0BF0
	stmdb sp!, {r3, lr}
	mov lr, r1
	mov r3, r2
	cmp r0, #0
	ldrh r1, [lr]
	ldrh ip, [lr, #2]
	mov r2, #1
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	cmp lr, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	tst r1, r2, lsl r3
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	tst ip, r2, lsl r3
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	add r2, lr, #4
	bl sub_020E0C44
	ldmia sp!, {r3, pc}
	arm_func_end sub_020E0BF0

	arm_func_start sub_020E0C44
sub_020E0C44: ; 0x020E0C44
	stmdb sp!, {r3, r4, r5, lr}
	mov ip, #1
	mov r3, ip, lsl r3
	sub r3, r3, #1
	mov r5, r0
	and r0, r1, r3
	mov r4, r2
	bl sub_020E3714
	add r1, r5, #0x800
	ldrh r1, [r1, #0x10]
	mla r0, r1, r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020E0C44

	arm_func_start sub_020E0C74
sub_020E0C74: ; 0x020E0C74
	stmdb sp!, {r3, lr}
	mov ip, #1
	rsb r2, ip, #0x10000
	mov r3, #2
	str ip, [sp]
	bl sub_020E00F4
	ldmia sp!, {r3, pc}
	arm_func_end sub_020E0C74

	arm_func_start sub_020E0C90
sub_020E0C90: ; 0x020E0C90
	ldr ip, _020E0C98 ; =sub_020E0348
	bx ip
	.align 2, 0
_020E0C98: .word sub_020E0348
	arm_func_end sub_020E0C90

	arm_func_start sub_020E0C9C
sub_020E0C9C: ; 0x020E0C9C
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl sub_020DE680
	cmp r0, #0
	ldmneia sp!, {r4, r5, r6, pc}
	cmp r5, #3
	movhi r0, #6
	ldmhiia sp!, {r4, r5, r6, pc}
	cmp r5, #0
	beq _020E0CE4
	cmp r4, #0
	moveq r0, #6
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, r4
	mov r1, #0x50
	bl DC_StoreRange
_020E0CE4:
	mov r1, r6
	mov r0, #0x14
	bl sub_020DE4C8
	mov r2, r5
	mov r3, r4
	mov r0, #0x14
	mov r1, #2
	bl sub_020DE538
	cmp r0, #0
	moveq r0, #2
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020E0C9C

	arm_func_start sub_020E0D10
sub_020E0D10: ; 0x020E0D10
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl sub_020DE680
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r6, #3
	movhi r0, #6
	ldmhiia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r6, #0
	beq _020E0D5C
	cmp r4, #0
	moveq r0, #6
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r4
	mov r1, #0x50
	bl DC_StoreRange
_020E0D5C:
	mov r1, r7
	mov r0, #0x27
	bl sub_020DE4C8
	mov r2, r6
	mov r3, r4
	mov r0, #0x27
	mov r1, #3
	str r5, [sp]
	bl sub_020DE538
	cmp r0, #0
	moveq r0, #2
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020E0D10

	arm_func_start sub_020E0D8C
sub_020E0D8C: ; 0x020E0D8C
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0xc
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r0, #2
	mov r1, #7
	mov r2, #9
	mov r4, r3
	bl sub_020DE6C8
	cmp r0, #0
	addne sp, sp, #0xc
	ldmneia sp!, {r4, r5, r6, r7, pc}
	cmp r6, #0
	addeq sp, sp, #0xc
	moveq r0, #6
	ldmeqia sp!, {r4, r5, r6, r7, pc}
	cmp r5, #0x70
	addhi sp, sp, #0xc
	movhi r0, #6
	ldmhiia sp!, {r4, r5, r6, r7, pc}
	ldr r1, _020E0E40 ; =0x021E4CC0
	mov r0, r6
	mov r2, r5
	bl MIi_CpuCopy16
	ldr r0, _020E0E40 ; =0x021E4CC0
	mov r1, r5
	bl DC_StoreRange
	mov r1, r7
	mov r0, #0x18
	bl sub_020DE4C8
	ldrh r0, [sp, #0x20]
	str r4, [sp]
	ldrb r1, [sp, #0x24]
	str r0, [sp, #4]
	ldr r2, _020E0E40 ; =0x021E4CC0
	str r1, [sp, #8]
	mov r3, r5
	mov r0, #0x18
	mov r1, #5
	bl sub_020DE538
	cmp r0, #0
	moveq r0, #2
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, pc}
	.align 2, 0
_020E0E40: .word 0x021E4CC0
	arm_func_end sub_020E0D8C

	arm_func_start sub_020E0E44
sub_020E0E44: ; 0x020E0E44
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl sub_020DE680
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	cmp r4, #0
	cmpne r4, #1
	movne r0, #6
	ldmneia sp!, {r3, r4, r5, pc}
	mov r1, r5
	mov r0, #0x19
	bl sub_020DE4C8
	mov r2, r4
	mov r0, #0x19
	mov r1, #1
	bl sub_020DE538
	cmp r0, #0
	moveq r0, #2
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020E0E44

	arm_func_start sub_020E0E94
sub_020E0E94: ; 0x020E0E94
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl sub_020DE680
	cmp r0, #0
	addne sp, sp, #8
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	mov r1, r7
	mov r0, #0x1d
	bl sub_020DE4C8
	ldrh ip, [sp, #0x20]
	mov r2, r6
	mov r3, r5
	mov r0, #0x1d
	mov r1, #4
	stmia sp, {r4, ip}
	bl sub_020DE538
	cmp r0, #0
	moveq r0, #2
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020E0E94

	arm_func_start sub_020E0EF4
sub_020E0EF4: ; 0x020E0EF4
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0xc
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl sub_020DE654
	mov r0, #1
	mov r1, #2
	bl sub_020DE6C8
	cmp r0, #0
	addne sp, sp, #0xc
	ldmneia sp!, {r4, r5, r6, r7, pc}
	mov r1, r7
	mov r0, #0x1e
	bl sub_020DE4C8
	ldrh r2, [sp, #0x20]
	mov r3, #0x1e
	add r0, sp, #0
	mov r1, #0xa
	strh r3, [sp]
	strh r6, [sp, #2]
	strh r5, [sp, #4]
	strh r4, [sp, #6]
	strh r2, [sp, #8]
	bl sub_020DE5E4
	cmp r0, #0
	moveq r0, #2
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, pc}
	arm_func_end sub_020E0EF4

	arm_func_start sub_020E0F6C
sub_020E0F6C: ; 0x020E0F6C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r0, #2
	mov r1, #7
	mov r2, #9
	bl sub_020DE6C8
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r1, r5
	mov r0, #0x21
	bl sub_020DE4C8
	mov r2, r4
	mov r0, #0x21
	mov r1, #1
	bl sub_020DE538
	cmp r0, #0
	moveq r0, #2
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020E0F6C

	arm_func_start sub_020E0FB8
sub_020E0FB8: ; 0x020E0FB8
	stmdb sp!, {r3, lr}
	ldr r1, _020E0FE4 ; =0x021E4D44
	mov r3, #0
	ldr r2, _020E0FE8 ; =0x05000001
	add r0, sp, #0
	str r3, [sp]
	bl SVC_CpuSet
	bl OS_GetLockID
	ldr r1, _020E0FEC ; =0x021E4D40
	strh r0, [r1, #6]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020E0FE4: .word 0x021E4D44
_020E0FE8: .word 0x05000001
_020E0FEC: .word 0x021E4D40
	arm_func_end sub_020E0FB8

	arm_func_start sub_020E0FF0
sub_020E0FF0: ; 0x020E0FF0
	stmdb sp!, {r3, lr}
	bl sub_020E1134
	cmp r0, #0
	beq _020E1010
	bl sub_020E1040
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, pc}
_020E1010:
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_020E0FF0

	arm_func_start sub_020E1018
sub_020E1018: ; 0x020E1018
	stmdb sp!, {r3, lr}
	bl sub_020E1134
	cmp r0, #0
	beq _020E1038
	bl sub_020E1040
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
_020E1038:
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_020E1018

	arm_func_start sub_020E1040
sub_020E1040: ; 0x020E1040
	ldr r0, _020E1054 ; =0x027FFC30
	ldrb r0, [r0, #5]
	mov r0, r0, lsl #0x1f
	mov r0, r0, lsr #0x1f
	bx lr
	.align 2, 0
_020E1054: .word 0x027FFC30
	arm_func_end sub_020E1040

	arm_func_start sub_020E1058
sub_020E1058: ; 0x020E1058
	stmdb sp!, {r4, lr}
	mov r4, #0
	bl sub_020E1134
	cmp r0, #0
	beq _020E1074
	bl sub_020E107C
	mov r4, r0
_020E1074:
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end sub_020E1058

	arm_func_start sub_020E107C
sub_020E107C: ; 0x020E107C
	stmdb sp!, {r4, lr}
	mov r4, #0
	bl sub_020E1040
	cmp r0, #0
	ldrne r0, _020E109C ; =0x027FFC30
	ldrne r4, [r0, #8]
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_020E109C: .word 0x027FFC30
	arm_func_end sub_020E107C

	arm_func_start sub_020E10A0
sub_020E10A0: ; 0x020E10A0
	stmdb sp!, {r4, lr}
	mov r4, #0
	bl sub_020E1134
	cmp r0, #0
	beq _020E10BC
	bl sub_020E10C4
	mov r4, r0
_020E10BC:
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end sub_020E10A0

	arm_func_start sub_020E10C4
sub_020E10C4: ; 0x020E10C4
	stmdb sp!, {r4, lr}
	mov r4, #0
	bl sub_020E1040
	cmp r0, #0
	ldrne r0, _020E10E4 ; =0x027FFC30
	ldrneh r4, [r0, #6]
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_020E10E4: .word 0x027FFC30
	arm_func_end sub_020E10C4

	arm_func_start CTRDG_IsPulledOut
CTRDG_IsPulledOut: ; 0x020E10E8
	stmdb sp!, {r3, lr}
	ldr r2, _020E112C ; =0x027FFC30
	ldr r0, _020E1130 ; =0x0000FFFF
	ldrh r1, [r2]
	cmp r1, r0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	ldrb r0, [r2, #5]
	mov r0, r0, lsl #0x1e
	movs r0, r0, lsr #0x1f
	bne _020E1118
	bl sub_020E1134
_020E1118:
	ldr r0, _020E112C ; =0x027FFC30
	ldrb r0, [r0, #5]
	mov r0, r0, lsl #0x1e
	mov r0, r0, lsr #0x1f
	ldmia sp!, {r3, pc}
	.align 2, 0
_020E112C: .word 0x027FFC30
_020E1130: .word 0x0000FFFF
	arm_func_end CTRDG_IsPulledOut

	arm_func_start sub_020E1134
sub_020E1134: ; 0x020E1134
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	ldr r2, _020E1234 ; =0x027FFC30
	mov r4, #1
	ldrh r1, [r2]
	rsb r0, r4, #0x10000
	cmp r1, r0
	addeq sp, sp, #0x10
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	ldrb r0, [r2, #5]
	mov r0, r0, lsl #0x1e
	mov r0, r0, lsr #0x1f
	cmp r0, #1
	addeq sp, sp, #0x10
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r0, _020E1238 ; =0x021E4D40
	add r1, sp, #8
	ldrh r0, [r0, #6]
	bl sub_020E12BC
	add r0, sp, #0
	bl sub_020E1240
	mov r0, #0x8000000
	ldrb r2, [r0, #0xb2]
	cmp r2, #0x96
	bne _020E11B4
	ldr r1, _020E1234 ; =0x027FFC30
	ldrh r0, [r0, #0xbe]
	ldrh r1, [r1]
	cmp r1, r0
	bne _020E11FC
_020E11B4:
	cmp r2, #0x96
	beq _020E11D4
	ldr r1, _020E1234 ; =0x027FFC30
	ldr r0, _020E123C ; =0x0801FFFE
	ldrh r1, [r1]
	ldrh r0, [r0]
	cmp r1, r0
	bne _020E11FC
_020E11D4:
	ldr r2, _020E1234 ; =0x027FFC30
	mov r0, #0x8000000
	ldr r1, [r2, #8]
	ldr r0, [r0, #0xac]
	cmp r1, r0
	beq _020E1210
	ldrb r0, [r2, #5]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	beq _020E1210
_020E11FC:
	ldr r1, _020E1234 ; =0x027FFC30
	mov r4, #0
	ldrb r0, [r1, #5]
	orr r0, r0, #2
	strb r0, [r1, #5]
_020E1210:
	add r0, sp, #0
	bl sub_020E1288
	ldr r0, _020E1238 ; =0x021E4D40
	add r1, sp, #8
	ldrh r0, [r0, #6]
	bl sub_020E1318
	mov r0, r4
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_020E1234: .word 0x027FFC30
_020E1238: .word 0x021E4D40
_020E123C: .word 0x0801FFFE
	arm_func_end sub_020E1134

	arm_func_start sub_020E1240
sub_020E1240: ; 0x020E1240
	ldr r2, _020E1284 ; =0x04000204
	ldrh r1, [r2]
	and r1, r1, #0xc
	mov r1, r1, asr #2
	str r1, [r0]
	ldrh r1, [r2]
	and r1, r1, #0x10
	mov r1, r1, asr #4
	str r1, [r0, #4]
	ldrh r0, [r2]
	bic r0, r0, #0xc
	orr r0, r0, #0xc
	strh r0, [r2]
	ldrh r0, [r2]
	bic r0, r0, #0x10
	strh r0, [r2]
	bx lr
	.align 2, 0
_020E1284: .word 0x04000204
	arm_func_end sub_020E1240

	arm_func_start sub_020E1288
sub_020E1288: ; 0x020E1288
	ldr r3, _020E12B8 ; =0x04000204
	ldr r2, [r0]
	ldrh r1, [r3]
	bic r1, r1, #0xc
	orr r1, r1, r2, lsl #2
	strh r1, [r3]
	ldrh r1, [r3]
	ldr r2, [r0, #4]
	bic r0, r1, #0x10
	orr r0, r0, r2, lsl #4
	strh r0, [r3]
	bx lr
	.align 2, 0
_020E12B8: .word 0x04000204
	arm_func_end sub_020E1288

	arm_func_start sub_020E12BC
sub_020E12BC: ; 0x020E12BC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r5, _020E1314 ; =0x027FFFE8
	mov r7, r0
	mov r6, r1
	mov r4, #1
_020E12D0:
	bl OS_DisableInterrupts
	str r0, [r6, #4]
	mov r0, r5
	bl OS_ReadOwnerOfLockWord
	ands r0, r0, #0x40
	str r0, [r6]
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r7
	bl OS_TryLockCartridge
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, [r6, #4]
	bl OS_RestoreInterrupts
	mov r0, r4
	bl SVC_WaitByLoop
	b _020E12D0
	arm_func_end sub_020E12BC

	arm_func_start sub_020E1310
sub_020E1310: ; 0x020E1310
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020E1314: .word 0x027FFFE8
	arm_func_end sub_020E1310

	arm_func_start sub_020E1318
sub_020E1318: ; 0x020E1318
	stmdb sp!, {r4, lr}
	mov r4, r1
	ldr r1, [r4]
	cmp r1, #0
	bne _020E1330
	bl OS_UnLockCartridge
_020E1330:
	ldr r0, [r4, #4]
	bl OS_RestoreInterrupts
	ldmia sp!, {r4, pc}
	arm_func_end sub_020E1318

	arm_func_start sub_020E133C
sub_020E133C: ; 0x020E133C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r1, r7
	mov r0, #0xd
	mov r2, #0
	bl PXI_SendWordByFifo
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r6, #1
	mov r5, #0xd
	mov r4, #0
_020E1368:
	mov r0, r6
	bl SVC_WaitByLoop
	mov r0, r5
	mov r1, r7
	mov r2, r4
	bl PXI_SendWordByFifo
	cmp r0, #0
	bne _020E1368
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020E133C

	arm_func_start sub_020E138C
sub_020E138C: ; 0x020E138C
	stmdb sp!, {r3, lr}
	mov lr, r1
	mov r3, r2
	cmp lr, #0x8000000
	blo _020E13C4
	ldr r2, _020E13E0 ; =0x0A010000
	cmp lr, r2
	bhs _020E13C4
	mov ip, #1
	mov r2, r0
	mov r0, #0
	str ip, [sp]
	bl sub_020E1434
	ldmia sp!, {r3, pc}
_020E13C4:
	mov ip, #1
	mov r1, r0
	mov r2, lr
	mov r0, #0
	str ip, [sp]
	bl sub_020E1434
	ldmia sp!, {r3, pc}
	.align 2, 0
_020E13E0: .word 0x0A010000
	arm_func_end sub_020E138C

	arm_func_start sub_020E13E4
sub_020E13E4: ; 0x020E13E4
	stmdb sp!, {r3, lr}
	mov lr, r1
	mov r3, r2
	mov ip, #0x11
	mov r1, r0
	mov r2, lr
	mov r0, #0
	str ip, [sp]
	bl sub_020E1434
	ldmia sp!, {r3, pc}
	arm_func_end sub_020E13E4

	arm_func_start sub_020E140C
sub_020E140C: ; 0x020E140C
	stmdb sp!, {r3, lr}
	mov lr, r1
	mov r3, r2
	mov ip, #0x21
	mov r1, r0
	mov r2, lr
	mov r0, #0
	str ip, [sp]
	bl sub_020E1434
	ldmia sp!, {r3, pc}
	arm_func_end sub_020E140C

	arm_func_start sub_020E1434
sub_020E1434: ; 0x020E1434
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl sub_020E1134
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	bl sub_020E16C0
	ldr r0, _020E156C ; =0x021E4D40
	ldrh r0, [r0, #6]
	bl OS_LockCartridge
	ldr r0, [sp, #0x18]
	tst r0, #1
	bne _020E1488
	mov r0, r7
	bl MI_StopDma
	mov r0, r5
	mov r1, r4
	bl DC_FlushRange
_020E1488:
	ldr r0, [sp, #0x18]
	cmp r0, #0x11
	bhi _020E14B8
	cmp r0, #0x10
	blo _020E14AC
	beq _020E14D4
	cmp r0, #0x11
	beq _020E1504
	b _020E154C
_020E14AC:
	cmp r0, #1
	beq _020E152C
	b _020E154C
_020E14B8:
	cmp r0, #0x20
	bhi _020E14C8
	beq _020E14EC
	b _020E154C
_020E14C8:
	cmp r0, #0x21
	beq _020E1518
	b _020E154C
_020E14D4:
	mov r0, r7
	mov r1, r6
	mov r2, r5
	mov r3, r4
	bl MI_DmaCopy16
	b _020E154C
_020E14EC:
	mov r0, r7
	mov r1, r6
	mov r2, r5
	mov r3, r4
	bl MI_DmaCopy32
	b _020E154C
_020E1504:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl MIi_CpuCopy16
	b _020E154C
_020E1518:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl MIi_CpuCopy32
	b _020E154C
_020E152C:
	cmp r4, #0
	mov r1, #0
	bls _020E154C
_020E1538:
	ldrb r0, [r6], #1
	add r1, r1, #1
	cmp r1, r4
	strb r0, [r5], #1
	blo _020E1538
_020E154C:
	ldr r0, _020E156C ; =0x021E4D40
	ldrh r0, [r0, #6]
	bl OS_UnLockCartridge
	bl sub_020E1134
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020E156C: .word 0x021E4D40
	arm_func_end sub_020E1434

	arm_func_start sub_020E1570
sub_020E1570: ; 0x020E1570
	ldr ip, _020E1584 ; =sub_020E1588
	mov r2, r1
	mov r1, #0
	mov r3, #0x41
	bx ip
	.align 2, 0
_020E1584: .word sub_020E1588
	arm_func_end sub_020E1570

	arm_func_start sub_020E1588
sub_020E1588: ; 0x020E1588
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl sub_020E1134
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	bl sub_020E16C0
	ldr r0, _020E1664 ; =0x021E4D40
	ldrh r0, [r0, #6]
	bl OS_LockCartridge
	cmp r4, #0x21
	bhi _020E15F4
	bhs _020E1620
	cmp r4, #0x11
	bhi _020E15E8
	cmp r4, #0x10
	blo _020E1644
	beq _020E1640
	cmp r4, #0x11
	beq _020E1610
	b _020E1644
_020E15E8:
	cmp r4, #0x20
	streqh r6, [r7]
	b _020E1644
_020E15F4:
	cmp r4, #0x40
	bhi _020E1604
	streq r6, [r7]
	b _020E1644
_020E1604:
	cmp r4, #0x41
	beq _020E1630
	b _020E1644
_020E1610:
	cmp r5, #0
	ldrneb r0, [r7]
	strneb r0, [r5]
	b _020E1644
_020E1620:
	cmp r5, #0
	ldrneh r0, [r7]
	strneh r0, [r5]
	b _020E1644
_020E1630:
	cmp r5, #0
	ldrne r0, [r7]
	strne r0, [r5]
	b _020E1644
_020E1640:
	strb r6, [r7]
_020E1644:
	ldr r0, _020E1664 ; =0x021E4D40
	ldrh r0, [r0, #6]
	bl OS_UnLockCartridge
	bl sub_020E1134
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020E1664: .word 0x021E4D40
	arm_func_end sub_020E1588

	arm_func_start sub_020E1668
sub_020E1668: ; 0x020E1668
	ldr r0, _020E1674 ; =0x021E4D40
	ldr r0, [r0]
	bx lr
	.align 2, 0
_020E1674: .word 0x021E4D40
	arm_func_end sub_020E1668

	arm_func_start sub_020E1678
sub_020E1678: ; 0x020E1678
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl OS_DisableInterrupts
	ldr r1, _020E16BC ; =0x021E4D40
	mov r4, r0
	str r5, [r1]
	bl sub_020E1018
	cmp r0, #0
	bne _020E16B0
	cmp r5, #0
	movne r1, #0x1000
	moveq r1, #0x5000
	mov r0, #0xf000
	bl OS_SetDPermissionsForProtectionRegion
_020E16B0:
	mov r0, r4
	bl OS_RestoreInterrupts
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020E16BC: .word 0x021E4D40
	arm_func_end sub_020E1678

	arm_func_start sub_020E16C0
sub_020E16C0: ; 0x020E16C0
	stmdb sp!, {r3, lr}
	bl sub_020E1018
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl sub_020E1668
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	bl OS_Terminate
	ldmia sp!, {r3, pc}
	arm_func_end sub_020E16C0

	arm_func_start CTRDG_Init
CTRDG_Init: ; 0x020E16E4
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _020E1784 ; =0x021E4D60
	ldr r1, [r0, #8]
	cmp r1, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r1, #1
	str r1, [r0, #8]
	bl sub_020E0FB8
	ldr r0, _020E1784 ; =0x021E4D60
	mov r1, #0
	str r1, [r0, #0xc]
	bl PXI_Init
	mov r5, #0xd
	mov r4, #1
_020E171C:
	mov r0, r5
	mov r1, r4
	bl PXI_IsCallbackReady
	cmp r0, #0
	beq _020E171C
	ldr r1, _020E1788 ; =sub_020E198C
	mov r0, #0xd
	bl PXI_SetFifoRecvCallback
	bl sub_020E1798
	mov r0, #0xd
	mov r1, #0
	bl PXI_SetFifoRecvCallback
	ldr r1, _020E178C ; =sub_020E19B8
	mov r0, #0xd
	bl PXI_SetFifoRecvCallback
	ldr r1, _020E1784 ; =0x021E4D60
	mov r2, #0
	ldr r0, _020E1790 ; =0x021E4E40
	str r2, [r1, #0x18]
	bl sub_020E34C0
	ldr r1, _020E1794 ; =sub_020E1A28
	mov r0, #0x11
	bl PXI_SetFifoRecvCallback
	mov r0, #0
	bl sub_020E1678
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020E1784: .word 0x021E4D60
_020E1788: .word sub_020E198C
_020E178C: .word sub_020E19B8
_020E1790: .word 0x021E4E40
_020E1794: .word sub_020E1A28
	arm_func_end CTRDG_Init

	arm_func_start sub_020E1798
sub_020E1798: ; 0x020E1798
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x10
	ldr r0, _020E1960 ; =0x021E4D60
	ldr r1, [r0]
	cmp r1, #0
	addne sp, sp, #0x10
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r1, _020E1964 ; =0x04000300
	mov r2, #1
	ldrh r1, [r1]
	str r2, [r0]
	tst r1, #1
	addeq sp, sp, #0x10
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, #0x40000
	bl OS_SetIrqMask
	ldr r3, _020E1968 ; =0x04000208
	mov r2, #1
	ldrh r5, [r3]
	ldr r1, _020E196C ; =0x021E4D44
	mov r4, r0
	strh r2, [r3]
	ldrh r0, [r1, #2]
	add r1, sp, #8
	bl sub_020E12BC
	ldr r1, _020E1970 ; =0x04000204
	add r0, sp, #0
	ldrh r1, [r1]
	and r1, r1, #0x8000
	mov r6, r1, asr #0xf
	bl sub_020E1240
	ldr r3, _020E1970 ; =0x04000204
	ldr r0, _020E1974 ; =0x021E4D80
	ldrh r2, [r3]
	add r0, r0, #0x80
	mov r1, #0x40
	bic r2, r2, #0x8000
	strh r2, [r3]
	bl DC_InvalidateRange
	ldr r2, _020E1974 ; =0x021E4D80
	ldr r1, _020E1978 ; =0x08000080
	mov r0, #1
	mov r3, #0x40
	add r2, r2, #0x80
	bl MI_DmaCopy16
	ldr r2, _020E1970 ; =0x04000204
	add r0, sp, #0
	ldrh r1, [r2]
	bic r1, r1, #0x8000
	orr r1, r1, r6, lsl #15
	strh r1, [r2]
	bl sub_020E1288
	ldr r0, _020E196C ; =0x021E4D44
	add r1, sp, #8
	ldrh r0, [r0, #2]
	bl sub_020E1318
	ldr r1, _020E197C ; =0x027FFF9B
	ldrb r0, [r1]
	cmp r0, #0
	bne _020E1894
	ldrb r0, [r1, #-1]
	cmp r0, #0
	bne _020E18F8
_020E1894:
	ldr r3, _020E1974 ; =0x021E4D80
	ldr r6, _020E1980 ; =0x027FFC30
	ldrh r0, [r3, #0xbe]
	mov r2, #0
	strh r0, [r6]
	b _020E18C0
_020E18AC:
	add r0, r3, r2
	ldrb r1, [r0, #0xb5]
	add r0, r6, r2
	add r2, r2, #1
	strb r1, [r0, #2]
_020E18C0:
	cmp r2, #3
	blt _020E18AC
	ldrh r0, [r3, #0xb0]
	strh r0, [r6, #6]
	ldr r0, [r3, #0xac]
	str r0, [r6, #8]
	bl sub_020E1134
	cmp r0, #0
	movne r2, #1
	ldr r1, _020E197C ; =0x027FFF9B
	moveq r2, #0
	mov r0, #1
	strb r2, [r1]
	strb r0, [r1, #-1]
_020E18F8:
	ldr r0, _020E1984 ; =0xFFFF0020
	ldr r1, _020E1988 ; =0x021E4D84
	mov r2, #0x9c
	bl MIi_CpuCopy32
	bl DC_FlushAll
	ldr r0, _020E1974 ; =0x021E4D80
	add r0, r0, #0xfe000000
	mov r0, r0, lsr #5
	mov r0, r0, lsl #6
	orr r0, r0, #1
	bl sub_020E133C
	mov r7, #1
	ldr r6, _020E196C ; =0x021E4D44
	b _020E1938
_020E1930:
	mov r0, r7
	bl SVC_WaitByLoop
_020E1938:
	ldrh r0, [r6]
	cmp r0, #1
	bne _020E1930
	ldr r2, _020E1968 ; =0x04000208
	mov r0, r4
	ldrh r1, [r2]
	strh r5, [r2]
	bl OS_SetIrqMask
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020E1960: .word 0x021E4D60
_020E1964: .word 0x04000300
_020E1968: .word 0x04000208
_020E196C: .word 0x021E4D44
_020E1970: .word 0x04000204
_020E1974: .word 0x021E4D80
_020E1978: .word 0x08000080
_020E197C: .word 0x027FFF9B
_020E1980: .word 0x027FFC30
_020E1984: .word 0xFFFF0020
_020E1988: .word 0x021E4D84
	arm_func_end sub_020E1798

	arm_func_start sub_020E198C
sub_020E198C: ; 0x020E198C
	stmdb sp!, {r3, lr}
	and r0, r1, #0x3f
	cmp r0, #1
	bne _020E19AC
	ldr r0, _020E19B4 ; =0x021E4D44
	mov r1, #1
	strh r1, [r0]
	ldmia sp!, {r3, pc}
_020E19AC:
	bl OS_Terminate
	ldmia sp!, {r3, pc}
	.align 2, 0
_020E19B4: .word 0x021E4D44
	arm_func_end sub_020E198C

	arm_func_start sub_020E19B8
sub_020E19B8: ; 0x020E19B8
	stmdb sp!, {r3, lr}
	and r0, r1, #0x3f
	cmp r0, #0x11
	bne _020E1A08
	ldr r0, _020E1A10 ; =0x021E4D60
	ldr r1, [r0, #0xc]
	cmp r1, #0
	ldmneia sp!, {r3, pc}
	ldr r1, [r0, #0x18]
	mov r0, #0
	cmp r1, #0
	beq _020E19EC
	blx r1
_020E19EC:
	cmp r0, #0
	beq _020E19F8
	bl sub_020E1A14
_020E19F8:
	ldr r0, _020E1A10 ; =0x021E4D60
	mov r1, #1
	str r1, [r0, #0xc]
	ldmia sp!, {r3, pc}
_020E1A08:
	bl OS_Terminate
	ldmia sp!, {r3, pc}
	.align 2, 0
_020E1A10: .word 0x021E4D60
	arm_func_end sub_020E19B8

	arm_func_start sub_020E1A14
sub_020E1A14: ; 0x020E1A14
	stmdb sp!, {r3, lr}
	mov r0, #2
	bl sub_020E133C
	bl OS_Terminate
	ldmia sp!, {r3, pc}
	arm_func_end sub_020E1A14

	arm_func_start sub_020E1A28
sub_020E1A28: ; 0x020E1A28
	ldr r0, _020E1A38 ; =0x021E4D60
	mov r1, #0
	str r1, [r0, #4]
	bx lr
	.align 2, 0
_020E1A38: .word 0x021E4D60
	arm_func_end sub_020E1A28

	arm_func_start sub_020E1A3C
sub_020E1A3C: ; 0x020E1A3C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	cmp r7, #1
	mov r0, #1
	bhi _020E1B8C
	bl OS_GetLockID
	ldr r1, _020E1BA8 ; =0x021E4F2C
	strh r0, [r1]
	ldrh r0, [r1]
	bl OS_LockCartridge
	ldr r4, _020E1BAC ; =0x04000204
	ldr r1, _020E1BB0 ; =0x0210E1DC
	ldrh r3, [r4]
	ldrh r2, [r4]
	ldr r0, _020E1BB4 ; =_02110FC8
	and r6, r3, #3
	bic r2, r2, #3
	orr r2, r2, #3
	strh r2, [r4]
	str r1, [r0]
	bl sub_020E1C18
	ldr r2, _020E1BAC ; =0x04000204
	mov r4, r0
	ldrh r1, [r2]
	cmp r7, #0
	ldreq r5, _020E1BB8 ; =0x0210E1EC
	bic r1, r1, #3
	orr r1, r1, r6
	cmp r7, #1
	ldr r0, _020E1BA8 ; =0x021E4F2C
	strh r1, [r2]
	ldrh r0, [r0]
	ldreq r5, _020E1BBC ; =0x0210E1E0
	bl OS_UnlockCartridge
	ldr r3, [r5]
	mov r0, #1
	ldrh r1, [r3, #0x38]
	cmp r1, #0
	beq _020E1AFC
	and r2, r4, #0xff
_020E1ADC:
	ldrh r1, [r3, #0x38]
	cmp r2, r1
	moveq r0, #0
	beq _020E1AFC
	ldr r3, [r5, #4]!
	ldrh r1, [r3, #0x38]
	cmp r1, #0
	bne _020E1ADC
_020E1AFC:
	ldr r2, [r3]
	ldr r1, _020E1BC0 ; =0x021E4F30
	ldr r3, _020E1BC4 ; =0x021E4F44
	str r2, [r1]
	ldr r1, [r5]
	ldr r2, _020E1BC8 ; =0x021E4F3C
	ldr r4, [r1, #4]
	ldr r1, _020E1BCC ; =0x021E4F34
	str r4, [r3]
	ldr r3, [r5]
	ldr r6, _020E1BD0 ; =0x021E4F38
	ldr r3, [r3, #8]
	ldr r4, _020E1BD4 ; =0x021E4F40
	str r3, [r2]
	ldr r2, [r5]
	ldr r3, _020E1BD8 ; =0x021E4F5C
	ldr r7, [r2, #0xc]
	ldr r2, _020E1BB4 ; =_02110FC8
	str r7, [r1]
	ldr r7, [r5]
	ldr r1, _020E1BDC ; =_02110FC4
	ldr r7, [r7, #0x10]
	str r7, [r6]
	ldr r6, [r5]
	ldr r6, [r6, #0x14]
	str r6, [r4]
	ldr r4, [r5]
	ldr r4, [r4, #0x18]
	str r4, [r3]
	ldr r3, [r5]
	ldr r3, [r3, #0x1c]
	str r3, [r2]
	ldr r2, [r5]
	add r2, r2, #0x20
	str r2, [r1]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020E1B8C:
	cmp r7, #2
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	bl OS_GetLockID
	ldr r1, _020E1BE0 ; =0x021E4F60
	strh r0, [r1]
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020E1BA8: .word 0x021E4F2C
_020E1BAC: .word 0x04000204
_020E1BB0: .word 0x0210E1DC
_020E1BB4: .word _02110FC8
_020E1BB8: .word 0x0210E1EC
_020E1BBC: .word 0x0210E1E0
_020E1BC0: .word 0x021E4F30
_020E1BC4: .word 0x021E4F44
_020E1BC8: .word 0x021E4F3C
_020E1BCC: .word 0x021E4F34
_020E1BD0: .word 0x021E4F38
_020E1BD4: .word 0x021E4F40
_020E1BD8: .word 0x021E4F5C
_020E1BDC: .word _02110FC4
_020E1BE0: .word 0x021E4F60
	arm_func_end sub_020E1A3C

	arm_func_start sub_020E1BE4
sub_020E1BE4: ; 0x020E1BE4
	ldr r3, _020E1C10 ; =0x0A005555
	mov r2, #0xaa
	ldr r1, _020E1C14 ; =0x0A002AAA
	strb r2, [r3]
	mov r2, #0x55
	strb r2, [r1]
	mov r1, #0xb0
	strb r1, [r3]
	mov r1, #0xa000000
	strb r0, [r1]
	bx lr
	.align 2, 0
_020E1C10: .word 0x0A005555
_020E1C14: .word 0x0A002AAA
	arm_func_end sub_020E1BE4

	arm_func_start sub_020E1C18
sub_020E1C18: ; 0x020E1C18
	stmdb sp!, {r3, r4, r5, lr}
	ldr r5, _020E1D10 ; =0x04000208
	mov r0, #0
	ldrh r2, [r5]
	ldr r1, _020E1D14 ; =0x021E4F2C
	ldr r4, _020E1D18 ; =0x0A005555
	strh r0, [r5]
	str r2, [r1, #0x1c]
	mov r3, #0xaa
	ldr r2, _020E1D1C ; =0x0A002AAA
	strb r3, [r4]
	mov r3, #0x55
	strb r3, [r2]
	mov r2, #0x90
	strb r2, [r4]
	ldrh r2, [r5]
	ldr r1, [r1, #0x1c]
	strh r1, [r5]
	bl sub_020E1D24
	ldr r4, _020E1D14 ; =0x021E4F2C
	ldrh r0, [r4, #2]
	cmp r0, #0
	bne _020E1C84
_020E1C74:
	bl sub_020E1D6C
	ldrh r0, [r4, #2]
	cmp r0, #0
	beq _020E1C74
_020E1C84:
	ldr r0, _020E1D20 ; =0x0A000001
	bl sub_020E1DC8
	mov r4, r0, lsl #0x18
	mov r0, #0xa000000
	bl sub_020E1DC8
	ldr ip, _020E1D10 ; =0x04000208
	orr r4, r0, r4, lsr #16
	ldrh r2, [ip]
	mov r0, #0
	ldr r1, _020E1D14 ; =0x021E4F2C
	strh r0, [ip]
	ldr r5, _020E1D18 ; =0x0A005555
	str r2, [r1, #0x1c]
	mov r3, #0xaa
	ldr r2, _020E1D1C ; =0x0A002AAA
	strb r3, [r5]
	mov r3, #0x55
	strb r3, [r2]
	mov r2, #0xf0
	strb r2, [r5]
	strb r2, [r5]
	ldrh r2, [ip]
	ldr r1, [r1, #0x1c]
	strh r1, [ip]
	bl sub_020E1D24
	ldr r5, _020E1D14 ; =0x021E4F2C
	ldrh r0, [r5, #2]
	cmp r0, #0
	bne _020E1D08
_020E1CF8:
	bl sub_020E1D6C
	ldrh r0, [r5, #2]
	cmp r0, #0
	beq _020E1CF8
_020E1D08:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020E1D10: .word 0x04000208
_020E1D14: .word 0x021E4F2C
_020E1D18: .word 0x0A005555
_020E1D1C: .word 0x0A002AAA
_020E1D20: .word 0x0A000001
	arm_func_end sub_020E1C18

	arm_func_start sub_020E1D24
sub_020E1D24: ; 0x020E1D24
	stmdb sp!, {r3, lr}
	ldr r1, _020E1D64 ; =_02110FC4
	ldr r2, _020E1D68 ; =0x021E4F2C
	mov r3, #0
	ldr r1, [r1, #4]
	strh r3, [r2, #2]
	mov r0, r0, lsl #1
	ldrh r1, [r1, r0]
	mov r0, r3
	str r1, [r2, #0x20]
	str r0, [r2, #0x24]
	bl OS_GetTick
	ldr r2, _020E1D68 ; =0x021E4F2C
	str r0, [r2, #0x28]
	str r1, [r2, #0x2c]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020E1D64: .word _02110FC4
_020E1D68: .word 0x021E4F2C
	arm_func_end sub_020E1D24

	arm_func_start sub_020E1D6C
sub_020E1D6C: ; 0x020E1D6C
	stmdb sp!, {r3, lr}
	bl OS_GetTick
	ldr r3, _020E1DC0 ; =0x021E4F2C
	ldr r2, _020E1DC4 ; =0x000082EA
	ldr ip, [r3, #0x28]
	ldr r3, [r3, #0x2c]
	subs ip, r0, ip
	sbc r0, r1, r3
	mov r1, r0, lsl #6
	orr r1, r1, ip, lsr #26
	mov r0, ip, lsl #6
	mov r3, #0
	bl _ll_udiv
	ldr r2, _020E1DC0 ; =0x021E4F2C
	ldr r3, [r2, #0x24]
	ldr ip, [r2, #0x20]
	cmp r3, r1
	cmpeq ip, r0
	movls r0, #1
	strlsh r0, [r2, #2]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020E1DC0: .word 0x021E4F2C
_020E1DC4: .word 0x000082EA
	arm_func_end sub_020E1D6C

	arm_func_start sub_020E1DC8
sub_020E1DC8: ; 0x020E1DC8
	ldrb r0, [r0]
	bx lr
	arm_func_end sub_020E1DC8

	arm_func_start sub_020E1DD0
sub_020E1DD0: ; 0x020E1DD0
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r4, r0
	mov r8, r1
	mov r7, r2
	mov r6, #0
	bl sub_020E1D24
	ldr r5, _020E1E54 ; =0x021E4F2C
_020E1DEC:
	mov r0, r8
	bl sub_020E1DC8
	cmp r0, r7
	beq _020E1E40
	ldrh r0, [r5, #2]
	cmp r0, #0
	beq _020E1DEC
	mov r0, r8
	bl sub_020E1DC8
	cmp r7, r0
	beq _020E1E40
	ldr r0, _020E1E58 ; =_02110FC4
	ldr r0, [r0]
	ldrh r0, [r0, #0x18]
	cmp r0, #0xc2
	ldreq r0, _020E1E5C ; =0x0A005555
	moveq r1, #0xf0
	streqb r1, [r0]
	orr r0, r4, #0xc000
	mov r0, r0, lsl #0x10
	mov r6, r0, lsr #0x10
_020E1E40:
	bl sub_020E1134
	cmp r0, #0
	moveq r6, #0x1000
	mov r0, r6
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020E1E54: .word 0x021E4F2C
_020E1E58: .word _02110FC4
_020E1E5C: .word 0x0A005555
	arm_func_end sub_020E1DD0

	arm_func_start sub_020E1E60
sub_020E1E60: ; 0x020E1E60
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, #0
	bl sub_020E1D24
	ldr r4, _020E1F0C ; =0x021E4F2C
_020E1E7C:
	bl sub_020E1D6C
	mov r0, r7
	bl sub_020E1DC8
	cmp r0, r6
	beq _020E1EF8
	tst r0, #0x20
	beq _020E1EC4
	mov r0, r7
	bl sub_020E1DC8
	cmp r6, r0
	beq _020E1EF8
	orr r0, r8, #0xa000
	mov r0, r0, lsl #0x10
	ldr r1, _020E1F10 ; =0x0A005555
	mov r2, #0xf0
	strb r2, [r1]
	mov r5, r0, lsr #0x10
	b _020E1EF8
_020E1EC4:
	ldrh r0, [r4, #2]
	cmp r0, #0
	beq _020E1E7C
	mov r0, r7
	bl sub_020E1DC8
	cmp r6, r0
	beq _020E1EF8
	orr r0, r8, #0xc000
	mov r0, r0, lsl #0x10
	ldr r1, _020E1F10 ; =0x0A005555
	mov r2, #0xf0
	strb r2, [r1]
	mov r5, r0, lsr #0x10
_020E1EF8:
	bl sub_020E1134
	cmp r0, #0
	moveq r5, #0x1000
	mov r0, r5
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020E1F0C: .word 0x021E4F2C
_020E1F10: .word 0x0A005555
	arm_func_end sub_020E1E60

	arm_func_start sub_020E1F14
sub_020E1F14: ; 0x020E1F14
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x24
	mov r5, r0
	ldmia r5!, {r0, r1, r2, r3}
	add r4, sp, #0
	stmia r4!, {r0, r1, r2, r3}
	ldmia r5!, {r0, r1, r2, r3}
	stmia r4!, {r0, r1, r2, r3}
	ldr r0, _020E1FFC ; =0x021E4F2C
	ldr r1, [r5]
	ldrh r0, [r0]
	str r1, [r4]
	ldrh r5, [sp, #0x20]
	ldr r6, [sp, #0x14]
	ldr r7, [sp, #0x1c]
	ldr r8, [sp, #0x18]
	bl OS_LockCartridge
	ldr r3, _020E2000 ; =0x04000204
	ldr r0, _020E2004 ; =_02110FC4
	ldrh r2, [r3]
	ldrh r1, [r3]
	and r4, r2, #3
	bic r1, r1, #3
	orr r1, r1, #3
	strh r1, [r3]
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #0x20000
	bne _020E1F98
	mov r0, r5, lsl #0xc
	mov r0, r0, lsr #0x10
	bl sub_020E1BE4
	and r5, r5, #0xf
_020E1F98:
	ldr r0, _020E2004 ; =_02110FC4
	cmp r8, #0
	ldr r0, [r0]
	sub r8, r8, #1
	ldrh r0, [r0, #8]
	mov r0, r5, lsl r0
	add r0, r0, #0xa000000
	add r1, r6, r0
	beq _020E1FD0
_020E1FBC:
	ldrb r0, [r1], #1
	cmp r8, #0
	sub r8, r8, #1
	strb r0, [r7], #1
	bne _020E1FBC
_020E1FD0:
	ldr r2, _020E2000 ; =0x04000204
	ldr r0, _020E1FFC ; =0x021E4F2C
	ldrh r1, [r2]
	bic r1, r1, #3
	orr r1, r1, r4
	strh r1, [r2]
	ldrh r0, [r0]
	bl OS_UnlockCartridge
	mov r0, #0
	add sp, sp, #0x24
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020E1FFC: .word 0x021E4F2C
_020E2000: .word 0x04000204
_020E2004: .word _02110FC4
	arm_func_end sub_020E1F14

	arm_func_start sub_020E2008
sub_020E2008: ; 0x020E2008
	cmp r2, #0
	sub r2, r2, #1
	beq _020E2034
_020E2014:
	ldrb ip, [r1], #1
	ldrb r3, [r0], #1
	cmp ip, r3
	subne r0, r1, #1
	bxne lr
	cmp r2, #0
	sub r2, r2, #1
	bne _020E2014
_020E2034:
	mov r0, #0
	bx lr
	arm_func_end sub_020E2008

	arm_func_start sub_020E203C
sub_020E203C: ; 0x020E203C
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x24
	mov r5, r0
	ldmia r5!, {r0, r1, r2, r3}
	add r4, sp, #0
	stmia r4!, {r0, r1, r2, r3}
	ldmia r5!, {r0, r1, r2, r3}
	stmia r4!, {r0, r1, r2, r3}
	ldr r0, _020E210C ; =0x021E4F2C
	ldr r1, [r5]
	ldrh r0, [r0]
	str r1, [r4]
	ldrh r5, [sp, #0x20]
	ldr r6, [sp, #0xc]
	ldr r7, [sp, #0x18]
	bl OS_LockCartridge
	ldr r3, _020E2110 ; =0x04000204
	ldr r0, _020E2114 ; =_02110FC4
	ldrh r2, [r3]
	ldrh r1, [r3]
	and r4, r2, #3
	bic r1, r1, #3
	orr r1, r1, #3
	strh r1, [r3]
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #0x20000
	bne _020E20BC
	mov r0, r5, lsl #0xc
	mov r0, r0, lsr #0x10
	bl sub_020E1BE4
	and r5, r5, #0xf
_020E20BC:
	ldr r1, _020E2114 ; =_02110FC4
	mov r0, r6
	ldr r1, [r1]
	mov r2, r7
	ldrh r1, [r1, #8]
	mov r1, r5, lsl r1
	add r1, r1, #0xa000000
	bl sub_020E2008
	ldr r3, _020E2110 ; =0x04000204
	ldr r1, _020E210C ; =0x021E4F2C
	ldrh r2, [r3]
	mov r5, r0
	bic r0, r2, #3
	orr r0, r0, r4
	strh r0, [r3]
	ldrh r0, [r1]
	bl OS_UnlockCartridge
	mov r0, r5
	add sp, sp, #0x24
	ldmia sp!, {r4, r5, r6, r7, pc}
	.align 2, 0
_020E210C: .word 0x021E4F2C
_020E2110: .word 0x04000204
_020E2114: .word _02110FC4
	arm_func_end sub_020E203C

	arm_func_start sub_020E2118
sub_020E2118: ; 0x020E2118
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x24
	mov r4, r0
	ldmia r4!, {r0, r1, r2, r3}
	add ip, sp, #0
	stmia ip!, {r0, r1, r2, r3}
	ldmia r4!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	ldr r0, [r4]
	mov r4, #0
	str r0, [ip]
	ldrh r5, [sp, #0x20]
	ldr r6, [sp, #0xc]
	ldr r7, [sp, #0x18]
_020E2150:
	mov r0, r5
	mov r1, r6
	bl sub_020E21C4
	cmp r0, #0
	bne _020E2180
	mov r0, r5
	mov r1, r6
	mov r2, r7
	bl sub_020E21DC
	cmp r0, #0
	addeq sp, sp, #0x24
	ldmeqia sp!, {r4, r5, r6, r7, pc}
_020E2180:
	add r1, r4, #1
	mov r1, r1, lsl #0x10
	mov r4, r1, lsr #0x10
	cmp r4, #3
	blo _020E2150
	add sp, sp, #0x24
	ldmia sp!, {r4, r5, r6, r7, pc}
	arm_func_end sub_020E2118

	arm_func_start sub_020E219C
sub_020E219C: ; 0x020E219C
	stmdb sp!, {lr}
	sub sp, sp, #0x24
	strh r0, [sp, #0x20]
	add r0, sp, #0
	str r1, [sp, #0x14]
	str r2, [sp, #0x1c]
	str r3, [sp, #0x18]
	bl sub_020E1F14
	add sp, sp, #0x24
	ldmia sp!, {pc}
	arm_func_end sub_020E219C

	arm_func_start sub_020E21C4
sub_020E21C4: ; 0x020E21C4
	stmdb sp!, {r3, lr}
	ldr r2, _020E21D8 ; =0x021E4F2C
	ldr r2, [r2, #4]
	blx r2
	ldmia sp!, {r3, pc}
	.align 2, 0
_020E21D8: .word 0x021E4F2C
	arm_func_end sub_020E21C4

	arm_func_start sub_020E21DC
sub_020E21DC: ; 0x020E21DC
	stmdb sp!, {lr}
	sub sp, sp, #0x24
	strh r0, [sp, #0x20]
	add r0, sp, #0
	str r1, [sp, #0xc]
	str r2, [sp, #0x18]
	bl sub_020E203C
	add sp, sp, #0x24
	ldmia sp!, {pc}
	arm_func_end sub_020E21DC

	arm_func_start sub_020E2200
sub_020E2200:
	stmdb sp!, {lr}
	sub sp, sp, #0x24
	str r1, [sp, #0xc]
	strh r0, [sp, #0x20]
	str r2, [sp, #0x18]
	ldr r1, _020E222C ; =sub_020E2118
	add r0, sp, #0
	mov r2, r3
	bl sub_020E366C
	add sp, sp, #0x24
	ldmia sp!, {pc}
	.align 2, 0
_020E222C: .word sub_020E2118
	arm_func_end sub_020E2200

	arm_func_start sub_020E2230
sub_020E2230: ; 0x020E2230
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _020E22FC ; =0x021E4F2C
	ldrh r0, [r0]
	bl OS_LockCartridge
	ldr r0, _020E2300 ; =0x04000204
	ldr r1, _020E2304 ; =_02110FC4
	ldrh r3, [r0]
	ldr r2, [r1]
	ldrh r1, [r0]
	ldr r4, [r2, #0x10]
	mov r2, #0
	bic r1, r1, #3
	orr r1, r1, r4
	strh r1, [r0]
	ldrh r4, [r0, #4]
	ldr r1, _020E2308 ; =0x021E4F48
	ldr lr, _020E230C ; =0x0A005555
	strh r2, [r0, #4]
	str r4, [r1]
	mov r5, #0xaa
	ldr r4, _020E2310 ; =0x0A002AAA
	strb r5, [lr]
	mov ip, #0x55
	strb ip, [r4]
	mov r2, #0x80
	strb r2, [lr]
	strb r5, [lr]
	strb ip, [r4]
	mov r2, #0x10
	strb r2, [lr]
	ldrh r2, [r0, #4]
	ldr r2, [r1]
	ldr r1, _020E2314 ; =0x021E4F5C
	strh r2, [r0, #4]
	ldr r4, [r1]
	mov r0, #3
	mov r1, #0xa000000
	mov r2, #0xff
	and r5, r3, #3
	blx r4
	ldr r3, _020E2300 ; =0x04000204
	ldr r1, _020E22FC ; =0x021E4F2C
	ldrh r2, [r3]
	mov r4, r0
	bic r0, r2, #3
	orr r0, r0, r5
	strh r0, [r3]
	ldrh r0, [r1]
	bl OS_UnlockCartridge
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020E22FC: .word 0x021E4F2C
_020E2300: .word 0x04000204
_020E2304: .word _02110FC4
_020E2308: .word 0x021E4F48
_020E230C: .word 0x0A005555
_020E2310: .word 0x0A002AAA
_020E2314: .word 0x021E4F5C
	arm_func_end sub_020E2230

	arm_func_start sub_020E2318
sub_020E2318: ; 0x020E2318
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x24
	mov r5, r0
	ldmia r5!, {r0, r1, r2, r3}
	add r4, sp, #0
	stmia r4!, {r0, r1, r2, r3}
	ldmia r5!, {r0, r1, r2, r3}
	stmia r4!, {r0, r1, r2, r3}
	ldr r1, [r5]
	ldr r0, _020E2424 ; =0x021E4F2C
	str r1, [r4]
	ldrh r1, [sp, #0x20]
	ldrh r0, [r0]
	mov r1, r1, lsl #7
	add r5, r1, #0xa000000
	bl OS_LockCartridge
	ldr ip, _020E2428 ; =0x04000204
	ldr r1, _020E242C ; =_02110FC4
	ldrh r0, [ip]
	ldr r1, [r1]
	ldrh r2, [ip]
	ldr r3, [r1, #0x10]
	mov r1, #0
	bic r2, r2, #3
	orr r2, r2, r3
	strh r2, [ip]
	ldrh r3, [ip, #4]
	ldr r4, _020E2430 ; =0x0A005555
	mov r2, #0xaa
	strh r1, [ip, #4]
	strb r2, [r4]
	ldr r1, _020E2434 ; =0x0A002AAA
	mov r2, #0x55
	strb r2, [r1]
	mov r1, #0xa0
	strb r1, [r4]
	and r4, r0, #3
	mov r0, #0x80
	mov r2, #0xff
_020E23B4:
	strb r2, [r5], #1
	subs r0, r0, #1
	bne _020E23B4
	ldr lr, _020E2438 ; =0x04000208
	ldr ip, _020E243C ; =0x021E4F5C
	ldrh r0, [lr]
	sub r1, r5, #1
	strh r3, [lr]
	ldr r3, [ip]
	mov r0, #1
	blx r3
	movs r5, r0
	beq _020E23F8
	and r0, r5, #0xff00
	orr r0, r0, #2
	mov r0, r0, lsl #0x10
	mov r5, r0, lsr #0x10
_020E23F8:
	ldr r2, _020E2428 ; =0x04000204
	ldr r0, _020E2424 ; =0x021E4F2C
	ldrh r1, [r2]
	bic r1, r1, #3
	orr r1, r1, r4
	strh r1, [r2]
	ldrh r0, [r0]
	bl OS_UnlockCartridge
	mov r0, r5
	add sp, sp, #0x24
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_020E2424: .word 0x021E4F2C
_020E2428: .word 0x04000204
_020E242C: .word _02110FC4
_020E2430: .word 0x0A005555
_020E2434: .word 0x0A002AAA
_020E2438: .word 0x04000208
_020E243C: .word 0x021E4F5C
	arm_func_end sub_020E2318

	arm_func_start sub_020E2440
sub_020E2440: ; 0x020E2440
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x24
	mov r5, r0
	ldmia r5!, {r0, r1, r2, r3}
	add r4, sp, #0
	stmia r4!, {r0, r1, r2, r3}
	ldmia r5!, {r0, r1, r2, r3}
	stmia r4!, {r0, r1, r2, r3}
	ldr r0, [r5]
	str r0, [r4]
	ldrh r0, [sp, #0x20]
	cmp r0, #0x10
	addhs sp, sp, #0x24
	ldrhs r0, _020E24E4 ; =0x000080FF
	ldmhsia sp!, {r4, r5, r6, r7, pc}
	mov r0, r0, lsl #0x15
	mov r6, r0, lsr #0x10
	mov r5, #0
	mov r4, #2
_020E248C:
	mov r7, r4
_020E2490:
	mov r0, r6
	bl sub_020E27A8
	cmp r0, #0
	beq _020E24B0
	sub r1, r7, #1
	mov r1, r1, lsl #0x10
	movs r7, r1, lsr #0x10
	bne _020E2490
_020E24B0:
	add r1, r6, #1
	mov r1, r1, lsl #0x10
	cmp r0, #0
	mov r6, r1, lsr #0x10
	addne sp, sp, #0x24
	ldmneia sp!, {r4, r5, r6, r7, pc}
	add r1, r5, #1
	mov r1, r1, lsl #0x10
	mov r5, r1, lsr #0x10
	cmp r5, #0x20
	blo _020E248C
	add sp, sp, #0x24
	ldmia sp!, {r4, r5, r6, r7, pc}
	.align 2, 0
_020E24E4: .word 0x000080FF
	arm_func_end sub_020E2440

	arm_func_start sub_020E24E8
sub_020E24E8: ; 0x020E24E8
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x24
	mov r5, r0
	ldmia r5!, {r0, r1, r2, r3}
	add r4, sp, #0
	stmia r4!, {r0, r1, r2, r3}
	ldmia r5!, {r0, r1, r2, r3}
	stmia r4!, {r0, r1, r2, r3}
	ldr r0, _020E25E8 ; =0x021E4F2C
	ldr r1, [r5]
	ldrh r0, [r0]
	str r1, [r4]
	ldr r5, [sp, #0xc]
	bl OS_LockCartridge
	ldr r1, _020E25EC ; =0x04000204
	ldr r2, _020E25F0 ; =_02110FC4
	ldrh r0, [r1]
	ldr r3, [r2]
	ldrh r2, [r1]
	ldr r4, [r3, #0x10]
	mov r3, #0
	bic r2, r2, #3
	orr r2, r2, r4
	strh r2, [r1]
	ldrh ip, [sp, #0x20]
	ldrh r2, [r1, #4]
	ldr r4, _020E25F4 ; =0x0A005555
	mov ip, ip, lsl #7
	strh r3, [r1, #4]
	mov r3, #0xaa
	strb r3, [r4]
	ldr r1, _020E25F8 ; =0x0A002AAA
	mov r3, #0x55
	strb r3, [r1]
	mov r1, #0xa0
	strb r1, [r4]
	and r4, r0, #3
	add lr, ip, #0xa000000
	mov r1, #0x80
_020E2584:
	ldrb r0, [r5], #1
	subs r1, r1, #1
	strb r0, [lr], #1
	bne _020E2584
	ldr ip, _020E25FC ; =0x04000208
	ldr r3, _020E2600 ; =0x021E4F5C
	ldrh r0, [ip]
	sub r1, lr, #1
	mov r0, #1
	strh r2, [ip]
	ldrb r2, [r5, #-1]
	ldr r3, [r3]
	blx r3
	ldr r3, _020E25EC ; =0x04000204
	ldr r1, _020E25E8 ; =0x021E4F2C
	ldrh r2, [r3]
	mov r5, r0
	bic r0, r2, #3
	orr r0, r0, r4
	strh r0, [r3]
	ldrh r0, [r1]
	bl OS_UnlockCartridge
	mov r0, r5
	add sp, sp, #0x24
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_020E25E8: .word 0x021E4F2C
_020E25EC: .word 0x04000204
_020E25F0: .word _02110FC4
_020E25F4: .word 0x0A005555
_020E25F8: .word 0x0A002AAA
_020E25FC: .word 0x04000208
_020E2600: .word 0x021E4F5C
	arm_func_end sub_020E24E8

	arm_func_start sub_020E2604
sub_020E2604: ; 0x020E2604
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x24
	mov r5, r0
	ldmia r5!, {r0, r1, r2, r3}
	add r4, sp, #0
	stmia r4!, {r0, r1, r2, r3}
	ldmia r5!, {r0, r1, r2, r3}
	stmia r4!, {r0, r1, r2, r3}
	ldr r0, [r5]
	str r0, [r4]
	ldrh r0, [sp, #0x20]
	ldr r6, [sp, #0xc]
	cmp r0, #0x10
	addhs sp, sp, #0x24
	ldrhs r0, _020E26C0 ; =0x000080FF
	ldmhsia sp!, {r3, r4, r5, r6, r7, r8, pc}
	ldr r7, _020E26C4 ; =0x021E4F28
	mov r0, r0, lsl #0x15
	mov r1, #0x1000
	strh r1, [r7]
	mov r5, r0, lsr #0x10
	mov r4, #2
_020E265C:
	mov r8, r4
_020E2660:
	mov r0, r5
	mov r1, r6
	bl sub_020E27CC
	cmp r0, #0
	beq _020E2684
	sub r1, r8, #1
	mov r1, r1, lsl #0x10
	movs r8, r1, lsr #0x10
	bne _020E2660
_020E2684:
	cmp r0, #0
	addne sp, sp, #0x24
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, pc}
	ldrh r2, [r7]
	add r1, r5, #1
	mov r1, r1, lsl #0x10
	sub r2, r2, #0x80
	strh r2, [r7]
	ldrh r2, [r7]
	add r6, r6, #0x80
	mov r5, r1, lsr #0x10
	cmp r2, #0
	bne _020E265C
	add sp, sp, #0x24
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020E26C0: .word 0x000080FF
_020E26C4: .word 0x021E4F28
	arm_func_end sub_020E2604

	arm_func_start sub_020E26C8
sub_020E26C8: ; 0x020E26C8
	stmdb sp!, {lr}
	sub sp, sp, #0x24
	add r0, sp, #0
	bl sub_020E2230
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	add sp, sp, #0x24
	ldmia sp!, {pc}
	stmdb sp!, {lr}
	sub sp, sp, #0x24
	strh r0, [sp, #0x20]
	add r0, sp, #0
	bl sub_020E2440
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	add sp, sp, #0x24
	ldmia sp!, {pc}
	stmdb sp!, {lr}
	sub sp, sp, #0x24
	strh r0, [sp, #0x20]
	add r0, sp, #0
	str r1, [sp, #0xc]
	bl sub_020E2604
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	add sp, sp, #0x24
	ldmia sp!, {pc}
	stmdb sp!, {lr}
	sub sp, sp, #0x24
	ldr r1, _020E2754 ; =sub_020E2230
	mov r2, r0
	add r0, sp, #0
	bl sub_020E366C
	add sp, sp, #0x24
	ldmia sp!, {pc}
	.align 2, 0
_020E2754: .word sub_020E2230
	arm_func_end sub_020E26C8

	arm_func_start sub_020E2758
sub_020E2758: ; 0x020E2758
	stmdb sp!, {lr}
	sub sp, sp, #0x24
	mov r2, r1
	strh r0, [sp, #0x20]
	ldr r1, _020E277C ; =sub_020E2440
	add r0, sp, #0
	bl sub_020E366C
	add sp, sp, #0x24
	ldmia sp!, {pc}
	.align 2, 0
_020E277C: .word sub_020E2440
	arm_func_end sub_020E2758

	arm_func_start sub_020E2780
sub_020E2780: ; 0x020E2780
	stmdb sp!, {lr}
	sub sp, sp, #0x24
	str r1, [sp, #0xc]
	strh r0, [sp, #0x20]
	ldr r1, _020E27A4 ; =sub_020E2604
	add r0, sp, #0
	bl sub_020E366C
	add sp, sp, #0x24
	ldmia sp!, {pc}
	.align 2, 0
_020E27A4: .word sub_020E2604
	arm_func_end sub_020E2780

	arm_func_start sub_020E27A8
sub_020E27A8: ; 0x020E27A8
	stmdb sp!, {lr}
	sub sp, sp, #0x24
	strh r0, [sp, #0x20]
	add r0, sp, #0
	bl sub_020E2318
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	add sp, sp, #0x24
	ldmia sp!, {pc}
	arm_func_end sub_020E27A8

	arm_func_start sub_020E27CC
sub_020E27CC: ; 0x020E27CC
	stmdb sp!, {lr}
	sub sp, sp, #0x24
	strh r0, [sp, #0x20]
	add r0, sp, #0
	str r1, [sp, #0xc]
	bl sub_020E24E8
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	add sp, sp, #0x24
	ldmia sp!, {pc}
	stmdb sp!, {lr}
	sub sp, sp, #0x24
	mov r2, r1
	strh r0, [sp, #0x20]
	ldr r1, _020E2818 ; =sub_020E2318
	add r0, sp, #0
	bl sub_020E366C
	add sp, sp, #0x24
	ldmia sp!, {pc}
	.align 2, 0
_020E2818: .word sub_020E2318
	arm_func_end sub_020E27CC

	arm_func_start sub_020E281C
sub_020E281C: ; 0x020E281C
	stmdb sp!, {lr}
	sub sp, sp, #0x24
	str r1, [sp, #0xc]
	strh r0, [sp, #0x20]
	ldr r1, _020E2840 ; =sub_020E24E8
	add r0, sp, #0
	bl sub_020E366C
	add sp, sp, #0x24
	ldmia sp!, {pc}
	.align 2, 0
_020E2840: .word sub_020E24E8
	arm_func_end sub_020E281C

	arm_func_start sub_020E2844
sub_020E2844: ; 0x020E2844
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _020E2910 ; =0x021E4F2C
	ldrh r0, [r0]
	bl OS_LockCartridge
	ldr r0, _020E2914 ; =0x04000204
	ldr r1, _020E2918 ; =_02110FC4
	ldrh r3, [r0]
	ldr r2, [r1]
	ldrh r1, [r0]
	ldr r4, [r2, #0x10]
	mov r2, #0
	bic r1, r1, #3
	orr r1, r1, r4
	strh r1, [r0]
	ldrh r4, [r0, #4]
	ldr r1, _020E291C ; =0x021E4F48
	ldr lr, _020E2920 ; =0x0A005555
	strh r2, [r0, #4]
	str r4, [r1]
	mov r5, #0xaa
	ldr r4, _020E2924 ; =0x0A002AAA
	strb r5, [lr]
	mov ip, #0x55
	strb ip, [r4]
	mov r2, #0x80
	strb r2, [lr]
	strb r5, [lr]
	strb ip, [r4]
	mov r2, #0x10
	strb r2, [lr]
	ldrh r2, [r0, #4]
	ldr r2, [r1]
	ldr r1, _020E2928 ; =0x021E4F5C
	strh r2, [r0, #4]
	ldr r4, [r1]
	mov r0, #3
	mov r1, #0xa000000
	mov r2, #0xff
	and r5, r3, #3
	blx r4
	ldr r3, _020E2914 ; =0x04000204
	ldr r1, _020E2910 ; =0x021E4F2C
	ldrh r2, [r3]
	mov r4, r0
	bic r0, r2, #3
	orr r0, r0, r5
	strh r0, [r3]
	ldrh r0, [r1]
	bl OS_UnlockCartridge
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020E2910: .word 0x021E4F2C
_020E2914: .word 0x04000204
_020E2918: .word _02110FC4
_020E291C: .word 0x021E4F48
_020E2920: .word 0x0A005555
_020E2924: .word 0x0A002AAA
_020E2928: .word 0x021E4F5C
	arm_func_end sub_020E2844

	arm_func_start sub_020E292C
sub_020E292C: ; 0x020E292C
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x24
	mov r5, r0
	ldmia r5!, {r0, r1, r2, r3}
	add r4, sp, #0
	stmia r4!, {r0, r1, r2, r3}
	ldmia r5!, {r0, r1, r2, r3}
	stmia r4!, {r0, r1, r2, r3}
	ldr r0, [r5]
	str r0, [r4]
	ldrh r4, [sp, #0x20]
	cmp r4, #0x10
	addhs sp, sp, #0x24
	ldrhs r0, _020E2A40 ; =0x000080FF
	ldmhsia sp!, {r3, r4, r5, r6, pc}
	ldr r0, _020E2A44 ; =0x021E4F2C
	ldrh r0, [r0]
	bl OS_LockCartridge
	ldr r0, _020E2A48 ; =0x04000204
	ldr r1, _020E2A4C ; =_02110FC4
	ldrh r3, [r0]
	ldr r5, [r1]
	ldrh r2, [r0]
	ldr r6, [r5, #0x10]
	mov r5, #0
	bic r2, r2, #3
	orr r2, r2, r6
	strh r2, [r0]
	ldr r2, [r1]
	ldrh r1, [r0, #4]
	ldrh ip, [r2, #8]
	ldr r2, _020E2A50 ; =0x021E4F48
	ldr lr, _020E2A54 ; =0x0A005555
	strh r5, [r0, #4]
	mov r6, r4, lsl ip
	str r1, [r2]
	mov r5, #0xaa
	ldr r4, _020E2A58 ; =0x0A002AAA
	strb r5, [lr]
	mov ip, #0x55
	strb ip, [r4]
	mov r1, #0x80
	strb r1, [lr]
	strb r5, [lr]
	strb ip, [r4]
	add r1, r6, #0xa000000
	mov r4, #0x30
	strb r4, [r1]
	ldrh r4, [r0, #4]
	ldr r4, [r2]
	ldr r2, _020E2A5C ; =0x021E4F5C
	strh r4, [r0, #4]
	ldr r4, [r2]
	mov r0, #2
	mov r2, #0xff
	and r5, r3, #3
	blx r4
	ldr r3, _020E2A48 ; =0x04000204
	ldr r1, _020E2A44 ; =0x021E4F2C
	ldrh r2, [r3]
	mov r4, r0
	bic r0, r2, #3
	orr r0, r0, r5
	strh r0, [r3]
	ldrh r0, [r1]
	bl OS_UnlockCartridge
	mov r0, r4
	add sp, sp, #0x24
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_020E2A40: .word 0x000080FF
_020E2A44: .word 0x021E4F2C
_020E2A48: .word 0x04000204
_020E2A4C: .word _02110FC4
_020E2A50: .word 0x021E4F48
_020E2A54: .word 0x0A005555
_020E2A58: .word 0x0A002AAA
_020E2A5C: .word 0x021E4F5C
	arm_func_end sub_020E292C

	arm_func_start sub_020E2A60
sub_020E2A60: ; 0x020E2A60
	stmdb sp!, {r3, lr}
	ldr ip, _020E2AA8 ; =0x0A005555
	mov r3, #0xaa
	ldr r2, _020E2AAC ; =0x0A002AAA
	strb r3, [ip]
	mov r3, #0x55
	mov lr, r0
	strb r3, [r2]
	mov r0, #0xa0
	strb r0, [ip]
	ldrb r2, [lr]
	ldr r3, _020E2AB0 ; =0x021E4F5C
	mov r0, #1
	strb r2, [r1]
	ldrb r2, [lr]
	ldr r3, [r3]
	blx r3
	ldmia sp!, {r3, pc}
	.align 2, 0
_020E2AA8: .word 0x0A005555
_020E2AAC: .word 0x0A002AAA
_020E2AB0: .word 0x021E4F5C
	arm_func_end sub_020E2A60

	arm_func_start sub_020E2AB4
sub_020E2AB4: ; 0x020E2AB4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x24
	mov r5, r0
	ldmia r5!, {r0, r1, r2, r3}
	add r4, sp, #0
	stmia r4!, {r0, r1, r2, r3}
	ldmia r5!, {r0, r1, r2, r3}
	stmia r4!, {r0, r1, r2, r3}
	ldr r0, [r5]
	str r0, [r4]
	ldrh r8, [sp, #0x20]
	ldr r5, [sp, #0xc]
	cmp r8, #0x10
	addhs sp, sp, #0x24
	ldrhs r0, _020E2C64 ; =0x000080FF
	ldmhsia sp!, {r4, r5, r6, r7, r8, sb, pc}
	ldr r0, _020E2C68 ; =_02110FC4
	ldr r6, _020E2C6C ; =sub_020E2C84
	ldr r0, [r0]
	mov sb, #0
	ldrh r0, [r0, #8]
	mov r0, r8, lsl r0
	add r7, r0, #0xa000000
_020E2B10:
	mov r0, r8
	bl sub_020E2D64
	movs r4, r0
	bne _020E2B38
	mov r0, r7
	mov r1, r6
	bl sub_020E2CB8
	mov r0, r0, lsl #0x10
	movs r4, r0, lsr #0x10
	beq _020E2B58
_020E2B38:
	add r0, sb, #1
	mov r0, r0, lsl #0x10
	cmp sb, #0x50
	mov sb, r0, lsr #0x10
	bne _020E2B10
	add sp, sp, #0x24
	mov r0, r4
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
_020E2B58:
	mov r6, #1
	cmp sb, #0
	movne r6, #6
	cmp r6, #1
	mov sb, #1
	blo _020E2B8C
_020E2B70:
	mov r0, r8
	bl sub_020E2D64
	add r0, sb, #1
	mov r0, r0, lsl #0x10
	cmp r6, r0, lsr #16
	mov sb, r0, lsr #0x10
	bhs _020E2B70
_020E2B8C:
	ldr r0, _020E2C70 ; =0x021E4F2C
	ldrh r0, [r0]
	bl OS_LockCartridge
	ldr r1, _020E2C74 ; =0x04000204
	ldr r2, _020E2C68 ; =_02110FC4
	ldrh r0, [r1]
	ldr r6, [r2]
	ldrh r3, [r1]
	ldr r8, [r6, #0x10]
	ldr r6, _020E2C78 ; =0x021E4F28
	bic r3, r3, #3
	orr r3, r3, r8
	strh r3, [r1]
	ldr r2, [r2]
	mov r3, #0
	ldr r8, [r2, #4]
	ldr r2, _020E2C7C ; =0x021E4F48
	strh r8, [r6]
	ldrh sb, [r1, #4]
	and r8, r0, #3
	strh r3, [r1, #4]
	ldrh r0, [r6]
	str sb, [r2]
	cmp r0, #0
	beq _020E2C24
_020E2BF0:
	mov r0, r5
	mov r1, r7
	bl sub_020E2A60
	movs r4, r0
	bne _020E2C24
	ldrh r0, [r6]
	add r5, r5, #1
	add r7, r7, #1
	sub r0, r0, #1
	strh r0, [r6]
	ldrh r0, [r6]
	cmp r0, #0
	bne _020E2BF0
_020E2C24:
	ldr r3, _020E2C80 ; =0x04000208
	ldr r0, _020E2C7C ; =0x021E4F48
	ldrh r1, [r3]
	ldr r0, [r0]
	sub r2, r3, #4
	strh r0, [r3]
	ldrh r1, [r2]
	ldr r0, _020E2C70 ; =0x021E4F2C
	bic r1, r1, #3
	orr r1, r1, r8
	strh r1, [r2]
	ldrh r0, [r0]
	bl OS_UnlockCartridge
	mov r0, r4
	add sp, sp, #0x24
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_020E2C64: .word 0x000080FF
_020E2C68: .word _02110FC4
_020E2C6C: .word sub_020E2C84
_020E2C70: .word 0x021E4F2C
_020E2C74: .word 0x04000204
_020E2C78: .word 0x021E4F28
_020E2C7C: .word 0x021E4F48
_020E2C80: .word 0x04000208
	arm_func_end sub_020E2AB4

	arm_func_start sub_020E2C84
sub_020E2C84: ; 0x020E2C84
	ldr r1, _020E2CB4 ; =_02110FC4
	ldr r1, [r1]
	ldr r2, [r1, #4]
	cmp r2, #0
	beq _020E2CAC
_020E2C98:
	ldrb r1, [r0], #1
	cmp r1, #0xff
	bne _020E2CAC
	subs r2, r2, #1
	bne _020E2C98
_020E2CAC:
	mov r0, r2
	bx lr
	.align 2, 0
_020E2CB4: .word _02110FC4
	arm_func_end sub_020E2C84

	arm_func_start sub_020E2CB8
sub_020E2CB8: ; 0x020E2CB8
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, _020E2D34 ; =0x021E4F2C
	mov r5, r0
	ldrh r0, [r2]
	mov r4, r1
	bl OS_LockCartridge
	ldr ip, _020E2D38 ; =0x04000204
	ldr r0, _020E2D3C ; =_02110FC4
	ldrh r3, [ip]
	ldr r0, [r0]
	ldrh r1, [ip]
	ldr r2, [r0, #0x10]
	mov r0, r5
	bic r1, r1, #3
	orr r1, r1, r2
	strh r1, [ip]
	and r6, r3, #3
	mov r5, #0
	blx r4
	cmp r0, #0
	ldr r2, _020E2D38 ; =0x04000204
	ldr r0, _020E2D34 ; =0x021E4F2C
	ldrh r1, [r2]
	ldrne r5, _020E2D40 ; =0x00008004
	bic r1, r1, #3
	orr r1, r1, r6
	strh r1, [r2]
	ldrh r0, [r0]
	bl OS_UnlockCartridge
	mov r0, r5
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020E2D34: .word 0x021E4F2C
_020E2D38: .word 0x04000204
_020E2D3C: .word _02110FC4
_020E2D40: .word 0x00008004
	arm_func_end sub_020E2CB8

	arm_func_start sub_020E2D44
sub_020E2D44: ; 0x020E2D44
	stmdb sp!, {lr}
	sub sp, sp, #0x24
	add r0, sp, #0
	bl sub_020E2844
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	add sp, sp, #0x24
	ldmia sp!, {pc}
	arm_func_end sub_020E2D44

	arm_func_start sub_020E2D64
sub_020E2D64: ; 0x020E2D64
	stmdb sp!, {lr}
	sub sp, sp, #0x24
	strh r0, [sp, #0x20]
	add r0, sp, #0
	bl sub_020E292C
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	add sp, sp, #0x24
	ldmia sp!, {pc}
	stmdb sp!, {lr}
	sub sp, sp, #0x24
	strh r0, [sp, #0x20]
	add r0, sp, #0
	str r1, [sp, #0xc]
	bl sub_020E2AB4
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	add sp, sp, #0x24
	ldmia sp!, {pc}
	stmdb sp!, {lr}
	sub sp, sp, #0x24
	ldr r1, _020E2DD0 ; =sub_020E2844
	mov r2, r0
	add r0, sp, #0
	bl sub_020E366C
	add sp, sp, #0x24
	ldmia sp!, {pc}
	.align 2, 0
_020E2DD0: .word sub_020E2844
	arm_func_end sub_020E2D64

	arm_func_start sub_020E2DD4
sub_020E2DD4: ; 0x020E2DD4
	stmdb sp!, {lr}
	sub sp, sp, #0x24
	mov r2, r1
	strh r0, [sp, #0x20]
	ldr r1, _020E2DF8 ; =sub_020E292C
	add r0, sp, #0
	bl sub_020E366C
	add sp, sp, #0x24
	ldmia sp!, {pc}
	.align 2, 0
_020E2DF8: .word sub_020E292C
	arm_func_end sub_020E2DD4

	arm_func_start sub_020E2DFC
sub_020E2DFC: ; 0x020E2DFC
	stmdb sp!, {lr}
	sub sp, sp, #0x24
	str r1, [sp, #0xc]
	strh r0, [sp, #0x20]
	ldr r1, _020E2E20 ; =sub_020E2AB4
	add r0, sp, #0
	bl sub_020E366C
	add sp, sp, #0x24
	ldmia sp!, {pc}
	.align 2, 0
_020E2E20: .word sub_020E2AB4
	arm_func_end sub_020E2DFC

	arm_func_start sub_020E2E24
sub_020E2E24: ; 0x020E2E24
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _020E2EF0 ; =0x021E4F2C
	ldrh r0, [r0]
	bl OS_LockCartridge
	ldr r0, _020E2EF4 ; =0x04000204
	ldr r1, _020E2EF8 ; =_02110FC4
	ldrh r3, [r0]
	ldr r2, [r1]
	ldrh r1, [r0]
	ldr r4, [r2, #0x10]
	mov r2, #0
	bic r1, r1, #3
	orr r1, r1, r4
	strh r1, [r0]
	ldrh r4, [r0, #4]
	ldr r1, _020E2EFC ; =0x021E4F48
	ldr lr, _020E2F00 ; =0x0A005555
	strh r2, [r0, #4]
	str r4, [r1]
	mov r5, #0xaa
	ldr r4, _020E2F04 ; =0x0A002AAA
	strb r5, [lr]
	mov ip, #0x55
	strb ip, [r4]
	mov r2, #0x80
	strb r2, [lr]
	strb r5, [lr]
	strb ip, [r4]
	mov r2, #0x10
	strb r2, [lr]
	ldrh r2, [r0, #4]
	ldr r2, [r1]
	ldr r1, _020E2F08 ; =0x021E4F5C
	strh r2, [r0, #4]
	ldr r4, [r1]
	mov r0, #3
	mov r1, #0xa000000
	mov r2, #0xff
	and r5, r3, #3
	blx r4
	ldr r3, _020E2EF4 ; =0x04000204
	ldr r1, _020E2EF0 ; =0x021E4F2C
	ldrh r2, [r3]
	mov r4, r0
	bic r0, r2, #3
	orr r0, r0, r5
	strh r0, [r3]
	ldrh r0, [r1]
	bl OS_UnlockCartridge
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020E2EF0: .word 0x021E4F2C
_020E2EF4: .word 0x04000204
_020E2EF8: .word _02110FC4
_020E2EFC: .word 0x021E4F48
_020E2F00: .word 0x0A005555
_020E2F04: .word 0x0A002AAA
_020E2F08: .word 0x021E4F5C
	arm_func_end sub_020E2E24

	arm_func_start sub_020E2F0C
sub_020E2F0C: ; 0x020E2F0C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x28
	mov r5, r0
	ldmia r5!, {r0, r1, r2, r3}
	add r4, sp, #4
	stmia r4!, {r0, r1, r2, r3}
	ldmia r5!, {r0, r1, r2, r3}
	stmia r4!, {r0, r1, r2, r3}
	ldr r0, _020E3074 ; =_02110FC4
	ldr r1, [r5]
	ldr r0, [r0]
	str r1, [r4]
	ldrh r4, [sp, #0x24]
	ldrh r0, [r0, #0xa]
	cmp r4, r0
	addhs sp, sp, #0x28
	ldrhs r0, _020E3078 ; =0x000080FF
	ldmhsia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, _020E307C ; =0x021E4F2C
	ldrh r0, [r0]
	bl OS_LockCartridge
	ldr r5, _020E3080 ; =0x04000204
	ldr r0, _020E3074 ; =_02110FC4
	ldrh r3, [r5]
	ldr r2, [r0]
	ldrh r1, [r5]
	mov r0, r4, lsl #0xc
	ldr r2, [r2, #0x10]
	bic r1, r1, #3
	orr r1, r1, r2
	strh r1, [r5]
	and r1, r3, #3
	mov r0, r0, lsr #0x10
	str r1, [sp]
	bl sub_020E1BE4
	and sl, r4, #0xf
	mov r8, #0
	add r7, r5, #4
	ldr r5, _020E3084 ; =0x0A005555
	ldr r4, _020E3088 ; =0x021E4F48
	mov fp, r8
	mov r6, #0xaa
_020E2FB4:
	ldr r0, _020E3074 ; =_02110FC4
	ldrh r3, [r7]
	ldr r0, [r0]
	mov sb, #0x55
	ldrh r1, [r0, #8]
	mov r0, #2
	mov r2, #0xff
	strh fp, [r7]
	str r3, [r4]
	ldr r3, _020E308C ; =0x0A002AAA
	strb r6, [r5]
	strb sb, [r3]
	mov r3, #0x80
	strb r3, [r5]
	mov r1, sl, lsl r1
	ldr r3, _020E308C ; =0x0A002AAA
	strb r6, [r5]
	strb sb, [r3]
	add r1, r1, #0xa000000
	mov r3, #0x30
	strb r3, [r1]
	ldrh r3, [r7]
	ldr r3, [r4]
	strh r3, [r7]
	ldr r3, _020E3090 ; =0x021E4F5C
	ldr r3, [r3]
	blx r3
	mov sb, r0
	tst sb, #0xa000
	beq _020E3044
	cmp r8, #0
	bne _020E3044
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, lsr #0x10
	b _020E2FB4
_020E3044:
	ldr r2, _020E3080 ; =0x04000204
	ldr r1, _020E307C ; =0x021E4F2C
	ldrh r0, [r2]
	bic r3, r0, #3
	ldr r0, [sp]
	orr r0, r3, r0
	strh r0, [r2]
	ldrh r0, [r1]
	bl OS_UnlockCartridge
	mov r0, sb
	add sp, sp, #0x28
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020E3074: .word _02110FC4
_020E3078: .word 0x000080FF
_020E307C: .word 0x021E4F2C
_020E3080: .word 0x04000204
_020E3084: .word 0x0A005555
_020E3088: .word 0x021E4F48
_020E308C: .word 0x0A002AAA
_020E3090: .word 0x021E4F5C
	arm_func_end sub_020E2F0C

	arm_func_start sub_020E3094
sub_020E3094: ; 0x020E3094
	stmdb sp!, {r3, lr}
	ldr ip, _020E30DC ; =0x0A005555
	mov r3, #0xaa
	ldr r2, _020E30E0 ; =0x0A002AAA
	strb r3, [ip]
	mov r3, #0x55
	mov lr, r0
	strb r3, [r2]
	mov r0, #0xa0
	strb r0, [ip]
	ldrb r2, [lr]
	ldr r3, _020E30E4 ; =0x021E4F5C
	mov r0, #1
	strb r2, [r1]
	ldrb r2, [lr]
	ldr r3, [r3]
	blx r3
	ldmia sp!, {r3, pc}
	.align 2, 0
_020E30DC: .word 0x0A005555
_020E30E0: .word 0x0A002AAA
_020E30E4: .word 0x021E4F5C
	arm_func_end sub_020E3094

	arm_func_start sub_020E30E8
sub_020E30E8: ; 0x020E30E8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x24
	mov r5, r0
	ldmia r5!, {r0, r1, r2, r3}
	add r4, sp, #0
	stmia r4!, {r0, r1, r2, r3}
	ldmia r5!, {r0, r1, r2, r3}
	stmia r4!, {r0, r1, r2, r3}
	ldr r0, _020E3244 ; =_02110FC4
	ldr r1, [r5]
	ldr r0, [r0]
	str r1, [r4]
	ldrh r4, [sp, #0x20]
	ldrh r0, [r0, #0xa]
	ldr r7, [sp, #0xc]
	cmp r4, r0
	addhs sp, sp, #0x24
	ldrhs r0, _020E3248 ; =0x000080FF
	ldmhsia sp!, {r3, r4, r5, r6, r7, r8, pc}
	mov r0, r4
	bl sub_020E3280
	movs r6, r0
	addne sp, sp, #0x24
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, pc}
	ldr r0, _020E324C ; =0x021E4F2C
	ldrh r0, [r0]
	bl OS_LockCartridge
	ldr r5, _020E3250 ; =0x04000204
	ldr r0, _020E3244 ; =_02110FC4
	ldrh r3, [r5]
	ldr r2, [r0]
	ldrh r1, [r5]
	mov r0, r4, lsl #0xc
	ldr r2, [r2, #0x10]
	bic r1, r1, #3
	orr r1, r1, r2
	strh r1, [r5]
	mov r0, r0, lsr #0x10
	and r5, r3, #3
	bl sub_020E1BE4
	ldr r0, _020E3244 ; =_02110FC4
	ldr r8, _020E3254 ; =0x021E4F28
	ldr r2, [r0]
	ldr r1, _020E3258 ; =0x04000208
	ldr r0, [r2, #4]
	and r4, r4, #0xf
	strh r0, [r8]
	ldrh r3, [r2, #8]
	ldrh r2, [r1]
	mov r0, #0
	mov r3, r4, lsl r3
	strh r0, [r1]
	ldrh r1, [r8]
	ldr r0, _020E325C ; =0x021E4F48
	add r4, r3, #0xa000000
	str r2, [r0]
	cmp r1, #0
	beq _020E3204
_020E31D0:
	mov r0, r7
	mov r1, r4
	bl sub_020E3094
	movs r6, r0
	bne _020E3204
	ldrh r0, [r8]
	add r7, r7, #1
	add r4, r4, #1
	sub r0, r0, #1
	strh r0, [r8]
	ldrh r0, [r8]
	cmp r0, #0
	bne _020E31D0
_020E3204:
	ldr r3, _020E3258 ; =0x04000208
	ldr r0, _020E325C ; =0x021E4F48
	ldrh r1, [r3]
	ldr r0, [r0]
	sub r2, r3, #4
	strh r0, [r3]
	ldrh r1, [r2]
	ldr r0, _020E324C ; =0x021E4F2C
	bic r1, r1, #3
	orr r1, r1, r5
	strh r1, [r2]
	ldrh r0, [r0]
	bl OS_UnlockCartridge
	mov r0, r6
	add sp, sp, #0x24
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020E3244: .word _02110FC4
_020E3248: .word 0x000080FF
_020E324C: .word 0x021E4F2C
_020E3250: .word 0x04000204
_020E3254: .word 0x021E4F28
_020E3258: .word 0x04000208
_020E325C: .word 0x021E4F48
	arm_func_end sub_020E30E8

	arm_func_start sub_020E3260
sub_020E3260: ; 0x020E3260
	stmdb sp!, {lr}
	sub sp, sp, #0x24
	add r0, sp, #0
	bl sub_020E2E24
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	add sp, sp, #0x24
	ldmia sp!, {pc}
	arm_func_end sub_020E3260

	arm_func_start sub_020E3280
sub_020E3280: ; 0x020E3280
	stmdb sp!, {lr}
	sub sp, sp, #0x24
	strh r0, [sp, #0x20]
	add r0, sp, #0
	bl sub_020E2F0C
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	add sp, sp, #0x24
	ldmia sp!, {pc}
	stmdb sp!, {lr}
	sub sp, sp, #0x24
	strh r0, [sp, #0x20]
	add r0, sp, #0
	str r1, [sp, #0xc]
	bl sub_020E30E8
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	add sp, sp, #0x24
	ldmia sp!, {pc}
	stmdb sp!, {lr}
	sub sp, sp, #0x24
	ldr r1, _020E32EC ; =sub_020E2E24
	mov r2, r0
	add r0, sp, #0
	bl sub_020E366C
	add sp, sp, #0x24
	ldmia sp!, {pc}
	.align 2, 0
_020E32EC: .word sub_020E2E24
	arm_func_end sub_020E3280

	arm_func_start sub_020E32F0
sub_020E32F0: ; 0x020E32F0
	stmdb sp!, {lr}
	sub sp, sp, #0x24
	mov r2, r1
	strh r0, [sp, #0x20]
	ldr r1, _020E3314 ; =sub_020E2F0C
	add r0, sp, #0
	bl sub_020E366C
	add sp, sp, #0x24
	ldmia sp!, {pc}
	.align 2, 0
_020E3314: .word sub_020E2F0C
	arm_func_end sub_020E32F0

	arm_func_start sub_020E3318
sub_020E3318: ; 0x020E3318
	stmdb sp!, {lr}
	sub sp, sp, #0x24
	str r1, [sp, #0xc]
	strh r0, [sp, #0x20]
	ldr r1, _020E333C ; =sub_020E30E8
	add r0, sp, #0
	bl sub_020E366C
	add sp, sp, #0x24
	ldmia sp!, {pc}
	.align 2, 0
_020E333C: .word sub_020E30E8
	arm_func_end sub_020E3318

	arm_func_start sub_020E3340
sub_020E3340: ; 0x020E3340
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x24
	mov r5, r0
	ldmia r5!, {r0, r1, r2, r3}
	add r4, sp, #0
	stmia r4!, {r0, r1, r2, r3}
	ldmia r5!, {r0, r1, r2, r3}
	stmia r4!, {r0, r1, r2, r3}
	ldr r0, _020E345C ; =_02110FC4
	ldr r1, [r5]
	ldr r0, [r0]
	str r1, [r4]
	ldrh r4, [sp, #0x20]
	ldrh r0, [r0, #0xa]
	ldr r7, [sp, #0xc]
	cmp r4, r0
	addhs sp, sp, #0x24
	ldrhs r0, _020E3460 ; =0x000080FF
	ldmhsia sp!, {r3, r4, r5, r6, r7, r8, pc}
	mov r0, r4
	bl sub_020E2D64
	movs r6, r0
	addne sp, sp, #0x24
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, pc}
	ldr r0, _020E3464 ; =0x021E4F2C
	ldrh r0, [r0]
	bl OS_LockCartridge
	ldr r5, _020E3468 ; =0x04000204
	ldr r0, _020E345C ; =_02110FC4
	ldrh r3, [r5]
	ldr r2, [r0]
	ldrh r1, [r5]
	ldr r2, [r2, #0x10]
	ldr r8, _020E346C ; =0x021E4F28
	bic r1, r1, #3
	orr r1, r1, r2
	strh r1, [r5]
	ldr r1, [r0]
	and r5, r3, #3
	ldr r0, [r1, #4]
	strh r0, [r8]
	ldrh r1, [r1, #8]
	ldrh r0, [r8]
	mov r1, r4, lsl r1
	cmp r0, #0
	add r4, r1, #0xa000000
	beq _020E3430
_020E33FC:
	mov r0, r7
	mov r1, r4
	bl sub_020E2A60
	movs r6, r0
	bne _020E3430
	ldrh r0, [r8]
	add r7, r7, #1
	add r4, r4, #1
	sub r0, r0, #1
	strh r0, [r8]
	ldrh r0, [r8]
	cmp r0, #0
	bne _020E33FC
_020E3430:
	ldr r2, _020E3468 ; =0x04000204
	ldr r0, _020E3464 ; =0x021E4F2C
	ldrh r1, [r2]
	bic r1, r1, #3
	orr r1, r1, r5
	strh r1, [r2]
	ldrh r0, [r0]
	bl OS_UnlockCartridge
	mov r0, r6
	add sp, sp, #0x24
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020E345C: .word _02110FC4
_020E3460: .word 0x000080FF
_020E3464: .word 0x021E4F2C
_020E3468: .word 0x04000204
_020E346C: .word 0x021E4F28
	arm_func_end sub_020E3340

	arm_func_start sub_020E3470
sub_020E3470: ; 0x020E3470
	stmdb sp!, {lr}
	sub sp, sp, #0x24
	strh r0, [sp, #0x20]
	add r0, sp, #0
	str r1, [sp, #0xc]
	bl sub_020E3340
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	add sp, sp, #0x24
	ldmia sp!, {pc}
	stmdb sp!, {lr}
	sub sp, sp, #0x24
	str r1, [sp, #0xc]
	strh r0, [sp, #0x20]
	ldr r1, _020E34BC ; =sub_020E3340
	add r0, sp, #0
	bl sub_020E366C
	add sp, sp, #0x24
	ldmia sp!, {pc}
	.align 2, 0
_020E34BC: .word sub_020E3340
	arm_func_end sub_020E3470

	arm_func_start sub_020E34C0
sub_020E34C0: ; 0x020E34C0
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r5, r0
	bl OS_DisableInterrupts
	ldr r1, _020E353C ; =0x021E4F68
	mov r4, r0
	ldr r0, [r1]
	cmp r0, #0
	bne _020E352C
	add r0, r5, #0xc4
	str r5, [r1]
	bl sub_020E3568
	ldr r0, _020E3540 ; =0x021E4F6C
	bl sub_020E3568
	mov r0, #0
	str r0, [r5, #0xc0]
	mov r2, #0x400
	ldr r1, _020E3544 ; =sub_020E357C
	ldr r3, _020E3548 ; =0x021E5390
	mov r0, r5
	str r2, [sp]
	mov r2, #0x14
	str r2, [sp, #4]
	mov r2, r5
	bl OS_CreateThread
	mov r0, r5
	bl OS_WakeupThreadDirect
_020E352C:
	mov r0, r4
	bl OS_RestoreInterrupts
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020E353C: .word 0x021E4F68
_020E3540: .word 0x021E4F6C
_020E3544: .word sub_020E357C
_020E3548: .word 0x021E5390
	arm_func_end sub_020E34C0

	arm_func_start sub_020E354C
sub_020E354C: ; 0x020E354C
	ldr r0, _020E3564 ; =0x021E4F68
	ldr r0, [r0]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	bx lr
	.align 2, 0
_020E3564: .word 0x021E4F68
	arm_func_end sub_020E354C

	arm_func_start sub_020E3568
sub_020E3568: ; 0x020E3568
	ldr ip, _020E3578 ; =MI_CpuFill8
	mov r1, #0
	mov r2, #0x24
	bx ip
	.align 2, 0
_020E3578: .word MI_CpuFill8
	arm_func_end sub_020E3568

	arm_func_start sub_020E357C
sub_020E357C: ; 0x020E357C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x24
	mov r4, #0
	mov r8, r0
	add r6, sp, #0
	mov sl, r4
	mov sb, r4
	mov r5, r4
	mov fp, #0x24
_020E35A0:
	mov r0, r6
	mov r1, r5
	mov r2, fp
	bl MI_CpuFill8
	bl OS_DisableInterrupts
	ldr r1, [r8, #0xc0]
	mov r7, r0
	cmp r1, #0
	bne _020E35D8
_020E35C4:
	mov r0, r4
	bl OS_SleepThread
	ldr r0, [r8, #0xc0]
	cmp r0, #0
	beq _020E35C4
_020E35D8:
	ldr lr, [r8, #0xc0]
	add ip, sp, #0
	ldmia lr!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	ldmia lr!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	ldr r1, [lr]
	mov r0, r7
	str r1, [ip]
	bl OS_RestoreInterrupts
	ldr r1, [sp]
	cmp r1, #0
	beq _020E3618
	mov r0, r6
	blx r1
	str r0, [sp, #8]
_020E3618:
	bl OS_DisableInterrupts
	ldr r2, [sp, #4]
	ldr r1, _020E3668 ; =0x021E4F68
	mov r7, r0
	strb sl, [r1, #0x26]
	cmp r2, #0
	beq _020E363C
	mov r0, r6
	blx r2
_020E363C:
	ldr r0, _020E3668 ; =0x021E4F68
	ldr r0, [r0]
	cmp r0, #0
	beq _020E365C
	mov r0, r7
	str sb, [r8, #0xc0]
	bl OS_RestoreInterrupts
	b _020E35A0
_020E365C:
	bl OS_ExitThread
	add sp, sp, #0x24
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020E3668: .word 0x021E4F68
	arm_func_end sub_020E357C

	arm_func_start sub_020E366C
sub_020E366C: ; 0x020E366C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r3, _020E370C ; =0x021E4F68
	mov r7, r0
	mov r5, r1
	mov r6, r2
	ldr r4, [r3]
	bl sub_020E354C
	cmp r0, #0
	bne _020E3694
	bl OS_Terminate
_020E3694:
	ldr r0, _020E370C ; =0x021E4F68
	ldrb r0, [r0, #0x26]
	cmp r0, #0
	beq _020E36A8
	bl OS_Terminate
_020E36A8:
	bl OS_DisableInterrupts
	mov r1, #1
	strb r1, [r7, #0x22]
	str r5, [r7]
	add r1, r4, #0xc4
	cmp r7, r1
	mov r5, r0
	ldreq r0, _020E370C ; =0x021E4F68
	str r6, [r7, #4]
	moveq r1, #0
	streq r1, [r0]
	ldr ip, _020E3710 ; =0x021E4F6C
	ldmia r7!, {r0, r1, r2, r3}
	mov r6, ip
	stmia ip!, {r0, r1, r2, r3}
	ldmia r7!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	ldr r1, [r7]
	mov r0, r4
	str r1, [ip]
	str r6, [r4, #0xc0]
	bl OS_WakeupThreadDirect
	mov r0, r5
	bl OS_RestoreInterrupts
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020E370C: .word 0x021E4F68
_020E3710: .word 0x021E4F6C
	arm_func_end sub_020E366C

	arm_func_start sub_020E3714
sub_020E3714: ; 0x020E3714
	ldr r1, _020E374C ; =0x55555555
	ldr r2, _020E3750 ; =0x33333333
	and r1, r1, r0, lsr #1
	sub r0, r0, r1
	and r1, r0, r2
	and r0, r2, r0, lsr #2
	add r1, r1, r0
	ldr r0, _020E3754 ; =0x0F0F0F0F
	add r1, r1, r1, lsr #4
	and r0, r1, r0
	add r0, r0, r0, lsr #8
	add r0, r0, r0, lsr #16
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_020E374C: .word 0x55555555
_020E3750: .word 0x33333333
_020E3754: .word 0x0F0F0F0F
	arm_func_end sub_020E3714

	arm_func_start sub_020E3758
sub_020E3758: ; 0x020E3758
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x58
	mov r6, r0
	add r0, sp, #0
	mov r5, r1
	mov r4, r2
	bl sub_020D8E00
	add r0, sp, #0
	mov r1, r5
	mov r2, r4
	bl sub_020D8E40
	add r1, sp, #0
	mov r0, r6
	bl sub_020D8F08
	add sp, sp, #0x58
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020E3758

	arm_func_start sub_020E3798
sub_020E3798: ; 0x020E3798
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x68
	mov r6, r0
	add r0, sp, #0
	mov r5, r1
	mov r4, r2
	bl sub_020D9374
	add r0, sp, #0
	mov r1, r5
	mov r2, r4
	bl sub_020D93C4
	add r0, sp, #0
	mov r1, r6
	bl sub_020D9518
	add sp, sp, #0x68
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020E3798

	arm_func_start sub_020E37D8
sub_020E37D8: ; 0x020E37D8
	stmdb sp!, {r3, lr}
	mov ip, #0
	mov r2, ip
_020E37E4:
	mov r3, ip
	mov lr, r2
_020E37EC:
	tst r3, #0x80
	eorne r3, r1, r3, lsl #1
	add lr, lr, #1
	moveq r3, r3, lsl #1
	cmp lr, #8
	blo _020E37EC
	strb r3, [r0, ip]
	add ip, ip, #1
	cmp ip, #0x100
	blo _020E37E4
	ldmia sp!, {r3, pc}
	arm_func_end sub_020E37D8

	arm_func_start sub_020E3818
sub_020E3818: ; 0x020E3818
	stmdb sp!, {r4, lr}
	cmp r3, #0
	ldrb lr, [r1]
	mov r4, #0
	bls _020E3848
_020E382C:
	ldrb ip, [r2], #1
	add r4, r4, #1
	cmp r4, r3
	eor ip, lr, ip
	and ip, ip, #0xff
	ldrb lr, [r0, ip]
	blo _020E382C
_020E3848:
	strb lr, [r1]
	ldmia sp!, {r4, pc}
	arm_func_end sub_020E3818

	arm_func_start MATHi_CRC16InitTable
MATHi_CRC16InitTable: ; 0x020E3850
	stmdb sp!, {r4, lr}
	mov lr, #0
	mov r4, lr
	mov r3, lr
_020E3860:
	mov ip, r4
	mov r2, r3
_020E3868:
	tst ip, #0x8000
	eorne ip, r1, ip, lsl #1
	add r2, r2, #1
	moveq ip, ip, lsl #1
	cmp r2, #8
	blo _020E3868
	mov r2, lr, lsl #1
	add lr, lr, #1
	strh ip, [r0, r2]
	cmp lr, #0x100
	add r4, r4, #0x100
	blo _020E3860
	ldmia sp!, {r4, pc}
	arm_func_end MATHi_CRC16InitTable

	arm_func_start sub_020E389C
sub_020E389C: ; 0x020E389C
	stmdb sp!, {r3, lr}
	mov lr, #0
	mov r3, lr
_020E38A8:
	mov ip, lr
	mov r2, r3
_020E38B0:
	tst ip, #1
	eorne ip, r1, ip, lsr #1
	add r2, r2, #1
	moveq ip, ip, lsr #1
	cmp r2, #8
	blo _020E38B0
	mov r2, lr, lsl #1
	add lr, lr, #1
	strh ip, [r0, r2]
	cmp lr, #0x100
	blo _020E38A8
	ldmia sp!, {r3, pc}
	arm_func_end sub_020E389C

	arm_func_start sub_020E38E0
sub_020E38E0: ; 0x020E38E0
	stmdb sp!, {r4, lr}
	cmp r3, #0
	ldrh lr, [r1]
	mov r4, #0
	bls _020E3918
_020E38F4:
	ldrb ip, [r2], #1
	add r4, r4, #1
	cmp r4, r3
	eor ip, ip, lr, lsr #8
	mov ip, ip, lsl #0x18
	mov ip, ip, lsr #0x17
	ldrh ip, [r0, ip]
	eor lr, ip, lr, lsl #8
	blo _020E38F4
_020E3918:
	strh lr, [r1]
	ldmia sp!, {r4, pc}
	arm_func_end sub_020E38E0

	arm_func_start sub_020E3920
sub_020E3920: ; 0x020E3920
	stmdb sp!, {r4, lr}
	cmp r3, #0
	ldrh lr, [r1]
	mov r4, #0
	bls _020E3958
_020E3934:
	ldrb ip, [r2], #1
	add r4, r4, #1
	cmp r4, r3
	eor ip, lr, ip
	mov ip, ip, lsl #0x18
	mov ip, ip, lsr #0x17
	ldrh ip, [r0, ip]
	eor lr, ip, lr, lsr #8
	blo _020E3934
_020E3958:
	strh lr, [r1]
	ldmia sp!, {r4, pc}
	arm_func_end sub_020E3920

	arm_func_start sub_020E3960
sub_020E3960: ; 0x020E3960
	stmdb sp!, {r3, lr}
	mov ip, #0
	mov r2, ip
_020E396C:
	mov r3, ip
	mov lr, r2
_020E3974:
	tst r3, #1
	eorne r3, r1, r3, lsr #1
	add lr, lr, #1
	moveq r3, r3, lsr #1
	cmp lr, #8
	blo _020E3974
	str r3, [r0, ip, lsl #2]
	add ip, ip, #1
	cmp ip, #0x100
	blo _020E396C
	ldmia sp!, {r3, pc}
	arm_func_end sub_020E3960

	arm_func_start sub_020E39A0
sub_020E39A0: ; 0x020E39A0
	stmdb sp!, {r4, lr}
	cmp r3, #0
	ldr lr, [r1]
	mov r4, #0
	bls _020E39D4
_020E39B4:
	ldrb ip, [r2], #1
	add r4, r4, #1
	cmp r4, r3
	eor ip, lr, ip
	and ip, ip, #0xff
	ldr ip, [r0, ip, lsl #2]
	eor lr, ip, lr, lsr #8
	blo _020E39B4
_020E39D4:
	str lr, [r1]
	ldmia sp!, {r4, pc}
	arm_func_end sub_020E39A0

	arm_func_start sub_020E39DC
sub_020E39DC: ; 0x020E39DC
	stmdb sp!, {r3, lr}
	mov lr, r1
	mov ip, #0
	mov r3, r2
	add r1, sp, #0
	mov r2, lr
	strb ip, [sp]
	bl sub_020E3818
	ldrb r0, [sp]
	ldmia sp!, {r3, pc}
	arm_func_end sub_020E39DC

	arm_func_start sub_020E3A04
sub_020E3A04: ; 0x020E3A04
	stmdb sp!, {r3, lr}
	mov lr, r1
	mov ip, #0
	mov r3, r2
	add r1, sp, #0
	mov r2, lr
	strh ip, [sp]
	bl sub_020E3920
	ldrh r0, [sp]
	ldmia sp!, {r3, pc}
	arm_func_end sub_020E3A04

	arm_func_start MATH_CalcCRC16CCITT
MATH_CalcCRC16CCITT: ; 0x020E3A2C
	stmdb sp!, {r3, lr}
	ldr ip, _020E3A54 ; =0x0000FFFF
	mov lr, r1
	mov r3, r2
	add r1, sp, #0
	mov r2, lr
	strh ip, [sp]
	bl sub_020E38E0
	ldrh r0, [sp]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020E3A54: .word 0x0000FFFF
	arm_func_end MATH_CalcCRC16CCITT

	arm_func_start sub_020E3A58
sub_020E3A58: ; 0x020E3A58
	stmdb sp!, {r3, lr}
	mov lr, r1
	mvn ip, #0
	mov r3, r2
	add r1, sp, #0
	mov r2, lr
	str ip, [sp]
	bl sub_020E39A0
	ldr r0, [sp]
	mvn r0, r0
	ldmia sp!, {r3, pc}
	arm_func_end sub_020E3A58

	arm_func_start sub_020E3A84
sub_020E3A84: ; 0x020E3A84
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	cmp r1, #1
	ble _020E3D6C
	ldr r4, [sp, #0x24]
	mov fp, r3
	mov r8, r2
	cmp r4, #0
	bne _020E3ABC
	clz r2, r1
	rsb r2, r2, #0x20
	mov r2, r2, lsl #3
	sub sp, sp, r2
	mov r4, sp
	str r2, [sp, #-4]!
_020E3ABC:
	sub r1, r1, #1
	mla r1, r1, r8, r0
	mov r5, r4
	str r0, [r4], #4
	str r1, [r4], #4
	clz r2, r8
	rsb r2, r2, #0x20
	str r2, [sp, #-4]!
_020E3ADC:
	cmp r4, r5
	beq _020E3D3C
	ldr r7, [r4, #-4]
	ldr r6, [r4, #-8]!
	sub r2, r7, r6
	cmp r2, r8
	bne _020E3B50
	mov r0, r6
	mov r1, r7
	blx fp
	cmp r0, #0
	ble _020E3ADC
	mov r0, r8
	tst r0, #3
	beq _020E3B34
_020E3B18:
	ldrb r1, [r6]
	subs r0, r0, #1
	swpb r1, r1, [r7]
	add r7, r7, #1
	strb r1, [r6], #1
	bne _020E3B18
	b _020E3ADC
_020E3B34:
	ldr r1, [r6]
	subs r0, r0, #4
	swp r1, r1, [r7]
	add r7, r7, #4
	str r1, [r6], #4
	bne _020E3B34
	b _020E3ADC
_020E3B50:
	ldr r3, [sp]
	sub r2, r7, r6
	mov r2, r2, lsr r3
	mla r2, r2, r8, r6
	mov r3, r6
	mov r0, r8
	mov r2, r2
	tst r0, #3
	beq _020E3B90
_020E3B74:
	ldrb r1, [r2]
	subs r0, r0, #1
	swpb r1, r1, [r3]
	add r3, r3, #1
	strb r1, [r2], #1
	bne _020E3B74
	b _020E3BA8
_020E3B90:
	ldr r1, [r2]
	subs r0, r0, #4
	swp r1, r1, [r3]
	add r3, r3, #4
	str r1, [r2], #4
	bne _020E3B90
_020E3BA8:
	mov sb, r6
	mov sl, r7
	add sb, sb, r8
_020E3BB4:
	cmp sb, r7
	bge _020E3BDC
	mov r1, r6
	mov r0, sb
	blx fp
	cmp r0, #0
	blt _020E3BD4
	b _020E3BD8
_020E3BD4:
	add sb, sb, r8
_020E3BD8:
	blt _020E3BB4
_020E3BDC:
	mov r1, r6
	mov r0, sl
	blx fp
	cmp r0, #0
	bgt _020E3BF4
	b _020E3BF8
_020E3BF4:
	sub sl, sl, r8
_020E3BF8:
	bgt _020E3BDC
	cmp sb, sl
	bge _020E3C5C
	mov r2, sb
	mov r3, sl
	mov r0, r8
	tst r0, #3
	beq _020E3C34
_020E3C18:
	ldrb r1, [r2]
	subs r0, r0, #1
	swpb r1, r1, [r3]
	add r3, r3, #1
	strb r1, [r2], #1
	bne _020E3C18
	b _020E3C4C
_020E3C34:
	ldr r1, [r2]
	subs r0, r0, #4
	swp r1, r1, [r3]
	add r3, r3, #4
	str r1, [r2], #4
	bne _020E3C34
_020E3C4C:
	add sb, sb, r8
	sub sl, sl, r8
	cmp sb, sl
	ble _020E3BB4
_020E3C5C:
	mov r2, r6
	mov r3, sl
	mov r0, r8
	tst r0, #3
	beq _020E3C8C
_020E3C70:
	ldrb r1, [r2]
	subs r0, r0, #1
	swpb r1, r1, [r3]
	add r3, r3, #1
	strb r1, [r2], #1
	bne _020E3C70
	b _020E3CA4
_020E3C8C:
	ldr r1, [r2]
	subs r0, r0, #4
	swp r1, r1, [r3]
	add r3, r3, #4
	str r1, [r2], #4
	bne _020E3C8C
_020E3CA4:
	sub r2, sl, r6
	sub r3, r7, sl
	cmp r2, r3
	ble _020E3CF8
	sub r2, sl, r8
	cmp r6, r2
	blt _020E3CC4
	b _020E3CC8
_020E3CC4:
	str r6, [r4], #4
_020E3CC8:
	blt _020E3CD0
	b _020E3CD4
_020E3CD0:
	str r2, [r4], #4
_020E3CD4:
	add r2, sl, r8
	cmp r2, r7
	blt _020E3CE4
	b _020E3CE8
_020E3CE4:
	str r2, [r4], #4
_020E3CE8:
	blt _020E3CF0
	b _020E3CF4
_020E3CF0:
	str r7, [r4], #4
_020E3CF4:
	b _020E3ADC
_020E3CF8:
	add r2, sl, r8
	cmp r2, r7
	blt _020E3D08
	b _020E3D0C
_020E3D08:
	str r2, [r4], #4
_020E3D0C:
	blt _020E3D14
	b _020E3D18
_020E3D14:
	str r7, [r4], #4
_020E3D18:
	sub r2, sl, r8
	cmp r6, r2
	blt _020E3D28
	b _020E3D2C
_020E3D28:
	str r6, [r4], #4
_020E3D2C:
	blt _020E3D34
	b _020E3D38
_020E3D34:
	str r2, [r4], #4
_020E3D38:
	b _020E3ADC
_020E3D3C:
	add sp, sp, #4
	sub r4, r4, #4
	cmp r4, sp
	beq _020E3D50
	b _020E3D54
_020E3D50:
	ldr r0, [sp]
_020E3D54:
	beq _020E3D5C
	b _020E3D60
_020E3D5C:
	add r0, r0, #4
_020E3D60:
	beq _020E3D68
	b _020E3D6C
_020E3D68:
	add sp, sp, r0
_020E3D6C:
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	arm_func_end sub_020E3A84

	arm_func_start sub_020E3D74
sub_020E3D74: ; 0x020E3D74
	stmdb sp!, {r4, lr}
	sub ip, r2, #1
	mov r4, r1
	cmp ip, #0
	mov lr, #0
	ble _020E3DB0
_020E3D8C:
	ldrsb r3, [r4]
	strb r3, [r0, lr]
	ldrsb r3, [r4]
	cmp r3, #0
	beq _020E3DB0
	add lr, lr, #1
	cmp lr, ip
	add r4, r4, #1
	blt _020E3D8C
_020E3DB0:
	sub r3, r2, #1
	cmp lr, r3
	blt _020E3DC8
	cmp r2, #0
	movne r2, #0
	strneb r2, [r0, lr]
_020E3DC8:
	mov r0, r1
	bl sub_020E3DD4
	ldmia sp!, {r4, pc}
	arm_func_end sub_020E3D74

	arm_func_start sub_020E3DD4
sub_020E3DD4: ; 0x020E3DD4
	ldrsb r1, [r0]
	mov r2, #0
	cmp r1, #0
	beq _020E3DF4
_020E3DE4:
	add r2, r2, #1
	ldrsb r1, [r0, r2]
	cmp r1, #0
	bne _020E3DE4
_020E3DF4:
	mov r0, r2
	bx lr
	arm_func_end sub_020E3DD4

	arm_func_start sub_020E3DFC
sub_020E3DFC: ; 0x020E3DFC
	b _020E3E08
_020E3E00:
	add r0, r0, #1
	add r1, r1, #1
_020E3E08:
	ldrsb r3, [r1]
	ldrsb r2, [r0]
	cmp r2, r3
	bne _020E3E20
	cmp r2, #0
	bne _020E3E00
_020E3E20:
	sub r0, r2, r3
	bx lr
	arm_func_end sub_020E3DFC

	arm_func_start sub_020E3E28
sub_020E3E28: ; 0x020E3E28
	stmdb sp!, {r3, lr}
	cmp r2, #0
	beq _020E3E60
	cmp r2, #0
	mov lr, #0
	ble _020E3E60
_020E3E40:
	ldrb ip, [r0, lr]
	ldrb r3, [r1, lr]
	cmp ip, r3
	subne r0, ip, r3
	ldmneia sp!, {r3, pc}
	add lr, lr, #1
	cmp lr, r2
	blt _020E3E40
_020E3E60:
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_020E3E28

	arm_func_start sub_020E3E68
sub_020E3E68: ; 0x020E3E68
	ldr r2, [r0]
	cmp r2, #0
	beq _020E3E88
	ldr r2, [r0, #4]
	strb r1, [r2]
	ldr r1, [r0]
	sub r1, r1, #1
	str r1, [r0]
_020E3E88:
	ldr r1, [r0, #4]
	add r1, r1, #1
	str r1, [r0, #4]
	bx lr
	arm_func_end sub_020E3E68

	arm_func_start sub_020E3E98
sub_020E3E98: ; 0x020E3E98
	stmdb sp!, {r3, lr}
	cmp r2, #0
	ldmleia sp!, {r3, pc}
	ldr lr, [r0]
	mov ip, #0
	cmp lr, r2
	movhi lr, r2
	cmp lr, #0
	bls _020E3ED0
_020E3EBC:
	ldr r3, [r0, #4]
	strb r1, [r3, ip]
	add ip, ip, #1
	cmp ip, lr
	blo _020E3EBC
_020E3ED0:
	ldr r1, [r0]
	sub r1, r1, lr
	str r1, [r0]
	ldr r1, [r0, #4]
	add r1, r1, r2
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	arm_func_end sub_020E3E98

	arm_func_start sub_020E3EEC
sub_020E3EEC: ; 0x020E3EEC
	stmdb sp!, {r4, lr}
	cmp r2, #0
	ldmleia sp!, {r4, pc}
	ldr r4, [r0]
	mov lr, #0
	cmp r4, r2
	movhi r4, r2
	cmp r4, #0
	bls _020E3F28
_020E3F10:
	ldrsb ip, [r1, lr]
	ldr r3, [r0, #4]
	strb ip, [r3, lr]
	add lr, lr, #1
	cmp lr, r4
	blo _020E3F10
_020E3F28:
	ldr r1, [r0]
	sub r1, r1, r4
	str r1, [r0]
	ldr r1, [r0, #4]
	add r1, r1, r2
	str r1, [r0, #4]
	ldmia sp!, {r4, pc}
	arm_func_end sub_020E3EEC

	arm_func_start STD_TVSNPrintf
STD_TVSNPrintf: ; 0x020E3F44
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x30
	mov sb, r2
	str r1, [sp, #0xc]
	str r0, [sp, #0x14]
	str r0, [sp, #0x10]
	ldrsb r0, [sb]
	str r1, [sp]
	mov fp, r3
	cmp r0, #0
	beq _020E4770
_020E3F70:
	ldrsb r1, [sb]
	and r0, r1, #0xff
	eor r0, r0, #0x20
	sub r0, r0, #0xa1
	cmp r0, #0x3c
	bhs _020E3FAC
	add r0, sp, #0xc
	bl sub_020E3E68
	ldrsb r1, [sb, #1]!
	cmp r1, #0
	beq _020E4764
	add r0, sp, #0xc
	add sb, sb, #1
	bl sub_020E3E68
	b _020E4764
_020E3FAC:
	cmp r1, #0x25
	beq _020E3FC4
	add r0, sp, #0xc
	add sb, sb, #1
	bl sub_020E3E68
	b _020E4764
_020E3FC4:
	mov r5, #0
	mov sl, r5
	mov r2, sb
	sub r6, r5, #1
	mov r0, #0xa
	mov r3, #0x57
_020E3FDC:
	ldrsb r4, [sb, #1]!
	cmp r4, #0x20
	bgt _020E3FF0
	beq _020E402C
	b _020E4044
_020E3FF0:
	cmp r4, #0x30
	bgt _020E4044
	cmp r4, #0x2b
	blt _020E4044
	beq _020E4018
	cmp r4, #0x2d
	beq _020E4034
	cmp r4, #0x30
	beq _020E403C
	b _020E4044
_020E4018:
	ldrsb r1, [sb, #-1]
	cmp r1, #0x20
	bne _020E4044
	orr r5, r5, #2
	b _020E3FDC
_020E402C:
	orr r5, r5, #1
	b _020E3FDC
_020E4034:
	orr r5, r5, #8
	b _020E3FDC
_020E403C:
	orr r5, r5, #0x10
	b _020E3FDC
_020E4044:
	cmp r4, #0x2a
	bne _020E4068
	add fp, fp, #4
	ldr sl, [fp, #-4]
	add sb, sb, #1
	cmp sl, #0
	rsblt sl, sl, #0
	orrlt r5, r5, #8
	b _020E4090
_020E4068:
	mov r1, #0xa
	b _020E407C
_020E4070:
	ldrsb r4, [sb], #1
	mla r4, sl, r1, r4
	sub sl, r4, #0x30
_020E407C:
	ldrsb r4, [sb]
	cmp r4, #0x30
	blt _020E4090
	cmp r4, #0x39
	ble _020E4070
_020E4090:
	ldrsb r1, [sb]
	cmp r1, #0x2e
	bne _020E40EC
	ldrsb r1, [sb, #1]!
	mov r6, #0
	cmp r1, #0x2a
	bne _020E40C4
	add fp, fp, #4
	ldr r6, [fp, #-4]
	add sb, sb, #1
	cmp r6, #0
	mvnlt r6, #0
	b _020E40EC
_020E40C4:
	mov r1, #0xa
	b _020E40D8
_020E40CC:
	ldrsb r4, [sb], #1
	mla r4, r6, r1, r4
	sub r6, r4, #0x30
_020E40D8:
	ldrsb r4, [sb]
	cmp r4, #0x30
	blt _020E40EC
	cmp r4, #0x39
	ble _020E40CC
_020E40EC:
	ldrsb r1, [sb]
	cmp r1, #0x68
	beq _020E4104
	cmp r1, #0x6c
	beq _020E411C
	b _020E4130
_020E4104:
	ldrsb r1, [sb, #1]!
	cmp r1, #0x68
	orrne r5, r5, #0x40
	addeq sb, sb, #1
	orreq r5, r5, #0x100
	b _020E4130
_020E411C:
	ldrsb r1, [sb, #1]!
	cmp r1, #0x6c
	orrne r5, r5, #0x20
	addeq sb, sb, #1
	orreq r5, r5, #0x80
_020E4130:
	ldrsb r1, [sb]
	cmp r1, #0x69
	bgt _020E4174
	cmp r1, #0x63
	blt _020E4158
	beq _020E41E4
	cmp r1, #0x64
	cmpne r1, #0x69
	beq _020E439C
	b _020E4380
_020E4158:
	cmp r1, #0x25
	bgt _020E4168
	beq _020E4364
	b _020E4380
_020E4168:
	cmp r1, #0x58
	beq _020E41D0
	b _020E4380
_020E4174:
	cmp r1, #0x6e
	bgt _020E4184
	beq _020E430C
	b _020E4380
_020E4184:
	sub r1, r1, #0x6f
	cmp r1, #9
	addls pc, pc, r1, lsl #2
	b _020E4380
_020E4194: ; jump table
	b _020E41BC ; case 0
	b _020E41D8 ; case 1
	b _020E4380 ; case 2
	b _020E4380 ; case 3
	b _020E4258 ; case 4
	b _020E4380 ; case 5
	b _020E41C8 ; case 6
	b _020E4380 ; case 7
	b _020E4380 ; case 8
	b _020E4394 ; case 9
_020E41BC:
	orr r5, r5, #0x1000
	mov r0, #8
	b _020E439C
_020E41C8:
	orr r5, r5, #0x1000
	b _020E439C
_020E41D0:
	mov r3, #0x37
	b _020E4394
_020E41D8:
	orr r5, r5, #4
	mov r6, #8
	b _020E4394
_020E41E4:
	cmp r6, #0
	bge _020E4380
	add fp, fp, #4
	tst r5, #8
	ldr r4, [fp, #-4]
	beq _020E4220
	mov r1, r4, lsl #0x18
	add r0, sp, #0xc
	mov r1, r1, asr #0x18
	bl sub_020E3E68
	add r0, sp, #0xc
	sub r2, sl, #1
	mov r1, #0x20
	bl sub_020E3E98
	b _020E4250
_020E4220:
	tst r5, #0x10
	movne r0, #0x30
	moveq r0, #0x20
	mov r1, r0, lsl #0x18
	add r0, sp, #0xc
	mov r1, r1, asr #0x18
	sub r2, sl, #1
	bl sub_020E3E98
	mov r1, r4, lsl #0x18
	add r0, sp, #0xc
	mov r1, r1, asr #0x18
	bl sub_020E3E68
_020E4250:
	add sb, sb, #1
	b _020E4764
_020E4258:
	add fp, fp, #4
	cmp r6, #0
	ldr r7, [fp, #-4]
	mov r4, #0
	bge _020E4290
	ldrsb r0, [r7]
	cmp r0, #0
	beq _020E42A4
_020E4278:
	add r4, r4, #1
	ldrsb r0, [r7, r4]
	cmp r0, #0
	bne _020E4278
	b _020E42A4
_020E428C:
	add r4, r4, #1
_020E4290:
	cmp r4, r6
	bge _020E42A4
	ldrsb r0, [r7, r4]
	cmp r0, #0
	bne _020E428C
_020E42A4:
	tst r5, #8
	sub sl, sl, r4
	beq _020E42D4
	add r0, sp, #0xc
	mov r1, r7
	mov r2, r4
	bl sub_020E3EEC
	add r0, sp, #0xc
	mov r2, sl
	mov r1, #0x20
	bl sub_020E3E98
	b _020E4304
_020E42D4:
	tst r5, #0x10
	movne r0, #0x30
	moveq r0, #0x20
	mov r1, r0, lsl #0x18
	add r0, sp, #0xc
	mov r2, sl
	mov r1, r1, asr #0x18
	bl sub_020E3E98
	add r0, sp, #0xc
	mov r1, r7
	mov r2, r4
	bl sub_020E3EEC
_020E4304:
	add sb, sb, #1
	b _020E4764
_020E430C:
	ldr r1, [sp, #0x10]
	ldr r0, [sp, #0x14]
	tst r5, #0x100
	sub r2, r1, r0
	bne _020E435C
	tst r5, #0x40
	beq _020E4338
	add fp, fp, #4
	ldr r0, [fp, #-4]
	strh r2, [r0]
	b _020E435C
_020E4338:
	add fp, fp, #4
	tst r5, #0x80
	ldreq r0, [fp, #-4]
	streq r2, [r0]
	beq _020E435C
	ldr r0, [fp, #-4]
	mov r1, r2, asr #0x1f
	str r2, [r0]
	str r1, [r0, #4]
_020E435C:
	add sb, sb, #1
	b _020E4764
_020E4364:
	add r0, r2, #1
	cmp r0, sb
	bne _020E4380
	add r0, sp, #0xc
	add sb, sb, #1
	bl sub_020E3E68
	b _020E4764
_020E4380:
	mov r1, r2
	add r0, sp, #0xc
	sub r2, sb, r2
	bl sub_020E3EEC
	b _020E4764
_020E4394:
	orr r5, r5, #0x1000
	mov r0, #0x10
_020E439C:
	tst r5, #8
	bicne r5, r5, #0x10
	cmp r6, #0
	bicge r5, r5, #0x10
	movlt r6, #1
	mov r4, #0
	tst r5, #0x1000
	beq _020E445C
	tst r5, #0x100
	beq _020E43D4
	add fp, fp, #4
	ldrb r7, [fp, #-4]
	mov r1, #0
	b _020E440C
_020E43D4:
	tst r5, #0x40
	beq _020E43EC
	add fp, fp, #4
	ldrh r7, [fp, #-4]
	mov r1, #0
	b _020E440C
_020E43EC:
	tst r5, #0x80
	addeq fp, fp, #4
	ldreq r7, [fp, #-4]
	moveq r1, #0
	beq _020E440C
	add fp, fp, #8
	ldr r7, [fp, #-8]
	ldr r1, [fp, #-4]
_020E440C:
	bic r5, r5, #3
	tst r5, #4
	beq _020E451C
	cmp r0, #0x10
	bne _020E4444
	cmp r1, #0
	cmpeq r7, #0
	beq _020E451C
	add r4, r3, #0x21
	mov r2, #0x30
	strb r4, [sp, #8]
	strb r2, [sp, #9]
	mov r4, #2
	b _020E451C
_020E4444:
	cmp r0, #8
	bne _020E451C
	mov r2, #0x30
	strb r2, [sp, #8]
	mov r4, #1
	b _020E451C
_020E445C:
	tst r5, #0x100
	beq _020E4474
	add fp, fp, #4
	ldrsb r7, [fp, #-4]
	mov r1, r7, asr #0x1f
	b _020E44AC
_020E4474:
	tst r5, #0x40
	beq _020E448C
	add fp, fp, #4
	ldrsh r7, [fp, #-4]
	mov r1, r7, asr #0x1f
	b _020E44AC
_020E448C:
	tst r5, #0x80
	addeq fp, fp, #4
	ldreq r7, [fp, #-4]
	moveq r1, r7, asr #0x1f
	beq _020E44AC
	add fp, fp, #8
	ldr r7, [fp, #-8]
	ldr r1, [fp, #-4]
_020E44AC:
	mov ip, #0
	and r2, ip, #0
	and r8, r1, #0x80000000
	cmp r2, #0
	cmpeq r8, #0
	beq _020E44E4
	mvn r4, r7
	mov r2, #0x2d
	mvn r1, r1
	strb r2, [sp, #8]
	adds r7, r4, #1
	adc r1, r1, ip
	mov r4, #1
	b _020E451C
_020E44E4:
	cmp r1, ip
	cmpeq r7, ip
	cmpeq r6, #0
	beq _020E451C
	tst r5, #2
	beq _020E450C
	mov r2, #0x2b
	strb r2, [sp, #8]
	mov r4, #1
	b _020E451C
_020E450C:
	tst r5, #1
	movne r2, #0x20
	strneb r2, [sp, #8]
	movne r4, #1
_020E451C:
	cmp r0, #8
	mov r8, #0
	beq _020E453C
	cmp r0, #0xa
	beq _020E4588
	cmp r0, #0x10
	beq _020E4620
	b _020E466C
_020E453C:
	cmp r1, r8
	cmpeq r7, r8
	beq _020E466C
	add r2, sp, #0x18
	mov r0, r8
	mov lr, #7
	mov ip, r8
_020E4558:
	and r3, r7, lr
	add r3, r3, #0x30
	strb r3, [r2, r8]
	mov r3, r1, lsr #3
	cmp r3, r0
	mov r7, r7, lsr #3
	orr r7, r7, r1, lsl #29
	mov r1, r3
	cmpeq r7, ip
	add r8, r8, #1
	bne _020E4558
	b _020E466C
_020E4588:
	mov r0, r8
	cmp r0, r8
	cmpeq r1, r8
	bne _020E45D4
	cmp r7, #0
	beq _020E466C
	ldr ip, _020E47BC ; =0xCCCCCCCD
	add r3, sp, #0x18
	mov r2, #0xa
_020E45AC:
	umull r1, r0, r7, ip
	movs r0, r0, lsr #3
	mul r1, r0, r2
	sub r1, r7, r1
	mov r7, r0
	add r0, r1, #0x30
	strb r0, [r3, r8]
	add r8, r8, #1
	bne _020E45AC
	b _020E466C
_020E45D4:
	cmp r1, r8
	cmpeq r7, r8
	beq _020E466C
_020E45E0:
	mov r0, r7
	mov r2, #0xa
	mov r3, #0
	bl _ll_udiv
	mov r2, #0xa
	umull r3, r2, r0, r2
	subs r2, r7, r3
	add r3, r2, #0x30
	add r2, sp, #0x18
	strb r3, [r2, r8]
	cmp r1, #0
	cmpeq r0, #0
	mov r7, r0
	add r8, r8, #1
	bne _020E45E0
	b _020E466C
_020E4620:
	cmp r1, r8
	cmpeq r7, r8
	beq _020E466C
	add ip, sp, #0x18
	mov lr, #0xf
_020E4634:
	and r2, r7, lr
	mov r7, r7, lsr #4
	mov r0, r1, lsr #4
	orr r7, r7, r1, lsl #28
	cmp r2, #0xa
	mov r1, r0
	addlt r0, r2, #0x30
	addge r0, r2, r3
	strb r0, [ip, r8]
	mov r0, #0
	cmp r1, r0
	cmpeq r7, r0
	add r8, r8, #1
	bne _020E4634
_020E466C:
	cmp r4, #0
	ble _020E4694
	ldrsb r0, [sp, #8]
	cmp r0, #0x30
	bne _020E4694
	add r0, sp, #0x18
	mov r1, #0x30
	strb r1, [r0, r8]
	add r8, r8, #1
	mov r4, #0
_020E4694:
	tst r5, #0x10
	sub r6, r6, r8
	beq _020E46B0
	sub r0, sl, r8
	sub r0, r0, r4
	cmp r6, r0
	movlt r6, r0
_020E46B0:
	cmp r6, #0
	subgt sl, sl, r6
	add r0, r4, r8
	sub sl, sl, r0
	ands r0, r5, #8
	str r0, [sp, #4]
	bne _020E46DC
	add r0, sp, #0xc
	mov r2, sl
	mov r1, #0x20
	bl sub_020E3E98
_020E46DC:
	cmp r4, #0
	ble _020E4708
	add r0, sp, #8
	add r5, r0, r4
	add r7, sp, #0xc
_020E46F0:
	ldrsb r1, [r5, #-1]!
	mov r0, r7
	sub r4, r4, #1
	bl sub_020E3E68
	cmp r4, #0
	bgt _020E46F0
_020E4708:
	add r0, sp, #0xc
	mov r2, r6
	mov r1, #0x30
	bl sub_020E3E98
	cmp r8, #0
	ble _020E4744
	add r0, sp, #0x18
	add r5, r0, r8
	add r4, sp, #0xc
_020E472C:
	ldrsb r1, [r5, #-1]!
	mov r0, r4
	sub r8, r8, #1
	bl sub_020E3E68
	cmp r8, #0
	bgt _020E472C
_020E4744:
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _020E4760
	add r0, sp, #0xc
	mov r2, sl
	mov r1, #0x20
	bl sub_020E3E98
_020E4760:
	add sb, sb, #1
_020E4764:
	ldrsb r0, [sb]
	cmp r0, #0
	bne _020E3F70
_020E4770:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _020E478C
	ldr r0, [sp, #0x10]
	mov r1, #0
	strb r1, [r0]
	b _020E47A8
_020E478C:
	ldr r0, [sp]
	cmp r0, #0
	beq _020E47A8
	ldr r1, [sp, #0x14]
	mov r2, #0
	add r0, r1, r0
	strb r2, [r0, #-1]
_020E47A8:
	ldr r1, [sp, #0x10]
	ldr r0, [sp, #0x14]
	sub r0, r1, r0
	add sp, sp, #0x30
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020E47BC: .word 0xCCCCCCCD
	arm_func_end STD_TVSNPrintf

	.rodata

_0210D650:
	.byte 0x00, 0x80, 0x2E, 0xFD, 0x2F, 0xFD, 0x75, 0xFD, 0xA7, 0xFD, 0xCE, 0xFD, 0xEE, 0xFD, 0x09, 0xFE
	.byte 0x20, 0xFE, 0x34, 0xFE, 0x46, 0xFE, 0x57, 0xFE, 0x66, 0xFE, 0x74, 0xFE, 0x81, 0xFE, 0x8D, 0xFE
	.byte 0x98, 0xFE, 0xA3, 0xFE, 0xAD, 0xFE, 0xB6, 0xFE, 0xBF, 0xFE, 0xC7, 0xFE, 0xCF, 0xFE, 0xD7, 0xFE
	.byte 0xDF, 0xFE, 0xE6, 0xFE, 0xEC, 0xFE, 0xF3, 0xFE, 0xF9, 0xFE, 0xFF, 0xFE, 0x05, 0xFF, 0x0B, 0xFF
	.byte 0x11, 0xFF, 0x16, 0xFF, 0x1B, 0xFF, 0x20, 0xFF, 0x25, 0xFF, 0x2A, 0xFF, 0x2E, 0xFF, 0x33, 0xFF
	.byte 0x37, 0xFF, 0x3C, 0xFF, 0x40, 0xFF, 0x44, 0xFF, 0x48, 0xFF, 0x4C, 0xFF, 0x50, 0xFF, 0x53, 0xFF
	.byte 0x57, 0xFF, 0x5B, 0xFF, 0x5E, 0xFF, 0x62, 0xFF, 0x65, 0xFF, 0x68, 0xFF, 0x6B, 0xFF, 0x6F, 0xFF
	.byte 0x72, 0xFF, 0x75, 0xFF, 0x78, 0xFF, 0x7B, 0xFF, 0x7E, 0xFF, 0x81, 0xFF, 0x83, 0xFF, 0x86, 0xFF
	.byte 0x89, 0xFF, 0x8C, 0xFF, 0x8E, 0xFF, 0x91, 0xFF, 0x93, 0xFF, 0x96, 0xFF, 0x99, 0xFF, 0x9B, 0xFF
	.byte 0x9D, 0xFF, 0xA0, 0xFF, 0xA2, 0xFF, 0xA5, 0xFF, 0xA7, 0xFF, 0xA9, 0xFF, 0xAB, 0xFF, 0xAE, 0xFF
	.byte 0xB0, 0xFF, 0xB2, 0xFF, 0xB4, 0xFF, 0xB6, 0xFF, 0xB8, 0xFF, 0xBA, 0xFF, 0xBC, 0xFF, 0xBE, 0xFF
	.byte 0xC0, 0xFF, 0xC2, 0xFF, 0xC4, 0xFF, 0xC6, 0xFF, 0xC8, 0xFF, 0xCA, 0xFF, 0xCC, 0xFF, 0xCE, 0xFF
	.byte 0xCF, 0xFF, 0xD1, 0xFF, 0xD3, 0xFF, 0xD5, 0xFF, 0xD6, 0xFF, 0xD8, 0xFF, 0xDA, 0xFF, 0xDC, 0xFF
	.byte 0xDD, 0xFF, 0xDF, 0xFF, 0xE1, 0xFF, 0xE2, 0xFF, 0xE4, 0xFF, 0xE5, 0xFF, 0xE7, 0xFF, 0xE9, 0xFF
	.byte 0xEA, 0xFF, 0xEC, 0xFF, 0xED, 0xFF, 0xEF, 0xFF, 0xF0, 0xFF, 0xF2, 0xFF, 0xF3, 0xFF, 0xF5, 0xFF
	.byte 0xF6, 0xFF, 0xF8, 0xFF, 0xF9, 0xFF, 0xFA, 0xFF, 0xFC, 0xFF, 0xFD, 0xFF, 0xFF, 0xFF, 0x00, 0x00
	.byte 0x00, 0x80, 0x5B, 0xFE, 0x97, 0xFE, 0xBB, 0xFE, 0xD4, 0xFE, 0xE7, 0xFE, 0xF7, 0xFE, 0x04, 0xFF
	.byte 0x10, 0xFF, 0x1A, 0xFF, 0x23, 0xFF, 0x2C, 0xFF, 0x33, 0xFF, 0x3A, 0xFF, 0x40, 0xFF, 0x46, 0xFF
	.byte 0x4C, 0xFF, 0x51, 0xFF, 0x56, 0xFF, 0x5B, 0xFF, 0x5F, 0xFF, 0x64, 0xFF, 0x68, 0xFF, 0x6C, 0xFF
	.byte 0x6F, 0xFF, 0x73, 0xFF, 0x76, 0xFF, 0x7A, 0xFF, 0x7D, 0xFF, 0x80, 0xFF, 0x83, 0xFF, 0x86, 0xFF
	.byte 0x88, 0xFF, 0x8B, 0xFF, 0x8E, 0xFF, 0x90, 0xFF, 0x92, 0xFF, 0x95, 0xFF, 0x97, 0xFF, 0x99, 0xFF
	.byte 0x9C, 0xFF, 0x9E, 0xFF, 0xA0, 0xFF, 0xA2, 0xFF, 0xA4, 0xFF, 0xA6, 0xFF, 0xA8, 0xFF, 0xAA, 0xFF
	.byte 0xAB, 0xFF, 0xAD, 0xFF, 0xAF, 0xFF, 0xB1, 0xFF, 0xB2, 0xFF, 0xB4, 0xFF, 0xB6, 0xFF, 0xB7, 0xFF
	.byte 0xB9, 0xFF, 0xBA, 0xFF, 0xBC, 0xFF, 0xBD, 0xFF, 0xBF, 0xFF, 0xC0, 0xFF, 0xC2, 0xFF, 0xC3, 0xFF
	.byte 0xC4, 0xFF, 0xC6, 0xFF, 0xC7, 0xFF, 0xC8, 0xFF, 0xCA, 0xFF, 0xCB, 0xFF, 0xCC, 0xFF, 0xCD, 0xFF
	.byte 0xCF, 0xFF, 0xD0, 0xFF, 0xD1, 0xFF, 0xD2, 0xFF, 0xD3, 0xFF, 0xD5, 0xFF, 0xD6, 0xFF, 0xD7, 0xFF
	.byte 0xD8, 0xFF, 0xD9, 0xFF, 0xDA, 0xFF, 0xDB, 0xFF, 0xDC, 0xFF, 0xDD, 0xFF, 0xDE, 0xFF, 0xDF, 0xFF
	.byte 0xE0, 0xFF, 0xE1, 0xFF, 0xE2, 0xFF, 0xE3, 0xFF, 0xE4, 0xFF, 0xE5, 0xFF, 0xE6, 0xFF, 0xE7, 0xFF
	.byte 0xE8, 0xFF, 0xE9, 0xFF, 0xE9, 0xFF, 0xEA, 0xFF, 0xEB, 0xFF, 0xEC, 0xFF, 0xED, 0xFF, 0xEE, 0xFF
	.byte 0xEF, 0xFF, 0xEF, 0xFF, 0xF0, 0xFF, 0xF1, 0xFF, 0xF2, 0xFF, 0xF3, 0xFF, 0xF4, 0xFF, 0xF4, 0xFF
	.byte 0xF5, 0xFF, 0xF6, 0xFF, 0xF7, 0xFF, 0xF7, 0xFF, 0xF8, 0xFF, 0xF9, 0xFF, 0xFA, 0xFF, 0xFA, 0xFF
	.byte 0xFB, 0xFF, 0xFC, 0xFF, 0xFD, 0xFF, 0xFD, 0xFF, 0xFE, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00
	.byte 0x00, 0x00, 0x3B, 0x00, 0x76, 0x00, 0xB2, 0x00, 0xED, 0x00, 0x28, 0x01, 0x64, 0x01, 0x9F, 0x01
	.byte 0xDB, 0x01, 0x17, 0x02, 0x52, 0x02, 0x8E, 0x02, 0xCA, 0x02, 0x05, 0x03, 0x41, 0x03, 0x7D, 0x03
	.byte 0xB9, 0x03, 0xF5, 0x03, 0x31, 0x04, 0x6E, 0x04, 0xAA, 0x04, 0xE6, 0x04, 0x22, 0x05, 0x5F, 0x05
	.byte 0x9B, 0x05, 0xD8, 0x05, 0x14, 0x06, 0x51, 0x06, 0x8D, 0x06, 0xCA, 0x06, 0x07, 0x07, 0x43, 0x07
	.byte 0x80, 0x07, 0xBD, 0x07, 0xFA, 0x07, 0x37, 0x08, 0x74, 0x08, 0xB1, 0x08, 0xEF, 0x08, 0x2C, 0x09
	.byte 0x69, 0x09, 0xA7, 0x09, 0xE4, 0x09, 0x21, 0x0A, 0x5F, 0x0A, 0x9C, 0x0A, 0xDA, 0x0A, 0x18, 0x0B
	.byte 0x56, 0x0B, 0x93, 0x0B, 0xD1, 0x0B, 0x0F, 0x0C, 0x4D, 0x0C, 0x8B, 0x0C, 0xC9, 0x0C, 0x07, 0x0D
	.byte 0x45, 0x0D, 0x84, 0x0D, 0xC2, 0x0D, 0x00, 0x0E, 0x3F, 0x0E, 0x7D, 0x0E, 0xBC, 0x0E, 0xFA, 0x0E
	.byte 0x39, 0x0F, 0x78, 0x0F, 0xB6, 0x0F, 0xF5, 0x0F, 0x34, 0x10, 0x73, 0x10, 0xB2, 0x10, 0xF1, 0x10
	.byte 0x30, 0x11, 0x6F, 0x11, 0xAE, 0x11, 0xEE, 0x11, 0x2D, 0x12, 0x6C, 0x12, 0xAC, 0x12, 0xEB, 0x12
	.byte 0x2B, 0x13, 0x6B, 0x13, 0xAA, 0x13, 0xEA, 0x13, 0x2A, 0x14, 0x6A, 0x14, 0xA9, 0x14, 0xE9, 0x14
	.byte 0x29, 0x15, 0x69, 0x15, 0xAA, 0x15, 0xEA, 0x15, 0x2A, 0x16, 0x6A, 0x16, 0xAB, 0x16, 0xEB, 0x16
	.byte 0x2C, 0x17, 0x6C, 0x17, 0xAD, 0x17, 0xED, 0x17, 0x2E, 0x18, 0x6F, 0x18, 0xB0, 0x18, 0xF0, 0x18
	.byte 0x31, 0x19, 0x72, 0x19, 0xB3, 0x19, 0xF5, 0x19, 0x36, 0x1A, 0x77, 0x1A, 0xB8, 0x1A, 0xFA, 0x1A
	.byte 0x3B, 0x1B, 0x7D, 0x1B, 0xBE, 0x1B, 0x00, 0x1C, 0x41, 0x1C, 0x83, 0x1C, 0xC5, 0x1C, 0x07, 0x1D
	.byte 0x48, 0x1D, 0x8A, 0x1D, 0xCC, 0x1D, 0x0E, 0x1E, 0x51, 0x1E, 0x93, 0x1E, 0xD5, 0x1E, 0x17, 0x1F
	.byte 0x5A, 0x1F, 0x9C, 0x1F, 0xDF, 0x1F, 0x21, 0x20, 0x64, 0x20, 0xA6, 0x20, 0xE9, 0x20, 0x2C, 0x21
	.byte 0x6F, 0x21, 0xB2, 0x21, 0xF5, 0x21, 0x38, 0x22, 0x7B, 0x22, 0xBE, 0x22, 0x01, 0x23, 0x44, 0x23
	.byte 0x88, 0x23, 0xCB, 0x23, 0x0E, 0x24, 0x52, 0x24, 0x96, 0x24, 0xD9, 0x24, 0x1D, 0x25, 0x61, 0x25
	.byte 0xA4, 0x25, 0xE8, 0x25, 0x2C, 0x26, 0x70, 0x26, 0xB4, 0x26, 0xF8, 0x26, 0x3D, 0x27, 0x81, 0x27
	.byte 0xC5, 0x27, 0x0A, 0x28, 0x4E, 0x28, 0x92, 0x28, 0xD7, 0x28, 0x1C, 0x29, 0x60, 0x29, 0xA5, 0x29
	.byte 0xEA, 0x29, 0x2F, 0x2A, 0x74, 0x2A, 0xB9, 0x2A, 0xFE, 0x2A, 0x43, 0x2B, 0x88, 0x2B, 0xCD, 0x2B
	.byte 0x13, 0x2C, 0x58, 0x2C, 0x9D, 0x2C, 0xE3, 0x2C, 0x28, 0x2D, 0x6E, 0x2D, 0xB4, 0x2D, 0xF9, 0x2D
	.byte 0x3F, 0x2E, 0x85, 0x2E, 0xCB, 0x2E, 0x11, 0x2F, 0x57, 0x2F, 0x9D, 0x2F, 0xE3, 0x2F, 0x2A, 0x30
	.byte 0x70, 0x30, 0xB6, 0x30, 0xFD, 0x30, 0x43, 0x31, 0x8A, 0x31, 0xD0, 0x31, 0x17, 0x32, 0x5E, 0x32
	.byte 0xA5, 0x32, 0xEC, 0x32, 0x32, 0x33, 0x79, 0x33, 0xC1, 0x33, 0x08, 0x34, 0x4F, 0x34, 0x96, 0x34
	.byte 0xDD, 0x34, 0x25, 0x35, 0x6C, 0x35, 0xB4, 0x35, 0xFB, 0x35, 0x43, 0x36, 0x8B, 0x36, 0xD3, 0x36
	.byte 0x1A, 0x37, 0x62, 0x37, 0xAA, 0x37, 0xF2, 0x37, 0x3A, 0x38, 0x83, 0x38, 0xCB, 0x38, 0x13, 0x39
	.byte 0x5C, 0x39, 0xA4, 0x39, 0xED, 0x39, 0x35, 0x3A, 0x7E, 0x3A, 0xC6, 0x3A, 0x0F, 0x3B, 0x58, 0x3B
	.byte 0xA1, 0x3B, 0xEA, 0x3B, 0x33, 0x3C, 0x7C, 0x3C, 0xC5, 0x3C, 0x0E, 0x3D, 0x58, 0x3D, 0xA1, 0x3D
	.byte 0xEA, 0x3D, 0x34, 0x3E, 0x7D, 0x3E, 0xC7, 0x3E, 0x11, 0x3F, 0x5A, 0x3F, 0xA4, 0x3F, 0xEE, 0x3F
	.byte 0x38, 0x40, 0x82, 0x40, 0xCC, 0x40, 0x16, 0x41, 0x61, 0x41, 0xAB, 0x41, 0xF5, 0x41, 0x40, 0x42
	.byte 0x8A, 0x42, 0xD5, 0x42, 0x1F, 0x43, 0x6A, 0x43, 0xB5, 0x43, 0x00, 0x44, 0x4B, 0x44, 0x95, 0x44
	.byte 0xE1, 0x44, 0x2C, 0x45, 0x77, 0x45, 0xC2, 0x45, 0x0D, 0x46, 0x59, 0x46, 0xA4, 0x46, 0xF0, 0x46
	.byte 0x3B, 0x47, 0x87, 0x47, 0xD3, 0x47, 0x1E, 0x48, 0x6A, 0x48, 0xB6, 0x48, 0x02, 0x49, 0x4E, 0x49
	.byte 0x9A, 0x49, 0xE6, 0x49, 0x33, 0x4A, 0x7F, 0x4A, 0xCB, 0x4A, 0x18, 0x4B, 0x64, 0x4B, 0xB1, 0x4B
	.byte 0xFE, 0x4B, 0x4A, 0x4C, 0x97, 0x4C, 0xE4, 0x4C, 0x31, 0x4D, 0x7E, 0x4D, 0xCB, 0x4D, 0x18, 0x4E
	.byte 0x66, 0x4E, 0xB3, 0x4E, 0x00, 0x4F, 0x4E, 0x4F, 0x9B, 0x4F, 0xE9, 0x4F, 0x36, 0x50, 0x84, 0x50
	.byte 0xD2, 0x50, 0x20, 0x51, 0x6E, 0x51, 0xBC, 0x51, 0x0A, 0x52, 0x58, 0x52, 0xA6, 0x52, 0xF4, 0x52
	.byte 0x43, 0x53, 0x91, 0x53, 0xE0, 0x53, 0x2E, 0x54, 0x7D, 0x54, 0xCC, 0x54, 0x1A, 0x55, 0x69, 0x55
	.byte 0xB8, 0x55, 0x07, 0x56, 0x56, 0x56, 0xA5, 0x56, 0xF4, 0x56, 0x44, 0x57, 0x93, 0x57, 0xE2, 0x57
	.byte 0x32, 0x58, 0x82, 0x58, 0xD1, 0x58, 0x21, 0x59, 0x71, 0x59, 0xC1, 0x59, 0x10, 0x5A, 0x60, 0x5A
	.byte 0xB0, 0x5A, 0x01, 0x5B, 0x51, 0x5B, 0xA1, 0x5B, 0xF1, 0x5B, 0x42, 0x5C, 0x92, 0x5C, 0xE3, 0x5C
	.byte 0x34, 0x5D, 0x84, 0x5D, 0xD5, 0x5D, 0x26, 0x5E, 0x77, 0x5E, 0xC8, 0x5E, 0x19, 0x5F, 0x6A, 0x5F
	.byte 0xBB, 0x5F, 0x0D, 0x60, 0x5E, 0x60, 0xB0, 0x60, 0x01, 0x61, 0x53, 0x61, 0xA4, 0x61, 0xF6, 0x61
	.byte 0x48, 0x62, 0x9A, 0x62, 0xEC, 0x62, 0x3E, 0x63, 0x90, 0x63, 0xE2, 0x63, 0x34, 0x64, 0x87, 0x64
	.byte 0xD9, 0x64, 0x2C, 0x65, 0x7E, 0x65, 0xD1, 0x65, 0x24, 0x66, 0x76, 0x66, 0xC9, 0x66, 0x1C, 0x67
	.byte 0x6F, 0x67, 0xC2, 0x67, 0x15, 0x68, 0x69, 0x68, 0xBC, 0x68, 0x0F, 0x69, 0x63, 0x69, 0xB6, 0x69
	.byte 0x0A, 0x6A, 0x5E, 0x6A, 0xB1, 0x6A, 0x05, 0x6B, 0x59, 0x6B, 0xAD, 0x6B, 0x01, 0x6C, 0x55, 0x6C
	.byte 0xAA, 0x6C, 0xFE, 0x6C, 0x52, 0x6D, 0xA7, 0x6D, 0xFB, 0x6D, 0x50, 0x6E, 0xA4, 0x6E, 0xF9, 0x6E
	.byte 0x4E, 0x6F, 0xA3, 0x6F, 0xF8, 0x6F, 0x4D, 0x70, 0xA2, 0x70, 0xF7, 0x70, 0x4D, 0x71, 0xA2, 0x71
	.byte 0xF7, 0x71, 0x4D, 0x72, 0xA2, 0x72, 0xF8, 0x72, 0x4E, 0x73, 0xA4, 0x73, 0xFA, 0x73, 0x50, 0x74
	.byte 0xA6, 0x74, 0xFC, 0x74, 0x52, 0x75, 0xA8, 0x75, 0xFF, 0x75, 0x55, 0x76, 0xAC, 0x76, 0x02, 0x77
	.byte 0x59, 0x77, 0xB0, 0x77, 0x07, 0x78, 0x5E, 0x78, 0xB4, 0x78, 0x0C, 0x79, 0x63, 0x79, 0xBA, 0x79
	.byte 0x11, 0x7A, 0x69, 0x7A, 0xC0, 0x7A, 0x18, 0x7B, 0x6F, 0x7B, 0xC7, 0x7B, 0x1F, 0x7C, 0x77, 0x7C
	.byte 0xCF, 0x7C, 0x27, 0x7D, 0x7F, 0x7D, 0xD7, 0x7D, 0x2F, 0x7E, 0x88, 0x7E, 0xE0, 0x7E, 0x38, 0x7F
	.byte 0x91, 0x7F, 0xEA, 0x7F, 0x42, 0x80, 0x9B, 0x80, 0xF4, 0x80, 0x4D, 0x81, 0xA6, 0x81, 0xFF, 0x81
	.byte 0x59, 0x82, 0xB2, 0x82, 0x0B, 0x83, 0x65, 0x83, 0xBE, 0x83, 0x18, 0x84, 0x72, 0x84, 0xCB, 0x84
	.byte 0x25, 0x85, 0x7F, 0x85, 0xD9, 0x85, 0x33, 0x86, 0x8E, 0x86, 0xE8, 0x86, 0x42, 0x87, 0x9D, 0x87
	.byte 0xF7, 0x87, 0x52, 0x88, 0xAC, 0x88, 0x07, 0x89, 0x62, 0x89, 0xBD, 0x89, 0x18, 0x8A, 0x73, 0x8A
	.byte 0xCE, 0x8A, 0x2A, 0x8B, 0x85, 0x8B, 0xE0, 0x8B, 0x3C, 0x8C, 0x97, 0x8C, 0xF3, 0x8C, 0x4F, 0x8D
	.byte 0xAB, 0x8D, 0x07, 0x8E, 0x63, 0x8E, 0xBF, 0x8E, 0x1B, 0x8F, 0x77, 0x8F, 0xD4, 0x8F, 0x30, 0x90
	.byte 0x8C, 0x90, 0xE9, 0x90, 0x46, 0x91, 0xA2, 0x91, 0xFF, 0x91, 0x5C, 0x92, 0xB9, 0x92, 0x16, 0x93
	.byte 0x73, 0x93, 0xD1, 0x93, 0x2E, 0x94, 0x8C, 0x94, 0xE9, 0x94, 0x47, 0x95, 0xA4, 0x95, 0x02, 0x96
	.byte 0x60, 0x96, 0xBE, 0x96, 0x1C, 0x97, 0x7A, 0x97, 0xD8, 0x97, 0x36, 0x98, 0x95, 0x98, 0xF3, 0x98
	.byte 0x52, 0x99, 0xB0, 0x99, 0x0F, 0x9A, 0x6E, 0x9A, 0xCD, 0x9A, 0x2C, 0x9B, 0x8B, 0x9B, 0xEA, 0x9B
	.byte 0x49, 0x9C, 0xA8, 0x9C, 0x08, 0x9D, 0x67, 0x9D, 0xC7, 0x9D, 0x26, 0x9E, 0x86, 0x9E, 0xE6, 0x9E
	.byte 0x46, 0x9F, 0xA6, 0x9F, 0x06, 0xA0, 0x66, 0xA0, 0xC6, 0xA0, 0x27, 0xA1, 0x87, 0xA1, 0xE8, 0xA1
	.byte 0x48, 0xA2, 0xA9, 0xA2, 0x0A, 0xA3, 0x6B, 0xA3, 0xCC, 0xA3, 0x2D, 0xA4, 0x8E, 0xA4, 0xEF, 0xA4
	.byte 0x50, 0xA5, 0xB2, 0xA5, 0x13, 0xA6, 0x75, 0xA6, 0xD6, 0xA6, 0x38, 0xA7, 0x9A, 0xA7, 0xFC, 0xA7
	.byte 0x5E, 0xA8, 0xC0, 0xA8, 0x22, 0xA9, 0x84, 0xA9, 0xE7, 0xA9, 0x49, 0xAA, 0xAC, 0xAA, 0x0E, 0xAB
	.byte 0x71, 0xAB, 0xD4, 0xAB, 0x37, 0xAC, 0x9A, 0xAC, 0xFD, 0xAC, 0x60, 0xAD, 0xC3, 0xAD, 0x27, 0xAE
	.byte 0x8A, 0xAE, 0xED, 0xAE, 0x51, 0xAF, 0xB5, 0xAF, 0x19, 0xB0, 0x7C, 0xB0, 0xE0, 0xB0, 0x45, 0xB1
	.byte 0xA9, 0xB1, 0x0D, 0xB2, 0x71, 0xB2, 0xD6, 0xB2, 0x3A, 0xB3, 0x9F, 0xB3, 0x03, 0xB4, 0x68, 0xB4
	.byte 0xCD, 0xB4, 0x32, 0xB5, 0x97, 0xB5, 0xFC, 0xB5, 0x62, 0xB6, 0xC7, 0xB6, 0x2C, 0xB7, 0x92, 0xB7
	.byte 0xF7, 0xB7, 0x5D, 0xB8, 0xC3, 0xB8, 0x29, 0xB9, 0x8F, 0xB9, 0xF5, 0xB9, 0x5B, 0xBA, 0xC1, 0xBA
	.byte 0x28, 0xBB, 0x8E, 0xBB, 0xF5, 0xBB, 0x5B, 0xBC, 0xC2, 0xBC, 0x29, 0xBD, 0x90, 0xBD, 0xF7, 0xBD
	.byte 0x5E, 0xBE, 0xC5, 0xBE, 0x2C, 0xBF, 0x94, 0xBF, 0xFB, 0xBF, 0x63, 0xC0, 0xCA, 0xC0, 0x32, 0xC1
	.byte 0x9A, 0xC1, 0x02, 0xC2, 0x6A, 0xC2, 0xD2, 0xC2, 0x3A, 0xC3, 0xA2, 0xC3, 0x0B, 0xC4, 0x73, 0xC4
	.byte 0xDC, 0xC4, 0x44, 0xC5, 0xAD, 0xC5, 0x16, 0xC6, 0x7F, 0xC6, 0xE8, 0xC6, 0x51, 0xC7, 0xBB, 0xC7
	.byte 0x24, 0xC8, 0x8D, 0xC8, 0xF7, 0xC8, 0x60, 0xC9, 0xCA, 0xC9, 0x34, 0xCA, 0x9E, 0xCA, 0x08, 0xCB
	.byte 0x72, 0xCB, 0xDC, 0xCB, 0x47, 0xCC, 0xB1, 0xCC, 0x1B, 0xCD, 0x86, 0xCD, 0xF1, 0xCD, 0x5B, 0xCE
	.byte 0xC6, 0xCE, 0x31, 0xCF, 0x9C, 0xCF, 0x08, 0xD0, 0x73, 0xD0, 0xDE, 0xD0, 0x4A, 0xD1, 0xB5, 0xD1
	.byte 0x21, 0xD2, 0x8D, 0xD2, 0xF8, 0xD2, 0x64, 0xD3, 0xD0, 0xD3, 0x3D, 0xD4, 0xA9, 0xD4, 0x15, 0xD5
	.byte 0x82, 0xD5, 0xEE, 0xD5, 0x5B, 0xD6, 0xC7, 0xD6, 0x34, 0xD7, 0xA1, 0xD7, 0x0E, 0xD8, 0x7B, 0xD8
	.byte 0xE9, 0xD8, 0x56, 0xD9, 0xC3, 0xD9, 0x31, 0xDA, 0x9E, 0xDA, 0x0C, 0xDB, 0x7A, 0xDB, 0xE8, 0xDB
	.byte 0x56, 0xDC, 0xC4, 0xDC, 0x32, 0xDD, 0xA0, 0xDD, 0x0F, 0xDE, 0x7D, 0xDE, 0xEC, 0xDE, 0x5B, 0xDF
	.byte 0xC9, 0xDF, 0x38, 0xE0, 0xA7, 0xE0, 0x16, 0xE1, 0x86, 0xE1, 0xF5, 0xE1, 0x64, 0xE2, 0xD4, 0xE2
	.byte 0x43, 0xE3, 0xB3, 0xE3, 0x23, 0xE4, 0x93, 0xE4, 0x03, 0xE5, 0x73, 0xE5, 0xE3, 0xE5, 0x54, 0xE6
	.byte 0xC4, 0xE6, 0x35, 0xE7, 0xA5, 0xE7, 0x16, 0xE8, 0x87, 0xE8, 0xF8, 0xE8, 0x69, 0xE9, 0xDA, 0xE9
	.byte 0x4B, 0xEA, 0xBC, 0xEA, 0x2E, 0xEB, 0x9F, 0xEB, 0x11, 0xEC, 0x83, 0xEC, 0xF5, 0xEC, 0x66, 0xED
	.byte 0xD9, 0xED, 0x4B, 0xEE, 0xBD, 0xEE, 0x2F, 0xEF, 0xA2, 0xEF, 0x14, 0xF0, 0x87, 0xF0, 0xFA, 0xF0
	.byte 0x6D, 0xF1, 0xE0, 0xF1, 0x53, 0xF2, 0xC6, 0xF2, 0x39, 0xF3, 0xAD, 0xF3, 0x20, 0xF4, 0x94, 0xF4
	.byte 0x07, 0xF5, 0x7B, 0xF5, 0xEF, 0xF5, 0x63, 0xF6, 0xD7, 0xF6, 0x4C, 0xF7, 0xC0, 0xF7, 0x34, 0xF8
	.byte 0xA9, 0xF8, 0x1E, 0xF9, 0x92, 0xF9, 0x07, 0xFA, 0x7C, 0xFA, 0xF1, 0xFA, 0x66, 0xFB, 0xDC, 0xFB
	.byte 0x51, 0xFC, 0xC7, 0xFC, 0x3C, 0xFD, 0xB2, 0xFD, 0x28, 0xFE, 0x9E, 0xFE, 0x14, 0xFF, 0x8A, 0xFF
	.byte 0x00, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01
	.byte 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01
	.byte 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01
	.byte 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01
	.byte 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01
	.byte 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01
	.byte 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02
	.byte 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02
	.byte 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x03, 0x03, 0x03
	.byte 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03
	.byte 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04
	.byte 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04
	.byte 0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05
	.byte 0x05, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06
	.byte 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x08, 0x08, 0x08, 0x08
	.byte 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x09, 0x09, 0x09, 0x09, 0x09, 0x09, 0x09, 0x09, 0x09
	.byte 0x09, 0x0A, 0x0A, 0x0A, 0x0A, 0x0A, 0x0A, 0x0A, 0x0A, 0x0B, 0x0B, 0x0B, 0x0B, 0x0B, 0x0B, 0x0B
	.byte 0x0B, 0x0C, 0x0C, 0x0C, 0x0C, 0x0C, 0x0C, 0x0C, 0x0C, 0x0D, 0x0D, 0x0D, 0x0D, 0x0D, 0x0D, 0x0E
	.byte 0x0E, 0x0E, 0x0E, 0x0E, 0x0E, 0x0E, 0x0F, 0x0F, 0x0F, 0x0F, 0x0F, 0x10, 0x10, 0x10, 0x10, 0x10
	.byte 0x10, 0x11, 0x11, 0x11, 0x11, 0x11, 0x12, 0x12, 0x12, 0x12, 0x12, 0x13, 0x13, 0x13, 0x13, 0x14
	.byte 0x14, 0x14, 0x14, 0x14, 0x15, 0x15, 0x15, 0x15, 0x16, 0x16, 0x16, 0x16, 0x17, 0x17, 0x17, 0x18
	.byte 0x18, 0x18, 0x18, 0x19, 0x19, 0x19, 0x19, 0x1A, 0x1A, 0x1A, 0x1B, 0x1B, 0x1B, 0x1C, 0x1C, 0x1C
	.byte 0x1D, 0x1D, 0x1D, 0x1E, 0x1E, 0x1E, 0x1F, 0x1F, 0x1F, 0x20, 0x20, 0x20, 0x21, 0x21, 0x22, 0x22
	.byte 0x22, 0x23, 0x23, 0x24, 0x24, 0x24, 0x25, 0x25, 0x26, 0x26, 0x27, 0x27, 0x27, 0x28, 0x28, 0x29
	.byte 0x29, 0x2A, 0x2A, 0x2B, 0x2B, 0x2C, 0x2C, 0x2D, 0x2D, 0x2E, 0x2E, 0x2F, 0x2F, 0x30, 0x31, 0x31
	.byte 0x32, 0x32, 0x33, 0x33, 0x34, 0x35, 0x35, 0x36, 0x36, 0x37, 0x38, 0x38, 0x39, 0x3A, 0x3A, 0x3B
	.byte 0x3C, 0x3C, 0x3D, 0x3E, 0x3F, 0x3F, 0x40, 0x41, 0x42, 0x42, 0x43, 0x44, 0x45, 0x45, 0x46, 0x47
	.byte 0x48, 0x49, 0x4A, 0x4A, 0x4B, 0x4C, 0x4D, 0x4E, 0x4F, 0x50, 0x51, 0x52, 0x52, 0x53, 0x54, 0x55
	.byte 0x56, 0x57, 0x58, 0x59, 0x5A, 0x5B, 0x5D, 0x5E, 0x5F, 0x60, 0x61, 0x62, 0x63, 0x64, 0x65, 0x67
	.byte 0x68, 0x69, 0x6A, 0x6B, 0x6D, 0x6E, 0x6F, 0x71, 0x72, 0x73, 0x75, 0x76, 0x77, 0x79, 0x7A, 0x7B
	.byte 0x7D, 0x7E, 0x7F, 0x20, 0x21, 0x21, 0x21, 0x22, 0x22, 0x23, 0x23, 0x23, 0x24, 0x24, 0x25, 0x25
	.byte 0x26, 0x26, 0x26, 0x27, 0x27, 0x28, 0x28, 0x29, 0x29, 0x2A, 0x2A, 0x2B, 0x2B, 0x2C, 0x2C, 0x2D
	.byte 0x2D, 0x2E, 0x2E, 0x2F, 0x2F, 0x30, 0x30, 0x31, 0x31, 0x32, 0x33, 0x33, 0x34, 0x34, 0x35, 0x36
	.byte 0x36, 0x37, 0x37, 0x38, 0x39, 0x39, 0x3A, 0x3B, 0x3B, 0x3C, 0x3D, 0x3E, 0x3E, 0x3F, 0x40, 0x40
	.byte 0x41, 0x42, 0x43, 0x43, 0x44, 0x45, 0x46, 0x47, 0x47, 0x48, 0x49, 0x4A, 0x4B, 0x4C, 0x4D, 0x4D
	.byte 0x4E, 0x4F, 0x50, 0x51, 0x52, 0x53, 0x54, 0x55, 0x56, 0x57, 0x58, 0x59, 0x5A, 0x5B, 0x5C, 0x5D
	.byte 0x5E, 0x5F, 0x60, 0x62, 0x63, 0x64, 0x65, 0x66, 0x67, 0x69, 0x6A, 0x6B, 0x6C, 0x6D, 0x6F, 0x70
	.byte 0x71, 0x73, 0x74, 0x75, 0x77, 0x78, 0x79, 0x7B, 0x7C, 0x7E, 0x7E, 0x40, 0x41, 0x42, 0x43, 0x43
	.byte 0x44, 0x45, 0x46, 0x47, 0x47, 0x48, 0x49, 0x4A, 0x4B, 0x4C, 0x4C, 0x4D, 0x4E, 0x4F, 0x50, 0x51
	.byte 0x52, 0x53, 0x54, 0x55, 0x56, 0x57, 0x58, 0x59, 0x5A, 0x5B, 0x5C, 0x5D, 0x5E, 0x5F, 0x60, 0x61
	.byte 0x62, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69, 0x6B, 0x6C, 0x6D, 0x6E, 0x70, 0x71, 0x72, 0x74, 0x75
	.byte 0x76, 0x78, 0x79, 0x7B, 0x7C, 0x7D, 0x7E, 0x40, 0x41, 0x42, 0x42, 0x43, 0x44, 0x45, 0x46, 0x46
	.byte 0x47, 0x48, 0x49, 0x4A, 0x4B, 0x4B, 0x4C, 0x4D, 0x4E, 0x4F, 0x50, 0x51, 0x52, 0x53, 0x54, 0x55
	.byte 0x56, 0x57, 0x58, 0x59, 0x5A, 0x5B, 0x5C, 0x5D, 0x5E, 0x5F, 0x60, 0x61, 0x62, 0x63, 0x65, 0x66
	.byte 0x67, 0x68, 0x69, 0x6A, 0x6C, 0x6D, 0x6E, 0x6F, 0x71, 0x72, 0x73, 0x75, 0x76, 0x77, 0x79, 0x7A
	.byte 0x7C, 0x7D, 0x7E, 0x7F, 0x94, 0x6B, 0x0D, 0x02, 0xC0, 0x6B, 0x0D, 0x02, 0xEC, 0x6B, 0x0D, 0x02
	.byte 0x84, 0x6C, 0x0D, 0x02, 0xB0, 0x6D, 0x0D, 0x02, 0x94, 0x6F, 0x0D, 0x02, 0x40, 0x73, 0x0D, 0x02
	.byte 0xC0, 0x73, 0x0D, 0x02, 0xE8, 0x73, 0x0D, 0x02, 0x21, 0x06, 0xC0, 0xDE, 0xBA, 0x98, 0xCE, 0x3F
	.byte 0xA6, 0x92, 0xE3, 0x9D, 0x46, 0xF2, 0xED, 0x01, 0x76, 0xE3, 0xCC, 0x08, 0x56, 0x23, 0x63, 0xFA
	.byte 0xCA, 0xD4, 0xEC, 0xDF, 0x9A, 0x62, 0x78, 0x34, 0x8F, 0x6D, 0x63, 0x3C, 0xFE, 0x22, 0xCA, 0x92
	.byte 0x20, 0x88, 0x97, 0x23, 0xD2, 0xCF, 0xAE, 0xC2, 0x32, 0x67, 0x8D, 0xFE, 0xCA, 0x83, 0x64, 0x98
	.byte 0xAC, 0xFD, 0x3E, 0x37, 0x87, 0x46, 0x58, 0x24, 0x14, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x14, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00
	.byte 0x48, 0xE3, 0x10, 0x02, 0x84, 0xE2, 0x10, 0x02, 0x84, 0xE3, 0x10, 0x02, 0x04, 0xE3, 0x10, 0x02
	.byte 0x04, 0xE2, 0x10, 0x02, 0xC8, 0xE3, 0x10, 0x02, 0xC8, 0xE2, 0x10, 0x02, 0x0A, 0x00, 0x28, 0x00
	.byte 0x00, 0x00, 0x28, 0x00, 0x0C, 0x27, 0x0E, 0x02, 0xC8, 0x26, 0x0E, 0x02, 0xE8, 0x26, 0x0E, 0x02
	.byte 0x80, 0x27, 0x0E, 0x02, 0x34, 0x27, 0x0E, 0x02, 0x58, 0x27, 0x0E, 0x02, 0xD0, 0x1D, 0x0E, 0x02
	.byte 0xFC, 0xE1, 0x10, 0x02, 0x00, 0x00, 0x01, 0x00, 0x00, 0x10, 0x00, 0x00, 0x0C, 0x00, 0x10, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x3D, 0x00
	.byte 0xCC, 0x27, 0x0E, 0x02, 0xC8, 0x26, 0x0E, 0x02, 0xA8, 0x27, 0x0E, 0x02, 0x1C, 0x28, 0x0E, 0x02
	.byte 0x34, 0x27, 0x0E, 0x02, 0xF4, 0x27, 0x0E, 0x02, 0xD0, 0x1D, 0x0E, 0x02, 0xFC, 0xE1, 0x10, 0x02
	.byte 0x00, 0x00, 0x01, 0x00, 0x80, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x3D, 0x00, 0x0A, 0x00, 0x0A, 0x00
	.byte 0xD0, 0x07, 0x88, 0x13, 0xA4, 0x32, 0x0E, 0x02, 0x60, 0x32, 0x0E, 0x02, 0x80, 0x32, 0x0E, 0x02
	.byte 0x18, 0x33, 0x0E, 0x02, 0xCC, 0x32, 0x0E, 0x02, 0xF0, 0x32, 0x0E, 0x02, 0x60, 0x1E, 0x0E, 0x02
	.byte 0x7C, 0xE2, 0x10, 0x02, 0x00, 0x00, 0x02, 0x00, 0x00, 0x10, 0x00, 0x00, 0x0C, 0x00, 0x20, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x62, 0x00, 0x13, 0x00
	.byte 0x0A, 0x00, 0x0A, 0x00, 0x28, 0x00, 0xC8, 0x00, 0x88, 0x2D, 0x0E, 0x02, 0x44, 0x2D, 0x0E, 0x02
	.byte 0x64, 0x2D, 0x0E, 0x02, 0xFC, 0x2D, 0x0E, 0x02, 0xB0, 0x2D, 0x0E, 0x02, 0xD4, 0x2D, 0x0E, 0x02
	.byte 0xD0, 0x1D, 0x0E, 0x02, 0xC0, 0xE2, 0x10, 0x02, 0x00, 0x00, 0x01, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x0C, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x88, 0x2D, 0x0E, 0x02, 0x44, 0x2D, 0x0E, 0x02, 0x64, 0x2D, 0x0E, 0x02
	.byte 0xFC, 0x2D, 0x0E, 0x02, 0xB0, 0x2D, 0x0E, 0x02, 0xD4, 0x2D, 0x0E, 0x02, 0xD0, 0x1D, 0x0E, 0x02
	.byte 0xC0, 0xE2, 0x10, 0x02, 0x00, 0x00, 0x01, 0x00, 0x00, 0x10, 0x00, 0x00, 0x0C, 0x00, 0x10, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xBF, 0x00, 0xD4, 0x00
	.byte 0x0A, 0x00, 0x0A, 0x00, 0xD0, 0x07, 0xD0, 0x07, 0xA4, 0x32, 0x0E, 0x02, 0x60, 0x32, 0x0E, 0x02
	.byte 0x80, 0x32, 0x0E, 0x02, 0x18, 0x33, 0x0E, 0x02, 0xCC, 0x32, 0x0E, 0x02, 0xF0, 0x32, 0x0E, 0x02
	.byte 0x60, 0x1E, 0x0E, 0x02, 0x40, 0xE3, 0x10, 0x02, 0x00, 0x00, 0x02, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x0C, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0xC2, 0x00, 0x09, 0x00, 0xA4, 0x32, 0x0E, 0x02, 0x60, 0x32, 0x0E, 0x02, 0x80, 0x32, 0x0E, 0x02
	.byte 0x18, 0x33, 0x0E, 0x02, 0xCC, 0x32, 0x0E, 0x02, 0xF0, 0x32, 0x0E, 0x02, 0x60, 0x1E, 0x0E, 0x02
	.byte 0x40, 0xE3, 0x10, 0x02, 0x00, 0x00, 0x02, 0x00, 0x00, 0x10, 0x00, 0x00, 0x0C, 0x00, 0x20, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x0A, 0x00, 0xF4, 0x01, 0xF4, 0x01, 0x70, 0x34, 0x0E, 0x02, 0x44, 0x2D, 0x0E, 0x02
	.byte 0x64, 0x2D, 0x0E, 0x02, 0x98, 0x34, 0x0E, 0x02, 0xB0, 0x2D, 0x0E, 0x02, 0xD4, 0x2D, 0x0E, 0x02
	.byte 0xD0, 0x1D, 0x0E, 0x02, 0xC0, 0xE3, 0x10, 0x02, 0x00, 0x00, 0x01, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x0C, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x32, 0x00, 0x1B, 0x00

	.data

_02110C98:
	.byte 0x3A, 0x2F, 0x00, 0x00
_02110C9C:
	.byte 0x72, 0x6F, 0x6D, 0x00
_02110CA0:
	.byte 0x48, 0xE1, 0x10, 0x02, 0x40, 0x00, 0x00, 0x00
_02110CA8:
	.byte 0x80, 0x00, 0x00, 0x00
_02110CAC:
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00
	.byte 0x0E, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00
	.byte 0x0C, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x07, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x0F, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x0B, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00
_02110D6C:
	.byte 0x78, 0xA4, 0x6A, 0xD7
	.byte 0x56, 0xB7, 0xC7, 0xE8, 0xDB, 0x70, 0x20, 0x24, 0xEE, 0xCE, 0xBD, 0xC1, 0xAF, 0x0F, 0x7C, 0xF5
	.byte 0x2A, 0xC6, 0x87, 0x47, 0x13, 0x46, 0x30, 0xA8, 0x01, 0x95, 0x46, 0xFD, 0xD8, 0x98, 0x80, 0x69
	.byte 0xAF, 0xF7, 0x44, 0x8B, 0xB1, 0x5B, 0xFF, 0xFF, 0xBE, 0xD7, 0x5C, 0x89, 0x22, 0x11, 0x90, 0x6B
	.byte 0x93, 0x71, 0x98, 0xFD, 0x8E, 0x43, 0x79, 0xA6, 0x21, 0x08, 0xB4, 0x49, 0x62, 0x25, 0x1E, 0xF6
	.byte 0x40, 0xB3, 0x40, 0xC0, 0x51, 0x5A, 0x5E, 0x26, 0xAA, 0xC7, 0xB6, 0xE9, 0x5D, 0x10, 0x2F, 0xD6
	.byte 0x53, 0x14, 0x44, 0x02, 0x81, 0xE6, 0xA1, 0xD8, 0xC8, 0xFB, 0xD3, 0xE7, 0xE6, 0xCD, 0xE1, 0x21
	.byte 0xD6, 0x07, 0x37, 0xC3, 0x87, 0x0D, 0xD5, 0xF4, 0xED, 0x14, 0x5A, 0x45, 0x05, 0xE9, 0xE3, 0xA9
	.byte 0xF8, 0xA3, 0xEF, 0xFC, 0xD9, 0x02, 0x6F, 0x67, 0x8A, 0x4C, 0x2A, 0x8D, 0x42, 0x39, 0xFA, 0xFF
	.byte 0x81, 0xF6, 0x71, 0x87, 0x22, 0x61, 0x9D, 0x6D, 0x0C, 0x38, 0xE5, 0xFD, 0x44, 0xEA, 0xBE, 0xA4
	.byte 0xA9, 0xCF, 0xDE, 0x4B, 0x60, 0x4B, 0xBB, 0xF6, 0x70, 0xBC, 0xBF, 0xBE, 0xC6, 0x7E, 0x9B, 0x28
	.byte 0xFA, 0x27, 0xA1, 0xEA, 0x85, 0x30, 0xEF, 0xD4, 0x05, 0x1D, 0x88, 0x04, 0x39, 0xD0, 0xD4, 0xD9
	.byte 0xE5, 0x99, 0xDB, 0xE6, 0xF8, 0x7C, 0xA2, 0x1F, 0x65, 0x56, 0xAC, 0xC4, 0x44, 0x22, 0x29, 0xF4
	.byte 0x97, 0xFF, 0x2A, 0x43, 0xA7, 0x23, 0x94, 0xAB, 0x39, 0xA0, 0x93, 0xFC, 0xC3, 0x59, 0x5B, 0x65
	.byte 0x92, 0xCC, 0x0C, 0x8F, 0x7D, 0xF4, 0xEF, 0xFF, 0xD1, 0x5D, 0x84, 0x85, 0x4F, 0x7E, 0xA8, 0x6F
	.byte 0xE0, 0xE6, 0x2C, 0xFE, 0x14, 0x43, 0x01, 0xA3, 0xA1, 0x11, 0x08, 0x4E, 0x82, 0x7E, 0x53, 0xF7
	.byte 0x35, 0xF2, 0x3A, 0xBD, 0xBB, 0xD2, 0xD7, 0x2A, 0x91, 0xD3, 0x86, 0xEB, 0x61, 0x00, 0x00, 0x00
_02110E70:
	.byte 0x74, 0x99, 0x0D, 0x02, 0xD8, 0x0E, 0x11, 0x02, 0xF0, 0x0E, 0x11, 0x02, 0xA8, 0x0E, 0x11, 0x02
	.byte 0xC0, 0x0E, 0x11, 0x02, 0xA4, 0x0E, 0x11, 0x02, 0x08, 0x0F, 0x11, 0x02, 0x6C, 0x0E, 0x11, 0x02
	.byte 0x44, 0x0F, 0x11, 0x02, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x40, 0x42, 0x0F, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x61, 0x62, 0x63, 0x00, 0x34, 0xAA, 0x97, 0x3C, 0xD4, 0xC4, 0xDA, 0xA4
	.byte 0xF6, 0x1E, 0xEB, 0x2B, 0xDB, 0xAD, 0x27, 0x31, 0x65, 0x34, 0x01, 0x6F, 0x00, 0x00, 0x00, 0x00
	.byte 0xDE, 0xA3, 0x56, 0xA2, 0xCD, 0xDD, 0x90, 0xC7, 0xA7, 0xEC, 0xED, 0xC5, 0xEB, 0xB5, 0x63, 0x93
	.byte 0x4F, 0x46, 0x04, 0x52, 0x00, 0x00, 0x00, 0x00, 0xA9, 0x99, 0x3E, 0x36, 0x47, 0x06, 0x81, 0x6A
	.byte 0xBA, 0x3E, 0x25, 0x71, 0x78, 0x50, 0xC2, 0x6C, 0x9C, 0xD0, 0xD8, 0x9D, 0x00, 0x00, 0x00, 0x00
	.byte 0x84, 0x98, 0x3E, 0x44, 0x1C, 0x3B, 0xD2, 0x6E, 0xBA, 0xAE, 0x4A, 0xA1, 0xF9, 0x51, 0x29, 0xE5
	.byte 0xE5, 0x46, 0x70, 0xF1, 0x00, 0x00, 0x00, 0x00, 0x61, 0x62, 0x63, 0x64, 0x62, 0x63, 0x64, 0x65
	.byte 0x63, 0x64, 0x65, 0x66, 0x64, 0x65, 0x66, 0x67, 0x65, 0x66, 0x67, 0x68, 0x66, 0x67, 0x68, 0x69
	.byte 0x67, 0x68, 0x69, 0x6A, 0x68, 0x69, 0x6A, 0x6B, 0x69, 0x6A, 0x6B, 0x6C, 0x6A, 0x6B, 0x6C, 0x6D
	.byte 0x6B, 0x6C, 0x6D, 0x6E, 0x6C, 0x6D, 0x6E, 0x6F, 0x6D, 0x6E, 0x6F, 0x70, 0x6E, 0x6F, 0x70, 0x71
	.byte 0x00, 0x00, 0x00, 0x00, 0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x30, 0x31, 0x32, 0x33
	.byte 0x34, 0x35, 0x36, 0x37, 0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x30, 0x31, 0x32, 0x33
	.byte 0x34, 0x35, 0x36, 0x37, 0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x30, 0x31, 0x32, 0x33
	.byte 0x34, 0x35, 0x36, 0x37, 0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x30, 0x31, 0x32, 0x33
	.byte 0x34, 0x35, 0x36, 0x37
_02110F84:
	.byte 0x00, 0x00, 0x00, 0x00
_02110F88:
	.byte 0x00, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x00, 0x00
	.byte 0x3B, 0x00, 0x00, 0x00, 0x5A, 0x00, 0x00, 0x00, 0x78, 0x00, 0x00, 0x00, 0x97, 0x00, 0x00, 0x00
	.byte 0xB5, 0x00, 0x00, 0x00, 0xD4, 0x00, 0x00, 0x00, 0xF3, 0x00, 0x00, 0x00, 0x11, 0x01, 0x00, 0x00
	.byte 0x30, 0x01, 0x00, 0x00, 0x4E, 0x01, 0x00, 0x00
_02110FB8:
	.byte 0x00, 0xFE, 0x7F, 0x02
_02110FBC:
	.byte 0xFD, 0xFF, 0x00, 0x00
_02110FC0:
	.byte 0x00, 0x00, 0x01, 0x00
_02110FC4:
	.byte 0x00, 0x00, 0x00, 0x00
_02110FC8:
	.byte 0x00, 0x00, 0x00, 0x00

	.section .itcm,4,1,4

	arm_func_start sub_01FF8448
sub_01FF8448: ; 0x01FF8448
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl OS_DisableInterrupts
	mov r1, #0xc
	mul r2, r7, r1
	add r1, r2, #0xb0
	add r2, r2, #0x4000000
	str r6, [r2, #0xb0]
	add r1, r1, #0x4000000
	str r5, [r1, #4]
	str r4, [r1, #8]
	bl OS_RestoreInterrupts
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_01FF8448

	arm_func_start sub_01FF8488
sub_01FF8488: ; 0x01FF8488
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl OS_DisableInterrupts
	mov r1, #0xc
	mul r2, r7, r1
	add r1, r2, #0xb0
	add r2, r2, #0x4000000
	str r6, [r2, #0xb0]
	add r3, r1, #0x4000000
	str r5, [r3, #4]
	ldr r2, _01FF84F0 ; =0x040000B0
	str r4, [r3, #8]
	ldr r1, [r2]
	cmp r7, #0
	ldr r1, [r2]
	bne _01FF84E8
	mov r2, #0
	str r2, [r3]
	ldr r1, _01FF84F4 ; =0x81400001
	str r2, [r3, #4]
	str r1, [r3, #8]
_01FF84E8:
	bl OS_RestoreInterrupts
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_01FF84F0: .word 0x040000B0
_01FF84F4: .word 0x81400001
	arm_func_end sub_01FF8488

	arm_func_start sub_01FF84F8
sub_01FF84F8: ; 0x01FF84F8
	mov ip, #0xc
	mul ip, r0, ip
	add r0, ip, #0xb0
	add ip, ip, #0x4000000
	str r1, [ip, #0xb0]
	add r0, r0, #0x4000000
	str r2, [r0, #4]
	str r3, [r0, #8]
	bx lr
	arm_func_end sub_01FF84F8

	arm_func_start sub_01FF851C
sub_01FF851C: ; 0x01FF851C
	stmdb sp!, {r3, lr}
	mov ip, #0xc
	mul lr, r0, ip
	add ip, lr, #0xb0
	add lr, lr, #0x4000000
	str r1, [lr, #0xb0]
	add ip, ip, #0x4000000
	str r2, [ip, #4]
	ldr r2, _01FF8578 ; =0x040000B0
	str r3, [ip, #8]
	ldr r1, [r2]
	cmp r0, #0
	ldr r0, [r2]
	bne _01FF8568
	mov r1, #0
	str r1, [ip]
	ldr r0, _01FF857C ; =0x81400001
	str r1, [ip, #4]
	str r0, [ip, #8]
_01FF8568:
	ldr r1, _01FF8578 ; =0x040000B0
	ldr r0, [r1]
	ldr r0, [r1]
	ldmia sp!, {r3, pc}
	.align 2, 0
_01FF8578: .word 0x040000B0
_01FF857C: .word 0x81400001
	arm_func_end sub_01FF851C

	arm_func_start sub_01FF8580
sub_01FF8580: ; 0x01FF8580
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	movs r8, r2
	mov sl, r0
	mov sb, r1
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r3, #0
	bl sub_020D4394
	add r0, sl, sl, lsl #1
	add r0, r0, #2
	mov r0, r0, lsl #2
	add r0, r0, #0xb0
	add r6, r0, #0x4000000
_01FF85B0:
	ldr r0, [r6]
	tst r0, #-0x80000000
	bne _01FF85B0
	cmp r8, #0
	beq _01FF85FC
	ldr fp, _01FF860C ; =0x04000400
	ldr r4, _01FF8610 ; =0x84400000
	mov r5, #0x1d8
_01FF85D0:
	cmp r8, #0x1d8
	movhi r7, r5
	movls r7, r8
	mov r0, sl
	mov r1, sb
	mov r2, fp
	orr r3, r4, r7, lsr #2
	bl sub_01FF8448
	subs r8, r8, r7
	add sb, sb, r7
	bne _01FF85D0
_01FF85FC:
	ldr r0, [r6]
	tst r0, #-0x80000000
	bne _01FF85FC
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_01FF860C: .word 0x04000400
_01FF8610: .word 0x84400000
	arm_func_end sub_01FF8580
