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

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/Johan/Documents/TEC/Taller/I2cVhdlSabado/FSM_Logic.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {1U, 0U};
static unsigned int ng3[] = {13U, 0U};
static unsigned int ng4[] = {2U, 0U};
static unsigned int ng5[] = {3U, 0U};
static unsigned int ng6[] = {4U, 0U};
static unsigned int ng7[] = {5U, 0U};
static unsigned int ng8[] = {6U, 0U};
static unsigned int ng9[] = {7U, 0U};
static unsigned int ng10[] = {11U, 0U};
static unsigned int ng11[] = {8U, 0U};
static unsigned int ng12[] = {9U, 0U};
static unsigned int ng13[] = {10U, 0U};
static unsigned int ng14[] = {12U, 0U};
static unsigned int ng15[] = {14U, 0U};
static unsigned int ng16[] = {15U, 0U};



static void Always_34_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;

LAB0:    t1 = (t0 + 5824U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(34, ng0);
    t2 = (t0 + 6640);
    *((int *)t2) = 1;
    t3 = (t0 + 5856);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(35, ng0);
    t4 = (t0 + 3384U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB5;

LAB6:    xsi_set_current_line(38, ng0);
    t2 = (t0 + 4904);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4744);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 4);

LAB7:    goto LAB2;

LAB5:    xsi_set_current_line(36, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 4744);
    xsi_vlogvar_assign_value(t12, t11, 0, 0, 4);
    goto LAB7;

}

static void Always_41_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    int t8;
    char *t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    char *t16;
    char *t17;

LAB0:    t1 = (t0 + 6072U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(41, ng0);
    t2 = (t0 + 6656);
    *((int *)t2) = 1;
    t3 = (t0 + 6104);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(42, ng0);
    t4 = (t0 + 4744);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);

