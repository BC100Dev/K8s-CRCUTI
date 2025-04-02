function(CollectSources RootDir OutVar)
    set(SEARCH_PATTERNS
            "${RootDir}/*.cpp"
            "${RootDir}/*.hpp"
            "${RootDir}/*.c"
            "${RootDir}/*.h"
            "${RootDir}/*.cc"
            "${RootDir}/*.cuh"
            "${RootDir}/**/*.cpp"
            "${RootDir}/**/*.hpp"
            "${RootDir}/**/*.c"
            "${RootDir}/**/*.h"
            "${RootDir}/**/*.cc"
            "${RootDir}/**/*.cuh")

    file(GLOB_RECURSE SOURCE_FILES ${SEARCH_PATTERNS})
    set(${OutVar} ${SOURCE_FILES} PARENT_SCOPE)
endfunction()

function(CreateGoTarget TargetName GoSources)
	add_custom_target(${TargetName}
		COMMAND go build -o "${CMAKE_BINARY_DIR}/${TargetName}" "${GoSources}"
		WORKING_DIRECTORY "${GoSources}"
		COMMENT "Building Golang module: ${TargetName}"
	)
endfunction()
