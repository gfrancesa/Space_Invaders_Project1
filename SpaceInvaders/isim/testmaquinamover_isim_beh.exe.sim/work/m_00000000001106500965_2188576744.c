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
static const char *ng0 = "C:/Users/Johan/Documents/TEC/Taller/SpaceInvaders/Machine.v";
static unsigned int ng1[] = {128U, 0U};
static unsigned int ng2[] = {0U, 0U};
static unsigned int ng3[] = {1U, 0U};
static unsigned int ng4[] = {4U, 0U};
static unsigned int ng5[] = {2U, 0U};
static unsigned int ng6[] = {3U, 0U};
static unsigned int ng7[] = {127U, 0U};
static unsigned int ng8[] = {5U, 0U};
static int ng9[] = {0, 0};
static unsigned int ng10[] = {300U, 0U};
static unsigned int ng11[] = {6U, 0U};
static unsigned int ng12[] = {7U, 0U};



static void Initial_32_0(char *t0)
{
    char *t1;
    char *t2;

LAB0:    xsi_set_current_line(33, ng0);

LAB2:    xsi_set_current_line(34, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 2856);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 11);
    xsi_set_current_line(35, ng0);
    t1 = ((char*)((ng2)));
    t2 = (t0 + 3016);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 9);
    xsi_set_current_line(36, ng0);
    t1 = ((char*)((ng2)));
    t2 = (t0 + 3176);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 2);

LAB1:    return;
}

static void Always_43_1(char *t0)
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

LAB0:    t1 = (t0 + 4664U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(43, ng0);
    t2 = (t0 + 5480);
    *((int *)t2) = 1;
    t3 = (t0 + 4696);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(44, ng0);
    t4 = (t0 + 2296U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB5;

LAB6:    xsi_set_current_line(48, ng0);
    t2 = (t0 + 3496);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 3336);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 3);

LAB7:    goto LAB2;

LAB5:    xsi_set_current_line(45, ng0);
    t11 = ((char*)((ng2)));
    t12 = (t0 + 3336);
    xsi_vlogvar_assign_value(t12, t11, 0, 0, 3);
    goto LAB7;

}

