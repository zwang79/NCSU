cmake_minimum_required(VERSION 3.13)

project(ece563-project1)

add_library(src ../sim_pipe.h ../sim_pipe.cc ../sim_pipe_fp.cc ../sim_pipe_fp.h lib/sp_register.h lib/sp_register.cc lib/sp_register_fp.cc lib/sp_register_fp.h)

add_subdirectory(testcases)
add_subdirectory(asm)
add_subdirectory(lib)