if (${BUILD_LAPACK})

include (ExternalProject)
ExternalProject_Add(lapack
  GIT_REPOSITORY https://github.com/andreacovelli/lapack.git
  GIT_TAG master
  PREFIX "${THIRD_PARTY_DIR}/lapack"
  SOURCE_DIR "${THIRD_PARTY_DIR}/lapack/source" 
  BINARY_DIR "${THIRD_PARTY_DIR}/lapack/build" 
  INSTALL_DIR "${THIRD_PARTY_DIR}/lion/thirdparty"
  
  CONFIGURE_COMMAND ${CMAKE_COMMAND}
                -DCMAKE_C_COMPILER:FILEPATH=${CMAKE_C_COMPILER}
                -DCMAKE_CXX_COMPILER:FILEPATH=${CMAKE_CXX_COMPILER}
                -DCMAKE_INSTALL_PREFIX:PATH=${THIRD_PARTY_DIR}/lion/thirdparty
                -DCMAKE_INSTALL_LIBDIR=lib
        		-DBUILD_SHARED_LIBS:BOOL=YES
                ${THIRD_PARTY_DIR}/lapack/source
)

endif()
