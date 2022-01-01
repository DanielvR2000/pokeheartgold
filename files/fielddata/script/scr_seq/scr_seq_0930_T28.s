#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T28.h"
#include "msgdata/msg/msg_0620_T28.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T28_000
	scrdef scr_seq_T28_001
	scrdef scr_seq_T28_002
	scrdef scr_seq_T28_003
	scrdef scr_seq_T28_004
	scrdef scr_seq_T28_005
	scrdef scr_seq_T28_006
	scrdef scr_seq_T28_007
	scrdef scr_seq_T28_008
	scrdef_end

scr_seq_T28_005:
	setvar VAR_UNK_4077, 2
	setflag FLAG_UNK_0C5
	setflag FLAG_UNK_99B
	comparevartovalue VAR_UNK_40F8, 0
	gotoif ne, _0047
	setvar VAR_UNK_40F8, 2
_0047:
	setvar VAR_SPECIAL_x8004, 1
	setvar VAR_SPECIAL_x8005, 2
	setvar VAR_SPECIAL_x8006, 2
	callstd std_phone_call
	setvar VAR_UNK_4134, 5
	end

scr_seq_T28_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 5
	gotoif eq, _0117
	checkflag FLAG_UNK_163
	gotoif TRUE, _010C
	npc_msg msg_0620_T28_00000
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0101
_009D:
	hasenoughmoneyimmediate 32780, 200
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _00EC
	goto_if_no_item_space ITEM_RAGECANDYBAR, 1, _00F7
	callstd std_give_item_verbose
	submoneyimmediate 200
	npc_msg msg_0620_T28_00005
	waitbutton
	setflag FLAG_UNK_163
	goto _014C

_00EC:
	npc_msg msg_0620_T28_00007
	waitbutton
	goto _014C

_00F7:
	callstd std_bag_is_full
	goto _014C

_0101:
	npc_msg msg_0620_T28_00009
	waitbutton
	goto _014C

_010C:
	npc_msg msg_0620_T28_00001
	waitbutton
	goto _014C

_0117:
	checkflag FLAG_UNK_163
	gotoif TRUE, _0147
	npc_msg msg_0620_T28_00003
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _009D
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0101
_0147:
	npc_msg msg_0620_T28_00004
	waitbutton
_014C:
	closemsg
	releaseall
	end

scr_seq_T28_001:
	scrcmd_609
	lockall
	apply_movement obj_T28_gsmiddleman1, _0278
	wait_movement
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 56
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 176
	gotoif ne, _0193
	apply_movement obj_T28_gsmiddleman1, _0284
	apply_movement obj_player, _0294
	goto _01A3

_0193:
	apply_movement obj_T28_gsmiddleman1, _02A4
	apply_movement obj_player, _02B4
_01A3:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	checkflag FLAG_UNK_163
	gotoif TRUE, _026D
	npc_msg msg_0620_T28_00000
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _01DF
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0257
_01DF:
	hasenoughmoneyimmediate 32780, 300
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0262
	goto_if_no_item_space ITEM_RAGECANDYBAR, 1, _00F7
	callstd std_give_item_verbose
	submoneyimmediate 300
	npc_msg msg_0620_T28_00006
	closemsg
	setflag FLAG_UNK_163
_0228:
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 176
	gotoif ne, _0249
	apply_movement obj_T28_gsmiddleman1, _02C4
	goto _0251

_0249:
	apply_movement obj_T28_gsmiddleman1, _02D0
_0251:
	wait_movement
	releaseall
	end

_0257:
	npc_msg msg_0620_T28_00010
	closemsg
	goto _0228

_0262:
	npc_msg msg_0620_T28_00008
	closemsg
	goto _0228

_026D:
	npc_msg msg_0620_T28_00002
	closemsg
	goto _0228


_0278:
	step 1, 1
	step 75, 1
	step_end

_0284:
	step 19, 1
	step 17, 1
	step 18, 1
	step_end

_0294:
	step 62, 2
	step 18, 1
	step 3, 1
	step_end

_02A4:
	step 19, 1
	step 17, 2
	step 18, 1
	step_end

_02B4:
	step 62, 3
	step 18, 1
	step 3, 1
	step_end

_02C4:
	step 12, 1
	step 1, 1
	step_end

_02D0:
	step 12, 2
	step 1, 1
	step_end
scr_seq_T28_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_GOT_RED_SCALE
	gotoif TRUE, _02FA
	npc_msg msg_0620_T28_00014
	waitbutton
	closemsg
	releaseall
	end

_02FA:
	npc_msg msg_0620_T28_00015
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T28_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0620_T28_00016
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T28_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0620_T28_00013
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T28_006:
	direction_signpost msg_0620_T28_00017, 0, 19, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd std_signpost
	end

scr_seq_T28_007:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0620_T28_00018, VAR_SPECIAL_x800C
	callstd std_signpost
	end

scr_seq_T28_008:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0620_T28_00019, VAR_SPECIAL_x800C
	callstd std_signpost
	end
	.balign 4, 0
