    .include "macros/btlcmd.inc"

    .data

_000:
    TryPartyStatusRefresh 
    CompareVarToValue OPCODE_EQU, BSCRIPT_VAR_MOVE_NO_CUR, MOVE_AROMATHERAPY, _010
    // A bell chimed!
    PrintMessage msg_0197_00821, TAG_NONE
    GoTo _013

_010:
    // A soothing aroma wafted through the area!
    PrintMessage msg_0197_00592, TAG_NONE

_013:
    Wait 
    WaitButtonABTime 30
    CompareVarToValue OPCODE_EQU, BSCRIPT_VAR_MOVE_NO_CUR, MOVE_AROMATHERAPY, _049
    CompareVarToValue OPCODE_FLAG_NOT, BSCRIPT_VAR_CALC_TEMP, 0x00000001, _035
    // {0}’s {1} blocks {2}!
    PrintMessage msg_0197_00689, TAG_NICKNAME_ABILITY_MOVE, BATTLER_CATEGORY_ATTACKER, BATTLER_CATEGORY_ATTACKER, BATTLER_CATEGORY_MSG_TEMP
    Wait 
    WaitButtonABTime 30

_035:
    CompareVarToValue OPCODE_FLAG_NOT, BSCRIPT_VAR_CALC_TEMP, 0x00000002, _049
    // {0}’s {1} blocks {2}!
    PrintMessage msg_0197_00689, TAG_NICKNAME_ABILITY_MOVE, BATTLER_CATEGORY_ATTACKER_PARTNER, BATTLER_CATEGORY_ATTACKER_PARTNER, BATTLER_CATEGORY_MSG_TEMP
    Wait 
    WaitButtonABTime 30

_049:
    CompareVarToValue OPCODE_FLAG_SET, BSCRIPT_VAR_CALC_TEMP, 0x00000004, _057
    SetHealthbarStatus BATTLER_CATEGORY_ATTACKER, BATTLE_ANIMATION_NONE

_057:
    CompareVarToValue OPCODE_FLAG_SET, BSCRIPT_VAR_CALC_TEMP, 0x00000008, _065
    SetHealthbarStatus BATTLER_CATEGORY_ATTACKER_PARTNER, BATTLE_ANIMATION_NONE

_065:
    End 
