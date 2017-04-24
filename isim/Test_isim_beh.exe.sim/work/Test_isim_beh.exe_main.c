/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    xilinxcorelib_ver_m_00000000001358910285_2452494459_init();
    xilinxcorelib_ver_m_00000000001687936702_1893098575_init();
    xilinxcorelib_ver_m_00000000000277421008_1851102587_init();
    xilinxcorelib_ver_m_00000000001603977570_1074603218_init();
    work_m_00000000000403262735_2381739659_init();
    work_m_00000000002643247286_3715546195_init();
    work_m_00000000003884510415_3597375865_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000003884510415_3597375865");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
