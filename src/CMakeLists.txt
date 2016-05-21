add_executable( example
  main.cpp
  )

target_link_libraries( example ${SICYPHOS_LIBRARIES} ${SYSTEMCAMS_LIBRARIES} ${SYSTEMC_LIBRARIES} )