static void Always_51_2(char *t0)
{
    char t11[8];
    char t26[8];
    char t42[8];
    char t50[8];
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
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    char *t17;
    char *t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t27;
    char *t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    char *t41;
    char *t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    char *t49;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    char *t54;
    char *t55;
    char *t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    char *t64;
    char *t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    int t74;
    int t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    char *t82;
    unsigned int t83;
    unsigned int t84;
    unsigned int t85;
    unsigned int t86;
    unsigned int t87;
    char *t88;
    char *t89;

LAB0:    t1 = (t0 + 4912U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(51, ng0);
    t2 = (t0 + 5496);
    *((int *)t2) = 1;
    t3 = (t0 + 4944);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(52, ng0);
    t4 = (t0 + 3336);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);

LAB5:    t7 = ((char*)((ng2)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 3, t7, 3);
    if (t8 == 1)
        goto LAB6;

LAB7:    t2 = ((char*)((ng3)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 3, t2, 3);
    if (t8 == 1)
        goto LAB8;

LAB9:    t2 = ((char*)((ng4)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 3, t2, 3);
    if (t8 == 1)
        goto LAB10;

LAB11:    t2 = ((char*)((ng6)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 3, t2, 3);
    if (t8 == 1)
        goto LAB12;

LAB13:    t2 = ((char*)((ng8)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 3, t2, 3);
    if (t8 == 1)
        goto LAB14;

LAB15:    t2 = ((char*)((ng11)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 3, t2, 3);
    if (t8 == 1)
        goto LAB16;

LAB17:    t2 = ((char*)((ng5)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 3, t2, 3);
    if (t8 == 1)
        goto LAB18;

LAB19:    t2 = ((char*)((ng12)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 3, t2, 3);
    if (t8 == 1)
        goto LAB20;

LAB21:
LAB22:    goto LAB2;

LAB6:    xsi_set_current_line(53, ng0);
    t9 = (t0 + 2456U);
    t10 = *((char **)t9);
    memset(t11, 0, 8);
    t9 = (t10 + 4);
    t12 = *((unsigned int *)t9);
    t13 = (~(t12));
    t14 = *((unsigned int *)t10);
    t15 = (t14 & t13);
    t16 = (t15 & 1U);
    if (t16 != 0)
        goto LAB23;

LAB24:    if (*((unsigned int *)t9) != 0)
        goto LAB25;

LAB26:    t18 = (t11 + 4);
    t19 = *((unsigned int *)t11);
    t20 = *((unsigned int *)t18);
    t21 = (t19 || t20);
    if (t21 > 0)
        goto LAB27;

LAB28:    memcpy(t50, t11, 8);

LAB29:    t82 = (t50 + 4);
    t83 = *((unsigned int *)t82);
    t84 = (~(t83));
    t85 = *((unsigned int *)t50);
    t86 = (t85 & t84);
    t87 = (t86 != 0);
    if (t87 > 0)
        goto LAB41;

LAB42:    xsi_set_current_line(55, ng0);
    t2 = (t0 + 2456U);
    t3 = *((char **)t2);
    memset(t11, 0, 8);
    t2 = (t3 + 4);
    t12 = *((unsigned int *)t2);
    t13 = (~(t12));
    t14 = *((unsigned int *)t3);
    t15 = (t14 & t13);
    t16 = (t15 & 1U);
    if (t16 != 0)
        goto LAB44;

LAB45:    if (*((unsigned int *)t2) != 0)
        goto LAB46;

LAB47:    t5 = (t11 + 4);
    t19 = *((unsigned int *)t11);
    t20 = *((unsigned int *)t5);
    t21 = (t19 || t20);
    if (t21 > 0)
        goto LAB48;

LAB49:    memcpy(t50, t11, 8);

LAB50:    t54 = (t50 + 4);
    t83 = *((unsigned int *)t54);
    t84 = (~(t83));
    t85 = *((unsigned int *)t50);
    t86 = (t85 & t84);
    t87 = (t86 != 0);
    if (t87 > 0)
        goto LAB62;

LAB63:    xsi_set_current_line(57, ng0);
    t2 = (t0 + 2456U);
    t3 = *((char **)t2);
    memset(t11, 0, 8);
    t2 = (t3 + 4);
    t12 = *((unsigned int *)t2);
    t13 = (~(t12));
    t14 = *((unsigned int *)t3);
    t15 = (t14 & t13);
    t16 = (t15 & 1U);
    if (t16 != 0)
        goto LAB65;

LAB66:    if (*((unsigned int *)t2) != 0)
        goto LAB67;

LAB68:    t5 = (t11 + 4);
    t19 = *((unsigned int *)t11);
    t20 = *((unsigned int *)t5);
    t21 = (t19 || t20);
    if (t21 > 0)
        goto LAB69;

LAB70:    memcpy(t50, t11, 8);

LAB71:    t54 = (t50 + 4);
    t83 = *((unsigned int *)t54);
    t84 = (~(t83));
    t85 = *((unsigned int *)t50);
    t86 = (t85 & t84);
    t87 = (t86 != 0);
    if (t87 > 0)
        goto LAB83;

LAB84:    xsi_set_current_line(60, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3496);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 3);

LAB85:
LAB64:
LAB43:    goto LAB22;

LAB8:    xsi_set_current_line(62, ng0);
    t3 = (t0 + 3016);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t7 = ((char*)((ng7)));
    memset(t11, 0, 8);
    t9 = (t5 + 4);
    t10 = (t7 + 4);
    t12 = *((unsigned int *)t5);
    t13 = *((unsigned int *)t7);
    t14 = (t12 ^ t13);
    t15 = *((unsigned int *)t9);
    t16 = *((unsigned int *)t10);
    t19 = (t15 ^ t16);
    t20 = (t14 | t19);
    t21 = *((unsigned int *)t9);
    t29 = *((unsigned int *)t10);
    t30 = (t21 | t29);
    t31 = (~(t30));
    t32 = (t20 & t31);
    if (t32 != 0)
        goto LAB89;

LAB86:    if (t30 != 0)
        goto LAB88;

LAB87:    *((unsigned int *)t11) = 1;

LAB89:    t18 = (t11 + 4);
    t33 = *((unsigned int *)t18);
    t34 = (~(t33));
    t35 = *((unsigned int *)t11);
    t36 = (t35 & t34);
    t37 = (t36 != 0);
    if (t37 > 0)
        goto LAB90;

LAB91:    xsi_set_current_line(65, ng0);
    t2 = ((char*)((ng9)));
    t3 = (t0 + 3496);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 3);

LAB92:    goto LAB22;

LAB10:    xsi_set_current_line(67, ng0);
    t3 = (t0 + 3016);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t7 = ((char*)((ng10)));
    memset(t11, 0, 8);
    t9 = (t5 + 4);
    t10 = (t7 + 4);
    t12 = *((unsigned int *)t5);
    t13 = *((unsigned int *)t7);
    t14 = (t12 ^ t13);
    t15 = *((unsigned int *)t9);
    t16 = *((unsigned int *)t10);
    t19 = (t15 ^ t16);
    t20 = (t14 | t19);
    t21 = *((unsigned int *)t9);
    t29 = *((unsigned int *)t10);
    t30 = (t21 | t29);
    t31 = (~(t30));
    t32 = (t20 & t31);
    if (t32 != 0)
        goto LAB96;

LAB93:    if (t30 != 0)
        goto LAB95;

LAB94:    *((unsigned int *)t11) = 1;

LAB96:    t18 = (t11 + 4);
    t33 = *((unsigned int *)t18);
    t34 = (~(t33));
    t35 = *((unsigned int *)t11);
    t36 = (t35 & t34);
    t37 = (t36 != 0);
    if (t37 > 0)
        goto LAB97;

LAB98:    xsi_set_current_line(70, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3496);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 3);

LAB99:    goto LAB22;

LAB12:    xsi_set_current_line(72, ng0);
    t3 = (t0 + 3016);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t7 = ((char*)((ng10)));
    memset(t11, 0, 8);
    t9 = (t5 + 4);
    t10 = (t7 + 4);
    t12 = *((unsigned int *)t5);
    t13 = *((unsigned int *)t7);
    t14 = (t12 ^ t13);
    t15 = *((unsigned int *)t9);
    t16 = *((unsigned int *)t10);
    t19 = (t15 ^ t16);
    t20 = (t14 | t19);
    t21 = *((unsigned int *)t9);
    t29 = *((unsigned int *)t10);
    t30 = (t21 | t29);
    t31 = (~(t30));
    t32 = (t20 & t31);
    if (t32 != 0)
        goto LAB103;

LAB100:    if (t30 != 0)
        goto LAB102;

LAB101:    *((unsigned int *)t11) = 1;

LAB103:    t18 = (t11 + 4);
    t33 = *((unsigned int *)t18);
    t34 = (~(t33));
    t35 = *((unsigned int *)t11);
    t36 = (t35 & t34);
    t37 = (t36 != 0);
    if (t37 > 0)
        goto LAB104;

LAB105:    xsi_set_current_line(75, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3496);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 3);

LAB106:    goto LAB22;

LAB14:    xsi_set_current_line(77, ng0);
    t3 = ((char*)((ng2)));
    t4 = (t0 + 3496);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 3);
    goto LAB22;

LAB16:    xsi_set_current_line(79, ng0);
    t3 = ((char*)((ng2)));
    t4 = (t0 + 3496);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 3);
    goto LAB22;

LAB18:    xsi_set_current_line(81, ng0);
    t3 = ((char*)((ng2)));
    t4 = (t0 + 3496);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 3);
    goto LAB22;

LAB20:    xsi_set_current_line(83, ng0);
    t3 = ((char*)((ng2)));
    t4 = (t0 + 3496);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 3);
    goto LAB22;

LAB23:    *((unsigned int *)t11) = 1;
    goto LAB26;

LAB25:    t17 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t17) = 1;
    goto LAB26;

