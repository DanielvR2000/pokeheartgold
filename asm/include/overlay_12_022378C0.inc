#include <nitro/fs/overlay.h>
#pragma once
.public sub_020027F0
.public TextFlags_SetCanABSpeedUpPrint
.public sub_02002B50
.public sub_02002B8C
.public FontID_Alloc
.public FontID_Release
.public PaletteData_Init
.public PaletteData_Free
.public PaletteData_AllocBuffers
.public PaletteData_FreeBuffers
.public PaletteData_LoadNarc
.public PaletteData_GetUnfadedBuf
.public sub_02003370
.public sub_0200398C
.public sub_02003B44
.public sub_02003B50
.public sub_02003D5C
.public sub_020059D0
.public sub_02005BEC
.public PlaySE
.public StopSE
.public IsSEPlaying
.public UnloadOverlayByID
.public HandleLoadOverlay
.public OverlayManager_CreateAndGetData
.public OverlayManager_GetData
.public OverlayManager_GetArgs
.public NARC_ctor
.public NARC_dtor
.public GfGfxLoader_LoadCharData
.public GfGfxLoader_LoadScrnData
.public sub_02007FD4
.public sub_02008120
.public sub_02008524
.public sub_02009408
.public sub_02009418
.public G2dRenderer_SetSubSurfaceCoords
.public sub_02009FE8
.public sub_0200A080
.public NewMsgDataFromNarc
.public DestroyMsgData
.public ReadMsgDataIntoString
.public MessageFormat_new
.public MessageFormat_delete
.public MessagePrinter_new
.public MessagePrinter_delete
.public sub_0200CF18
.public sub_0200CF38
.public sub_0200CF6C
.public sub_0200CF70
.public sub_0200CFF4
.public sub_0200D020
.public sub_0200D034
.public sub_0200D03C
.public sub_0200D108
.public sub_0200D3F8
.public sub_0200D998
.public CreateSysTask
.public sub_0200E33C
.public DestroySysTask
.public sub_0200E640
.public DrawFrameAndWindow2
.public sub_0200EB80
.public sub_0200F0AC
.public sub_0200F450
.public SetMasterBrightnessNeutral
.public sub_0200FBF4
.public sub_02014DA0
.public sub_02014F84
.public sub_020163E0
.public sub_0201649C
.public sub_020164C4
.public sub_02016EDC
.public sub_02016F2C
.public Main_SetVBlankIntrCB
.public HBlankInterruptDisable
.public CreateHeap
.public DestroyHeap
.public AllocFromHeap
.public FreeToHeap
.public BgConfig_Alloc
.public SetBothScreensModesAndDisable
.public InitBgFromTemplate
.public FreeBgTilemapBuffer
.public BgSetPosTextAndCommit
.public BgClearTilemapBufferAndCommit
.public AllocWindows
.public AddWindowParameterized
.public RemoveWindow
.public WindowArray_dtor
.public FillWindowPixelBuffer
.public BgConfig_HandleScheduledScrollAndTransferOps
.public GetLCRNGSeed
.public SetLCRNGSeed
.public AddTextPrinterParameterized
.public GF_CreateVramTransferManager
.public GF_DestroyVramTransferManager
.public GF_RunVramTransferTasks
.public sub_02020654
.public sub_0202067C
.public sub_020210BC
.public sub_02021148
.public sub_02021238
.public GX_SetBanks
.public GX_DisableEngineALayers
.public GX_EngineAToggleLayers
.public GX_EngineBToggleLayers
.public GX_BothDispOn
.public GF_AssertFail
.public String_ctor
.public String_dtor
.public sub_02026E50
.public sub_02026E84
.public sub_02026E8C
.public sub_02026E94
.public sub_02026E9C
.public GF_3DVramMan_Create
.public GF_3DVramMan_Delete
.public PlayerProfile_new
.public PlayerProfile_copy
.public PlayerProfile_GetPlayerName_NewString
.public PlayerProfile_GetVersion
.public Pokedex_new
.public Pokedex_copy
.public Options_GetFrame
.public GameStats_Inc
.public sub_020302A4
.public sub_02035650
.public sub_02037454
.public sub_0203769C
.public sub_020378AC
.public sub_02037930
.public sub_02037AC0
.public sub_02037B38
.public sub_02039998
.public sub_020399FC
.public sub_02039AD8
.public sub_02039F68
.public sub_0203A880
.public sub_0203A914
.public sub_0203A930
.public GetMonData
.public SetMonData
.public MonApplyFriendshipMod
.public GetMonGender
.public MaskOfFlagNo
.public SavArray_Party_alloc
.public GetPartyCount
.public GetPartyMonByIndex
.public Party_copy
.public sub_02074E5C
.public sub_02074EC4
.public sub_02075074
.public sub_020750E0
.public sub_02075108
.public sub_0207514C
.public sub_02075178
.public sub_020751B8
.public sub_020751DC
.public sub_02075220
.public sub_02075248
.public sub_0207527C
.public sub_020752D8
.public sub_0207531C
.public sub_02075350
.public sub_020753A8
.public sub_020753D4
.public sub_02075A7C
.public sub_02075D3C
.public sub_02075D4C
.public Sav2_Bag_new
.public Sav2_Bag_copy
.public BagCursor_Battle_Init
.public sub_020880B0
.public ApplyMonMoodModifier
.public G3X_SetFog
.public G3X_SetClearColor
.public MIi_CpuClear16
.public MIi_CpuCopy16
.public MIi_CpuClear32
.public MIi_CpuClearFast
.public WM_GetLinkLevel
.public NNS_GfdDefaultFuncAllocTexVram
.public NNS_GfdDefaultFuncAllocPlttVram
.public ov00_021EC9D4
.public ov05_0221BA00
.public ov06_0221BAF0
.public ov07_0221BEDC
.public ov07_0221BFE0
.public ov12_022378C0
.public ov12_02237B0C
.public ov12_02237B6C
.public ov12_02237BB8
.public ov12_02237CC4
.public ov12_02237D00
.public ov12_02237ED0
.public ov12_022399BC
.public BattleSys_GetBattleType
.public ov12_0223A7E4
.public BattleSys_GetOpponentDataByBattlerId
.public BattleSys_GetMaxBattlers
.public BattleSys_GetPartySize
.public BattleSystem_GetPartyMon
.public BattleSys_GetPlayerProfile
.public ov12_0223AA84
.public ov12_0223AA88
.public ov12_0223AAC8
.public BattleSys_GetFieldSide
.public BattleSys_GetTerrainId
.public BattleSys_GetBattlerIdPartner
.public BattleSys_GetBattleFlags
.public ov12_0223B52C
.public ov12_0223B5EC
.public ov12_0223B708
.public ov12_0223B798
.public ov12_0223B870
.public ov12_0223BBF0
.public ov12_0223BC48
.public ov12_0223BCC8
.public ov12_0223BD2C
.public ov12_0223BD3C
.public ov12_0223BD58
.public ov12_0223BD68
.public ov12_0223BFC0
.public ov12_0223BFCC
.public ov12_0223BFEC
.public ov12_02248660
.public ov12_022486B0
.public ov12_022486FC
.public ov12_02256F28
.public ov12_022581D4
.public ov12_022582B8
.public ov12_02258D74
.public ov12_02258DB0
.public ov12_02258E54
.public ov12_02258E7C
.public ov12_02260EA4
.public ov12_02261264
.public ov12_0226127C
.public ov12_022621C4
.public ov12_02265FD4
.public ov12_0226604C
.public ov12_022660A8
.public ov12_022660D0
.public ov12_0226631C
.public ov12_02266390
.public ov12_02266508
.public ov12_02266644
.public ov12_0226BEF0