LAB5:    t7 = ((char*)((ng1)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t7, 4);
    if (t8 == 1)
        goto LAB6;

LAB7:    t2 = ((char*)((ng2)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB8;

LAB9:    t2 = ((char*)((ng4)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB10;

LAB11:    t2 = ((char*)((ng5)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB12;

LAB13:    t2 = ((char*)((ng6)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB14;

LAB15:    t2 = ((char*)((ng7)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB16;

LAB17:    t2 = ((char*)((ng8)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB18;

LAB19:    t2 = ((char*)((ng9)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB20;

LAB21:    t2 = ((char*)((ng11)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB22;

LAB23:    t2 = ((char*)((ng12)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB24;

LAB25:    t2 = ((char*)((ng13)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB26;

LAB27:    t2 = ((char*)((ng10)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB28;

LAB29:    t2 = ((char*)((ng14)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB30;

LAB31:    t2 = ((char*)((ng3)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB32;

LAB33:    t2 = ((char*)((ng15)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB34;

LAB35:    t2 = ((char*)((ng16)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB36;

LAB37:
LAB38:    goto LAB2;

LAB6:    xsi_set_current_line(43, ng0);
    t9 = (t0 + 3544U);
    t10 = *((char **)t9);
    t9 = (t10 + 4);
    t11 = *((unsigned int *)t9);
    t12 = (~(t11));
    t13 = *((unsigned int *)t10);
    t14 = (t13 & t12);
    t15 = (t14 != 0);
    if (t15 > 0)
        goto LAB39;

LAB40:    xsi_set_current_line(46, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4904);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);

LAB41:    goto LAB38;

LAB8:    xsi_set_current_line(48, ng0);
    t3 = (t0 + 3704U);
    t4 = *((char **)t3);
    t3 = (t4 + 4);
    t11 = *((unsigned int *)t3);
    t12 = (~(t11));
    t13 = *((unsigned int *)t4);
    t14 = (t13 & t12);
    t15 = (t14 != 0);
    if (t15 > 0)
        goto LAB42;

LAB43:    xsi_set_current_line(51, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 4904);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);

LAB44:    goto LAB38;

LAB10:    xsi_set_current_line(53, ng0);
    t3 = (t0 + 3704U);
    t4 = *((char **)t3);
    t3 = (t4 + 4);
    t11 = *((unsigned int *)t3);
    t12 = (~(t11));
    t13 = *((unsigned int *)t4);
    t14 = (t13 & t12);
    t15 = (t14 != 0);
    if (t15 > 0)
        goto LAB45;

LAB46:    xsi_set_current_line(56, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 4904);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);

LAB47:    goto LAB38;

LAB12:    xsi_set_current_line(57, ng0);
    t3 = (t0 + 3704U);
    t4 = *((char **)t3);
    t3 = (t4 + 4);
    t11 = *((unsigned int *)t3);
    t12 = (~(t11));
    t13 = *((unsigned int *)t4);
    t14 = (t13 & t12);
    t15 = (t14 != 0);
    if (t15 > 0)
        goto LAB48;

LAB49:    xsi_set_current_line(60, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 4904);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);

LAB50:    goto LAB38;

LAB14:    xsi_set_current_line(61, ng0);
    t3 = ((char*)((ng7)));
    t4 = (t0 + 4904);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 4);
    goto LAB38;

LAB16:    xsi_set_current_line(62, ng0);
    t3 = ((char*)((ng8)));
    t4 = (t0 + 4904);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 4);
    goto LAB38;

LAB18:    xsi_set_current_line(63, ng0);
    t3 = ((char*)((ng9)));
    t4 = (t0 + 4904);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 4);
    goto LAB38;

LAB20:    xsi_set_current_line(64, ng0);
    t3 = ((char*)((ng10)));
    t4 = (t0 + 4904);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 4);
    goto LAB38;

LAB22:    xsi_set_current_line(65, ng0);
    t3 = (t0 + 3704U);
    t4 = *((char **)t3);
    t3 = (t4 + 4);
    t11 = *((unsigned int *)t3);
    t12 = (~(t11));
    t13 = *((unsigned int *)t4);
    t14 = (t13 & t12);
    t15 = (t14 != 0);
    if (t15 > 0)
        goto LAB51;

LAB52:    xsi_set_current_line(68, ng0);
    t2 = ((char*)((ng12)));
    t3 = (t0 + 4904);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);

LAB53:    goto LAB38;

LAB24:    xsi_set_current_line(69, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 4904);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 4);
    goto LAB38;

LAB26:    xsi_set_current_line(70, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 4904);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 4);
    goto LAB38;

LAB28:    xsi_set_current_line(71, ng0);
    t3 = ((char*)((ng14)));
    t4 = (t0 + 4904);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 4);
    goto LAB38;

LAB30:    xsi_set_current_line(72, ng0);
    t3 = ((char*)((ng3)));
    t4 = (t0 + 4904);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 4);
    goto LAB38;

LAB32:    xsi_set_current_line(73, ng0);
    t3 = ((char*)((ng11)));
    t4 = (t0 + 4904);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 4);
    goto LAB38;

LAB34:    xsi_set_current_line(74, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 4904);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 4);
    goto LAB38;

LAB36:    xsi_set_current_line(75, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 4904);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 4);
    goto LAB38;

LAB39:    xsi_set_current_line(44, ng0);
    t16 = ((char*)((ng2)));
    t17 = (t0 + 4904);
    xsi_vlogvar_assign_value(t17, t16, 0, 0, 4);
    goto LAB41;

LAB42:    xsi_set_current_line(49, ng0);
    t5 = ((char*)((ng3)));
    t7 = (t0 + 4904);
    xsi_vlogvar_assign_value(t7, t5, 0, 0, 4);
    goto LAB44;

LAB45:    xsi_set_current_line(54, ng0);
    t5 = ((char*)((ng4)));
    t7 = (t0 + 4904);
    xsi_vlogvar_assign_value(t7, t5, 0, 0, 4);
    goto LAB47;

LAB48:    xsi_set_current_line(58, ng0);
    t5 = ((char*)((ng6)));
    t7 = (t0 + 4904);
    xsi_vlogvar_assign_value(t7, t5, 0, 0, 4);
    goto LAB50;

LAB51:    xsi_set_current_line(66, ng0);
    t5 = ((char*)((ng11)));
    t7 = (t0 + 4904);
    xsi_vlogvar_assign_value(t7, t5, 0, 0, 4);
    goto LAB53;

}

static void Always_82_2(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    int t8;
    char *t9;
    char *t10;

LAB0:    t1 = (t0 + 6320U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(82, ng0);
    t2 = (t0 + 6672);
    *((int *)t2) = 1;
    t3 = (t0 + 6352);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(83, ng0);
    t4 = (t0 + 4744);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);

LAB5:    t7 = ((char*)((ng1)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t7, 4);
    if (t8 == 1)
        goto LAB6;

LAB7:    t2 = ((char*)((ng2)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB8;

LAB9:    t2 = ((char*)((ng4)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB10;

LAB11:    t2 = ((char*)((ng5)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB12;

LAB13:    t2 = ((char*)((ng6)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB14;

LAB15:    t2 = ((char*)((ng7)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB16;

LAB17:    t2 = ((char*)((ng8)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB18;

LAB19:    t2 = ((char*)((ng9)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB20;

LAB21:    t2 = ((char*)((ng11)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB22;

LAB23:    t2 = ((char*)((ng12)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB24;

LAB25:    t2 = ((char*)((ng13)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB26;

LAB27:    t2 = ((char*)((ng10)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB28;

LAB29:    t2 = ((char*)((ng14)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB30;

LAB31:    t2 = ((char*)((ng3)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB32;

LAB33:    t2 = ((char*)((ng15)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB34;

LAB35:    t2 = ((char*)((ng16)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 4, t2, 4);
    if (t8 == 1)
        goto LAB36;

LAB37:
LAB38:    goto LAB2;

LAB6:    xsi_set_current_line(84, ng0);

LAB39:    xsi_set_current_line(85, ng0);
    t9 = ((char*)((ng1)));
    t10 = (t0 + 4264);
    xsi_vlogvar_assign_value(t10, t9, 0, 0, 1);
    xsi_set_current_line(86, ng0);
    t2 = (t0 + 4424);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4424);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 8);
    xsi_set_current_line(87, ng0);
    t2 = (t0 + 4584);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4584);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 8);
    goto LAB38;

LAB8:    xsi_set_current_line(89, ng0);

LAB40:    xsi_set_current_line(90, ng0);
    t3 = ((char*)((ng2)));
    t4 = (t0 + 4264);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 1);
    xsi_set_current_line(91, ng0);
    t2 = (t0 + 4424);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4424);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 8);
    xsi_set_current_line(92, ng0);
    t2 = (t0 + 4584);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4584);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 8);
    goto LAB38;

LAB10:    xsi_set_current_line(94, ng0);

LAB41:    xsi_set_current_line(95, ng0);
    t3 = ((char*)((ng2)));
    t4 = (t0 + 4264);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 1);
    xsi_set_current_line(96, ng0);
    t2 = (t0 + 4424);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4424);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 8);
    xsi_set_current_line(97, ng0);
    t2 = (t0 + 4584);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4584);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 8);
    goto LAB38;

LAB12:    xsi_set_current_line(99, ng0);

LAB42:    xsi_set_current_line(100, ng0);
    t3 = ((char*)((ng2)));
    t4 = (t0 + 4264);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 1);
    xsi_set_current_line(101, ng0);
    t2 = (t0 + 3864U);
    t3 = *((char **)t2);
    t2 = (t0 + 4424);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 8);
    xsi_set_current_line(102, ng0);
    t2 = (t0 + 4584);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4584);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 8);
    goto LAB38;

LAB14:    xsi_set_current_line(106, ng0);

LAB43:    xsi_set_current_line(107, ng0);
    t3 = ((char*)((ng2)));
    t4 = (t0 + 4264);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 1);
    xsi_set_current_line(108, ng0);
    t2 = (t0 + 4424);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4424);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 8);
    xsi_set_current_line(109, ng0);
    t2 = (t0 + 4584);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4584);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 8);
    goto LAB38;

LAB16:    xsi_set_current_line(111, ng0);

LAB44:    xsi_set_current_line(112, ng0);
    t3 = ((char*)((ng2)));
    t4 = (t0 + 4264);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 1);
    xsi_set_current_line(113, ng0);
    t2 = (t0 + 4424);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4424);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 8);
    xsi_set_current_line(114, ng0);
    t2 = (t0 + 4584);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4584);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 8);
    goto LAB38;

LAB18:    xsi_set_current_line(116, ng0);

LAB45:    xsi_set_current_line(117, ng0);
    t3 = ((char*)((ng2)));
    t4 = (t0 + 4264);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 1);
    xsi_set_current_line(118, ng0);
    t2 = (t0 + 4424);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4424);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 8);
    xsi_set_current_line(119, ng0);
    t2 = (t0 + 4584);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4584);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 8);
    goto LAB38;

LAB20:    xsi_set_current_line(121, ng0);

LAB46:    xsi_set_current_line(122, ng0);
    t3 = ((char*)((ng2)));
    t4 = (t0 + 4264);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 1);
    xsi_set_current_line(123, ng0);
    t2 = (t0 + 4424);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4424);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 8);
    xsi_set_current_line(124, ng0);
    t2 = (t0 + 4584);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4584);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 8);
    goto LAB38;

LAB22:    xsi_set_current_line(126, ng0);

LAB47:    xsi_set_current_line(127, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 4264);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 1);
    xsi_set_current_line(128, ng0);
    t2 = (t0 + 4424);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4424);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 8);
    xsi_set_current_line(129, ng0);
    t2 = (t0 + 4584);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4584);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 8);
    goto LAB38;

LAB24:    xsi_set_current_line(131, ng0);

LAB48:    xsi_set_current_line(132, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 4264);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 1);
    xsi_set_current_line(133, ng0);
    t2 = (t0 + 4424);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4424);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 8);
    xsi_set_current_line(134, ng0);
    t2 = (t0 + 3864U);
    t3 = *((char **)t2);
    t2 = (t0 + 4584);
    xsi_vlogvar_assign_value(t2, t3, 0, 0, 8);
    goto LAB38;