LAB27:    t22 = (t0 + 3176);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    t25 = ((char*)((ng2)));
    memset(t26, 0, 8);
    t27 = (t24 + 4);
    t28 = (t25 + 4);
    t29 = *((unsigned int *)t24);
    t30 = *((unsigned int *)t25);
    t31 = (t29 ^ t30);
    t32 = *((unsigned int *)t27);
    t33 = *((unsigned int *)t28);
    t34 = (t32 ^ t33);
    t35 = (t31 | t34);
    t36 = *((unsigned int *)t27);
    t37 = *((unsigned int *)t28);
    t38 = (t36 | t37);
    t39 = (~(t38));
    t40 = (t35 & t39);
    if (t40 != 0)
        goto LAB33;

LAB30:    if (t38 != 0)
        goto LAB32;

LAB31:    *((unsigned int *)t26) = 1;

LAB33:    memset(t42, 0, 8);
    t43 = (t26 + 4);
    t44 = *((unsigned int *)t43);
    t45 = (~(t44));
    t46 = *((unsigned int *)t26);
    t47 = (t46 & t45);
    t48 = (t47 & 1U);
    if (t48 != 0)
        goto LAB34;

LAB35:    if (*((unsigned int *)t43) != 0)
        goto LAB36;

LAB37:    t51 = *((unsigned int *)t11);
    t52 = *((unsigned int *)t42);
    t53 = (t51 & t52);
    *((unsigned int *)t50) = t53;
    t54 = (t11 + 4);
    t55 = (t42 + 4);
    t56 = (t50 + 4);
    t57 = *((unsigned int *)t54);
    t58 = *((unsigned int *)t55);
    t59 = (t57 | t58);
    *((unsigned int *)t56) = t59;
    t60 = *((unsigned int *)t56);
    t61 = (t60 != 0);
    if (t61 == 1)
        goto LAB38;

