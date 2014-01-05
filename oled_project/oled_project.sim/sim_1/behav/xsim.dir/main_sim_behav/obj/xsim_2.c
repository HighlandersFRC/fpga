/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2011 Xilinx, Inc.                 */
/*  /   /         All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
#include "iki.h"
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

int main(int argc, char **argv)
{
    void* design_handle = iki_create_design("xsim.dir/main_sim_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_sv_type_file_path_name("xsim.dir/main_sim_behav/xsim.svtype");
    (void* ) design_handle;
    return iki_simulate_design();
}
