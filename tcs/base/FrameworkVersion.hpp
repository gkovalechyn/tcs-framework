#define STRINGIFY(text) #text

#define VERSION_MAJOR 1
#define VERSION_MINOR 5
#define VERSION_PATCH 4

#define __FRAMEWORK_VERSION VERSION_MAJOR##.##VERSION_MINOR##.##VERSION_PATCH
#define VERSION_STRING STRINGIFY(__FRAMEWORK_VERSION)

#define __FRAMEWORK_NAME TCS Framework
#define FRAMEWORK_NAME STRINGIFY(__FRAMEWORK_NAME)

#define __FRAMEWORK_NAME_FULL __FRAMEWORK_NAME v##__FRAMEWORK_VERSION
#define FRAMEWORK_NAME_FULL STRINGIFY(__FRAMEWORK_NAME_FULL)