LAB39:
LAB40:    goto LAB29;

LAB32:    t41 = (t26 + 4);
    *((unsigned int *)t26) = 1;
    *((unsigned int *)t41) = 1;
    goto LAB33;

LAB34:    *((unsigned int *)t42) = 1;
    goto LAB37;

LAB36:    t49 = (t42 + 4);
    *((unsigned int *)t42) = 1;
    *((unsigned int *)t49) = 1;
    goto LAB37;

LAB38:    t62 = *((unsigned int *)t50);
    t63 = *((unsigned int *)t56);
    *((unsigned int *)t50) = (t62 | t63);
    t64 = (t11 + 4);
    t65 = (t42 + 4);
    t66 = *((unsigned int *)t11);
    t67 = (~(t66));
    t68 = *((unsigned int *)t64);
    t69 = (~(t68));
    t70 = *((unsigned int *)t42);
    t71 = (~(t70));
    t72 = *((unsigned int *)t65);
    t73 = (~(t72));
    t74 = (t67 & t69);
    t75 = (t71 & t73);
    t76 = (~(t74));
    t77 = (~(t75));
    t78 = *((unsigned int *)t56);
    *((unsigned int *)t56) = (t78 & t76);
    t79 = *((unsigned int *)t56);
    *((unsigned int *)t56) = (t79 & t77);
    t80 = *((unsigned int *)t50);
    *((unsigned int *)t50) = (t80 & t76);
    t81 = *((unsigned int *)t50);
    *((unsigned int *)t50) = (t81 & t77);
    goto LAB40;

