    .include "macros/btlcmd.inc"

    .data

_000:
    CheckAbility CHECK_OPCODE_NOT_HAVE, BATTLER_CATEGORY_ATTACKER, ABILITY_RECKLESS, _008
    UpdateVar OPCODE_SET, BSCRIPT_VAR_POWER_MULTI, 12

_008:
    UpdateVar OPCODE_SET, BSCRIPT_VAR_SIDE_EFFECT_FLAGS_INDIRECT, MOVE_SIDE_EFFECT_ON_HIT|MOVE_SUBSCRIPT_PTR_RECOIL_1_2
    CalcCrit 
    CalcDamage 
    End 
