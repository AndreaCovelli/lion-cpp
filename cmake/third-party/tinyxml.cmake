if (${BUILD_TINYXML})

if (MSYS)
	set(windows_flag -D__FreeBSD__)
endif()

include (ExternalProject)
ExternalProject_Add(tinyxml
  GIT_REPOSITORY https://github.com/andreacovelli/tinyxml2.git
  GIT_TAG master
  PREFIX "${THIRD_PARTY_DIR}/tinyxml"
  SOURCE_DIR "${THIRD_PARTY_DIR}/tinyxml/source" 
  BINARY_DIR "${THIRD_PARTY_DIR}/tinyxml/build" 
  INSTALL_DIR "${THIRD_PARTY_DIR}/lion/thirdparty"
  
  CONFIGURE_COMMAND ${CMAKE_COMMAND}
                -DCMAKE_C_COMPILER:FILEPATH=${CMAKE_C_COMPILER}
                -DCMAKE_CXX_COMPILER:FILEPATH=${CMAKE_CXX_COMPILER}
                -DCMAKE_INSTALL_PREFIX:PATH=${THIRD_PARTY_DIR}/lion/thirdparty
                -DCMAKE_INSTALL_LIBDIR:STRING=lib
                -DCMAKE_CXX_FLAGS:STRING=-DTIXML_USE_STL
		-DCMAKE_BUILD_TYPE:STRING=Release
		-DBUILD_SHARED_LIBS:BOOL=On
		-DCMAKE_CXX_STANDARD=11
		-DCMAKE_CXX_FLAGS=${windows_flag}
                ${THIRD_PARTY_DIR}/tinyxml/source
)

endif()