LAB41:    xsi_set_current_line(54, ng0);
    t88 = ((char*)((ng3)));
    t89 = (t0 + 3496);
    xsi_vlogvar_assign_value(t89, t88, 0, 0, 3);
    goto LAB43;

LAB44:    *((unsigned int *)t11) = 1;
    goto LAB47;

LAB46:    t4 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t4) = 1;
    goto LAB47;

LAB48:    t7 = (t0 + 3176);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    t17 = ((char*)((ng3)));
    memset(t26, 0, 8);
    t18 = (t10 + 4);
    t22 = (t17 + 4);
    t29 = *((unsigned int *)t10);
    t30 = *((unsigned int *)t17);
    t31 = (t29 ^ t30);
    t32 = *((unsigned int *)t18);
    t33 = *((unsigned int *)t22);
    t34 = (t32 ^ t33);
    t35 = (t31 | t34);
    t36 = *((unsigned int *)t18);
    t37 = *((unsigned int *)t22);
    t38 = (t36 | t37);
    t39 = (~(t38));
    t40 = (t35 & t39);
    if (t40 != 0)
        goto LAB54;

LAB51:    if (t38 != 0)
        goto LAB53;

LAB52:    *((unsigned int *)t26) = 1;

LAB54:    memset(t42, 0, 8);
    t24 = (t26 + 4);
    t44 = *((unsigned int *)t24);
    t45 = (~(t44));
    t46 = *((unsigned int *)t26);
    t47 = (t46 & t45);
    t48 = (t47 & 1U);
    if (t48 != 0)
        goto LAB55;

LAB56:    if (*((unsigned int *)t24) != 0)
        goto LAB57;

LAB58:    t51 = *((unsigned int *)t11);
    t52 = *((unsigned int *)t42);
    t53 = (t51 & t52);
    *((unsigned int *)t50) = t53;
    t27 = (t11 + 4);
    t28 = (t42 + 4);
    t41 = (t50 + 4);
    t57 = *((unsigned int *)t27);
    t58 = *((unsigned int *)t28);
    t59 = (t57 | t58);
    *((unsigned int *)t41) = t59;
    t60 = *((unsigned int *)t41);
    t61 = (t60 != 0);
    if (t61 == 1)
        goto LAB59;

LAB60:
LAB61:    goto LAB50;

LAB53:    t23 = (t26 + 4);
    *((unsigned int *)t26) = 1;
    *((unsigned int *)t23) = 1;
    goto LAB54;

LAB55:    *((unsigned int *)t42) = 1;
    goto LAB58;

LAB57:    t25 = (t42 + 4);
    *((unsigned int *)t42) = 1;
    *((unsigned int *)t25) = 1;
    goto LAB58;

LAB59:    t62 = *((unsigned int *)t50);
    t63 = *((unsigned int *)t41);
    *((unsigned int *)t50) = (t62 | t63);
    t43 = (t11 + 4);
    t49 = (t42 + 4);
    t66 = *((unsigned int *)t11);
    t67 = (~(t66));
    t68 = *((unsigned int *)t43);
    t69 = (~(t68));
    t70 = *((unsigned int *)t42);
    t71 = (~(t70));
    t72 = *((unsigned int *)t49);
    t73 = (~(t72));
    t8 = (t67 & t69);
    t74 = (t71 & t73);
    t76 = (~(t8));
    t77 = (~(t74));
    t78 = *((unsigned int *)t41);
    *((unsigned int *)t41) = (t78 & t76);
    t79 = *((unsigned int *)t41);
    *((unsigned int *)t41) = (t79 & t77);
    t80 = *((unsigned int *)t50);
    *((unsigned int *)t50) = (t80 & t76);
    t81 = *((unsigned int *)t50);
    *((unsigned int *)t50) = (t81 & t77);
    goto LAB61;

