#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D37R0103.h"
#include "msgdata/msg/msg_0118_D37R0103.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D37R0103_000
	scrdef scr_seq_D37R0103_001
	scrdef scr_seq_D37R0103_002
	scrdef scr_seq_D37R0103_003
	scrdef_end

scr_seq_D37R0103_003:
	scrcmd_375 9
	scrcmd_375 10
	scrcmd_375 11
	scrcmd_375 12
	scrcmd_375 13
	scrcmd_375 14
	scrcmd_375 15
	scrcmd_375 16
	scrcmd_375 17
	checkflag FLAG_UNK_096
	gotoif TRUE, _0059
	checkflag FLAG_UNK_097
	gotoif TRUE, _01BE
	checkflag FLAG_UNK_098
	gotoif TRUE, _0207
	end

_0059:
	checkflag FLAG_UNK_097
	gotoif TRUE, _00B3
	checkflag FLAG_UNK_098
	gotoif TRUE, _013E
	scrcmd_109 0, 9
	move_person obj_D37R0103_tsure_poke_593, 19, 0, 16, 1
	move_person obj_D37R0103_babyboy1_5_3, 19, 0, 18, 0
	move_person obj_D37R0103_stop, 19, 0, 17, 0
	move_person obj_D37R0103_stop_2, 20, 0, 17, 0
	move_person obj_D37R0103_stop_3, 20, 0, 18, 0
	end

_00B3:
	checkflag FLAG_UNK_098
	gotoif TRUE, _02BF
	scrcmd_109 0, 9
	move_person obj_D37R0103_tsure_poke_593, 19, 0, 16, 1
	move_person obj_D37R0103_babyboy1_5_3, 19, 0, 18, 0
	move_person obj_D37R0103_stop, 19, 0, 17, 0
	move_person obj_D37R0103_stop_2, 20, 0, 17, 0
	move_person obj_D37R0103_stop_3, 20, 0, 18, 0
	move_person obj_D37R0103_tsure_poke_593_2, 3, 0, 14, 2
	move_person obj_D37R0103_babyboy1_5_2, 1, 0, 14, 0
	move_person obj_D37R0103_stop_4, 1, 0, 13, 0
	move_person obj_D37R0103_stop_5, 2, 0, 13, 0
	move_person obj_D37R0103_stop_6, 2, 0, 14, 0
	end

_013E:
	scrcmd_109 0, 9
	move_person obj_D37R0103_tsure_poke_593, 19, 0, 16, 1
	move_person obj_D37R0103_babyboy1_5_3, 19, 0, 18, 0
	move_person obj_D37R0103_stop, 19, 0, 17, 0
	move_person obj_D37R0103_stop_2, 20, 0, 17, 0
	move_person obj_D37R0103_stop_3, 20, 0, 18, 0
	move_person obj_D37R0103_tsure_poke_593_3, 7, 0, 17, 3
	move_person obj_D37R0103_babyboy1_5, 8, 0, 18, 0
	move_person obj_D37R0103_stop_7, 8, 0, 17, 0
	move_person obj_D37R0103_stop_8, 9, 0, 17, 0
	move_person obj_D37R0103_stop_9, 9, 0, 18, 0
	end

_01BE:
	checkflag FLAG_UNK_098
	gotoif TRUE, _0245
	move_person obj_D37R0103_tsure_poke_593_2, 3, 0, 14, 2
	move_person obj_D37R0103_babyboy1_5_2, 1, 0, 14, 0
	move_person obj_D37R0103_stop_4, 1, 0, 13, 0
	move_person obj_D37R0103_stop_5, 2, 0, 13, 0
	move_person obj_D37R0103_stop_6, 2, 0, 14, 0
	end

_0207:
	move_person obj_D37R0103_tsure_poke_593_3, 7, 0, 17, 3
	move_person obj_D37R0103_babyboy1_5, 8, 0, 18, 0
	move_person obj_D37R0103_stop_7, 8, 0, 17, 0
	move_person obj_D37R0103_stop_8, 9, 0, 17, 0
	move_person obj_D37R0103_stop_9, 9, 0, 18, 0
	end

