# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Release")
  file(REMOVE_RECURSE
  "CMakeFiles/snake-store_autogen.dir/AutogenUsed.txt"
  "CMakeFiles/snake-store_autogen.dir/ParseCache.txt"
  "snake-store_autogen"
  )
endif()
