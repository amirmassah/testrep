#define SC_INCLUDE_DYNAMIC_PROCESSES

#include <systemc>
#include <systemc-ams>

using namespace sc_core;

int sc_main(int argc, char* argv[])
{
  sc_start(10, SC_SEC);
  std::cout<<"Welcome to SystemC and AMS modeling"<<std::endl;
  return 0;
}