LAB26:    xsi_set_current_line(137, ng0);

LAB49:    xsi_set_current_line(138, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 4264);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 1);
    xsi_set_current_line(139, ng0);
    t2 = (t0 + 4424);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4424);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 8);
    xsi_set_current_line(140, ng0);
    t2 = (t0 + 4584);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4584);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 8);
    goto LAB38;

LAB28:    xsi_set_current_line(142, ng0);

LAB50:    xsi_set_current_line(143, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 4264);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 1);
    xsi_set_current_line(144, ng0);
    t2 = (t0 + 4424);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4424);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 8);
    xsi_set_current_line(145, ng0);
    t2 = (t0 + 4584);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4584);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 8);
    goto LAB38;

LAB30:    xsi_set_current_line(147, ng0);

LAB51:    xsi_set_current_line(148, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 4264);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 1);
    xsi_set_current_line(149, ng0);
    t2 = (t0 + 4424);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4424);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 8);
    xsi_set_current_line(150, ng0);
    t2 = (t0 + 4584);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4584);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 8);
    goto LAB38;

LAB32:    xsi_set_current_line(152, ng0);

LAB52:    xsi_set_current_line(153, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 4264);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 1);
    xsi_set_current_line(154, ng0);
    t2 = (t0 + 4424);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4424);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 8);
    xsi_set_current_line(155, ng0);
    t2 = (t0 + 4584);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4584);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 8);
    goto LAB38;

LAB34:    xsi_set_current_line(157, ng0);

LAB53:    xsi_set_current_line(158, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 4264);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 1);
    xsi_set_current_line(159, ng0);
    t2 = (t0 + 4424);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4424);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 8);
    xsi_set_current_line(160, ng0);
    t2 = (t0 + 4584);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4584);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 8);
    goto LAB38;

LAB36:    xsi_set_current_line(162, ng0);

LAB54:    xsi_set_current_line(163, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 4264);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 1);
    xsi_set_current_line(164, ng0);
    t2 = (t0 + 4424);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4424);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 8);
    xsi_set_current_line(165, ng0);
    t2 = (t0 + 4584);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4584);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 8);
    goto LAB38;

}


extern void work_m_00000000001828853207_3520920028_init()
{
	static char *pe[] = {(void *)Always_34_0,(void *)Always_41_1,(void *)Always_82_2};
	xsi_register_didat("work_m_00000000001828853207_3520920028", "isim/testnupuedo_isim_beh.exe.sim/work/m_00000000001828853207_3520920028.didat");
	xsi_register_executes(pe);
}
