    .include "macros/btlcmd.inc"

    .data

_000:
    UpdateVar OPCODE_SET, BSCRIPT_VAR_SIDE_EFFECT_FLAGS_DIRECT, MOVE_SIDE_EFFECT_TO_ATTACKER|MOVE_SUBSCRIPT_PTR_USER_ATK_AND_DEF_UP_1_STAGE
    End 
