    .include "macros/btlcmd.inc"

    .data

_000:
    UpdateVar OPCODE_SET, BSCRIPT_VAR_SIDE_EFFECT_FLAGS_INDIRECT, MOVE_SIDE_EFFECT_TO_ATTACKER|MOVE_SUBSCRIPT_PTR_SP_ATTACK_UP_1_STAGE
    CalcCrit 
    CalcDamage 
    End 
