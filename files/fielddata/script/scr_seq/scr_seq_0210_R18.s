#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R18.h"
#include "msgdata/msg/msg_0358_R18.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R18_000
	scrdef scr_seq_R18_001
	scrdef_end

scr_seq_R18_000:
	checkflag FLAG_UNK_149
	gotoif TRUE, _0017
	end

_0017:
	scrcmd_186 1
	end

scr_seq_R18_001:
	direction_signpost msg_0358_R18_00000, 1, 1, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd std_signpost
	end
	.balign 4, 0