LAB62:    xsi_set_current_line(56, ng0);
    t55 = ((char*)((ng4)));
    t56 = (t0 + 3496);
    xsi_vlogvar_assign_value(t56, t55, 0, 0, 3);
    goto LAB64;

LAB65:    *((unsigned int *)t11) = 1;
    goto LAB68;

LAB67:    t4 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t4) = 1;
    goto LAB68;

LAB69:    t7 = (t0 + 3176);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    t17 = ((char*)((ng5)));
    memset(t26, 0, 8);
    t18 = (t10 + 4);
    t22 = (t17 + 4);
    t29 = *((unsigned int *)t10);
    t30 = *((unsigned int *)t17);
    t31 = (t29 ^ t30);
    t32 = *((unsigned int *)t18);
    t33 = *((unsigned int *)t22);
    t34 = (t32 ^ t33);
    t35 = (t31 | t34);
    t36 = *((unsigned int *)t18);
    t37 = *((unsigned int *)t22);
    t38 = (t36 | t37);
    t39 = (~(t38));
    t40 = (t35 & t39);
    if (t40 != 0)
        goto LAB75;

LAB72:    if (t38 != 0)
        goto LAB74;

LAB73:    *((unsigned int *)t26) = 1;

LAB75:    memset(t42, 0, 8);
    t24 = (t26 + 4);
    t44 = *((unsigned int *)t24);
    t45 = (~(t44));
    t46 = *((unsigned int *)t26);
    t47 = (t46 & t45);
    t48 = (t47 & 1U);
    if (t48 != 0)
        goto LAB76;

LAB77:    if (*((unsigned int *)t24) != 0)
        goto LAB78;

LAB79:    t51 = *((unsigned int *)t11);
    t52 = *((unsigned int *)t42);
    t53 = (t51 & t52);
    *((unsigned int *)t50) = t53;
    t27 = (t11 + 4);
    t28 = (t42 + 4);
    t41 = (t50 + 4);
    t57 = *((unsigned int *)t27);
    t58 = *((unsigned int *)t28);
    t59 = (t57 | t58);
    *((unsigned int *)t41) = t59;
    t60 = *((unsigned int *)t41);
    t61 = (t60 != 0);
    if (t61 == 1)
        goto LAB80;

LAB81:
LAB82:    goto LAB71;

LAB74:    t23 = (t26 + 4);
    *((unsigned int *)t26) = 1;
    *((unsigned int *)t23) = 1;
    goto LAB75;

LAB76:    *((unsigned int *)t42) = 1;
    goto LAB79;

LAB78:    t25 = (t42 + 4);
    *((unsigned int *)t42) = 1;
    *((unsigned int *)t25) = 1;
    goto LAB79;

LAB80:    t62 = *((unsigned int *)t50);
    t63 = *((unsigned int *)t41);
    *((unsigned int *)t50) = (t62 | t63);
    t43 = (t11 + 4);
    t49 = (t42 + 4);
    t66 = *((unsigned int *)t11);
    t67 = (~(t66));
    t68 = *((unsigned int *)t43);
    t69 = (~(t68));
    t70 = *((unsigned int *)t42);
    t71 = (~(t70));
    t72 = *((unsigned int *)t49);
    t73 = (~(t72));
    t8 = (t67 & t69);
    t74 = (t71 & t73);
    t76 = (~(t8));
    t77 = (~(t74));
    t78 = *((unsigned int *)t41);
    *((unsigned int *)t41) = (t78 & t76);
    t79 = *((unsigned int *)t41);
    *((unsigned int *)t41) = (t79 & t77);
    t80 = *((unsigned int *)t50);
    *((unsigned int *)t50) = (t80 & t76);
    t81 = *((unsigned int *)t50);
    *((unsigned int *)t50) = (t81 & t77);
    goto LAB82;

LAB83:    xsi_set_current_line(58, ng0);
    t55 = ((char*)((ng6)));
    t56 = (t0 + 3496);
    xsi_vlogvar_assign_value(t56, t55, 0, 0, 3);
    goto LAB85;

