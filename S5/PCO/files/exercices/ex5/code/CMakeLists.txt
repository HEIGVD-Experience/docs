cmake_minimum_required(VERSION 3.13)

project(exercice_5_synchro_tests)

set(CMAKE_CXX_STANDARD 17)

set(SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/main.cpp
)

add_executable(exercice_5_synchro_tests ${SOURCES})

target_link_libraries(exercice_5_synchro_tests PRIVATE -lpcosynchro gtest)

