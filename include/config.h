#ifndef POKEHEARTGOLD_CONFIG_H
#define POKEHEARTGOLD_CONFIG_H

#define VERSION_SAPPHIRE        1
#define VERSION_RUBY            2
#define VERSION_EMERALD         3
#define VERSION_FIRE_RED        4
#define VERSION_LEAF_GREEN      5
#define VERSION_HEARTGOLD       7
#define VERSION_SOULSILVER      8
#define VERSION_DIAMOND        10
#define VERSION_PEARL          11
#define VERSION_PLATINUM       12
#define VERSION_GAMECUBE       15

#define LANGUAGE_ENGLISH 2

#undef GAME_VERSION
#if defined(HEARTGOLD)
#define GAME_VERSION VERSION_HEARTGOLD
#elif defined(SOULSILVER)
#define GAME_VERSION VERSION_SOULSILVER
#else
#error "Missing or unrecognized game version define"
#endif

#undef GAME_LANGUAGE
#ifdef ENGLISH
#define GAME_LANGUAGE LANGUAGE_ENGLISH
#else
#error "Missing or unrecognized game language define"
#endif

#endif //POKEHEARTGOLD_CONFIG_H