LAB88:    t17 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t17) = 1;
    goto LAB89;

LAB90:    xsi_set_current_line(63, ng0);
    t22 = ((char*)((ng8)));
    t23 = (t0 + 3496);
    xsi_vlogvar_assign_value(t23, t22, 0, 0, 3);
    goto LAB92;

LAB95:    t17 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t17) = 1;
    goto LAB96;

LAB97:    xsi_set_current_line(68, ng0);
    t22 = ((char*)((ng8)));
    t23 = (t0 + 3496);
    xsi_vlogvar_assign_value(t23, t22, 0, 0, 3);
    goto LAB99;

LAB102:    t17 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t17) = 1;
    goto LAB103;

LAB104:    xsi_set_current_line(73, ng0);
    t22 = ((char*)((ng8)));
    t23 = (t0 + 3496);
    xsi_vlogvar_assign_value(t23, t22, 0, 0, 3);
    goto LAB106;

}

static void Always_89_3(char *t0)
{
    char t13[8];
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
    char *t11;
    char *t12;

LAB0:    t1 = (t0 + 5160U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(89, ng0);
    t2 = (t0 + 5512);
    *((int *)t2) = 1;
    t3 = (t0 + 5192);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(90, ng0);
    t4 = (t0 + 3336);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);

LAB5:    t7 = ((char*)((ng2)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 3, t7, 3);
    if (t8 == 1)
        goto LAB6;

LAB7:    t2 = ((char*)((ng3)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 3, t2, 3);
    if (t8 == 1)
        goto LAB8;

LAB9:    t2 = ((char*)((ng5)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 3, t2, 3);
    if (t8 == 1)
        goto LAB10;

LAB11:    t2 = ((char*)((ng6)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 3, t2, 3);
    if (t8 == 1)
        goto LAB12;

LAB13:    t2 = ((char*)((ng4)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 3, t2, 3);
    if (t8 == 1)
        goto LAB14;

LAB15:    t2 = ((char*)((ng8)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 3, t2, 3);
    if (t8 == 1)
        goto LAB16;

LAB17:    t2 = ((char*)((ng11)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 3, t2, 3);
    if (t8 == 1)
        goto LAB18;

LAB19:    t2 = ((char*)((ng12)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 3, t2, 3);
    if (t8 == 1)
        goto LAB20;

LAB21:
LAB22:    goto LAB2;

LAB6:    xsi_set_current_line(91, ng0);

LAB23:    xsi_set_current_line(92, ng0);
    t9 = (t0 + 3016);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    t12 = (t0 + 3016);
    xsi_vlogvar_assign_value(t12, t11, 0, 0, 9);
    xsi_set_current_line(93, ng0);
    t2 = (t0 + 3176);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 3176);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 2);
    xsi_set_current_line(94, ng0);
    t2 = (t0 + 2856);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 2856);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 11);
    goto LAB22;

LAB8:    xsi_set_current_line(96, ng0);

LAB24:    xsi_set_current_line(97, ng0);
    t3 = (t0 + 3016);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t7 = ((char*)((ng3)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_add(t13, 9, t5, 9, t7, 9);
    t9 = (t0 + 3016);
    xsi_vlogvar_assign_value(t9, t13, 0, 0, 9);
    xsi_set_current_line(98, ng0);
    t2 = (t0 + 3176);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 3176);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 2);
    xsi_set_current_line(99, ng0);
    t2 = (t0 + 2856);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng3)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_minus(t13, 11, t4, 11, t5, 11);
    t7 = (t0 + 2856);
    xsi_vlogvar_assign_value(t7, t13, 0, 0, 11);
    goto LAB22;

LAB10:    xsi_set_current_line(102, ng0);

LAB25:    xsi_set_current_line(103, ng0);
    t3 = (t0 + 3016);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t7 = (t0 + 3016);
    xsi_vlogvar_assign_value(t7, t5, 0, 0, 9);
    xsi_set_current_line(104, ng0);
    t2 = (t0 + 3176);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 3176);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 2);
    xsi_set_current_line(105, ng0);
    t2 = (t0 + 2856);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 2856);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 11);
    goto LAB22;

