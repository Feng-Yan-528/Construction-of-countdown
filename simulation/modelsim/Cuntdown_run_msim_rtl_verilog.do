transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/YF/workspace/ELEC5566M-MiniProject-Feng-Yan-528/Construction-of-countdown {C:/Users/YF/workspace/ELEC5566M-MiniProject-Feng-Yan-528/Construction-of-countdown/F_5.v}
vlog -vlog01compat -work work +incdir+C:/Users/YF/workspace/ELEC5566M-MiniProject-Feng-Yan-528/Construction-of-countdown {C:/Users/YF/workspace/ELEC5566M-MiniProject-Feng-Yan-528/Construction-of-countdown/F_10.v}
vlog -vlog01compat -work work +incdir+C:/Users/YF/workspace/ELEC5566M-MiniProject-Feng-Yan-528/Construction-of-countdown {C:/Users/YF/workspace/ELEC5566M-MiniProject-Feng-Yan-528/Construction-of-countdown/F_1.v}
vlog -vlog01compat -work work +incdir+C:/Users/YF/workspace/ELEC5566M-MiniProject-Feng-Yan-528/Construction-of-countdown {C:/Users/YF/workspace/ELEC5566M-MiniProject-Feng-Yan-528/Construction-of-countdown/Seg_display.v}
vlog -vlog01compat -work work +incdir+C:/Users/YF/workspace/ELEC5566M-MiniProject-Feng-Yan-528/Construction-of-countdown {C:/Users/YF/workspace/ELEC5566M-MiniProject-Feng-Yan-528/Construction-of-countdown/Counter.v}
vlog -vlog01compat -work work +incdir+C:/Users/YF/workspace/ELEC5566M-MiniProject-Feng-Yan-528/Construction-of-countdown {C:/Users/YF/workspace/ELEC5566M-MiniProject-Feng-Yan-528/Construction-of-countdown/Countdown.v}
vlog -vlog01compat -work work +incdir+C:/Users/YF/workspace/ELEC5566M-MiniProject-Feng-Yan-528/Construction-of-countdown {C:/Users/YF/workspace/ELEC5566M-MiniProject-Feng-Yan-528/Construction-of-countdown/FD.v}

vlog -vlog01compat -work work +incdir+C:/Users/YF/workspace/ELEC5566M-MiniProject-Feng-Yan-528/Construction-of-countdown/simulation {C:/Users/YF/workspace/ELEC5566M-MiniProject-Feng-Yan-528/Construction-of-countdown/simulation/Countdown_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  Countdown_tb

add wave *
view structure
view signals
run 18 sec
