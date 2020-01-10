STIL 1.0 {
    CTL P2001.10;
    Design 2005;
}
Header {
    Title "Minimal STIL for design `CORTEXM0DS'";
    Date "Thu Sep 26 23:23:50 2019";
    Source "DFT Compiler P-2019.03-SP1";
}
Signals {
    "HCLK" In;
    "HRDATA[0]" In;
    "HRDATA[10]" In;
    "HRDATA[11]" In;
    "HRDATA[12]" In;
    "HRDATA[13]" In;
    "HRDATA[14]" In;
    "HRDATA[15]" In;
    "HRDATA[16]" In;
    "HRDATA[17]" In;
    "HRDATA[18]" In;
    "HRDATA[19]" In;
    "HRDATA[1]" In;
    "HRDATA[20]" In;
    "HRDATA[21]" In;
    "HRDATA[22]" In;
    "HRDATA[23]" In;
    "HRDATA[24]" In;
    "HRDATA[25]" In;
    "HRDATA[26]" In;
    "HRDATA[27]" In;
    "HRDATA[28]" In;
    "HRDATA[29]" In;
    "HRDATA[2]" In;
    "HRDATA[30]" In;
    "HRDATA[31]" In;
    "HRDATA[3]" In;
    "HRDATA[4]" In;
    "HRDATA[5]" In;
    "HRDATA[6]" In;
    "HRDATA[7]" In;
    "HRDATA[8]" In;
    "HRDATA[9]" In;
    "HREADY" In;
    "HRESETn" In;
    "HRESP" In;
    "IRQ[0]" In;
    "IRQ[10]" In;
    "IRQ[11]" In;
    "IRQ[12]" In;
    "IRQ[13]" In;
    "IRQ[14]" In;
    "IRQ[15]" In;
    "IRQ[1]" In;
    "IRQ[2]" In;
    "IRQ[3]" In;
    "IRQ[4]" In;
    "IRQ[5]" In;
    "IRQ[6]" In;
    "IRQ[7]" In;
    "IRQ[8]" In;
    "IRQ[9]" In;
    "NMI" In;
    "RXEV" In;
    "HADDR[0]" Out;
    "HADDR[10]" Out;
    "HADDR[11]" Out;
    "HADDR[12]" Out;
    "HADDR[13]" Out;
    "HADDR[14]" Out;
    "HADDR[15]" Out;
    "HADDR[16]" Out;
    "HADDR[17]" Out;
    "HADDR[18]" Out;
    "HADDR[19]" Out;
    "HADDR[1]" Out;
    "HADDR[20]" Out;
    "HADDR[21]" Out;
    "HADDR[22]" Out;
    "HADDR[23]" Out;
    "HADDR[24]" Out;
    "HADDR[25]" Out;
    "HADDR[26]" Out;
    "HADDR[27]" Out;
    "HADDR[28]" Out;
    "HADDR[29]" Out;
    "HADDR[2]" Out;
    "HADDR[30]" Out;
    "HADDR[31]" Out;
    "HADDR[3]" Out;
    "HADDR[4]" Out;
    "HADDR[5]" Out;
    "HADDR[6]" Out;
    "HADDR[7]" Out;
    "HADDR[8]" Out;
    "HADDR[9]" Out;
    "HBURST[0]" Out;
    "HBURST[1]" Out;
    "HBURST[2]" Out;
    "HMASTLOCK" Out;
    "HPROT[0]" Out;
    "HPROT[1]" Out;
    "HPROT[2]" Out;
    "HPROT[3]" Out;
    "HSIZE[0]" Out;
    "HSIZE[1]" Out;
    "HSIZE[2]" Out;
    "HTRANS[0]" Out;
    "HTRANS[1]" Out;
    "HWDATA[0]" Out;
    "HWDATA[10]" Out;
    "HWDATA[11]" Out;
    "HWDATA[12]" Out;
    "HWDATA[13]" Out;
    "HWDATA[14]" Out;
    "HWDATA[15]" Out;
    "HWDATA[16]" Out;
    "HWDATA[17]" Out;
    "HWDATA[18]" Out;
    "HWDATA[19]" Out;
    "HWDATA[1]" Out;
    "HWDATA[20]" Out;
    "HWDATA[21]" Out;
    "HWDATA[22]" Out;
    "HWDATA[23]" Out;
    "HWDATA[24]" Out;
    "HWDATA[25]" Out;
    "HWDATA[26]" Out;
    "HWDATA[27]" Out;
    "HWDATA[28]" Out;
    "HWDATA[29]" Out;
    "HWDATA[2]" Out;
    "HWDATA[30]" Out;
    "HWDATA[31]" Out;
    "HWDATA[3]" Out;
    "HWDATA[4]" Out;
    "HWDATA[5]" Out;
    "HWDATA[6]" Out;
    "HWDATA[7]" Out;
    "HWDATA[8]" Out;
    "HWDATA[9]" Out;
    "HWRITE" Out;
    "LOCKUP" Out;
    "SLEEPING" Out;
    "SYSRESETREQ" Out;
    "TXEV" Out;
    "test_si" In;
    "test_se" In;
    "u_logic/A4t2z4_reg/SI" Pseudo;
    "u_logic/Ypi3z4_reg/Q" Pseudo;
}
SignalGroups  {
    "all_inputs" = '"HCLK" + "HRDATA[0]" + "HRDATA[10]" + "HRDATA[11]" + 
    "HRDATA[12]" + "HRDATA[13]" + "HRDATA[14]" + "HRDATA[15]" + "HRDATA[16]" + 
    "HRDATA[17]" + "HRDATA[18]" + "HRDATA[19]" + "HRDATA[1]" + "HRDATA[20]" + 
    "HRDATA[21]" + "HRDATA[22]" + "HRDATA[23]" + "HRDATA[24]" + "HRDATA[25]" + 
    "HRDATA[26]" + "HRDATA[27]" + "HRDATA[28]" + "HRDATA[29]" + "HRDATA[2]" + 
    "HRDATA[30]" + "HRDATA[31]" + "HRDATA[3]" + "HRDATA[4]" + "HRDATA[5]" + 
    "HRDATA[6]" + "HRDATA[7]" + "HRDATA[8]" + "HRDATA[9]" + "HREADY" + "HRESETn" 
    + "HRESP" + "IRQ[0]" + "IRQ[10]" + "IRQ[11]" + "IRQ[12]" + "IRQ[13]" + 
    "IRQ[14]" + "IRQ[15]" + "IRQ[1]" + "IRQ[2]" + "IRQ[3]" + "IRQ[4]" + "IRQ[5]" 
    + "IRQ[6]" + "IRQ[7]" + "IRQ[8]" + "IRQ[9]" + "NMI" + "RXEV" + "test_si" + 
    "test_se"';
    "all_outputs" = '"HADDR[0]" + "HADDR[10]" + "HADDR[11]" + "HADDR[12]" + 
    "HADDR[13]" + "HADDR[14]" + "HADDR[15]" + "HADDR[16]" + "HADDR[17]" + 
    "HADDR[18]" + "HADDR[19]" + "HADDR[1]" + "HADDR[20]" + "HADDR[21]" + 
    "HADDR[22]" + "HADDR[23]" + "HADDR[24]" + "HADDR[25]" + "HADDR[26]" + 
    "HADDR[27]" + "HADDR[28]" + "HADDR[29]" + "HADDR[2]" + "HADDR[30]" + 
    "HADDR[31]" + "HADDR[3]" + "HADDR[4]" + "HADDR[5]" + "HADDR[6]" + "HADDR[7]" 
    + "HADDR[8]" + "HADDR[9]" + "HBURST[0]" + "HBURST[1]" + "HBURST[2]" + 
    "HMASTLOCK" + "HPROT[0]" + "HPROT[1]" + "HPROT[2]" + "HPROT[3]" + "HSIZE[0]" 
    + "HSIZE[1]" + "HSIZE[2]" + "HTRANS[0]" + "HTRANS[1]" + "HWDATA[0]" + 
    "HWDATA[10]" + "HWDATA[11]" + "HWDATA[12]" + "HWDATA[13]" + "HWDATA[14]" + 
    "HWDATA[15]" + "HWDATA[16]" + "HWDATA[17]" + "HWDATA[18]" + "HWDATA[19]" + 
    "HWDATA[1]" + "HWDATA[20]" + "HWDATA[21]" + "HWDATA[22]" + "HWDATA[23]" + 
    "HWDATA[24]" + "HWDATA[25]" + "HWDATA[26]" + "HWDATA[27]" + "HWDATA[28]" + 
    "HWDATA[29]" + "HWDATA[2]" + "HWDATA[30]" + "HWDATA[31]" + "HWDATA[3]" + 
    "HWDATA[4]" + "HWDATA[5]" + "HWDATA[6]" + "HWDATA[7]" + "HWDATA[8]" + 
    "HWDATA[9]" + "HWRITE" + "LOCKUP" + "SLEEPING" + "SYSRESETREQ" + "TXEV"';
    "all_ports" = '"all_inputs" + "all_outputs"';
    "_pi" = '"HCLK" + "HRDATA[0]" + "HRDATA[10]" + "HRDATA[11]" + "HRDATA[12]" + 
    "HRDATA[13]" + "HRDATA[14]" + "HRDATA[15]" + "HRDATA[16]" + "HRDATA[17]" + 
    "HRDATA[18]" + "HRDATA[19]" + "HRDATA[1]" + "HRDATA[20]" + "HRDATA[21]" + 
    "HRDATA[22]" + "HRDATA[23]" + "HRDATA[24]" + "HRDATA[25]" + "HRDATA[26]" + 
    "HRDATA[27]" + "HRDATA[28]" + "HRDATA[29]" + "HRDATA[2]" + "HRDATA[30]" + 
    "HRDATA[31]" + "HRDATA[3]" + "HRDATA[4]" + "HRDATA[5]" + "HRDATA[6]" + 
    "HRDATA[7]" + "HRDATA[8]" + "HRDATA[9]" + "HREADY" + "HRESETn" + "HRESP" + 
    "IRQ[0]" + "IRQ[10]" + "IRQ[11]" + "IRQ[12]" + "IRQ[13]" + "IRQ[14]" + 
    "IRQ[15]" + "IRQ[1]" + "IRQ[2]" + "IRQ[3]" + "IRQ[4]" + "IRQ[5]" + "IRQ[6]" 
    + "IRQ[7]" + "IRQ[8]" + "IRQ[9]" + "NMI" + "RXEV" + "test_si" + "test_se"';
    "_po" = '"HADDR[0]" + "HADDR[10]" + "HADDR[11]" + "HADDR[12]" + "HADDR[13]" 
    + "HADDR[14]" + "HADDR[15]" + "HADDR[16]" + "HADDR[17]" + "HADDR[18]" + 
    "HADDR[19]" + "HADDR[1]" + "HADDR[20]" + "HADDR[21]" + "HADDR[22]" + 
    "HADDR[23]" + "HADDR[24]" + "HADDR[25]" + "HADDR[26]" + "HADDR[27]" + 
    "HADDR[28]" + "HADDR[29]" + "HADDR[2]" + "HADDR[30]" + "HADDR[31]" + 
    "HADDR[3]" + "HADDR[4]" + "HADDR[5]" + "HADDR[6]" + "HADDR[7]" + "HADDR[8]" 
    + "HADDR[9]" + "HBURST[0]" + "HBURST[1]" + "HBURST[2]" + "HMASTLOCK" + 
    "HPROT[0]" + "HPROT[1]" + "HPROT[2]" + "HPROT[3]" + "HSIZE[0]" + "HSIZE[1]" 
    + "HSIZE[2]" + "HTRANS[0]" + "HTRANS[1]" + "HWDATA[0]" + "HWDATA[10]" + 
    "HWDATA[11]" + "HWDATA[12]" + "HWDATA[13]" + "HWDATA[14]" + "HWDATA[15]" + 
    "HWDATA[16]" + "HWDATA[17]" + "HWDATA[18]" + "HWDATA[19]" + "HWDATA[1]" + 
    "HWDATA[20]" + "HWDATA[21]" + "HWDATA[22]" + "HWDATA[23]" + "HWDATA[24]" + 
    "HWDATA[25]" + "HWDATA[26]" + "HWDATA[27]" + "HWDATA[28]" + "HWDATA[29]" + 
    "HWDATA[2]" + "HWDATA[30]" + "HWDATA[31]" + "HWDATA[3]" + "HWDATA[4]" + 
    "HWDATA[5]" + "HWDATA[6]" + "HWDATA[7]" + "HWDATA[8]" + "HWDATA[9]" + 
    "HWRITE" + "LOCKUP" + "SLEEPING" + "SYSRESETREQ" + "TXEV"';
}
SignalGroups all_dft_protocol {
    "_clk" = '"HCLK" + "HRESETn"';
}
SignalGroups Internal_scan {
    "_si" = "test_si" {
        ScanIn;
    }
    "_so" = "SYSRESETREQ" {
        ScanOut;
    }
    "_clk" = '"HCLK" + "HRESETn"';
}
ScanStructures Internal_scan {
    ScanChain "1" {
        ScanLength 841;
        ScanCells "u_logic/Rd53z4_reg" "u_logic/Nf03z4_reg" "u_logic/T253z4_reg" 
        "u_logic/Mi13z4_reg" "u_logic/Hc13z4_reg" "u_logic/Ql13z4_reg" 
        "u_logic/I443z4_reg" "u_logic/Sa13z4_reg" "u_logic/Kig3z4_reg" 
        "u_logic/Kf23z4_reg" "u_logic/Fre3z4_reg" "u_logic/Cy43z4_reg" 
        "u_logic/Wnv2z4_reg" "u_logic/Neu2z4_reg" "u_logic/F483z4_reg" 
        "u_logic/Q2q2z4_reg" "u_logic/B1q2z4_reg" "u_logic/Sgp2z4_reg" 
        "u_logic/No93z4_reg" "u_logic/Fi93z4_reg" "u_logic/T583z4_reg" 
        "u_logic/Iwp2z4_reg" "u_logic/U4z2z4_reg" "u_logic/Jw93z4_reg" 
        "u_logic/Cqo2z4_reg" "u_logic/Efp2z4_reg" "u_logic/Y8q2z4_reg" 
        "u_logic/G1s2z4_reg" "u_logic/Szr2z4_reg" "u_logic/J7q2z4_reg" 
        "u_logic/Q7j2z4_reg" "u_logic/S8k2z4_reg" "u_logic/Zfh3z4_reg" 
        "u_logic/Lgi3z4_reg" "u_logic/Llq2z4_reg" "u_logic/L7p2z4_reg" 
        "u_logic/H4p2z4_reg" "u_logic/W5p2z4_reg" "u_logic/Hak2z4_reg" 
        "u_logic/I793z4_reg" "u_logic/Tzg3z4_reg" "u_logic/U593z4_reg" 
        "u_logic/Dkr2z4_reg" "u_logic/Ohh3z4_reg" "u_logic/Xx93z4_reg" 
        "u_logic/Rhi2z4_reg" "u_logic/Ovc3z4_reg" "u_logic/V1l2z4_reg" 
        "u_logic/Po83z4_reg" "u_logic/T9v2z4_reg" "u_logic/H783z4_reg" 
        "u_logic/Y1u2z4_reg" "u_logic/Yb93z4_reg" "u_logic/Hbv2z4_reg" 
        "u_logic/Rr73z4_reg" "u_logic/R283z4_reg" "u_logic/Po73z4_reg" 
        "u_logic/Dq73z4_reg" "u_logic/Slr2z4_reg" "u_logic/Gmm2z4_reg" 
        "u_logic/Ii63z4_reg" "u_logic/Unm2z4_reg" "u_logic/Psv2z4_reg" 
        "u_logic/Duu2z4_reg" "u_logic/Psu2z4_reg" "u_logic/Fwj2z4_reg" 
        "u_logic/Ym93z4_reg" "u_logic/Txj2z4_reg" "u_logic/Vu93z4_reg" 
        "u_logic/Yfn2z4_reg" "u_logic/Ukt2z4_reg" "u_logic/Dtj2z4_reg" 
        "u_logic/Mhn2z4_reg" "u_logic/Gf73z4_reg" "u_logic/Ug63z4_reg" 
        "u_logic/Ejm2z4_reg" "u_logic/Imt2z4_reg" "u_logic/Rvu2z4_reg" 
        "u_logic/G493z4_reg" "u_logic/It63z4_reg" "u_logic/Ajn2z4_reg" 
        "u_logic/Ruj2z4_reg" "u_logic/T0m2z4_reg" "u_logic/V3m2z4_reg" 
        "u_logic/Yx63z4_reg" "u_logic/Psn2z4_reg" "u_logic/Kw63z4_reg" 
        "u_logic/Ohv2z4_reg" "u_logic/Arn2z4_reg" "u_logic/Duv2z4_reg" 
        "u_logic/F473z4_reg" "u_logic/K0u2z4_reg" "u_logic/Ka93z4_reg" 
        "u_logic/U2s2z4_reg" "u_logic/F8u2z4_reg" "u_logic/Skm2z4_reg" 
        "u_logic/Ksm2z4_reg" "u_logic/R6v2z4_reg" "u_logic/Ixt2z4_reg" 
        "u_logic/Rr83z4_reg" "u_logic/Wqm2z4_reg" "u_logic/Ipm2z4_reg" 
        "u_logic/Gf63z4_reg" "u_logic/Grl2z4_reg" "u_logic/Spl2z4_reg" 
        "u_logic/Gju2z4_reg" "u_logic/Gjt2z4_reg" "u_logic/Hpd3z4_reg" 
        "u_logic/Asr2z4_reg" "u_logic/Qyc3z4_reg" "u_logic/Otr2z4_reg" 
        "u_logic/Ii73z4_reg" "u_logic/Cxc3z4_reg" "u_logic/Cvr2z4_reg" 
        "u_logic/Eol2z4_reg" "u_logic/Wqd3z4_reg" "u_logic/Rvv2z4_reg" 
        "u_logic/Ll83z4_reg" "u_logic/Cc73z4_reg" "u_logic/I0e3z4_reg" 
        "u_logic/Lpv2z4_reg" "u_logic/Imu2z4_reg" "u_logic/X1e3z4_reg" 
        "u_logic/Lsd3z4_reg" "u_logic/Snd3z4_reg" "u_logic/M3e3z4_reg" 
        "u_logic/Rr93z4_reg" "u_logic/Gcr2z4_reg" "u_logic/E0d3z4_reg" 
        "u_logic/Ccq2z4_reg" "u_logic/Vdr2z4_reg" "u_logic/Cgu2z4_reg" 
        "u_logic/Qg93z4_reg" "u_logic/Zb83z4_reg" "u_logic/Q273z4_reg" 
        "u_logic/Kfr2z4_reg" "u_logic/W5s2z4_reg" "u_logic/I4s2z4_reg" 
        "u_logic/Rd73z4_reg" "u_logic/Rhu2z4_reg" "u_logic/S2r2z4_reg" 
        "u_logic/E1r2z4_reg" "u_logic/G4r2z4_reg" "u_logic/H2m2z4_reg" 
        "u_logic/Eun2z4_reg" "u_logic/Gip2z4_reg" "u_logic/Y873z4_reg" 
        "u_logic/Wu63z4_reg" "u_logic/Wyt2z4_reg" "u_logic/F8v2z4_reg" 
        "u_logic/Ycu2z4_reg" "u_logic/Mzp2z4_reg" "u_logic/Yaz2z4_reg" 
        "u_logic/Svk2z4_reg" "u_logic/Rni2z4_reg" "u_logic/Sjj2z4_reg" 
        "u_logic/Fgm2z4_reg" "u_logic/T1d3z4_reg" "u_logic/H3d3z4_reg" 
        "u_logic/Wzy2z4_reg" "u_logic/E913z4_reg" "u_logic/Kc03z4_reg" 
        "u_logic/Qwr2z4_reg" "u_logic/Hq23z4_reg" "u_logic/Yg13z4_reg" 
        "u_logic/Wmp2z4_reg" "u_logic/Z853z4_reg" "u_logic/Eyr2z4_reg" 
        "u_logic/Yg23z4_reg" "u_logic/Qz43z4_reg" "u_logic/Tse3z4_reg" 
        "u_logic/Rpe3z4_reg" "u_logic/Hue3z4_reg" "u_logic/B613z4_reg" 
        "u_logic/I463z4_reg" "u_logic/L763z4_reg" "u_logic/To33z4_reg" 
        "u_logic/Z863z4_reg" "u_logic/Yj43z4_reg" "u_logic/Cn43z4_reg" 
        "u_logic/Ro43z4_reg" "u_logic/Pvd3z4_reg" "u_logic/Dcs2z4_reg" 
        "u_logic/Hq33z4_reg" "u_logic/Zu33z4_reg" "u_logic/Pfz2z4_reg" 
        "u_logic/Kt33z4_reg" "u_logic/Eif3z4_reg" "u_logic/Yd03z4_reg" 
        "u_logic/E153z4_reg" "u_logic/Cq93z4_reg" "u_logic/K7s2z4_reg" 
        "u_logic/Lqr2z4_reg" "u_logic/Na73z4_reg" "u_logic/Cc63z4_reg" 
        "u_logic/F9j2z4_reg" "u_logic/Arv2z4_reg" "u_logic/W893z4_reg" 
        "u_logic/Ujp2z4_reg" "u_logic/An83z4_reg" "u_logic/Gt93z4_reg" 
        "u_logic/Od83z4_reg" "u_logic/Qml2z4_reg" "u_logic/Oas2z4_reg" 
        "u_logic/Uku2z4_reg" "u_logic/Ug73z4_reg" "u_logic/Dq83z4_reg" 
        "u_logic/Yx73z4_reg" "u_logic/Po63z4_reg" "u_logic/Z3k2z4_reg" 
        "u_logic/Isi2z4_reg" "u_logic/Kiq2z4_reg" "u_logic/R293z4_reg" 
        "u_logic/C5v2z4_reg" "u_logic/Vmj2z4_reg" "u_logic/Djh3z4_reg" 
        "u_logic/Ehz2z4_reg" "u_logic/X2j2z4_reg" "u_logic/Rek2z4_reg" 
        "u_logic/Bk13z4_reg" "u_logic/Euh3z4_reg" "u_logic/Wo03z4_reg" 
        "u_logic/M743z4_reg" "u_logic/Ug43z4_reg" "u_logic/Cy13z4_reg" 
        "u_logic/C5n2z4_reg" "u_logic/D1p2z4_reg" "u_logic/Avg3z4_reg" 
        "u_logic/Pwg3z4_reg" "u_logic/Ilf3z4_reg" "u_logic/Olg3z4_reg" 
        "u_logic/Mi23z4_reg" "u_logic/Tvh3z4_reg" "u_logic/Ixh3z4_reg" 
        "u_logic/Hc23z4_reg" "u_logic/Rds2z4_reg" "u_logic/X553z4_reg" 
        "u_logic/Wd23z4_reg" "u_logic/Knz2z4_reg" "u_logic/Cmn2z4_reg" 
        "u_logic/Okn2z4_reg" "u_logic/Ek03z4_reg" "u_logic/Qz33z4_reg" 
        "u_logic/Ow33z4_reg" "u_logic/Ch03z4_reg" "u_logic/Gf43z4_reg" 
        "u_logic/M1j2z4_reg" "u_logic/Cy33z4_reg" "u_logic/L8m2z4_reg" 
        "u_logic/Qfa3z4_reg" "u_logic/B2i3z4_reg" "u_logic/Bec3z4_reg" 
        "u_logic/Qfc3z4_reg" "u_logic/Uic3z4_reg" "u_logic/Ztc3z4_reg" 
        "u_logic/R0t2z4_reg" "u_logic/Adt2z4_reg" "u_logic/Nnc3z4_reg" 
        "u_logic/D4g3z4_reg" "u_logic/N7c3z4_reg" "u_logic/Jsc3z4_reg" 
        "u_logic/Ipn2z4_reg" "u_logic/T7d3z4_reg" "u_logic/B1a3z4_reg" 
        "u_logic/P2a3z4_reg" "u_logic/Hzj2z4_reg" "u_logic/Uyv2z4_reg" 
        "u_logic/Kyi2z4_reg" "u_logic/Owq2z4_reg" "u_logic/Ydw2z4_reg" 
        "u_logic/Qlw2z4_reg" "u_logic/Ckw2z4_reg" "u_logic/Byw2z4_reg" 
        "u_logic/Urw2z4_reg" "u_logic/Itw2z4_reg" "u_logic/Xuw2z4_reg" 
        "u_logic/K6y2z4_reg" "u_logic/Y7y2z4_reg" "u_logic/M9y2z4_reg" 
        "u_logic/Bby2z4_reg" "u_logic/Qcy2z4_reg" "u_logic/Bdm2z4_reg" 
        "u_logic/W4y2z4_reg" "u_logic/Mww2z4_reg" "u_logic/Sow2z4_reg" 
        "u_logic/Enw2z4_reg" "u_logic/I3y2z4_reg" "u_logic/Lhd3z4_reg" 
        "u_logic/Qrp2z4_reg" "u_logic/Bjd3z4_reg" "u_logic/Aqp2z4_reg" 
        "u_logic/X9n2z4_reg" "u_logic/Uqi2z4_reg" "u_logic/F0y2z4_reg" 
        "u_logic/Oiw2z4_reg" "u_logic/Gtp2z4_reg" "u_logic/Dwl2z4_reg" 
        "u_logic/Mfw2z4_reg" "u_logic/Ahw2z4_reg" "u_logic/Ufy2z4_reg" 
        "u_logic/Gqw2z4_reg" "u_logic/Fey2z4_reg" "u_logic/Swy2z4_reg" 
        "u_logic/Zoy2z4_reg" "u_logic/Pty2z4_reg" "u_logic/Dvy2z4_reg" 
        "u_logic/Hyy2z4_reg" "u_logic/Bsy2z4_reg" "u_logic/H9i2z4_reg" 
        "u_logic/Nqy2z4_reg" "u_logic/U2x2z4_reg" "u_logic/Sgj2z4_reg" 
        "u_logic/Zcn2z4_reg" "u_logic/Fzl2z4_reg" "u_logic/Uup2z4_reg" 
        "u_logic/Qzq2z4_reg" "u_logic/Auk2z4_reg" "u_logic/K1z2z4_reg" 
        "u_logic/I2t2z4_reg" "u_logic/Viy2z4_reg" "u_logic/Lny2z4_reg" 
        "u_logic/Qem2z4_reg" "u_logic/Jky2z4_reg" "u_logic/Qzw2z4_reg" 
        "u_logic/F1x2z4_reg" "u_logic/T1y2z4_reg" "u_logic/Jcw2z4_reg" 
        "u_logic/Xly2z4_reg" "u_logic/Yzi2z4_reg" "u_logic/Rxl2z4_reg" 
        "u_logic/Qdj2z4_reg" "u_logic/L8t2z4_reg" "u_logic/Aii3z4_reg" 
        "u_logic/Jhy2z4_reg" "u_logic/Lbn2z4_reg" "u_logic/U5x2z4_reg" 
        "u_logic/I6w2z4_reg" "u_logic/Nbm2z4_reg" "u_logic/S4w2z4_reg" 
        "u_logic/Y6t2z4_reg" "u_logic/Emi2z4_reg" "u_logic/O5t2z4_reg" 
        "u_logic/Ark2z4_reg" "u_logic/Fij2z4_reg" "u_logic/Npk2z4_reg" 
        "u_logic/Nen2z4_reg" "u_logic/Pet2z4_reg" "u_logic/Aok2z4_reg" 
        "u_logic/Wai2z4_reg" "u_logic/Gji2z4_reg" "u_logic/Cam2z4_reg" 
        "u_logic/Uaj2z4_reg" "u_logic/G9w2z4_reg" "u_logic/R1w2z4_reg" 
        "u_logic/U7w2z4_reg" "u_logic/Ywi2z4_reg" "u_logic/Wbk2z4_reg" 
        "u_logic/Mvi2z4_reg" "u_logic/G0w2z4_reg" "u_logic/Mjl2z4_reg" 
        "u_logic/Trq2z4_reg" "u_logic/Tdp2z4_reg" "u_logic/Thm2z4_reg" 
        "u_logic/Wxp2z4_reg" "u_logic/C3w2z4_reg" "u_logic/Y9t2z4_reg" 
        "u_logic/Ffs2z4_reg" "u_logic/Lz93z4_reg" "u_logic/J6i2z4_reg" 
        "u_logic/Kop2z4_reg" "u_logic/K3l2z4_reg" "u_logic/Jje3z4_reg" 
        "u_logic/Qnn2z4_reg" "u_logic/Zad3z4_reg" "u_logic/J9d3z4_reg" 
        "u_logic/Tib3z4_reg" "u_logic/Vgs2z4_reg" "u_logic/Tqs2z4_reg" 
        "u_logic/Lns2z4_reg" "u_logic/Cps2z4_reg" "u_logic/Azs2z4_reg" 
        "u_logic/Jxs2z4_reg" "u_logic/Q6l2z4_reg" "u_logic/Bus2z4_reg" 
        "u_logic/G8n2z4_reg" "u_logic/Axm2z4_reg" "u_logic/Kss2z4_reg" 
        "u_logic/Z4l2z4_reg" "u_logic/Mis2z4_reg" "u_logic/Dks2z4_reg" 
        "u_logic/Svs2z4_reg" "u_logic/Gcb3z4_reg" "u_logic/Uls2z4_reg" 
        "u_logic/Pab3z4_reg" "u_logic/Kkb3z4_reg" "u_logic/Usl2z4_reg" 
        "u_logic/Vfd3z4_reg" "u_logic/Fed3z4_reg" "u_logic/H8l2z4_reg" 
        "u_logic/Pcd3z4_reg" "u_logic/I6h3z4_reg" "u_logic/Bmb3z4_reg" 
        "u_logic/Xdb3z4_reg" "u_logic/Lul2z4_reg" "u_logic/Q4h3z4_reg" 
        "u_logic/O2c3z4_reg" "u_logic/Rym2z4_reg" "u_logic/Qsb3z4_reg" 
        "u_logic/W8r2z4_reg" "u_logic/Gzb3z4_reg" "u_logic/X0c3z4_reg" 
        "u_logic/W5c3z4_reg" "u_logic/Tqc3z4_reg" "u_logic/E9c3z4_reg" 
        "u_logic/Ble3z4_reg" "u_logic/F4c3z4_reg" "u_logic/Oar2z4_reg" 
        "u_logic/Rnb3z4_reg" "u_logic/Zqb3z4_reg" "u_logic/Lee3z4_reg" 
        "u_logic/Gxk2z4_reg" "u_logic/Vve3z4_reg" "u_logic/Vac3z4_reg" 
        "u_logic/Hub3z4_reg" "u_logic/Y9l2z4_reg" "u_logic/Wuq2z4_reg" 
        "u_logic/Etq2z4_reg" "u_logic/Q0f3z4_reg" "u_logic/Yvb3z4_reg" 
        "u_logic/C7f3z4_reg" "u_logic/T8f3z4_reg" "u_logic/U5a3z4_reg" 
        "u_logic/Wia3z4_reg" "u_logic/Kxe3z4_reg" "u_logic/Pxb3z4_reg" 
        "u_logic/W3f3z4_reg" "u_logic/Taa3z4_reg" "u_logic/Gha3z4_reg" 
        "u_logic/Ipb3z4_reg" "u_logic/T5g3z4_reg" "u_logic/Nfb3z4_reg" 
        "u_logic/Dpc3z4_reg" "u_logic/Aea3z4_reg" "u_logic/H2f3z4_reg" 
        "u_logic/Mcc3z4_reg" "u_logic/Mbt2z4_reg" "u_logic/Ylc3z4_reg" 
        "u_logic/S5b3z4_reg" "u_logic/Fhc3z4_reg" "u_logic/V3o2z4_reg" 
        "u_logic/D4a3z4_reg" "u_logic/Tna3z4_reg" "u_logic/Jkc3z4_reg" 
        "u_logic/Xyn2z4_reg" "u_logic/Gdo2z4_reg" "u_logic/C9a3z4_reg" 
        "u_logic/Cma3z4_reg" "u_logic/L7a3z4_reg" "u_logic/Bge3z4_reg" 
        "u_logic/Uei3z4_reg" "u_logic/C4b3z4_reg" "u_logic/F2o2z4_reg" 
        "u_logic/Mka3z4_reg" "u_logic/J7b3z4_reg" "u_logic/Jca3z4_reg" 
        "u_logic/Gza3z4_reg" "u_logic/W0b3z4_reg" "u_logic/Z8b3z4_reg" 
        "u_logic/M2b3z4_reg" "u_logic/Qxa3z4_reg" "u_logic/Dhb3z4_reg" 
        "u_logic/Aze3z4_reg" "u_logic/M5f3z4_reg" "u_logic/Zva3z4_reg" 
        "u_logic/She3z4_reg" "u_logic/Iua3z4_reg" "u_logic/K7g3z4_reg" 
        "u_logic/Rsa3z4_reg" "u_logic/O0o2z4_reg" "u_logic/Xeo2z4_reg" 
        "u_logic/S3i3z4_reg" "u_logic/Ara3z4_reg" "u_logic/Jpa3z4_reg" 
        "u_logic/Ogo2z4_reg" "u_logic/I1h3z4_reg" "u_logic/Ieh3z4_reg" 
        "u_logic/Ey03z4_reg" "u_logic/Qa43z4_reg" "u_logic/Qi03z4_reg" 
        "u_logic/Bv03z4_reg" "u_logic/J5m2z4_reg" "u_logic/Cll2z4_reg" 
        "u_logic/Ow43z4_reg" "u_logic/Q713z4_reg" "u_logic/Mcz2z4_reg" 
        "u_logic/Ow13z4_reg" "u_logic/X6m2z4_reg" "u_logic/Ytm2z4_reg" 
        "u_logic/Nl43z4_reg" "u_logic/Tvn2z4_reg" "u_logic/Ixn2z4_reg" 
        "u_logic/Yr13z4_reg" "u_logic/Mvm2z4_reg" "u_logic/Lq03z4_reg" 
        "u_logic/Wlz2z4_reg" "u_logic/Kf13z4_reg" "u_logic/To23z4_reg" 
        "u_logic/Hyz2z4_reg" "u_logic/L753z4_reg" "u_logic/Rtz2z4_reg" 
        "u_logic/V223z4_reg" "u_logic/I7r2z4_reg" "u_logic/Nt03z4_reg" 
        "u_logic/Ddi3z4_reg" "u_logic/Z2h3z4_reg" "u_logic/F4q2z4_reg" 
        "u_logic/U5r2z4_reg" "u_logic/Av13z4_reg" "u_logic/Twz2z4_reg" 
        "u_logic/U5q2z4_reg" "u_logic/K103z4_reg" "u_logic/Xg33z4_reg" 
        "u_logic/Ec33z4_reg" "u_logic/Wu53z4_reg" "u_logic/Zj53z4_reg" 
        "u_logic/H133z4_reg" "u_logic/Po53z4_reg" "u_logic/X533z4_reg" 
        "u_logic/Ikz2z4_reg" "u_logic/Fn23z4_reg" "u_logic/Fn33z4_reg" 
        "u_logic/Wd13z4_reg" "u_logic/Wa03z4_reg" "u_logic/X563z4_reg" 
        "u_logic/J433z4_reg" "u_logic/Ibe3z4_reg" "u_logic/Ql33z4_reg" 
        "u_logic/H903z4_reg" "u_logic/Zu43z4_reg" "u_logic/Nl53z4_reg" 
        "u_logic/O2g3z4_reg" "u_logic/Mi33z4_reg" "u_logic/Ilp2z4_reg" 
        "u_logic/Bn53z4_reg" "u_logic/Pz53z4_reg" "u_logic/X213z4_reg" 
        "u_logic/O723z4_reg" "u_logic/Gq43z4_reg" "u_logic/D603z4_reg" 
        "u_logic/Sd43z4_reg" "u_logic/Ec43z4_reg" "u_logic/Mt13z4_reg" 
        "u_logic/Fvz2z4_reg" "u_logic/E163z4_reg" "u_logic/Zr03z4_reg" 
        "u_logic/Vr43z4_reg" "u_logic/D923z4_reg" "u_logic/Kzf3z4_reg" 
        "u_logic/Z0g3z4_reg" "u_logic/Vxf3z4_reg" "u_logic/Zgr2z4_reg" 
        "u_logic/S703z4_reg" "u_logic/Q6e3z4_reg" "u_logic/Ji43z4_reg" 
        "u_logic/Bk33z4_reg" "u_logic/F8e3z4_reg" "u_logic/U9e3z4_reg" 
        "u_logic/V233z4_reg" "u_logic/Aud3z4_reg" "u_logic/Tyd3z4_reg" 
        "u_logic/M0i3z4_reg" "u_logic/Xyh3z4_reg" "u_logic/G123z4_reg" 
        "u_logic/Psh3z4_reg" "u_logic/K423z4_reg" "u_logic/Pa33z4_reg" 
        "u_logic/Ht53z4_reg" "u_logic/Oir2z4_reg" "u_logic/Exd3z4_reg" 
        "u_logic/Joi3z4_reg" "u_logic/Tch3z4_reg" "u_logic/D7k2z4_reg" 
        "u_logic/T263z4_reg" "u_logic/S2p2z4_reg" "u_logic/Z523z4_reg" 
        "u_logic/Rbo2z4_reg" "u_logic/Ftf3z4_reg" "u_logic/Fn13z4_reg" 
        "u_logic/O5k2z4_reg" "u_logic/X543z4_reg" "u_logic/Rz13z4_reg" 
        "u_logic/Nqz2z4_reg" "u_logic/Sz23z4_reg" "u_logic/Ki53z4_reg" 
        "u_logic/Ebh3z4_reg" "u_logic/Umi3z4_reg" "u_logic/Kt43z4_reg" 
        "u_logic/Sa23z4_reg" "u_logic/M413z4_reg" "u_logic/B943z4_reg" 
        "u_logic/Jq13z4_reg" "u_logic/Fli3z4_reg" "u_logic/Qji3z4_reg" 
        "u_logic/A8h3z4_reg" "u_logic/Sr53z4_reg" "u_logic/A933z4_reg" 
        "u_logic/Ow23z4_reg" "u_logic/P9h3z4_reg" "u_logic/Igl2z4_reg" 
        "u_logic/Uo13z4_reg" "u_logic/Z203z4_reg" "u_logic/M4j2z4_reg" 
        "u_logic/Na63z4_reg" "u_logic/Lph3z4_reg" "u_logic/Qrf3z4_reg" 
        "u_logic/O403z4_reg" "u_logic/Ltg3z4_reg" "u_logic/Vzz2z4_reg" 
        "u_logic/Yoz2z4_reg" "u_logic/R6n2z4_reg" "u_logic/Cao2z4_reg" 
        "u_logic/Uuf3z4_reg" "u_logic/Eyg3z4_reg" "u_logic/Vr33z4_reg" 
        "u_logic/Arh3z4_reg" "u_logic/Ymo2z4_reg" "u_logic/Tiz2z4_reg" 
        "u_logic/N8i3z4_reg" "u_logic/Bk23z4_reg" "u_logic/Aez2z4_reg" 
        "u_logic/Cai3z4_reg" "u_logic/Wnh3z4_reg" "u_logic/V0k2z4_reg" 
        "u_logic/K2k2z4_reg" "u_logic/Koj2z4_reg" "u_logic/Lpu2z4_reg" 
        "u_logic/Ll73z4_reg" "u_logic/Tvt2z4_reg" "u_logic/Tr63z4_reg" 
        "u_logic/An63z4_reg" "u_logic/Jlo2z4_reg" "u_logic/Eqq2z4_reg" 
        "u_logic/Vhk2z4_reg" "u_logic/B5e3z4_reg" "u_logic/Ecp2z4_reg" 
        "u_logic/Fpi2z4_reg" "u_logic/N8o2z4_reg" "u_logic/Rdq2z4_reg" 
        "u_logic/Ozo2z4_reg" "u_logic/Aff3z4_reg" "u_logic/Wrg3z4_reg" 
        "u_logic/Zfv2z4_reg" "u_logic/Q6u2z4_reg" "u_logic/A9p2z4_reg" 
        "u_logic/Pap2z4_reg" "u_logic/U573z4_reg" "u_logic/Ka83z4_reg" 
        "u_logic/J773z4_reg" "u_logic/Gfg3z4_reg" "u_logic/Ft83z4_reg" 
        "u_logic/J5o2z4_reg" "u_logic/U9u2z4_reg" "u_logic/Uj93z4_reg" 
        "u_logic/Kev2z4_reg" "u_logic/Poq2z4_reg" "u_logic/B5u2z4_reg" 
        "u_logic/Anq2z4_reg" "u_logic/Naq2z4_reg" "u_logic/Wnu2z4_reg" 
        "u_logic/Wj73z4_reg" "u_logic/Bf93z4_reg" "u_logic/B173z4_reg" 
        "u_logic/Fxv2z4_reg" "u_logic/Jl93z4_reg" "u_logic/Nag3z4_reg" 
        "u_logic/Sog3z4_reg" "u_logic/Jbu2z4_reg" "u_logic/Ldf3z4_reg" 
        "u_logic/Eq63z4_reg" "u_logic/Nz73z4_reg" "u_logic/Tel2z4_reg" 
        "u_logic/Rdg3z4_reg" "u_logic/Pbl2z4_reg" "u_logic/Edl2z4_reg" 
        "u_logic/Eut2z4_reg" "u_logic/V883z4_reg" "u_logic/Rd63z4_reg" 
        "u_logic/Df83z4_reg" "u_logic/Sg83z4_reg" "u_logic/Wj63z4_reg" 
        "u_logic/Vuo2z4_reg" "u_logic/N3n2z4_reg" "u_logic/Ft73z4_reg" 
        "u_logic/Uu83z4_reg" "u_logic/Ll63z4_reg" "u_logic/Nz83z4_reg" 
        "u_logic/Uu73z4_reg" "u_logic/Lpt2z4_reg" "u_logic/Cgt2z4_reg" 
        "u_logic/Glj2z4_reg" "u_logic/Art2z4_reg" "u_logic/Pst2z4_reg" 
        "u_logic/Uyu2z4_reg" "u_logic/Fio2z4_reg" "u_logic/Ggk2z4_reg" 
        "u_logic/Ujo2z4_reg" "u_logic/Rht2z4_reg" "u_logic/Rro2z4_reg" 
        "u_logic/Wnt2z4_reg" "u_logic/Mz63z4_reg" "u_logic/Gto2z4_reg" 
        "u_logic/Y1n2z4_reg" "u_logic/J0n2z4_reg" "u_logic/Vcv2z4_reg" 
        "u_logic/Skv2z4_reg" "u_logic/Dng3z4_reg" "u_logic/N3v2z4_reg" 
        "u_logic/Hqg3z4_reg" "u_logic/C193z4_reg" "u_logic/Bqf3z4_reg" 
        "u_logic/Wbf3z4_reg" "u_logic/Zxo2z4_reg" "u_logic/Orj2z4_reg" 
        "u_logic/Mof3z4_reg" "u_logic/Ccg3z4_reg" "u_logic/Djv2z4_reg" 
        "u_logic/Kwo2z4_reg" "u_logic/Xmf3z4_reg" "u_logic/Y6o2z4_reg" 
        "u_logic/M3u2z4_reg" "u_logic/An73z4_reg" "u_logic/Zkk2z4_reg" 
        "u_logic/Aru2z4_reg" "u_logic/Fxu2z4_reg" "u_logic/Kjk2z4_reg" 
        "u_logic/J0v2z4_reg" "u_logic/Y1v2z4_reg" "u_logic/Vgq2z4_reg" 
        "u_logic/Gfq2z4_reg" "u_logic/Md93z4_reg" "u_logic/Jw83z4_reg" 
        "u_logic/Yx83z4_reg" "u_logic/Y6i3z4_reg" "u_logic/Skh3z4_reg" 
        "u_logic/Na53z4_reg" "u_logic/Zu23z4_reg" "u_logic/Vr23z4_reg" 
        "u_logic/Sl03z4_reg" "u_logic/Noo2z4_reg" "u_logic/Xhl2z4_reg" 
        "u_logic/Ay53z4_reg" "u_logic/Csz2z4_reg" "u_logic/Gf53z4_reg" 
        "u_logic/Hn03z4_reg" "u_logic/Dy23z4_reg" "u_logic/Vg53z4_reg" 
        "u_logic/Td33z4_reg" "u_logic/Lw53z4_reg" "u_logic/If33z4_reg" 
        "u_logic/Pgf3z4_reg" "u_logic/Vgg3z4_reg" "u_logic/L733z4_reg" 
        "u_logic/Dq53z4_reg" "u_logic/Pw03z4_reg" "u_logic/Tz03z4_reg" 
        "u_logic/I113z4_reg" "u_logic/Tjf3z4_reg" "u_logic/Zjg3z4_reg" 
        "u_logic/Cc53z4_reg" "u_logic/Kt23z4_reg" "u_logic/Ql23z4_reg" 
        "u_logic/I453z4_reg" "u_logic/J5i3z4_reg" "u_logic/Hmh3z4_reg" 
        "u_logic/T243z4_reg" "u_logic/E143z4_reg" "u_logic/Xti2z4_reg" 
        "u_logic/Zpj2z4_reg" "u_logic/Jw73z4_reg" "u_logic/C183z4_reg" 
        "u_logic/Z8s2z4_reg" "u_logic/Wj83z4_reg" "u_logic/Hnr2z4_reg" 
        "u_logic/Wor2z4_reg" "u_logic/Hi83z4_reg" "u_logic/Hmv2z4_reg" 
        "u_logic/Ffj2z4_reg" "u_logic/Nsk2z4_reg" "u_logic/A4t2z4_reg" 
        "u_logic/Tki2z4_reg" "u_logic/Pdi2z4_reg" "u_logic/Cyq2z4_reg" 
        "u_logic/W7z2z4_reg" "u_logic/K9z2z4_reg" "u_logic/I6z2z4_reg" 
        "u_logic/C3z2z4_reg" "u_logic/Tyx2z4_reg" "u_logic/Idk2z4_reg" 
        "u_logic/Hxx2z4_reg" "u_logic/Rbi3z4_reg" "u_logic/Vaw2z4_reg" 
        "u_logic/Z7i2z4_reg" "u_logic/J4x2z4_reg" "u_logic/R8x2z4_reg" 
        "u_logic/Fcj2z4_reg" "u_logic/Igi2z4_reg" "u_logic/Gci2z4_reg" 
        "u_logic/Omk2z4_reg" "u_logic/Ycx2z4_reg" "u_logic/G6d3z4_reg" 
        "u_logic/Nbx2z4_reg" "u_logic/Lrx2z4_reg" "u_logic/Xsx2z4_reg" 
        "u_logic/Ufx2z4_reg" "u_logic/Xyk2z4_reg" "u_logic/Zpx2z4_reg" 
        "u_logic/Jwf3z4_reg" "u_logic/Rix2z4_reg" "u_logic/Nox2z4_reg" 
        "u_logic/V4d3z4_reg" "u_logic/Jex2z4_reg" "u_logic/Jux2z4_reg" 
        "u_logic/G7x2z4_reg" "u_logic/Cax2z4_reg" "u_logic/Zei2z4_reg" 
        "u_logic/J0l2z4_reg" "u_logic/Vvx2z4_reg" "u_logic/Gmd3z4_reg" 
        "u_logic/Fhx2z4_reg" "u_logic/Kaf3z4_reg" "u_logic/Dkx2z4_reg" 
        "u_logic/Tme3z4_reg" "u_logic/Bnx2z4_reg" "u_logic/B9g3z4_reg" 
        "u_logic/Foe3z4_reg" "u_logic/Plx2z4_reg" "u_logic/Zjq2z4_reg" 
        "u_logic/B6j2z4_reg" "u_logic/Wce3z4_reg" "u_logic/Rkd3z4_reg" 
        "u_logic/Ypi3z4_reg";
        ScanIn "test_si";
        ScanOut "SYSRESETREQ";
        ScanEnable "test_se";
        ScanMasterClock "HCLK";
    }
}
Timing  {
    WaveformTable "_default_WFT_" {
        Period '100ns';
        Waveforms {
            "all_inputs" {
                0 {
                    '0ns' D;
                }
            }
            "all_inputs" {
                1 {
                    '0ns' U;
                }
            }
            "all_inputs" {
                Z {
                    '0ns' Z;
                }
            }
            "all_inputs" {
                N {
                    '0ns' N;
                }
            }
            "all_outputs" {
                X {
                    '0ns' X;
                    '40ns' X;
                }
            }
            "all_outputs" {
                H {
                    '0ns' X;
                    '40ns' H;
                }
            }
            "all_outputs" {
                T {
                    '0ns' X;
                    '40ns' T;
                }
            }
            "all_outputs" {
                L {
                    '0ns' X;
                    '40ns' L;
                }
            }
            "HCLK" {
                P {
                    '0ns' D;
                    '45ns' U;
                    '55ns' D;
                }
            }
            "HRESETn" {
                P {
                    '0ns' U;
                    '45ns' D;
                    '55ns' U;
                }
            }
        }
    }
    WaveformTable "_multiclock_capture_WFT_" {
        Period '100ns';
        Waveforms {
            "all_inputs" {
                0 {
                    '0ns' D;
                }
            }
            "all_inputs" {
                1 {
                    '0ns' U;
                }
            }
            "all_inputs" {
                Z {
                    '0ns' Z;
                }
            }
            "all_inputs" {
                N {
                    '0ns' N;
                }
            }
            "all_outputs" {
                X {
                    '0ns' X;
                    '40ns' X;
                }
            }
            "all_outputs" {
                H {
                    '0ns' X;
                    '40ns' H;
                }
            }
            "all_outputs" {
                T {
                    '0ns' X;
                    '40ns' T;
                }
            }
            "all_outputs" {
                L {
                    '0ns' X;
                    '40ns' L;
                }
            }
            "HCLK" {
                P {
                    '0ns' D;
                    '45ns' U;
                    '55ns' D;
                }
            }
            "HRESETn" {
                P {
                    '0ns' U;
                    '45ns' D;
                    '55ns' U;
                }
            }
        }
    }
    WaveformTable "_allclock_capture_WFT_" {
        Period '100ns';
        Waveforms {
            "all_inputs" {
                0 {
                    '0ns' D;
                }
            }
            "all_inputs" {
                1 {
                    '0ns' U;
                }
            }
            "all_inputs" {
                Z {
                    '0ns' Z;
                }
            }
            "all_inputs" {
                N {
                    '0ns' N;
                }
            }
            "all_outputs" {
                X {
                    '0ns' X;
                    '40ns' X;
                }
            }
            "all_outputs" {
                H {
                    '0ns' X;
                    '40ns' H;
                }
            }
            "all_outputs" {
                T {
                    '0ns' X;
                    '40ns' T;
                }
            }
            "all_outputs" {
                L {
                    '0ns' X;
                    '40ns' L;
                }
            }
            "HCLK" {
                P {
                    '0ns' D;
                    '45ns' U;
                    '55ns' D;
                }
            }
            "HRESETn" {
                P {
                    '0ns' U;
                    '45ns' D;
                    '55ns' U;
                }
            }
        }
    }
    WaveformTable "_allclock_launch_WFT_" {
        Period '100ns';
        Waveforms {
            "all_inputs" {
                0 {
                    '0ns' D;
                }
            }
            "all_inputs" {
                1 {
                    '0ns' U;
                }
            }
            "all_inputs" {
                Z {
                    '0ns' Z;
                }
            }
            "all_inputs" {
                N {
                    '0ns' N;
                }
            }
            "all_outputs" {
                X {
                    '0ns' X;
                    '40ns' X;
                }
            }
            "all_outputs" {
                H {
                    '0ns' X;
                    '40ns' H;
                }
            }
            "all_outputs" {
                T {
                    '0ns' X;
                    '40ns' T;
                }
            }
            "all_outputs" {
                L {
                    '0ns' X;
                    '40ns' L;
                }
            }
            "HCLK" {
                P {
                    '0ns' D;
                    '45ns' U;
                    '55ns' D;
                }
            }
            "HRESETn" {
                P {
                    '0ns' U;
                    '45ns' D;
                    '55ns' U;
                }
            }
        }
    }
    WaveformTable "_allclock_launch_capture_WFT_" {
        Period '100ns';
        Waveforms {
            "all_inputs" {
                0 {
                    '0ns' D;
                }
            }
            "all_inputs" {
                1 {
                    '0ns' U;
                }
            }
            "all_inputs" {
                Z {
                    '0ns' Z;
                }
            }
            "all_inputs" {
                N {
                    '0ns' N;
                }
            }
            "all_outputs" {
                X {
                    '0ns' X;
                    '40ns' X;
                }
            }
            "all_outputs" {
                H {
                    '0ns' X;
                    '40ns' H;
                }
            }
            "all_outputs" {
                T {
                    '0ns' X;
                    '40ns' T;
                }
            }
            "all_outputs" {
                L {
                    '0ns' X;
                    '40ns' L;
                }
            }
            "HCLK" {
                P {
                    '0ns' D;
                    '45ns' U;
                    '55ns' D;
                }
            }
            "HRESETn" {
                P {
                    '0ns' U;
                    '45ns' D;
                    '55ns' U;
                }
            }
        }
    }
}
PatternBurst "__burst__" {
    PatList {
        "CORTEXM0DS_Internal_scan_patterns" {
            SignalGroups Internal_scan;
            ScanStructures Internal_scan;
            Procedures Internal_scan;
            MacroDefs Internal_scan;
        }
    }
}
PatternExec  {
    PatternBurst "__burst__";
}
Procedures all_dft_protocol {
    "multiclock_capture" {
        W "_multiclock_capture_WFT_";
        C {
            "HCLK" = 0;
            "HRESETn" = 1;
            "HADDR[0]" = X;
            "HADDR[10]" = X;
            "HADDR[11]" = X;
            "HADDR[12]" = X;
            "HADDR[13]" = X;
            "HADDR[14]" = X;
            "HADDR[15]" = X;
            "HADDR[16]" = X;
            "HADDR[17]" = X;
            "HADDR[18]" = X;
            "HADDR[19]" = X;
            "HADDR[1]" = X;
            "HADDR[20]" = X;
            "HADDR[21]" = X;
            "HADDR[22]" = X;
            "HADDR[23]" = X;
            "HADDR[24]" = X;
            "HADDR[25]" = X;
            "HADDR[26]" = X;
            "HADDR[27]" = X;
            "HADDR[28]" = X;
            "HADDR[29]" = X;
            "HADDR[2]" = X;
            "HADDR[30]" = X;
            "HADDR[31]" = X;
            "HADDR[3]" = X;
            "HADDR[4]" = X;
            "HADDR[5]" = X;
            "HADDR[6]" = X;
            "HADDR[7]" = X;
            "HADDR[8]" = X;
            "HADDR[9]" = X;
            "HBURST[0]" = X;
            "HBURST[1]" = X;
            "HBURST[2]" = X;
            "HMASTLOCK" = X;
            "HPROT[0]" = X;
            "HPROT[1]" = X;
            "HPROT[2]" = X;
            "HPROT[3]" = X;
            "HSIZE[0]" = X;
            "HSIZE[1]" = X;
            "HSIZE[2]" = X;
            "HTRANS[0]" = X;
            "HTRANS[1]" = X;
            "HWDATA[0]" = X;
            "HWDATA[10]" = X;
            "HWDATA[11]" = X;
            "HWDATA[12]" = X;
            "HWDATA[13]" = X;
            "HWDATA[14]" = X;
            "HWDATA[15]" = X;
            "HWDATA[16]" = X;
            "HWDATA[17]" = X;
            "HWDATA[18]" = X;
            "HWDATA[19]" = X;
            "HWDATA[1]" = X;
            "HWDATA[20]" = X;
            "HWDATA[21]" = X;
            "HWDATA[22]" = X;
            "HWDATA[23]" = X;
            "HWDATA[24]" = X;
            "HWDATA[25]" = X;
            "HWDATA[26]" = X;
            "HWDATA[27]" = X;
            "HWDATA[28]" = X;
            "HWDATA[29]" = X;
            "HWDATA[2]" = X;
            "HWDATA[30]" = X;
            "HWDATA[31]" = X;
            "HWDATA[3]" = X;
            "HWDATA[4]" = X;
            "HWDATA[5]" = X;
            "HWDATA[6]" = X;
            "HWDATA[7]" = X;
            "HWDATA[8]" = X;
            "HWDATA[9]" = X;
            "HWRITE" = X;
            "LOCKUP" = X;
            "SLEEPING" = X;
            "SYSRESETREQ" = X;
            "TXEV" = X;
        }
        V {
            "_po" = \r82 #;
            "_pi" = \r54 #;
        }
    }
    "allclock_capture" {
        W "_allclock_capture_WFT_";
        C {
            "HCLK" = 0;
            "HRESETn" = 1;
            "HADDR[0]" = X;
            "HADDR[10]" = X;
            "HADDR[11]" = X;
            "HADDR[12]" = X;
            "HADDR[13]" = X;
            "HADDR[14]" = X;
            "HADDR[15]" = X;
            "HADDR[16]" = X;
            "HADDR[17]" = X;
            "HADDR[18]" = X;
            "HADDR[19]" = X;
            "HADDR[1]" = X;
            "HADDR[20]" = X;
            "HADDR[21]" = X;
            "HADDR[22]" = X;
            "HADDR[23]" = X;
            "HADDR[24]" = X;
            "HADDR[25]" = X;
            "HADDR[26]" = X;
            "HADDR[27]" = X;
            "HADDR[28]" = X;
            "HADDR[29]" = X;
            "HADDR[2]" = X;
            "HADDR[30]" = X;
            "HADDR[31]" = X;
            "HADDR[3]" = X;
            "HADDR[4]" = X;
            "HADDR[5]" = X;
            "HADDR[6]" = X;
            "HADDR[7]" = X;
            "HADDR[8]" = X;
            "HADDR[9]" = X;
            "HBURST[0]" = X;
            "HBURST[1]" = X;
            "HBURST[2]" = X;
            "HMASTLOCK" = X;
            "HPROT[0]" = X;
            "HPROT[1]" = X;
            "HPROT[2]" = X;
            "HPROT[3]" = X;
            "HSIZE[0]" = X;
            "HSIZE[1]" = X;
            "HSIZE[2]" = X;
            "HTRANS[0]" = X;
            "HTRANS[1]" = X;
            "HWDATA[0]" = X;
            "HWDATA[10]" = X;
            "HWDATA[11]" = X;
            "HWDATA[12]" = X;
            "HWDATA[13]" = X;
            "HWDATA[14]" = X;
            "HWDATA[15]" = X;
            "HWDATA[16]" = X;
            "HWDATA[17]" = X;
            "HWDATA[18]" = X;
            "HWDATA[19]" = X;
            "HWDATA[1]" = X;
            "HWDATA[20]" = X;
            "HWDATA[21]" = X;
            "HWDATA[22]" = X;
            "HWDATA[23]" = X;
            "HWDATA[24]" = X;
            "HWDATA[25]" = X;
            "HWDATA[26]" = X;
            "HWDATA[27]" = X;
            "HWDATA[28]" = X;
            "HWDATA[29]" = X;
            "HWDATA[2]" = X;
            "HWDATA[30]" = X;
            "HWDATA[31]" = X;
            "HWDATA[3]" = X;
            "HWDATA[4]" = X;
            "HWDATA[5]" = X;
            "HWDATA[6]" = X;
            "HWDATA[7]" = X;
            "HWDATA[8]" = X;
            "HWDATA[9]" = X;
            "HWRITE" = X;
            "LOCKUP" = X;
            "SLEEPING" = X;
            "SYSRESETREQ" = X;
            "TXEV" = X;
        }
        V {
            "_po" = \r82 #;
            "_pi" = \r54 #;
        }
    }
    "allclock_launch" {
        W "_allclock_launch_WFT_";
        C {
            "HCLK" = 0;
            "HRESETn" = 1;
            "HADDR[0]" = X;
            "HADDR[10]" = X;
            "HADDR[11]" = X;
            "HADDR[12]" = X;
            "HADDR[13]" = X;
            "HADDR[14]" = X;
            "HADDR[15]" = X;
            "HADDR[16]" = X;
            "HADDR[17]" = X;
            "HADDR[18]" = X;
            "HADDR[19]" = X;
            "HADDR[1]" = X;
            "HADDR[20]" = X;
            "HADDR[21]" = X;
            "HADDR[22]" = X;
            "HADDR[23]" = X;
            "HADDR[24]" = X;
            "HADDR[25]" = X;
            "HADDR[26]" = X;
            "HADDR[27]" = X;
            "HADDR[28]" = X;
            "HADDR[29]" = X;
            "HADDR[2]" = X;
            "HADDR[30]" = X;
            "HADDR[31]" = X;
            "HADDR[3]" = X;
            "HADDR[4]" = X;
            "HADDR[5]" = X;
            "HADDR[6]" = X;
            "HADDR[7]" = X;
            "HADDR[8]" = X;
            "HADDR[9]" = X;
            "HBURST[0]" = X;
            "HBURST[1]" = X;
            "HBURST[2]" = X;
            "HMASTLOCK" = X;
            "HPROT[0]" = X;
            "HPROT[1]" = X;
            "HPROT[2]" = X;
            "HPROT[3]" = X;
            "HSIZE[0]" = X;
            "HSIZE[1]" = X;
            "HSIZE[2]" = X;
            "HTRANS[0]" = X;
            "HTRANS[1]" = X;
            "HWDATA[0]" = X;
            "HWDATA[10]" = X;
            "HWDATA[11]" = X;
            "HWDATA[12]" = X;
            "HWDATA[13]" = X;
            "HWDATA[14]" = X;
            "HWDATA[15]" = X;
            "HWDATA[16]" = X;
            "HWDATA[17]" = X;
            "HWDATA[18]" = X;
            "HWDATA[19]" = X;
            "HWDATA[1]" = X;
            "HWDATA[20]" = X;
            "HWDATA[21]" = X;
            "HWDATA[22]" = X;
            "HWDATA[23]" = X;
            "HWDATA[24]" = X;
            "HWDATA[25]" = X;
            "HWDATA[26]" = X;
            "HWDATA[27]" = X;
            "HWDATA[28]" = X;
            "HWDATA[29]" = X;
            "HWDATA[2]" = X;
            "HWDATA[30]" = X;
            "HWDATA[31]" = X;
            "HWDATA[3]" = X;
            "HWDATA[4]" = X;
            "HWDATA[5]" = X;
            "HWDATA[6]" = X;
            "HWDATA[7]" = X;
            "HWDATA[8]" = X;
            "HWDATA[9]" = X;
            "HWRITE" = X;
            "LOCKUP" = X;
            "SLEEPING" = X;
            "SYSRESETREQ" = X;
            "TXEV" = X;
        }
        V {
            "_po" = \r82 #;
            "_pi" = \r54 #;
        }
    }
    "allclock_launch_capture" {
        W "_allclock_launch_capture_WFT_";
        C {
            "HCLK" = 0;
            "HRESETn" = 1;
            "HADDR[0]" = X;
            "HADDR[10]" = X;
            "HADDR[11]" = X;
            "HADDR[12]" = X;
            "HADDR[13]" = X;
            "HADDR[14]" = X;
            "HADDR[15]" = X;
            "HADDR[16]" = X;
            "HADDR[17]" = X;
            "HADDR[18]" = X;
            "HADDR[19]" = X;
            "HADDR[1]" = X;
            "HADDR[20]" = X;
            "HADDR[21]" = X;
            "HADDR[22]" = X;
            "HADDR[23]" = X;
            "HADDR[24]" = X;
            "HADDR[25]" = X;
            "HADDR[26]" = X;
            "HADDR[27]" = X;
            "HADDR[28]" = X;
            "HADDR[29]" = X;
            "HADDR[2]" = X;
            "HADDR[30]" = X;
            "HADDR[31]" = X;
            "HADDR[3]" = X;
            "HADDR[4]" = X;
            "HADDR[5]" = X;
            "HADDR[6]" = X;
            "HADDR[7]" = X;
            "HADDR[8]" = X;
            "HADDR[9]" = X;
            "HBURST[0]" = X;
            "HBURST[1]" = X;
            "HBURST[2]" = X;
            "HMASTLOCK" = X;
            "HPROT[0]" = X;
            "HPROT[1]" = X;
            "HPROT[2]" = X;
            "HPROT[3]" = X;
            "HSIZE[0]" = X;
            "HSIZE[1]" = X;
            "HSIZE[2]" = X;
            "HTRANS[0]" = X;
            "HTRANS[1]" = X;
            "HWDATA[0]" = X;
            "HWDATA[10]" = X;
            "HWDATA[11]" = X;
            "HWDATA[12]" = X;
            "HWDATA[13]" = X;
            "HWDATA[14]" = X;
            "HWDATA[15]" = X;
            "HWDATA[16]" = X;
            "HWDATA[17]" = X;
            "HWDATA[18]" = X;
            "HWDATA[19]" = X;
            "HWDATA[1]" = X;
            "HWDATA[20]" = X;
            "HWDATA[21]" = X;
            "HWDATA[22]" = X;
            "HWDATA[23]" = X;
            "HWDATA[24]" = X;
            "HWDATA[25]" = X;
            "HWDATA[26]" = X;
            "HWDATA[27]" = X;
            "HWDATA[28]" = X;
            "HWDATA[29]" = X;
            "HWDATA[2]" = X;
            "HWDATA[30]" = X;
            "HWDATA[31]" = X;
            "HWDATA[3]" = X;
            "HWDATA[4]" = X;
            "HWDATA[5]" = X;
            "HWDATA[6]" = X;
            "HWDATA[7]" = X;
            "HWDATA[8]" = X;
            "HWDATA[9]" = X;
            "HWRITE" = X;
            "LOCKUP" = X;
            "SLEEPING" = X;
            "SYSRESETREQ" = X;
            "TXEV" = X;
        }
        V {
            "_po" = \r82 #;
            "_pi" = \r54 #;
        }
    }
}
Procedures Internal_scan {
    "multiclock_capture" {
        W "_multiclock_capture_WFT_";
        C {
            "all_inputs" = 0 \r33 N 1 \r21 N;
            "all_outputs" = \r82 X;
        }
        V {
            "_pi" = \r56 #;
            "_po" = \r82 #;
        }
    }
    "allclock_capture" {
        W "_allclock_capture_WFT_";
        C {
            "all_inputs" = 0 \r33 N 1 \r21 N;
            "all_outputs" = \r82 X;
        }
        V {
            "_pi" = \r56 #;
            "_po" = \r82 #;
        }
    }
    "allclock_launch" {
        W "_allclock_launch_WFT_";
        C {
            "all_inputs" = 0 \r33 N 1 \r21 N;
            "all_outputs" = \r82 X;
        }
        V {
            "_pi" = \r56 #;
            "_po" = \r82 #;
        }
    }
    "allclock_launch_capture" {
        W "_allclock_launch_capture_WFT_";
        C {
            "all_inputs" = 0 \r33 N 1 \r21 N;
            "all_outputs" = \r82 X;
        }
        V {
            "_pi" = \r56 #;
            "_po" = \r82 #;
        }
    }
    "load_unload" {
        W "_default_WFT_";
        C {
            "all_inputs" = 0 \r33 N 1 \r21 N;
            "all_outputs" = \r82 X;
        }
        "Internal_scan_pre_shift" : V {
            "test_se" = 1;
        }
        Shift {
            V {
                "_clk" = P1;
                "_si" = #;
                "_so" = #;
            }
        }
    }
}
Procedures Mission_mode {
    "multiclock_capture" {
        W "_multiclock_capture_WFT_";
        C {
            "all_inputs" = 0 \r33 N 1 \r21 N;
            "all_outputs" = \r82 X;
        }
        V {
            "_pi" = \r56 #;
            "_po" = \r82 #;
        }
    }
    "allclock_capture" {
        W "_allclock_capture_WFT_";
        C {
            "all_inputs" = 0 \r33 N 1 \r21 N;
            "all_outputs" = \r82 X;
        }
        V {
            "_pi" = \r56 #;
            "_po" = \r82 #;
        }
    }
    "allclock_launch" {
        W "_allclock_launch_WFT_";
        C {
            "all_inputs" = 0 \r33 N 1 \r21 N;
            "all_outputs" = \r82 X;
        }
        V {
            "_pi" = \r56 #;
            "_po" = \r82 #;
        }
    }
    "allclock_launch_capture" {
        W "_allclock_launch_capture_WFT_";
        C {
            "all_inputs" = 0 \r33 N 1 \r21 N;
            "all_outputs" = \r82 X;
        }
        V {
            "_pi" = \r56 #;
            "_po" = \r82 #;
        }
    }
}
MacroDefs all_dft_protocol {
    "test_setup" {
        W "_default_WFT_";
        V {
            "HCLK" = 0;
        }
        V {
            "HRESETn" = 1;
        }
    }
}
MacroDefs Internal_scan {
    "test_setup" {
        W "_default_WFT_";
        C {
            "all_inputs" = \r56 N;
            "all_outputs" = \r82 X;
        }
        V {
            "HCLK" = 0;
            "HRESETn" = 1;
        }
        V {
        }
    }
}
MacroDefs Mission_mode {
    "test_setup" {
        W "_default_WFT_";
        C {
            "all_inputs" = \r56 N;
            "all_outputs" = \r82 X;
        }
        V {
            "HCLK" = 0;
        }
        V {
            "HRESETn" = 1;
        }
    }
}
Environment  {
    NameMaps DFTC {
        ScanCells {
            "u_logic/A4t2z4_reg" "u_logic_A4t2z4_reg";
            "u_logic/A8h3z4_reg" "u_logic_A8h3z4_reg";
            "u_logic/A9p2z4_reg" "u_logic_A9p2z4_reg";
            "u_logic/A933z4_reg" "u_logic_A933z4_reg";
            "u_logic/Adt2z4_reg" "u_logic_Adt2z4_reg";
            "u_logic/Aea3z4_reg" "u_logic_Aea3z4_reg";
            "u_logic/Aez2z4_reg" "u_logic_Aez2z4_reg";
            "u_logic/Aff3z4_reg" "u_logic_Aff3z4_reg";
            "u_logic/Ahw2z4_reg" "u_logic_Ahw2z4_reg";
            "u_logic/Aii3z4_reg" "u_logic_Aii3z4_reg";
            "u_logic/Ajn2z4_reg" "u_logic_Ajn2z4_reg";
            "u_logic/An63z4_reg" "u_logic_An63z4_reg";
            "u_logic/An73z4_reg" "u_logic_An73z4_reg";
            "u_logic/An83z4_reg" "u_logic_An83z4_reg";
            "u_logic/Anq2z4_reg" "u_logic_Anq2z4_reg";
            "u_logic/Aok2z4_reg" "u_logic_Aok2z4_reg";
            "u_logic/Aqp2z4_reg" "u_logic_Aqp2z4_reg";
            "u_logic/Ara3z4_reg" "u_logic_Ara3z4_reg";
            "u_logic/Arh3z4_reg" "u_logic_Arh3z4_reg";
            "u_logic/Ark2z4_reg" "u_logic_Ark2z4_reg";
            "u_logic/Arn2z4_reg" "u_logic_Arn2z4_reg";
            "u_logic/Art2z4_reg" "u_logic_Art2z4_reg";
            "u_logic/Aru2z4_reg" "u_logic_Aru2z4_reg";
            "u_logic/Arv2z4_reg" "u_logic_Arv2z4_reg";
            "u_logic/Asr2z4_reg" "u_logic_Asr2z4_reg";
            "u_logic/Aud3z4_reg" "u_logic_Aud3z4_reg";
            "u_logic/Auk2z4_reg" "u_logic_Auk2z4_reg";
            "u_logic/Av13z4_reg" "u_logic_Av13z4_reg";
            "u_logic/Avg3z4_reg" "u_logic_Avg3z4_reg";
            "u_logic/Axm2z4_reg" "u_logic_Axm2z4_reg";
            "u_logic/Ay53z4_reg" "u_logic_Ay53z4_reg";
            "u_logic/Aze3z4_reg" "u_logic_Aze3z4_reg";
            "u_logic/Azs2z4_reg" "u_logic_Azs2z4_reg";
            "u_logic/B1a3z4_reg" "u_logic_B1a3z4_reg";
            "u_logic/B1q2z4_reg" "u_logic_B1q2z4_reg";
            "u_logic/B2i3z4_reg" "u_logic_B2i3z4_reg";
            "u_logic/B5e3z4_reg" "u_logic_B5e3z4_reg";
            "u_logic/B5u2z4_reg" "u_logic_B5u2z4_reg";
            "u_logic/B6j2z4_reg" "u_logic_B6j2z4_reg";
            "u_logic/B9g3z4_reg" "u_logic_B9g3z4_reg";
            "u_logic/B173z4_reg" "u_logic_B173z4_reg";
            "u_logic/B613z4_reg" "u_logic_B613z4_reg";
            "u_logic/B943z4_reg" "u_logic_B943z4_reg";
            "u_logic/Bby2z4_reg" "u_logic_Bby2z4_reg";
            "u_logic/Bdm2z4_reg" "u_logic_Bdm2z4_reg";
            "u_logic/Bec3z4_reg" "u_logic_Bec3z4_reg";
            "u_logic/Bf93z4_reg" "u_logic_Bf93z4_reg";
            "u_logic/Bge3z4_reg" "u_logic_Bge3z4_reg";
            "u_logic/Bjd3z4_reg" "u_logic_Bjd3z4_reg";
            "u_logic/Bk13z4_reg" "u_logic_Bk13z4_reg";
            "u_logic/Bk23z4_reg" "u_logic_Bk23z4_reg";
            "u_logic/Bk33z4_reg" "u_logic_Bk33z4_reg";
            "u_logic/Ble3z4_reg" "u_logic_Ble3z4_reg";
            "u_logic/Bmb3z4_reg" "u_logic_Bmb3z4_reg";
            "u_logic/Bn53z4_reg" "u_logic_Bn53z4_reg";
            "u_logic/Bnx2z4_reg" "u_logic_Bnx2z4_reg";
            "u_logic/Bqf3z4_reg" "u_logic_Bqf3z4_reg";
            "u_logic/Bsy2z4_reg" "u_logic_Bsy2z4_reg";
            "u_logic/Bus2z4_reg" "u_logic_Bus2z4_reg";
            "u_logic/Bv03z4_reg" "u_logic_Bv03z4_reg";
            "u_logic/Byw2z4_reg" "u_logic_Byw2z4_reg";
            "u_logic/C3w2z4_reg" "u_logic_C3w2z4_reg";
            "u_logic/C3z2z4_reg" "u_logic_C3z2z4_reg";
            "u_logic/C4b3z4_reg" "u_logic_C4b3z4_reg";
            "u_logic/C5n2z4_reg" "u_logic_C5n2z4_reg";
            "u_logic/C5v2z4_reg" "u_logic_C5v2z4_reg";
            "u_logic/C7f3z4_reg" "u_logic_C7f3z4_reg";
            "u_logic/C9a3z4_reg" "u_logic_C9a3z4_reg";
            "u_logic/C183z4_reg" "u_logic_C183z4_reg";
            "u_logic/C193z4_reg" "u_logic_C193z4_reg";
            "u_logic/Cai3z4_reg" "u_logic_Cai3z4_reg";
            "u_logic/Cam2z4_reg" "u_logic_Cam2z4_reg";
            "u_logic/Cao2z4_reg" "u_logic_Cao2z4_reg";
            "u_logic/Cax2z4_reg" "u_logic_Cax2z4_reg";
            "u_logic/Cc53z4_reg" "u_logic_Cc53z4_reg";
            "u_logic/Cc63z4_reg" "u_logic_Cc63z4_reg";
            "u_logic/Cc73z4_reg" "u_logic_Cc73z4_reg";
            "u_logic/Ccg3z4_reg" "u_logic_Ccg3z4_reg";
            "u_logic/Ccq2z4_reg" "u_logic_Ccq2z4_reg";
            "u_logic/Cgt2z4_reg" "u_logic_Cgt2z4_reg";
            "u_logic/Cgu2z4_reg" "u_logic_Cgu2z4_reg";
            "u_logic/Ch03z4_reg" "u_logic_Ch03z4_reg";
            "u_logic/Ckw2z4_reg" "u_logic_Ckw2z4_reg";
            "u_logic/Cll2z4_reg" "u_logic_Cll2z4_reg";
            "u_logic/Cma3z4_reg" "u_logic_Cma3z4_reg";
            "u_logic/Cmn2z4_reg" "u_logic_Cmn2z4_reg";
            "u_logic/Cn43z4_reg" "u_logic_Cn43z4_reg";
            "u_logic/Cps2z4_reg" "u_logic_Cps2z4_reg";
            "u_logic/Cq93z4_reg" "u_logic_Cq93z4_reg";
            "u_logic/Cqo2z4_reg" "u_logic_Cqo2z4_reg";
            "u_logic/Csz2z4_reg" "u_logic_Csz2z4_reg";
            "u_logic/Cvr2z4_reg" "u_logic_Cvr2z4_reg";
            "u_logic/Cxc3z4_reg" "u_logic_Cxc3z4_reg";
            "u_logic/Cy13z4_reg" "u_logic_Cy13z4_reg";
            "u_logic/Cy33z4_reg" "u_logic_Cy33z4_reg";
            "u_logic/Cy43z4_reg" "u_logic_Cy43z4_reg";
            "u_logic/Cyq2z4_reg" "u_logic_Cyq2z4_reg";
            "u_logic/D1p2z4_reg" "u_logic_D1p2z4_reg";
            "u_logic/D4a3z4_reg" "u_logic_D4a3z4_reg";
            "u_logic/D4g3z4_reg" "u_logic_D4g3z4_reg";
            "u_logic/D7k2z4_reg" "u_logic_D7k2z4_reg";
            "u_logic/D603z4_reg" "u_logic_D603z4_reg";
            "u_logic/D923z4_reg" "u_logic_D923z4_reg";
            "u_logic/Dcs2z4_reg" "u_logic_Dcs2z4_reg";
            "u_logic/Ddi3z4_reg" "u_logic_Ddi3z4_reg";
            "u_logic/Df83z4_reg" "u_logic_Df83z4_reg";
            "u_logic/Dhb3z4_reg" "u_logic_Dhb3z4_reg";
            "u_logic/Djh3z4_reg" "u_logic_Djh3z4_reg";
            "u_logic/Djv2z4_reg" "u_logic_Djv2z4_reg";
            "u_logic/Dkr2z4_reg" "u_logic_Dkr2z4_reg";
            "u_logic/Dks2z4_reg" "u_logic_Dks2z4_reg";
            "u_logic/Dkx2z4_reg" "u_logic_Dkx2z4_reg";
            "u_logic/Dng3z4_reg" "u_logic_Dng3z4_reg";
            "u_logic/Dpc3z4_reg" "u_logic_Dpc3z4_reg";
            "u_logic/Dq53z4_reg" "u_logic_Dq53z4_reg";
            "u_logic/Dq73z4_reg" "u_logic_Dq73z4_reg";
            "u_logic/Dq83z4_reg" "u_logic_Dq83z4_reg";
            "u_logic/Dtj2z4_reg" "u_logic_Dtj2z4_reg";
            "u_logic/Duu2z4_reg" "u_logic_Duu2z4_reg";
            "u_logic/Duv2z4_reg" "u_logic_Duv2z4_reg";
            "u_logic/Dvy2z4_reg" "u_logic_Dvy2z4_reg";
            "u_logic/Dwl2z4_reg" "u_logic_Dwl2z4_reg";
            "u_logic/Dy23z4_reg" "u_logic_Dy23z4_reg";
            "u_logic/E0d3z4_reg" "u_logic_E0d3z4_reg";
            "u_logic/E1r2z4_reg" "u_logic_E1r2z4_reg";
            "u_logic/E9c3z4_reg" "u_logic_E9c3z4_reg";
            "u_logic/E143z4_reg" "u_logic_E143z4_reg";
            "u_logic/E153z4_reg" "u_logic_E153z4_reg";
            "u_logic/E163z4_reg" "u_logic_E163z4_reg";
            "u_logic/E913z4_reg" "u_logic_E913z4_reg";
            "u_logic/Ebh3z4_reg" "u_logic_Ebh3z4_reg";
            "u_logic/Ec33z4_reg" "u_logic_Ec33z4_reg";
            "u_logic/Ec43z4_reg" "u_logic_Ec43z4_reg";
            "u_logic/Ecp2z4_reg" "u_logic_Ecp2z4_reg";
            "u_logic/Edl2z4_reg" "u_logic_Edl2z4_reg";
            "u_logic/Efp2z4_reg" "u_logic_Efp2z4_reg";
            "u_logic/Ehz2z4_reg" "u_logic_Ehz2z4_reg";
            "u_logic/Eif3z4_reg" "u_logic_Eif3z4_reg";
            "u_logic/Ejm2z4_reg" "u_logic_Ejm2z4_reg";
            "u_logic/Ek03z4_reg" "u_logic_Ek03z4_reg";
            "u_logic/Emi2z4_reg" "u_logic_Emi2z4_reg";
            "u_logic/Enw2z4_reg" "u_logic_Enw2z4_reg";
            "u_logic/Eol2z4_reg" "u_logic_Eol2z4_reg";
            "u_logic/Eq63z4_reg" "u_logic_Eq63z4_reg";
            "u_logic/Eqq2z4_reg" "u_logic_Eqq2z4_reg";
            "u_logic/Etq2z4_reg" "u_logic_Etq2z4_reg";
            "u_logic/Euh3z4_reg" "u_logic_Euh3z4_reg";
            "u_logic/Eun2z4_reg" "u_logic_Eun2z4_reg";
            "u_logic/Eut2z4_reg" "u_logic_Eut2z4_reg";
            "u_logic/Exd3z4_reg" "u_logic_Exd3z4_reg";
            "u_logic/Ey03z4_reg" "u_logic_Ey03z4_reg";
            "u_logic/Eyg3z4_reg" "u_logic_Eyg3z4_reg";
            "u_logic/Eyr2z4_reg" "u_logic_Eyr2z4_reg";
            "u_logic/F0y2z4_reg" "u_logic_F0y2z4_reg";
            "u_logic/F1x2z4_reg" "u_logic_F1x2z4_reg";
            "u_logic/F2o2z4_reg" "u_logic_F2o2z4_reg";
            "u_logic/F4c3z4_reg" "u_logic_F4c3z4_reg";
            "u_logic/F4q2z4_reg" "u_logic_F4q2z4_reg";
            "u_logic/F8e3z4_reg" "u_logic_F8e3z4_reg";
            "u_logic/F8u2z4_reg" "u_logic_F8u2z4_reg";
            "u_logic/F8v2z4_reg" "u_logic_F8v2z4_reg";
            "u_logic/F9j2z4_reg" "u_logic_F9j2z4_reg";
            "u_logic/F473z4_reg" "u_logic_F473z4_reg";
            "u_logic/F483z4_reg" "u_logic_F483z4_reg";
            "u_logic/Fcj2z4_reg" "u_logic_Fcj2z4_reg";
            "u_logic/Fed3z4_reg" "u_logic_Fed3z4_reg";
            "u_logic/Fey2z4_reg" "u_logic_Fey2z4_reg";
            "u_logic/Ffj2z4_reg" "u_logic_Ffj2z4_reg";
            "u_logic/Ffs2z4_reg" "u_logic_Ffs2z4_reg";
            "u_logic/Fgm2z4_reg" "u_logic_Fgm2z4_reg";
            "u_logic/Fhc3z4_reg" "u_logic_Fhc3z4_reg";
            "u_logic/Fhx2z4_reg" "u_logic_Fhx2z4_reg";
            "u_logic/Fi93z4_reg" "u_logic_Fi93z4_reg";
            "u_logic/Fij2z4_reg" "u_logic_Fij2z4_reg";
            "u_logic/Fio2z4_reg" "u_logic_Fio2z4_reg";
            "u_logic/Fli3z4_reg" "u_logic_Fli3z4_reg";
            "u_logic/Fn13z4_reg" "u_logic_Fn13z4_reg";
            "u_logic/Fn23z4_reg" "u_logic_Fn23z4_reg";
            "u_logic/Fn33z4_reg" "u_logic_Fn33z4_reg";
            "u_logic/Foe3z4_reg" "u_logic_Foe3z4_reg";
            "u_logic/Fpi2z4_reg" "u_logic_Fpi2z4_reg";
            "u_logic/Fre3z4_reg" "u_logic_Fre3z4_reg";
            "u_logic/Ft73z4_reg" "u_logic_Ft73z4_reg";
            "u_logic/Ft83z4_reg" "u_logic_Ft83z4_reg";
            "u_logic/Ftf3z4_reg" "u_logic_Ftf3z4_reg";
            "u_logic/Fvz2z4_reg" "u_logic_Fvz2z4_reg";
            "u_logic/Fwj2z4_reg" "u_logic_Fwj2z4_reg";
            "u_logic/Fxu2z4_reg" "u_logic_Fxu2z4_reg";
            "u_logic/Fxv2z4_reg" "u_logic_Fxv2z4_reg";
            "u_logic/Fzl2z4_reg" "u_logic_Fzl2z4_reg";
            "u_logic/G0w2z4_reg" "u_logic_G0w2z4_reg";
            "u_logic/G1s2z4_reg" "u_logic_G1s2z4_reg";
            "u_logic/G4r2z4_reg" "u_logic_G4r2z4_reg";
            "u_logic/G6d3z4_reg" "u_logic_G6d3z4_reg";
            "u_logic/G7x2z4_reg" "u_logic_G7x2z4_reg";
            "u_logic/G8n2z4_reg" "u_logic_G8n2z4_reg";
            "u_logic/G9w2z4_reg" "u_logic_G9w2z4_reg";
            "u_logic/G123z4_reg" "u_logic_G123z4_reg";
            "u_logic/G493z4_reg" "u_logic_G493z4_reg";
            "u_logic/Gcb3z4_reg" "u_logic_Gcb3z4_reg";
            "u_logic/Gci2z4_reg" "u_logic_Gci2z4_reg";
            "u_logic/Gcr2z4_reg" "u_logic_Gcr2z4_reg";
            "u_logic/Gdo2z4_reg" "u_logic_Gdo2z4_reg";
            "u_logic/Gf43z4_reg" "u_logic_Gf43z4_reg";
            "u_logic/Gf53z4_reg" "u_logic_Gf53z4_reg";
            "u_logic/Gf63z4_reg" "u_logic_Gf63z4_reg";
            "u_logic/Gf73z4_reg" "u_logic_Gf73z4_reg";
            "u_logic/Gfg3z4_reg" "u_logic_Gfg3z4_reg";
            "u_logic/Gfq2z4_reg" "u_logic_Gfq2z4_reg";
            "u_logic/Ggk2z4_reg" "u_logic_Ggk2z4_reg";
            "u_logic/Gha3z4_reg" "u_logic_Gha3z4_reg";
            "u_logic/Gip2z4_reg" "u_logic_Gip2z4_reg";
            "u_logic/Gji2z4_reg" "u_logic_Gji2z4_reg";
            "u_logic/Gjt2z4_reg" "u_logic_Gjt2z4_reg";
            "u_logic/Gju2z4_reg" "u_logic_Gju2z4_reg";
            "u_logic/Glj2z4_reg" "u_logic_Glj2z4_reg";
            "u_logic/Gmd3z4_reg" "u_logic_Gmd3z4_reg";
            "u_logic/Gmm2z4_reg" "u_logic_Gmm2z4_reg";
            "u_logic/Gq43z4_reg" "u_logic_Gq43z4_reg";
            "u_logic/Gqw2z4_reg" "u_logic_Gqw2z4_reg";
            "u_logic/Grl2z4_reg" "u_logic_Grl2z4_reg";
            "u_logic/Gt93z4_reg" "u_logic_Gt93z4_reg";
            "u_logic/Gto2z4_reg" "u_logic_Gto2z4_reg";
            "u_logic/Gtp2z4_reg" "u_logic_Gtp2z4_reg";
            "u_logic/Gxk2z4_reg" "u_logic_Gxk2z4_reg";
            "u_logic/Gza3z4_reg" "u_logic_Gza3z4_reg";
            "u_logic/Gzb3z4_reg" "u_logic_Gzb3z4_reg";
            "u_logic/H2f3z4_reg" "u_logic_H2f3z4_reg";
            "u_logic/H2m2z4_reg" "u_logic_H2m2z4_reg";
            "u_logic/H3d3z4_reg" "u_logic_H3d3z4_reg";
            "u_logic/H4p2z4_reg" "u_logic_H4p2z4_reg";
            "u_logic/H8l2z4_reg" "u_logic_H8l2z4_reg";
            "u_logic/H9i2z4_reg" "u_logic_H9i2z4_reg";
            "u_logic/H133z4_reg" "u_logic_H133z4_reg";
            "u_logic/H783z4_reg" "u_logic_H783z4_reg";
            "u_logic/H903z4_reg" "u_logic_H903z4_reg";
            "u_logic/Hak2z4_reg" "u_logic_Hak2z4_reg";
            "u_logic/Hbv2z4_reg" "u_logic_Hbv2z4_reg";
            "u_logic/Hc13z4_reg" "u_logic_Hc13z4_reg";
            "u_logic/Hc23z4_reg" "u_logic_Hc23z4_reg";
            "u_logic/Hi83z4_reg" "u_logic_Hi83z4_reg";
            "u_logic/Hmh3z4_reg" "u_logic_Hmh3z4_reg";
            "u_logic/Hmv2z4_reg" "u_logic_Hmv2z4_reg";
            "u_logic/Hn03z4_reg" "u_logic_Hn03z4_reg";
            "u_logic/Hnr2z4_reg" "u_logic_Hnr2z4_reg";
            "u_logic/Hpd3z4_reg" "u_logic_Hpd3z4_reg";
            "u_logic/Hq23z4_reg" "u_logic_Hq23z4_reg";
            "u_logic/Hq33z4_reg" "u_logic_Hq33z4_reg";
            "u_logic/Hqg3z4_reg" "u_logic_Hqg3z4_reg";
            "u_logic/Ht53z4_reg" "u_logic_Ht53z4_reg";
            "u_logic/Hub3z4_reg" "u_logic_Hub3z4_reg";
            "u_logic/Hue3z4_reg" "u_logic_Hue3z4_reg";
            "u_logic/Hxx2z4_reg" "u_logic_Hxx2z4_reg";
            "u_logic/Hyy2z4_reg" "u_logic_Hyy2z4_reg";
            "u_logic/Hyz2z4_reg" "u_logic_Hyz2z4_reg";
            "u_logic/Hzj2z4_reg" "u_logic_Hzj2z4_reg";
            "u_logic/I0e3z4_reg" "u_logic_I0e3z4_reg";
            "u_logic/I1h3z4_reg" "u_logic_I1h3z4_reg";
            "u_logic/I2t2z4_reg" "u_logic_I2t2z4_reg";
            "u_logic/I3y2z4_reg" "u_logic_I3y2z4_reg";
            "u_logic/I4s2z4_reg" "u_logic_I4s2z4_reg";
            "u_logic/I6h3z4_reg" "u_logic_I6h3z4_reg";
            "u_logic/I6w2z4_reg" "u_logic_I6w2z4_reg";
            "u_logic/I6z2z4_reg" "u_logic_I6z2z4_reg";
            "u_logic/I7r2z4_reg" "u_logic_I7r2z4_reg";
            "u_logic/I113z4_reg" "u_logic_I113z4_reg";
            "u_logic/I443z4_reg" "u_logic_I443z4_reg";
            "u_logic/I453z4_reg" "u_logic_I453z4_reg";
            "u_logic/I463z4_reg" "u_logic_I463z4_reg";
            "u_logic/I793z4_reg" "u_logic_I793z4_reg";
            "u_logic/Ibe3z4_reg" "u_logic_Ibe3z4_reg";
            "u_logic/Idk2z4_reg" "u_logic_Idk2z4_reg";
            "u_logic/Ieh3z4_reg" "u_logic_Ieh3z4_reg";
            "u_logic/If33z4_reg" "u_logic_If33z4_reg";
            "u_logic/Igi2z4_reg" "u_logic_Igi2z4_reg";
            "u_logic/Igl2z4_reg" "u_logic_Igl2z4_reg";
            "u_logic/Ii63z4_reg" "u_logic_Ii63z4_reg";
            "u_logic/Ii73z4_reg" "u_logic_Ii73z4_reg";
            "u_logic/Ikz2z4_reg" "u_logic_Ikz2z4_reg";
            "u_logic/Ilf3z4_reg" "u_logic_Ilf3z4_reg";
            "u_logic/Ilp2z4_reg" "u_logic_Ilp2z4_reg";
            "u_logic/Imt2z4_reg" "u_logic_Imt2z4_reg";
            "u_logic/Imu2z4_reg" "u_logic_Imu2z4_reg";
            "u_logic/Ipb3z4_reg" "u_logic_Ipb3z4_reg";
            "u_logic/Ipm2z4_reg" "u_logic_Ipm2z4_reg";
            "u_logic/Ipn2z4_reg" "u_logic_Ipn2z4_reg";
            "u_logic/Isi2z4_reg" "u_logic_Isi2z4_reg";
            "u_logic/It63z4_reg" "u_logic_It63z4_reg";
            "u_logic/Itw2z4_reg" "u_logic_Itw2z4_reg";
            "u_logic/Iua3z4_reg" "u_logic_Iua3z4_reg";
            "u_logic/Iwp2z4_reg" "u_logic_Iwp2z4_reg";
            "u_logic/Ixh3z4_reg" "u_logic_Ixh3z4_reg";
            "u_logic/Ixn2z4_reg" "u_logic_Ixn2z4_reg";
            "u_logic/Ixt2z4_reg" "u_logic_Ixt2z4_reg";
            "u_logic/J0l2z4_reg" "u_logic_J0l2z4_reg";
            "u_logic/J0n2z4_reg" "u_logic_J0n2z4_reg";
            "u_logic/J0v2z4_reg" "u_logic_J0v2z4_reg";
            "u_logic/J4x2z4_reg" "u_logic_J4x2z4_reg";
            "u_logic/J5i3z4_reg" "u_logic_J5i3z4_reg";
            "u_logic/J5m2z4_reg" "u_logic_J5m2z4_reg";
            "u_logic/J5o2z4_reg" "u_logic_J5o2z4_reg";
            "u_logic/J6i2z4_reg" "u_logic_J6i2z4_reg";
            "u_logic/J7b3z4_reg" "u_logic_J7b3z4_reg";
            "u_logic/J7q2z4_reg" "u_logic_J7q2z4_reg";
            "u_logic/J9d3z4_reg" "u_logic_J9d3z4_reg";
            "u_logic/J433z4_reg" "u_logic_J433z4_reg";
            "u_logic/J773z4_reg" "u_logic_J773z4_reg";
            "u_logic/Jbu2z4_reg" "u_logic_Jbu2z4_reg";
            "u_logic/Jca3z4_reg" "u_logic_Jca3z4_reg";
            "u_logic/Jcw2z4_reg" "u_logic_Jcw2z4_reg";
            "u_logic/Jex2z4_reg" "u_logic_Jex2z4_reg";
            "u_logic/Jhy2z4_reg" "u_logic_Jhy2z4_reg";
            "u_logic/Ji43z4_reg" "u_logic_Ji43z4_reg";
            "u_logic/Jje3z4_reg" "u_logic_Jje3z4_reg";
            "u_logic/Jkc3z4_reg" "u_logic_Jkc3z4_reg";
            "u_logic/Jky2z4_reg" "u_logic_Jky2z4_reg";
            "u_logic/Jl93z4_reg" "u_logic_Jl93z4_reg";
            "u_logic/Jlo2z4_reg" "u_logic_Jlo2z4_reg";
            "u_logic/Joi3z4_reg" "u_logic_Joi3z4_reg";
            "u_logic/Jpa3z4_reg" "u_logic_Jpa3z4_reg";
            "u_logic/Jq13z4_reg" "u_logic_Jq13z4_reg";
            "u_logic/Jsc3z4_reg" "u_logic_Jsc3z4_reg";
            "u_logic/Jux2z4_reg" "u_logic_Jux2z4_reg";
            "u_logic/Jw73z4_reg" "u_logic_Jw73z4_reg";
            "u_logic/Jw83z4_reg" "u_logic_Jw83z4_reg";
            "u_logic/Jw93z4_reg" "u_logic_Jw93z4_reg";
            "u_logic/Jwf3z4_reg" "u_logic_Jwf3z4_reg";
            "u_logic/Jxs2z4_reg" "u_logic_Jxs2z4_reg";
            "u_logic/K0u2z4_reg" "u_logic_K0u2z4_reg";
            "u_logic/K1z2z4_reg" "u_logic_K1z2z4_reg";
            "u_logic/K2k2z4_reg" "u_logic_K2k2z4_reg";
            "u_logic/K3l2z4_reg" "u_logic_K3l2z4_reg";
            "u_logic/K6y2z4_reg" "u_logic_K6y2z4_reg";
            "u_logic/K7g3z4_reg" "u_logic_K7g3z4_reg";
            "u_logic/K7s2z4_reg" "u_logic_K7s2z4_reg";
            "u_logic/K9z2z4_reg" "u_logic_K9z2z4_reg";
            "u_logic/K103z4_reg" "u_logic_K103z4_reg";
            "u_logic/K423z4_reg" "u_logic_K423z4_reg";
            "u_logic/Ka83z4_reg" "u_logic_Ka83z4_reg";
            "u_logic/Ka93z4_reg" "u_logic_Ka93z4_reg";
            "u_logic/Kaf3z4_reg" "u_logic_Kaf3z4_reg";
            "u_logic/Kc03z4_reg" "u_logic_Kc03z4_reg";
            "u_logic/Kev2z4_reg" "u_logic_Kev2z4_reg";
            "u_logic/Kf13z4_reg" "u_logic_Kf13z4_reg";
            "u_logic/Kf23z4_reg" "u_logic_Kf23z4_reg";
            "u_logic/Kfr2z4_reg" "u_logic_Kfr2z4_reg";
            "u_logic/Ki53z4_reg" "u_logic_Ki53z4_reg";
            "u_logic/Kig3z4_reg" "u_logic_Kig3z4_reg";
            "u_logic/Kiq2z4_reg" "u_logic_Kiq2z4_reg";
            "u_logic/Kjk2z4_reg" "u_logic_Kjk2z4_reg";
            "u_logic/Kkb3z4_reg" "u_logic_Kkb3z4_reg";
            "u_logic/Knz2z4_reg" "u_logic_Knz2z4_reg";
            "u_logic/Koj2z4_reg" "u_logic_Koj2z4_reg";
            "u_logic/Kop2z4_reg" "u_logic_Kop2z4_reg";
            "u_logic/Ksm2z4_reg" "u_logic_Ksm2z4_reg";
            "u_logic/Kss2z4_reg" "u_logic_Kss2z4_reg";
            "u_logic/Kt23z4_reg" "u_logic_Kt23z4_reg";
            "u_logic/Kt33z4_reg" "u_logic_Kt33z4_reg";
            "u_logic/Kt43z4_reg" "u_logic_Kt43z4_reg";
            "u_logic/Kw63z4_reg" "u_logic_Kw63z4_reg";
            "u_logic/Kwo2z4_reg" "u_logic_Kwo2z4_reg";
            "u_logic/Kxe3z4_reg" "u_logic_Kxe3z4_reg";
            "u_logic/Kyi2z4_reg" "u_logic_Kyi2z4_reg";
            "u_logic/Kzf3z4_reg" "u_logic_Kzf3z4_reg";
            "u_logic/L7a3z4_reg" "u_logic_L7a3z4_reg";
            "u_logic/L7p2z4_reg" "u_logic_L7p2z4_reg";
            "u_logic/L8m2z4_reg" "u_logic_L8m2z4_reg";
            "u_logic/L8t2z4_reg" "u_logic_L8t2z4_reg";
            "u_logic/L733z4_reg" "u_logic_L733z4_reg";
            "u_logic/L753z4_reg" "u_logic_L753z4_reg";
            "u_logic/L763z4_reg" "u_logic_L763z4_reg";
            "u_logic/Lbn2z4_reg" "u_logic_Lbn2z4_reg";
            "u_logic/Ldf3z4_reg" "u_logic_Ldf3z4_reg";
            "u_logic/Lee3z4_reg" "u_logic_Lee3z4_reg";
            "u_logic/Lgi3z4_reg" "u_logic_Lgi3z4_reg";
            "u_logic/Lhd3z4_reg" "u_logic_Lhd3z4_reg";
            "u_logic/Ll63z4_reg" "u_logic_Ll63z4_reg";
            "u_logic/Ll73z4_reg" "u_logic_Ll73z4_reg";
            "u_logic/Ll83z4_reg" "u_logic_Ll83z4_reg";
            "u_logic/Llq2z4_reg" "u_logic_Llq2z4_reg";
            "u_logic/Lns2z4_reg" "u_logic_Lns2z4_reg";
            "u_logic/Lny2z4_reg" "u_logic_Lny2z4_reg";
            "u_logic/Lph3z4_reg" "u_logic_Lph3z4_reg";
            "u_logic/Lpt2z4_reg" "u_logic_Lpt2z4_reg";
            "u_logic/Lpu2z4_reg" "u_logic_Lpu2z4_reg";
            "u_logic/Lpv2z4_reg" "u_logic_Lpv2z4_reg";
            "u_logic/Lq03z4_reg" "u_logic_Lq03z4_reg";
            "u_logic/Lqr2z4_reg" "u_logic_Lqr2z4_reg";
            "u_logic/Lrx2z4_reg" "u_logic_Lrx2z4_reg";
            "u_logic/Lsd3z4_reg" "u_logic_Lsd3z4_reg";
            "u_logic/Ltg3z4_reg" "u_logic_Ltg3z4_reg";
            "u_logic/Lul2z4_reg" "u_logic_Lul2z4_reg";
            "u_logic/Lw53z4_reg" "u_logic_Lw53z4_reg";
            "u_logic/Lz93z4_reg" "u_logic_Lz93z4_reg";
            "u_logic/M0i3z4_reg" "u_logic_M0i3z4_reg";
            "u_logic/M1j2z4_reg" "u_logic_M1j2z4_reg";
            "u_logic/M2b3z4_reg" "u_logic_M2b3z4_reg";
            "u_logic/M3e3z4_reg" "u_logic_M3e3z4_reg";
            "u_logic/M3u2z4_reg" "u_logic_M3u2z4_reg";
            "u_logic/M4j2z4_reg" "u_logic_M4j2z4_reg";
            "u_logic/M5f3z4_reg" "u_logic_M5f3z4_reg";
            "u_logic/M9y2z4_reg" "u_logic_M9y2z4_reg";
            "u_logic/M413z4_reg" "u_logic_M413z4_reg";
            "u_logic/M743z4_reg" "u_logic_M743z4_reg";
            "u_logic/Mbt2z4_reg" "u_logic_Mbt2z4_reg";
            "u_logic/Mcc3z4_reg" "u_logic_Mcc3z4_reg";
            "u_logic/Mcz2z4_reg" "u_logic_Mcz2z4_reg";
            "u_logic/Md93z4_reg" "u_logic_Md93z4_reg";
            "u_logic/Mfw2z4_reg" "u_logic_Mfw2z4_reg";
            "u_logic/Mhn2z4_reg" "u_logic_Mhn2z4_reg";
            "u_logic/Mi13z4_reg" "u_logic_Mi13z4_reg";
            "u_logic/Mi23z4_reg" "u_logic_Mi23z4_reg";
            "u_logic/Mi33z4_reg" "u_logic_Mi33z4_reg";
            "u_logic/Mis2z4_reg" "u_logic_Mis2z4_reg";
            "u_logic/Mjl2z4_reg" "u_logic_Mjl2z4_reg";
            "u_logic/Mka3z4_reg" "u_logic_Mka3z4_reg";
            "u_logic/Mof3z4_reg" "u_logic_Mof3z4_reg";
            "u_logic/Mt13z4_reg" "u_logic_Mt13z4_reg";
            "u_logic/Mvi2z4_reg" "u_logic_Mvi2z4_reg";
            "u_logic/Mvm2z4_reg" "u_logic_Mvm2z4_reg";
            "u_logic/Mww2z4_reg" "u_logic_Mww2z4_reg";
            "u_logic/Mz63z4_reg" "u_logic_Mz63z4_reg";
            "u_logic/Mzp2z4_reg" "u_logic_Mzp2z4_reg";
            "u_logic/N3n2z4_reg" "u_logic_N3n2z4_reg";
            "u_logic/N3v2z4_reg" "u_logic_N3v2z4_reg";
            "u_logic/N7c3z4_reg" "u_logic_N7c3z4_reg";
            "u_logic/N8i3z4_reg" "u_logic_N8i3z4_reg";
            "u_logic/N8o2z4_reg" "u_logic_N8o2z4_reg";
            "u_logic/Na53z4_reg" "u_logic_Na53z4_reg";
            "u_logic/Na63z4_reg" "u_logic_Na63z4_reg";
            "u_logic/Na73z4_reg" "u_logic_Na73z4_reg";
            "u_logic/Nag3z4_reg" "u_logic_Nag3z4_reg";
            "u_logic/Naq2z4_reg" "u_logic_Naq2z4_reg";
            "u_logic/Nbm2z4_reg" "u_logic_Nbm2z4_reg";
            "u_logic/Nbx2z4_reg" "u_logic_Nbx2z4_reg";
            "u_logic/Nen2z4_reg" "u_logic_Nen2z4_reg";
            "u_logic/Neu2z4_reg" "u_logic_Neu2z4_reg";
            "u_logic/Nf03z4_reg" "u_logic_Nf03z4_reg";
            "u_logic/Nfb3z4_reg" "u_logic_Nfb3z4_reg";
            "u_logic/Nl43z4_reg" "u_logic_Nl43z4_reg";
            "u_logic/Nl53z4_reg" "u_logic_Nl53z4_reg";
            "u_logic/Nnc3z4_reg" "u_logic_Nnc3z4_reg";
            "u_logic/No93z4_reg" "u_logic_No93z4_reg";
            "u_logic/Noo2z4_reg" "u_logic_Noo2z4_reg";
            "u_logic/Nox2z4_reg" "u_logic_Nox2z4_reg";
            "u_logic/Npk2z4_reg" "u_logic_Npk2z4_reg";
            "u_logic/Nqy2z4_reg" "u_logic_Nqy2z4_reg";
            "u_logic/Nqz2z4_reg" "u_logic_Nqz2z4_reg";
            "u_logic/Nsk2z4_reg" "u_logic_Nsk2z4_reg";
            "u_logic/Nt03z4_reg" "u_logic_Nt03z4_reg";
            "u_logic/Nz73z4_reg" "u_logic_Nz73z4_reg";
            "u_logic/Nz83z4_reg" "u_logic_Nz83z4_reg";
            "u_logic/O0o2z4_reg" "u_logic_O0o2z4_reg";
            "u_logic/O2c3z4_reg" "u_logic_O2c3z4_reg";
            "u_logic/O2g3z4_reg" "u_logic_O2g3z4_reg";
            "u_logic/O5k2z4_reg" "u_logic_O5k2z4_reg";
            "u_logic/O5t2z4_reg" "u_logic_O5t2z4_reg";
            "u_logic/O403z4_reg" "u_logic_O403z4_reg";
            "u_logic/O723z4_reg" "u_logic_O723z4_reg";
            "u_logic/Oar2z4_reg" "u_logic_Oar2z4_reg";
            "u_logic/Oas2z4_reg" "u_logic_Oas2z4_reg";
            "u_logic/Od83z4_reg" "u_logic_Od83z4_reg";
            "u_logic/Ogo2z4_reg" "u_logic_Ogo2z4_reg";
            "u_logic/Ohh3z4_reg" "u_logic_Ohh3z4_reg";
            "u_logic/Ohv2z4_reg" "u_logic_Ohv2z4_reg";
            "u_logic/Oir2z4_reg" "u_logic_Oir2z4_reg";
            "u_logic/Oiw2z4_reg" "u_logic_Oiw2z4_reg";
            "u_logic/Okn2z4_reg" "u_logic_Okn2z4_reg";
            "u_logic/Olg3z4_reg" "u_logic_Olg3z4_reg";
            "u_logic/Omk2z4_reg" "u_logic_Omk2z4_reg";
            "u_logic/Orj2z4_reg" "u_logic_Orj2z4_reg";
            "u_logic/Otr2z4_reg" "u_logic_Otr2z4_reg";
            "u_logic/Ovc3z4_reg" "u_logic_Ovc3z4_reg";
            "u_logic/Ow13z4_reg" "u_logic_Ow13z4_reg";
            "u_logic/Ow23z4_reg" "u_logic_Ow23z4_reg";
            "u_logic/Ow33z4_reg" "u_logic_Ow33z4_reg";
            "u_logic/Ow43z4_reg" "u_logic_Ow43z4_reg";
            "u_logic/Owq2z4_reg" "u_logic_Owq2z4_reg";
            "u_logic/Ozo2z4_reg" "u_logic_Ozo2z4_reg";
            "u_logic/P2a3z4_reg" "u_logic_P2a3z4_reg";
            "u_logic/P9h3z4_reg" "u_logic_P9h3z4_reg";
            "u_logic/Pa33z4_reg" "u_logic_Pa33z4_reg";
            "u_logic/Pab3z4_reg" "u_logic_Pab3z4_reg";
            "u_logic/Pap2z4_reg" "u_logic_Pap2z4_reg";
            "u_logic/Pbl2z4_reg" "u_logic_Pbl2z4_reg";
            "u_logic/Pcd3z4_reg" "u_logic_Pcd3z4_reg";
            "u_logic/Pdi2z4_reg" "u_logic_Pdi2z4_reg";
            "u_logic/Pet2z4_reg" "u_logic_Pet2z4_reg";
            "u_logic/Pfz2z4_reg" "u_logic_Pfz2z4_reg";
            "u_logic/Pgf3z4_reg" "u_logic_Pgf3z4_reg";
            "u_logic/Plx2z4_reg" "u_logic_Plx2z4_reg";
            "u_logic/Po53z4_reg" "u_logic_Po53z4_reg";
            "u_logic/Po63z4_reg" "u_logic_Po63z4_reg";
            "u_logic/Po73z4_reg" "u_logic_Po73z4_reg";
            "u_logic/Po83z4_reg" "u_logic_Po83z4_reg";
            "u_logic/Poq2z4_reg" "u_logic_Poq2z4_reg";
            "u_logic/Psh3z4_reg" "u_logic_Psh3z4_reg";
            "u_logic/Psn2z4_reg" "u_logic_Psn2z4_reg";
            "u_logic/Pst2z4_reg" "u_logic_Pst2z4_reg";
            "u_logic/Psu2z4_reg" "u_logic_Psu2z4_reg";
            "u_logic/Psv2z4_reg" "u_logic_Psv2z4_reg";
            "u_logic/Pty2z4_reg" "u_logic_Pty2z4_reg";
            "u_logic/Pvd3z4_reg" "u_logic_Pvd3z4_reg";
            "u_logic/Pw03z4_reg" "u_logic_Pw03z4_reg";
            "u_logic/Pwg3z4_reg" "u_logic_Pwg3z4_reg";
            "u_logic/Pxb3z4_reg" "u_logic_Pxb3z4_reg";
            "u_logic/Pz53z4_reg" "u_logic_Pz53z4_reg";
            "u_logic/Q0f3z4_reg" "u_logic_Q0f3z4_reg";
            "u_logic/Q2q2z4_reg" "u_logic_Q2q2z4_reg";
            "u_logic/Q4h3z4_reg" "u_logic_Q4h3z4_reg";
            "u_logic/Q6e3z4_reg" "u_logic_Q6e3z4_reg";
            "u_logic/Q6l2z4_reg" "u_logic_Q6l2z4_reg";
            "u_logic/Q6u2z4_reg" "u_logic_Q6u2z4_reg";
            "u_logic/Q7j2z4_reg" "u_logic_Q7j2z4_reg";
            "u_logic/Q273z4_reg" "u_logic_Q273z4_reg";
            "u_logic/Q713z4_reg" "u_logic_Q713z4_reg";
            "u_logic/Qa43z4_reg" "u_logic_Qa43z4_reg";
            "u_logic/Qcy2z4_reg" "u_logic_Qcy2z4_reg";
            "u_logic/Qdj2z4_reg" "u_logic_Qdj2z4_reg";
            "u_logic/Qem2z4_reg" "u_logic_Qem2z4_reg";
            "u_logic/Qfa3z4_reg" "u_logic_Qfa3z4_reg";
            "u_logic/Qfc3z4_reg" "u_logic_Qfc3z4_reg";
            "u_logic/Qg93z4_reg" "u_logic_Qg93z4_reg";
            "u_logic/Qi03z4_reg" "u_logic_Qi03z4_reg";
            "u_logic/Qji3z4_reg" "u_logic_Qji3z4_reg";
            "u_logic/Ql13z4_reg" "u_logic_Ql13z4_reg";
            "u_logic/Ql23z4_reg" "u_logic_Ql23z4_reg";
            "u_logic/Ql33z4_reg" "u_logic_Ql33z4_reg";
            "u_logic/Qlw2z4_reg" "u_logic_Qlw2z4_reg";
            "u_logic/Qml2z4_reg" "u_logic_Qml2z4_reg";
            "u_logic/Qnn2z4_reg" "u_logic_Qnn2z4_reg";
            "u_logic/Qrf3z4_reg" "u_logic_Qrf3z4_reg";
            "u_logic/Qrp2z4_reg" "u_logic_Qrp2z4_reg";
            "u_logic/Qsb3z4_reg" "u_logic_Qsb3z4_reg";
            "u_logic/Qwr2z4_reg" "u_logic_Qwr2z4_reg";
            "u_logic/Qxa3z4_reg" "u_logic_Qxa3z4_reg";
            "u_logic/Qyc3z4_reg" "u_logic_Qyc3z4_reg";
            "u_logic/Qz33z4_reg" "u_logic_Qz33z4_reg";
            "u_logic/Qz43z4_reg" "u_logic_Qz43z4_reg";
            "u_logic/Qzq2z4_reg" "u_logic_Qzq2z4_reg";
            "u_logic/Qzw2z4_reg" "u_logic_Qzw2z4_reg";
            "u_logic/R0t2z4_reg" "u_logic_R0t2z4_reg";
            "u_logic/R1w2z4_reg" "u_logic_R1w2z4_reg";
            "u_logic/R6n2z4_reg" "u_logic_R6n2z4_reg";
            "u_logic/R6v2z4_reg" "u_logic_R6v2z4_reg";
            "u_logic/R8x2z4_reg" "u_logic_R8x2z4_reg";
            "u_logic/R283z4_reg" "u_logic_R283z4_reg";
            "u_logic/R293z4_reg" "u_logic_R293z4_reg";
            "u_logic/Rbi3z4_reg" "u_logic_Rbi3z4_reg";
            "u_logic/Rbo2z4_reg" "u_logic_Rbo2z4_reg";
            "u_logic/Rd53z4_reg" "u_logic_Rd53z4_reg";
            "u_logic/Rd63z4_reg" "u_logic_Rd63z4_reg";
            "u_logic/Rd73z4_reg" "u_logic_Rd73z4_reg";
            "u_logic/Rdg3z4_reg" "u_logic_Rdg3z4_reg";
            "u_logic/Rdq2z4_reg" "u_logic_Rdq2z4_reg";
            "u_logic/Rds2z4_reg" "u_logic_Rds2z4_reg";
            "u_logic/Rek2z4_reg" "u_logic_Rek2z4_reg";
            "u_logic/Rhi2z4_reg" "u_logic_Rhi2z4_reg";
            "u_logic/Rht2z4_reg" "u_logic_Rht2z4_reg";
            "u_logic/Rhu2z4_reg" "u_logic_Rhu2z4_reg";
            "u_logic/Rix2z4_reg" "u_logic_Rix2z4_reg";
            "u_logic/Rkd3z4_reg" "u_logic_Rkd3z4_reg";
            "u_logic/Rnb3z4_reg" "u_logic_Rnb3z4_reg";
            "u_logic/Rni2z4_reg" "u_logic_Rni2z4_reg";
            "u_logic/Ro43z4_reg" "u_logic_Ro43z4_reg";
            "u_logic/Rpe3z4_reg" "u_logic_Rpe3z4_reg";
            "u_logic/Rr73z4_reg" "u_logic_Rr73z4_reg";
            "u_logic/Rr83z4_reg" "u_logic_Rr83z4_reg";
            "u_logic/Rr93z4_reg" "u_logic_Rr93z4_reg";
            "u_logic/Rro2z4_reg" "u_logic_Rro2z4_reg";
            "u_logic/Rsa3z4_reg" "u_logic_Rsa3z4_reg";
            "u_logic/Rtz2z4_reg" "u_logic_Rtz2z4_reg";
            "u_logic/Ruj2z4_reg" "u_logic_Ruj2z4_reg";
            "u_logic/Rvu2z4_reg" "u_logic_Rvu2z4_reg";
            "u_logic/Rvv2z4_reg" "u_logic_Rvv2z4_reg";
            "u_logic/Rxl2z4_reg" "u_logic_Rxl2z4_reg";
            "u_logic/Rym2z4_reg" "u_logic_Rym2z4_reg";
            "u_logic/Rz13z4_reg" "u_logic_Rz13z4_reg";
            "u_logic/S2p2z4_reg" "u_logic_S2p2z4_reg";
            "u_logic/S2r2z4_reg" "u_logic_S2r2z4_reg";
            "u_logic/S3i3z4_reg" "u_logic_S3i3z4_reg";
            "u_logic/S4w2z4_reg" "u_logic_S4w2z4_reg";
            "u_logic/S5b3z4_reg" "u_logic_S5b3z4_reg";
            "u_logic/S8k2z4_reg" "u_logic_S8k2z4_reg";
            "u_logic/S703z4_reg" "u_logic_S703z4_reg";
            "u_logic/Sa13z4_reg" "u_logic_Sa13z4_reg";
            "u_logic/Sa23z4_reg" "u_logic_Sa23z4_reg";
            "u_logic/Sd43z4_reg" "u_logic_Sd43z4_reg";
            "u_logic/Sg83z4_reg" "u_logic_Sg83z4_reg";
            "u_logic/Sgj2z4_reg" "u_logic_Sgj2z4_reg";
            "u_logic/Sgp2z4_reg" "u_logic_Sgp2z4_reg";
            "u_logic/She3z4_reg" "u_logic_She3z4_reg";
            "u_logic/Sjj2z4_reg" "u_logic_Sjj2z4_reg";
            "u_logic/Skh3z4_reg" "u_logic_Skh3z4_reg";
            "u_logic/Skm2z4_reg" "u_logic_Skm2z4_reg";
            "u_logic/Skv2z4_reg" "u_logic_Skv2z4_reg";
            "u_logic/Sl03z4_reg" "u_logic_Sl03z4_reg";
            "u_logic/Slr2z4_reg" "u_logic_Slr2z4_reg";
            "u_logic/Snd3z4_reg" "u_logic_Snd3z4_reg";
            "u_logic/Sog3z4_reg" "u_logic_Sog3z4_reg";
            "u_logic/Sow2z4_reg" "u_logic_Sow2z4_reg";
            "u_logic/Spl2z4_reg" "u_logic_Spl2z4_reg";
            "u_logic/Sr53z4_reg" "u_logic_Sr53z4_reg";
            "u_logic/Svk2z4_reg" "u_logic_Svk2z4_reg";
            "u_logic/Svs2z4_reg" "u_logic_Svs2z4_reg";
            "u_logic/Swy2z4_reg" "u_logic_Swy2z4_reg";
            "u_logic/Sz23z4_reg" "u_logic_Sz23z4_reg";
            "u_logic/Szr2z4_reg" "u_logic_Szr2z4_reg";
            "u_logic/T0m2z4_reg" "u_logic_T0m2z4_reg";
            "u_logic/T1d3z4_reg" "u_logic_T1d3z4_reg";
            "u_logic/T1y2z4_reg" "u_logic_T1y2z4_reg";
            "u_logic/T5g3z4_reg" "u_logic_T5g3z4_reg";
            "u_logic/T7d3z4_reg" "u_logic_T7d3z4_reg";
            "u_logic/T8f3z4_reg" "u_logic_T8f3z4_reg";
            "u_logic/T9v2z4_reg" "u_logic_T9v2z4_reg";
            "u_logic/T243z4_reg" "u_logic_T243z4_reg";
            "u_logic/T253z4_reg" "u_logic_T253z4_reg";
            "u_logic/T263z4_reg" "u_logic_T263z4_reg";
            "u_logic/T583z4_reg" "u_logic_T583z4_reg";
            "u_logic/Taa3z4_reg" "u_logic_Taa3z4_reg";
            "u_logic/Tch3z4_reg" "u_logic_Tch3z4_reg";
            "u_logic/Td33z4_reg" "u_logic_Td33z4_reg";
            "u_logic/Tdp2z4_reg" "u_logic_Tdp2z4_reg";
            "u_logic/Tel2z4_reg" "u_logic_Tel2z4_reg";
            "u_logic/Thm2z4_reg" "u_logic_Thm2z4_reg";
            "u_logic/Tib3z4_reg" "u_logic_Tib3z4_reg";
            "u_logic/Tiz2z4_reg" "u_logic_Tiz2z4_reg";
            "u_logic/Tjf3z4_reg" "u_logic_Tjf3z4_reg";
            "u_logic/Tki2z4_reg" "u_logic_Tki2z4_reg";
            "u_logic/Tme3z4_reg" "u_logic_Tme3z4_reg";
            "u_logic/Tna3z4_reg" "u_logic_Tna3z4_reg";
            "u_logic/To23z4_reg" "u_logic_To23z4_reg";
            "u_logic/To33z4_reg" "u_logic_To33z4_reg";
            "u_logic/Tqc3z4_reg" "u_logic_Tqc3z4_reg";
            "u_logic/Tqs2z4_reg" "u_logic_Tqs2z4_reg";
            "u_logic/Tr63z4_reg" "u_logic_Tr63z4_reg";
            "u_logic/Trq2z4_reg" "u_logic_Trq2z4_reg";
            "u_logic/Tse3z4_reg" "u_logic_Tse3z4_reg";
            "u_logic/Tvh3z4_reg" "u_logic_Tvh3z4_reg";
            "u_logic/Tvn2z4_reg" "u_logic_Tvn2z4_reg";
            "u_logic/Tvt2z4_reg" "u_logic_Tvt2z4_reg";
            "u_logic/Twz2z4_reg" "u_logic_Twz2z4_reg";
            "u_logic/Txj2z4_reg" "u_logic_Txj2z4_reg";
            "u_logic/Tyd3z4_reg" "u_logic_Tyd3z4_reg";
            "u_logic/Tyx2z4_reg" "u_logic_Tyx2z4_reg";
            "u_logic/Tz03z4_reg" "u_logic_Tz03z4_reg";
            "u_logic/Tzg3z4_reg" "u_logic_Tzg3z4_reg";
            "u_logic/U2s2z4_reg" "u_logic_U2s2z4_reg";
            "u_logic/U2x2z4_reg" "u_logic_U2x2z4_reg";
            "u_logic/U4z2z4_reg" "u_logic_U4z2z4_reg";
            "u_logic/U5a3z4_reg" "u_logic_U5a3z4_reg";
            "u_logic/U5q2z4_reg" "u_logic_U5q2z4_reg";
            "u_logic/U5r2z4_reg" "u_logic_U5r2z4_reg";
            "u_logic/U5x2z4_reg" "u_logic_U5x2z4_reg";
            "u_logic/U7w2z4_reg" "u_logic_U7w2z4_reg";
            "u_logic/U9e3z4_reg" "u_logic_U9e3z4_reg";
            "u_logic/U9u2z4_reg" "u_logic_U9u2z4_reg";
            "u_logic/U573z4_reg" "u_logic_U573z4_reg";
            "u_logic/U593z4_reg" "u_logic_U593z4_reg";
            "u_logic/Uaj2z4_reg" "u_logic_Uaj2z4_reg";
            "u_logic/Uei3z4_reg" "u_logic_Uei3z4_reg";
            "u_logic/Ufx2z4_reg" "u_logic_Ufx2z4_reg";
            "u_logic/Ufy2z4_reg" "u_logic_Ufy2z4_reg";
            "u_logic/Ug43z4_reg" "u_logic_Ug43z4_reg";
            "u_logic/Ug63z4_reg" "u_logic_Ug63z4_reg";
            "u_logic/Ug73z4_reg" "u_logic_Ug73z4_reg";
            "u_logic/Uic3z4_reg" "u_logic_Uic3z4_reg";
            "u_logic/Uj93z4_reg" "u_logic_Uj93z4_reg";
            "u_logic/Ujo2z4_reg" "u_logic_Ujo2z4_reg";
            "u_logic/Ujp2z4_reg" "u_logic_Ujp2z4_reg";
            "u_logic/Ukt2z4_reg" "u_logic_Ukt2z4_reg";
            "u_logic/Uku2z4_reg" "u_logic_Uku2z4_reg";
            "u_logic/Uls2z4_reg" "u_logic_Uls2z4_reg";
            "u_logic/Umi3z4_reg" "u_logic_Umi3z4_reg";
            "u_logic/Unm2z4_reg" "u_logic_Unm2z4_reg";
            "u_logic/Uo13z4_reg" "u_logic_Uo13z4_reg";
            "u_logic/Uqi2z4_reg" "u_logic_Uqi2z4_reg";
            "u_logic/Urw2z4_reg" "u_logic_Urw2z4_reg";
            "u_logic/Usl2z4_reg" "u_logic_Usl2z4_reg";
            "u_logic/Uu73z4_reg" "u_logic_Uu73z4_reg";
            "u_logic/Uu83z4_reg" "u_logic_Uu83z4_reg";
            "u_logic/Uuf3z4_reg" "u_logic_Uuf3z4_reg";
            "u_logic/Uup2z4_reg" "u_logic_Uup2z4_reg";
            "u_logic/Uyu2z4_reg" "u_logic_Uyu2z4_reg";
            "u_logic/Uyv2z4_reg" "u_logic_Uyv2z4_reg";
            "u_logic/V0k2z4_reg" "u_logic_V0k2z4_reg";
            "u_logic/V1l2z4_reg" "u_logic_V1l2z4_reg";
            "u_logic/V3m2z4_reg" "u_logic_V3m2z4_reg";
            "u_logic/V3o2z4_reg" "u_logic_V3o2z4_reg";
            "u_logic/V4d3z4_reg" "u_logic_V4d3z4_reg";
            "u_logic/V223z4_reg" "u_logic_V223z4_reg";
            "u_logic/V233z4_reg" "u_logic_V233z4_reg";
            "u_logic/V883z4_reg" "u_logic_V883z4_reg";
            "u_logic/Vac3z4_reg" "u_logic_Vac3z4_reg";
            "u_logic/Vaw2z4_reg" "u_logic_Vaw2z4_reg";
            "u_logic/Vcv2z4_reg" "u_logic_Vcv2z4_reg";
            "u_logic/Vdr2z4_reg" "u_logic_Vdr2z4_reg";
            "u_logic/Vfd3z4_reg" "u_logic_Vfd3z4_reg";
            "u_logic/Vg53z4_reg" "u_logic_Vg53z4_reg";
            "u_logic/Vgg3z4_reg" "u_logic_Vgg3z4_reg";
            "u_logic/Vgq2z4_reg" "u_logic_Vgq2z4_reg";
            "u_logic/Vgs2z4_reg" "u_logic_Vgs2z4_reg";
            "u_logic/Vhk2z4_reg" "u_logic_Vhk2z4_reg";
            "u_logic/Viy2z4_reg" "u_logic_Viy2z4_reg";
            "u_logic/Vmj2z4_reg" "u_logic_Vmj2z4_reg";
            "u_logic/Vr23z4_reg" "u_logic_Vr23z4_reg";
            "u_logic/Vr33z4_reg" "u_logic_Vr33z4_reg";
            "u_logic/Vr43z4_reg" "u_logic_Vr43z4_reg";
            "u_logic/Vu93z4_reg" "u_logic_Vu93z4_reg";
            "u_logic/Vuo2z4_reg" "u_logic_Vuo2z4_reg";
            "u_logic/Vve3z4_reg" "u_logic_Vve3z4_reg";
            "u_logic/Vvx2z4_reg" "u_logic_Vvx2z4_reg";
            "u_logic/Vxf3z4_reg" "u_logic_Vxf3z4_reg";
            "u_logic/Vzz2z4_reg" "u_logic_Vzz2z4_reg";
            "u_logic/W0b3z4_reg" "u_logic_W0b3z4_reg";
            "u_logic/W3f3z4_reg" "u_logic_W3f3z4_reg";
            "u_logic/W4y2z4_reg" "u_logic_W4y2z4_reg";
            "u_logic/W5c3z4_reg" "u_logic_W5c3z4_reg";
            "u_logic/W5p2z4_reg" "u_logic_W5p2z4_reg";
            "u_logic/W5s2z4_reg" "u_logic_W5s2z4_reg";
            "u_logic/W7z2z4_reg" "u_logic_W7z2z4_reg";
            "u_logic/W8r2z4_reg" "u_logic_W8r2z4_reg";
            "u_logic/W893z4_reg" "u_logic_W893z4_reg";
            "u_logic/Wa03z4_reg" "u_logic_Wa03z4_reg";
            "u_logic/Wai2z4_reg" "u_logic_Wai2z4_reg";
            "u_logic/Wbf3z4_reg" "u_logic_Wbf3z4_reg";
            "u_logic/Wbk2z4_reg" "u_logic_Wbk2z4_reg";
            "u_logic/Wce3z4_reg" "u_logic_Wce3z4_reg";
            "u_logic/Wd13z4_reg" "u_logic_Wd13z4_reg";
            "u_logic/Wd23z4_reg" "u_logic_Wd23z4_reg";
            "u_logic/Wia3z4_reg" "u_logic_Wia3z4_reg";
            "u_logic/Wj63z4_reg" "u_logic_Wj63z4_reg";
            "u_logic/Wj73z4_reg" "u_logic_Wj73z4_reg";
            "u_logic/Wj83z4_reg" "u_logic_Wj83z4_reg";
            "u_logic/Wlz2z4_reg" "u_logic_Wlz2z4_reg";
            "u_logic/Wmp2z4_reg" "u_logic_Wmp2z4_reg";
            "u_logic/Wnh3z4_reg" "u_logic_Wnh3z4_reg";
            "u_logic/Wnt2z4_reg" "u_logic_Wnt2z4_reg";
            "u_logic/Wnu2z4_reg" "u_logic_Wnu2z4_reg";
            "u_logic/Wnv2z4_reg" "u_logic_Wnv2z4_reg";
            "u_logic/Wo03z4_reg" "u_logic_Wo03z4_reg";
            "u_logic/Wor2z4_reg" "u_logic_Wor2z4_reg";
            "u_logic/Wqd3z4_reg" "u_logic_Wqd3z4_reg";
            "u_logic/Wqm2z4_reg" "u_logic_Wqm2z4_reg";
            "u_logic/Wrg3z4_reg" "u_logic_Wrg3z4_reg";
            "u_logic/Wu53z4_reg" "u_logic_Wu53z4_reg";
            "u_logic/Wu63z4_reg" "u_logic_Wu63z4_reg";
            "u_logic/Wuq2z4_reg" "u_logic_Wuq2z4_reg";
            "u_logic/Wxp2z4_reg" "u_logic_Wxp2z4_reg";
            "u_logic/Wyt2z4_reg" "u_logic_Wyt2z4_reg";
            "u_logic/Wzy2z4_reg" "u_logic_Wzy2z4_reg";
            "u_logic/X0c3z4_reg" "u_logic_X0c3z4_reg";
            "u_logic/X1e3z4_reg" "u_logic_X1e3z4_reg";
            "u_logic/X2j2z4_reg" "u_logic_X2j2z4_reg";
            "u_logic/X6m2z4_reg" "u_logic_X6m2z4_reg";
            "u_logic/X9n2z4_reg" "u_logic_X9n2z4_reg";
            "u_logic/X213z4_reg" "u_logic_X213z4_reg";
            "u_logic/X533z4_reg" "u_logic_X533z4_reg";
            "u_logic/X543z4_reg" "u_logic_X543z4_reg";
            "u_logic/X553z4_reg" "u_logic_X553z4_reg";
            "u_logic/X563z4_reg" "u_logic_X563z4_reg";
            "u_logic/Xdb3z4_reg" "u_logic_Xdb3z4_reg";
            "u_logic/Xeo2z4_reg" "u_logic_Xeo2z4_reg";
            "u_logic/Xg33z4_reg" "u_logic_Xg33z4_reg";
            "u_logic/Xhl2z4_reg" "u_logic_Xhl2z4_reg";
            "u_logic/Xly2z4_reg" "u_logic_Xly2z4_reg";
            "u_logic/Xmf3z4_reg" "u_logic_Xmf3z4_reg";
            "u_logic/Xsx2z4_reg" "u_logic_Xsx2z4_reg";
            "u_logic/Xti2z4_reg" "u_logic_Xti2z4_reg";
            "u_logic/Xuw2z4_reg" "u_logic_Xuw2z4_reg";
            "u_logic/Xx93z4_reg" "u_logic_Xx93z4_reg";
            "u_logic/Xyh3z4_reg" "u_logic_Xyh3z4_reg";
            "u_logic/Xyk2z4_reg" "u_logic_Xyk2z4_reg";
            "u_logic/Xyn2z4_reg" "u_logic_Xyn2z4_reg";
            "u_logic/Y1n2z4_reg" "u_logic_Y1n2z4_reg";
            "u_logic/Y1u2z4_reg" "u_logic_Y1u2z4_reg";
            "u_logic/Y1v2z4_reg" "u_logic_Y1v2z4_reg";
            "u_logic/Y6i3z4_reg" "u_logic_Y6i3z4_reg";
            "u_logic/Y6o2z4_reg" "u_logic_Y6o2z4_reg";
            "u_logic/Y6t2z4_reg" "u_logic_Y6t2z4_reg";
            "u_logic/Y7y2z4_reg" "u_logic_Y7y2z4_reg";
            "u_logic/Y8q2z4_reg" "u_logic_Y8q2z4_reg";
            "u_logic/Y9l2z4_reg" "u_logic_Y9l2z4_reg";
            "u_logic/Y9t2z4_reg" "u_logic_Y9t2z4_reg";
            "u_logic/Y873z4_reg" "u_logic_Y873z4_reg";
            "u_logic/Yaz2z4_reg" "u_logic_Yaz2z4_reg";
            "u_logic/Yb93z4_reg" "u_logic_Yb93z4_reg";
            "u_logic/Ycu2z4_reg" "u_logic_Ycu2z4_reg";
            "u_logic/Ycx2z4_reg" "u_logic_Ycx2z4_reg";
            "u_logic/Yd03z4_reg" "u_logic_Yd03z4_reg";
            "u_logic/Ydw2z4_reg" "u_logic_Ydw2z4_reg";
            "u_logic/Yfn2z4_reg" "u_logic_Yfn2z4_reg";
            "u_logic/Yg13z4_reg" "u_logic_Yg13z4_reg";
            "u_logic/Yg23z4_reg" "u_logic_Yg23z4_reg";
            "u_logic/Yj43z4_reg" "u_logic_Yj43z4_reg";
            "u_logic/Ylc3z4_reg" "u_logic_Ylc3z4_reg";
            "u_logic/Ym93z4_reg" "u_logic_Ym93z4_reg";
            "u_logic/Ymo2z4_reg" "u_logic_Ymo2z4_reg";
            "u_logic/Yoz2z4_reg" "u_logic_Yoz2z4_reg";
            "u_logic/Yr13z4_reg" "u_logic_Yr13z4_reg";
            "u_logic/Ytm2z4_reg" "u_logic_Ytm2z4_reg";
            "u_logic/Yvb3z4_reg" "u_logic_Yvb3z4_reg";
            "u_logic/Ywi2z4_reg" "u_logic_Ywi2z4_reg";
            "u_logic/Yx63z4_reg" "u_logic_Yx63z4_reg";
            "u_logic/Yx73z4_reg" "u_logic_Yx73z4_reg";
            "u_logic/Yx83z4_reg" "u_logic_Yx83z4_reg";
            "u_logic/Yzi2z4_reg" "u_logic_Yzi2z4_reg";
            "u_logic/Z0g3z4_reg" "u_logic_Z0g3z4_reg";
            "u_logic/Z2h3z4_reg" "u_logic_Z2h3z4_reg";
            "u_logic/Z3k2z4_reg" "u_logic_Z3k2z4_reg";
            "u_logic/Z4l2z4_reg" "u_logic_Z4l2z4_reg";
            "u_logic/Z7i2z4_reg" "u_logic_Z7i2z4_reg";
            "u_logic/Z8b3z4_reg" "u_logic_Z8b3z4_reg";
            "u_logic/Z8s2z4_reg" "u_logic_Z8s2z4_reg";
            "u_logic/Z203z4_reg" "u_logic_Z203z4_reg";
            "u_logic/Z523z4_reg" "u_logic_Z523z4_reg";
            "u_logic/Z853z4_reg" "u_logic_Z853z4_reg";
            "u_logic/Z863z4_reg" "u_logic_Z863z4_reg";
            "u_logic/Zad3z4_reg" "u_logic_Zad3z4_reg";
            "u_logic/Zb83z4_reg" "u_logic_Zb83z4_reg";
            "u_logic/Zcn2z4_reg" "u_logic_Zcn2z4_reg";
            "u_logic/Zei2z4_reg" "u_logic_Zei2z4_reg";
            "u_logic/Zfh3z4_reg" "u_logic_Zfh3z4_reg";
            "u_logic/Zfv2z4_reg" "u_logic_Zfv2z4_reg";
            "u_logic/Zgr2z4_reg" "u_logic_Zgr2z4_reg";
            "u_logic/Zj53z4_reg" "u_logic_Zj53z4_reg";
            "u_logic/Zjg3z4_reg" "u_logic_Zjg3z4_reg";
            "u_logic/Zjq2z4_reg" "u_logic_Zjq2z4_reg";
            "u_logic/Zkk2z4_reg" "u_logic_Zkk2z4_reg";
            "u_logic/Zoy2z4_reg" "u_logic_Zoy2z4_reg";
            "u_logic/Zpj2z4_reg" "u_logic_Zpj2z4_reg";
            "u_logic/Zpx2z4_reg" "u_logic_Zpx2z4_reg";
            "u_logic/Zqb3z4_reg" "u_logic_Zqb3z4_reg";
            "u_logic/Zr03z4_reg" "u_logic_Zr03z4_reg";
            "u_logic/Ztc3z4_reg" "u_logic_Ztc3z4_reg";
            "u_logic/Zu23z4_reg" "u_logic_Zu23z4_reg";
            "u_logic/Zu33z4_reg" "u_logic_Zu33z4_reg";
            "u_logic/Zu43z4_reg" "u_logic_Zu43z4_reg";
            "u_logic/Zva3z4_reg" "u_logic_Zva3z4_reg";
            "u_logic/Zxo2z4_reg" "u_logic_Zxo2z4_reg";
            "u_logic/Ypi3z4_reg" "u_logic_Ypi3z4_reg";
        }
    }
}
Environment "CORTEXM0DS" {
    CTL  {
    }
    CTL all_dft_user {
        TestMode ForInheritOnly;
        Internal {
            "HCLK" {
                DataType ScanMasterClock MasterClock {
                    ActiveState ForceUp;
                }
            }
            "HRESETn" {
                DataType Reset {
                    ActiveState ForceDown;
                }
            }
        }
    }
    CTL all_dft_protocol {
        TestMode ForInheritOnly;
        Inherit all_dft_user;
        DomainReferences {
            SignalGroups all_dft_protocol;
            Procedures all_dft_protocol;
            MacroDefs all_dft_protocol;
        }
    }
    CTL all_dft {
        TestMode ForInheritOnly;
        Inherit all_dft_protocol;
        Internal {
            "test_se" {
                CaptureClock "HCLK" {
                    LeadingEdge;
                }
            }
        }
    }
    CTL Internal_scan_user {
        TestMode ForInheritOnly;
        Inherit all_dft;
        Internal {
            "test_se" {
                CaptureClock "HCLK" {
                    LeadingEdge;
                }
            }
        }
    }
    CTL Internal_scan_protocol {
        TestMode ForInheritOnly;
        Inherit Internal_scan_user;
        Internal {
            "test_se" {
                CaptureClock "HCLK" {
                    LeadingEdge;
                }
            }
        }
    }
    CTL Internal_scan {
        TestMode InternalTest;
        Focus Top {
        }
        Inherit Internal_scan_protocol;
        DomainReferences {
            SignalGroups Internal_scan;
            ScanStructures Internal_scan;
            MacroDefs Internal_scan;
            Procedures Internal_scan;
        }
        Internal {
            "HCLK" {
                DataType ScanMasterClock MasterClock;
            }
            "HBURST[0]" {
                DataType Constant {
                    ExpectState ExpectLow;
                }
            }
            "HBURST[1]" {
                DataType Constant {
                    ExpectState ExpectLow;
                }
            }
            "HBURST[2]" {
                DataType Constant {
                    ExpectState ExpectLow;
                }
            }
            "HMASTLOCK" {
                DataType Constant {
                    ExpectState ExpectLow;
                }
            }
            "HPROT[1]" {
                DataType Constant {
                    ExpectState ExpectHigh;
                }
            }
            "HSIZE[2]" {
                DataType Constant {
                    ExpectState ExpectLow;
                }
            }
            "HTRANS[0]" {
                DataType Constant {
                    ExpectState ExpectLow;
                }
            }
            "SYSRESETREQ" {
                LaunchClock "HCLK" {
                    LeadingEdge;
                }
                DataType ScanDataOut {
                    ScanDataType Internal;
                }
                ScanStyle MultiplexedData;
            }
            "test_si" {
                IsConnected In {
                    Signal "u_logic/A4t2z4_reg/SI";
                }
                CaptureClock "HCLK" {
                    LeadingEdge;
                }
                DataType ScanDataIn {
                    ScanDataType Internal;
                }
                ScanStyle MultiplexedData;
            }
            "test_se" {
                CaptureClock "HCLK" {
                    LeadingEdge;
                }
                DataType ScanEnable {
                    ActiveState ForceUp;
                }
            }
        }
    }
    CTL Mission_mode_user {
        TestMode ForInheritOnly;
        Inherit all_dft;
        Internal {
            "test_se" {
                CaptureClock "HCLK" {
                    LeadingEdge;
                }
            }
        }
    }
    CTL Mission_mode_protocol {
        TestMode ForInheritOnly;
        Inherit Mission_mode_user;
        Internal {
            "test_se" {
                CaptureClock "HCLK" {
                    LeadingEdge;
                }
            }
        }
    }
    CTL Mission_mode {
        TestMode Normal;
        Inherit Mission_mode_protocol;
        DomainReferences {
            MacroDefs Mission_mode;
            Procedures Mission_mode;
        }
        Internal {
            "HCLK" {
                DataType Functional;
            }
            "HRDATA[0]" {
                DataType Functional;
            }
            "HRDATA[10]" {
                DataType Functional;
            }
            "HRDATA[11]" {
                DataType Functional;
            }
            "HRDATA[12]" {
                DataType Functional;
            }
            "HRDATA[13]" {
                DataType Functional;
            }
            "HRDATA[14]" {
                DataType Functional;
            }
            "HRDATA[15]" {
                DataType Functional;
            }
            "HRDATA[16]" {
                DataType Functional;
            }
            "HRDATA[17]" {
                DataType Functional;
            }
            "HRDATA[18]" {
                DataType Functional;
            }
            "HRDATA[19]" {
                DataType Functional;
            }
            "HRDATA[1]" {
                DataType Functional;
            }
            "HRDATA[20]" {
                DataType Functional;
            }
            "HRDATA[21]" {
                DataType Functional;
            }
            "HRDATA[22]" {
                DataType Functional;
            }
            "HRDATA[23]" {
                DataType Functional;
            }
            "HRDATA[24]" {
                DataType Functional;
            }
            "HRDATA[25]" {
                DataType Functional;
            }
            "HRDATA[26]" {
                DataType Functional;
            }
            "HRDATA[27]" {
                DataType Functional;
            }
            "HRDATA[28]" {
                DataType Functional;
            }
            "HRDATA[29]" {
                DataType Functional;
            }
            "HRDATA[2]" {
                DataType Functional;
            }
            "HRDATA[30]" {
                DataType Functional;
            }
            "HRDATA[31]" {
                DataType Functional;
            }
            "HRDATA[3]" {
                DataType Functional;
            }
            "HRDATA[4]" {
                DataType Functional;
            }
            "HRDATA[5]" {
                DataType Functional;
            }
            "HRDATA[6]" {
                DataType Functional;
            }
            "HRDATA[7]" {
                DataType Functional;
            }
            "HRDATA[8]" {
                DataType Functional;
            }
            "HRDATA[9]" {
                DataType Functional;
            }
            "HREADY" {
                DataType Functional;
            }
            "HRESETn" {
                DataType Functional;
            }
            "HRESP" {
                DataType Functional;
            }
            "IRQ[0]" {
                DataType Functional;
            }
            "IRQ[10]" {
                DataType Functional;
            }
            "IRQ[11]" {
                DataType Functional;
            }
            "IRQ[12]" {
                DataType Functional;
            }
            "IRQ[13]" {
                DataType Functional;
            }
            "IRQ[14]" {
                DataType Functional;
            }
            "IRQ[15]" {
                DataType Functional;
            }
            "IRQ[1]" {
                DataType Functional;
            }
            "IRQ[2]" {
                DataType Functional;
            }
            "IRQ[3]" {
                DataType Functional;
            }
            "IRQ[4]" {
                DataType Functional;
            }
            "IRQ[5]" {
                DataType Functional;
            }
            "IRQ[6]" {
                DataType Functional;
            }
            "IRQ[7]" {
                DataType Functional;
            }
            "IRQ[8]" {
                DataType Functional;
            }
            "IRQ[9]" {
                DataType Functional;
            }
            "NMI" {
                DataType Functional;
            }
            "RXEV" {
                DataType Functional;
            }
            "HADDR[0]" {
                DataType Functional;
            }
            "HADDR[10]" {
                DataType Functional;
            }
            "HADDR[11]" {
                DataType Functional;
            }
            "HADDR[12]" {
                DataType Functional;
            }
            "HADDR[13]" {
                DataType Functional;
            }
            "HADDR[14]" {
                DataType Functional;
            }
            "HADDR[15]" {
                DataType Functional;
            }
            "HADDR[16]" {
                DataType Functional;
            }
            "HADDR[17]" {
                DataType Functional;
            }
            "HADDR[18]" {
                DataType Functional;
            }
            "HADDR[19]" {
                DataType Functional;
            }
            "HADDR[1]" {
                DataType Functional;
            }
            "HADDR[20]" {
                DataType Functional;
            }
            "HADDR[21]" {
                DataType Functional;
            }
            "HADDR[22]" {
                DataType Functional;
            }
            "HADDR[23]" {
                DataType Functional;
            }
            "HADDR[24]" {
                DataType Functional;
            }
            "HADDR[25]" {
                DataType Functional;
            }
            "HADDR[26]" {
                DataType Functional;
            }
            "HADDR[27]" {
                DataType Functional;
            }
            "HADDR[28]" {
                DataType Functional;
            }
            "HADDR[29]" {
                DataType Functional;
            }
            "HADDR[2]" {
                DataType Functional;
            }
            "HADDR[30]" {
                DataType Functional;
            }
            "HADDR[31]" {
                DataType Functional;
            }
            "HADDR[3]" {
                DataType Functional;
            }
            "HADDR[4]" {
                DataType Functional;
            }
            "HADDR[5]" {
                DataType Functional;
            }
            "HADDR[6]" {
                DataType Functional;
            }
            "HADDR[7]" {
                DataType Functional;
            }
            "HADDR[8]" {
                DataType Functional;
            }
            "HADDR[9]" {
                DataType Functional;
            }
            "HBURST[0]" {
                DataType Constant Functional {
                    ExpectState ExpectLow;
                }
            }
            "HBURST[1]" {
                DataType Constant Functional {
                    ExpectState ExpectLow;
                }
            }
            "HBURST[2]" {
                DataType Constant Functional {
                    ExpectState ExpectLow;
                }
            }
            "HMASTLOCK" {
                DataType Constant Functional {
                    ExpectState ExpectLow;
                }
            }
            "HPROT[0]" {
                DataType Functional;
            }
            "HPROT[1]" {
                DataType Constant Functional {
                    ExpectState ExpectHigh;
                }
            }
            "HPROT[2]" {
                DataType Functional;
            }
            "HPROT[3]" {
                DataType Functional;
            }
            "HSIZE[0]" {
                DataType Functional;
            }
            "HSIZE[1]" {
                DataType Functional;
            }
            "HSIZE[2]" {
                DataType Constant Functional {
                    ExpectState ExpectLow;
                }
            }
            "HTRANS[0]" {
                DataType Constant Functional {
                    ExpectState ExpectLow;
                }
            }
            "HTRANS[1]" {
                DataType Functional;
            }
            "HWDATA[0]" {
                DataType Functional;
            }
            "HWDATA[10]" {
                DataType Functional;
            }
            "HWDATA[11]" {
                DataType Functional;
            }
            "HWDATA[12]" {
                DataType Functional;
            }
            "HWDATA[13]" {
                DataType Functional;
            }
            "HWDATA[14]" {
                DataType Functional;
            }
            "HWDATA[15]" {
                DataType Functional;
            }
            "HWDATA[16]" {
                DataType Functional;
            }
            "HWDATA[17]" {
                DataType Functional;
            }
            "HWDATA[18]" {
                DataType Functional;
            }
            "HWDATA[19]" {
                DataType Functional;
            }
            "HWDATA[1]" {
                DataType Functional;
            }
            "HWDATA[20]" {
                DataType Functional;
            }
            "HWDATA[21]" {
                DataType Functional;
            }
            "HWDATA[22]" {
                DataType Functional;
            }
            "HWDATA[23]" {
                DataType Functional;
            }
            "HWDATA[24]" {
                DataType Functional;
            }
            "HWDATA[25]" {
                DataType Functional;
            }
            "HWDATA[26]" {
                DataType Functional;
            }
            "HWDATA[27]" {
                DataType Functional;
            }
            "HWDATA[28]" {
                DataType Functional;
            }
            "HWDATA[29]" {
                DataType Functional;
            }
            "HWDATA[2]" {
                DataType Functional;
            }
            "HWDATA[30]" {
                DataType Functional;
            }
            "HWDATA[31]" {
                DataType Functional;
            }
            "HWDATA[3]" {
                DataType Functional;
            }
            "HWDATA[4]" {
                DataType Functional;
            }
            "HWDATA[5]" {
                DataType Functional;
            }
            "HWDATA[6]" {
                DataType Functional;
            }
            "HWDATA[7]" {
                DataType Functional;
            }
            "HWDATA[8]" {
                DataType Functional;
            }
            "HWDATA[9]" {
                DataType Functional;
            }
            "HWRITE" {
                DataType Functional;
            }
            "LOCKUP" {
                DataType Functional;
            }
            "SLEEPING" {
                DataType Functional;
            }
            "SYSRESETREQ" {
                DataType Functional;
            }
            "TXEV" {
                DataType Functional;
            }
            "test_si" {
                DataType Functional;
            }
            "test_se" {
                CaptureClock "HCLK" {
                    LeadingEdge;
                }
                DataType Functional;
            }
        }
    }
}
Environment dftSpec {
    CTL  {
    }
    CTL all_dft {
        TestMode ForInheritOnly;
    }
    CTL Internal_scan {
        TestMode InternalTest;
        Inherit all_dft;
    }
    CTL Mission_mode {
        TestMode InternalTest;
        Inherit all_dft;
    }
}

