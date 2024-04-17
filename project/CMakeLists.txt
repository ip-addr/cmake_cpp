# project(prj)    

set(prj_SDL2_dir    "${CMAKE_CURRENT_SOURCE_DIR}/prj_SDL2" )
set(prj_my_test_dir "${CMAKE_CURRENT_SOURCE_DIR}/prj_my_test" )

add_subdirectory( ${prj_SDL2_dir})
add_subdirectory( ${prj_my_test_dir})