LAB12:    xsi_set_current_line(107, ng0);

LAB26:    xsi_set_current_line(108, ng0);
    t3 = (t0 + 3016);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t7 = ((char*)((ng3)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_add(t13, 9, t5, 9, t7, 9);
    t9 = (t0 + 3016);
    xsi_vlogvar_assign_value(t9, t13, 0, 0, 9);
    xsi_set_current_line(109, ng0);
    t2 = (t0 + 3176);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 3176);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 2);
    xsi_set_current_line(110, ng0);
    t2 = (t0 + 2856);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng3)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_minus(t13, 11, t4, 11, t5, 11);
    t7 = (t0 + 2856);
    xsi_vlogvar_assign_value(t7, t13, 0, 0, 11);
    goto LAB22;

LAB14:    xsi_set_current_line(113, ng0);

LAB27:    xsi_set_current_line(114, ng0);
    t3 = (t0 + 3016);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t7 = ((char*)((ng3)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_add(t13, 9, t5, 9, t7, 9);
    t9 = (t0 + 3016);
    xsi_vlogvar_assign_value(t9, t13, 0, 0, 9);
    xsi_set_current_line(115, ng0);
    t2 = (t0 + 3176);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 3176);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 2);
    xsi_set_current_line(116, ng0);
    t2 = (t0 + 2856);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng3)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_add(t13, 11, t4, 11, t5, 11);
    t7 = (t0 + 2856);
    xsi_vlogvar_assign_value(t7, t13, 0, 0, 11);
    goto LAB22;

LAB16:    xsi_set_current_line(119, ng0);

LAB28:    xsi_set_current_line(120, ng0);
    t3 = (t0 + 3016);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t7 = (t0 + 3016);
    xsi_vlogvar_assign_value(t7, t5, 0, 0, 9);
    xsi_set_current_line(121, ng0);
    t2 = (t0 + 3176);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng3)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_add(t13, 2, t4, 2, t5, 2);
    t7 = (t0 + 3176);
    xsi_vlogvar_assign_value(t7, t13, 0, 0, 2);
    xsi_set_current_line(122, ng0);
    t2 = (t0 + 2856);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 2856);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 11);
    goto LAB22;

LAB18:    xsi_set_current_line(125, ng0);

LAB29:    xsi_set_current_line(126, ng0);
    t3 = (t0 + 3016);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t7 = (t0 + 3016);
    xsi_vlogvar_assign_value(t7, t5, 0, 0, 9);
    xsi_set_current_line(127, ng0);
    t2 = (t0 + 3176);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 3176);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 2);
    xsi_set_current_line(128, ng0);
    t2 = (t0 + 2856);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 2856);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 11);
    goto LAB22;

LAB20:    xsi_set_current_line(131, ng0);

LAB30:    xsi_set_current_line(132, ng0);
    t3 = (t0 + 3016);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t7 = (t0 + 3016);
    xsi_vlogvar_assign_value(t7, t5, 0, 0, 9);
    xsi_set_current_line(133, ng0);
    t2 = (t0 + 3176);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 3176);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 2);
    xsi_set_current_line(134, ng0);
    t2 = (t0 + 2856);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 2856);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 11);
    goto LAB22;

}


extern void work_m_00000000001106500965_2188576744_init()
{
	static char *pe[] = {(void *)Initial_32_0,(void *)Always_43_1,(void *)Always_51_2,(void *)Always_89_3};
	xsi_register_didat("work_m_00000000001106500965_2188576744", "isim/testmaquinamover_isim_beh.exe.sim/work/m_00000000001106500965_2188576744.didat");
	xsi_register_executes(pe);
}