_0245:
	move_person obj_D37R0103_tsure_poke_593_2, 3, 0, 14, 2
	move_person obj_D37R0103_babyboy1_5_2, 1, 0, 14, 0
	move_person obj_D37R0103_stop_4, 1, 0, 13, 0
	move_person obj_D37R0103_stop_5, 2, 0, 13, 0
	move_person obj_D37R0103_stop_6, 2, 0, 14, 0
	move_person obj_D37R0103_tsure_poke_593_3, 7, 0, 17, 3
	move_person obj_D37R0103_babyboy1_5, 8, 0, 18, 0
	move_person obj_D37R0103_stop_7, 8, 0, 17, 0
	move_person obj_D37R0103_stop_8, 9, 0, 17, 0
	move_person obj_D37R0103_stop_9, 9, 0, 18, 0
	end

_02BF:
	scrcmd_109 0, 9
	move_person obj_D37R0103_tsure_poke_593, 19, 0, 16, 1
	move_person obj_D37R0103_babyboy1_5_3, 19, 0, 18, 0
	move_person obj_D37R0103_stop, 19, 0, 17, 0
	move_person obj_D37R0103_stop_2, 20, 0, 17, 0
	move_person obj_D37R0103_stop_3, 20, 0, 18, 0
	move_person obj_D37R0103_tsure_poke_593_2, 3, 0, 14, 2
	move_person obj_D37R0103_babyboy1_5_2, 1, 0, 14, 0
	move_person obj_D37R0103_stop_4, 1, 0, 13, 0
	move_person obj_D37R0103_stop_5, 2, 0, 13, 0
	move_person obj_D37R0103_stop_6, 2, 0, 14, 0
	move_person obj_D37R0103_tsure_poke_593_3, 7, 0, 17, 3
	move_person obj_D37R0103_babyboy1_5, 8, 0, 18, 0
	move_person obj_D37R0103_stop_7, 8, 0, 17, 0
	move_person obj_D37R0103_stop_8, 9, 0, 17, 0
	move_person obj_D37R0103_stop_9, 9, 0, 18, 0
	end

scr_seq_D37R0103_000:
	checkflag FLAG_UNK_096
	gotoif TRUE, _03C9
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0118_D37R0103_00000
	closemsg
	apply_movement obj_D37R0103_tsure_poke_593, _0504
	apply_movement obj_D37R0103_babyboy1_5_3, _0504
	apply_movement obj_D37R0103_stop, _0504
	apply_movement obj_D37R0103_stop_2, _0504
	apply_movement obj_D37R0103_stop_3, _0504
	wait_movement
	setflag FLAG_UNK_096
	scrcmd_109 0, 9
	releaseall
	end

_03C9:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0118_D37R0103_00001
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D37R0103_001:
	get_person_coords 4, VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 15
	gotoif ne, _03FD
	goto _041C
	.byte 0x16, 0x00, 0x1f, 0x00, 0x00, 0x00
_03FD:
	comparevartovalue VAR_TEMP_x4001, 16
	gotoif ne, _0416
	goto _0483
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
_0416:
	goto _03C9

_041C:
	checkflag FLAG_UNK_097
	gotoif TRUE, _03C9
	scrcmd_622 4, 16384
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, _0440
	goto _0446

_0440:
	goto _03C9

_0446:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0118_D37R0103_00000
	closemsg
	apply_movement obj_D37R0103_tsure_poke_593_2, _050C
	apply_movement obj_D37R0103_babyboy1_5_2, _050C
	apply_movement obj_D37R0103_stop_4, _050C
	apply_movement obj_D37R0103_stop_5, _050C
	apply_movement obj_D37R0103_stop_6, _050C
	wait_movement
	setflag FLAG_UNK_097
	releaseall
	end

_0483:
	checkflag FLAG_UNK_098
	gotoif TRUE, _03C9
	scrcmd_622 4, 16384
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif ne, _04A7
	goto _04AD

_04A7:
	goto _03C9

_04AD:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0118_D37R0103_00000
	closemsg
	apply_movement obj_D37R0103_tsure_poke_593_3, _0514
	apply_movement obj_D37R0103_babyboy1_5, _0514
	apply_movement obj_D37R0103_stop_7, _0514
	apply_movement obj_D37R0103_stop_8, _0514
	apply_movement obj_D37R0103_stop_9, _0514
	wait_movement
	setflag FLAG_UNK_098
	releaseall
	end

scr_seq_D37R0103_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	play_cry SPECIES_MACHOKE, 0
	npc_msg msg_0118_D37R0103_00002
	wait_cry
	waitbutton
	closemsg
	releaseall
	end
	.byte 0x00

_0504:
	step 9, 2
	step_end

_050C:
	step 10, 2
	step_end

_0514:
	step 11, 2
	step_end
	.balign 4, 0
