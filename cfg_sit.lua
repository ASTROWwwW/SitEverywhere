SeatConfig = {}

SeatConfig.Debug = true

SeatConfig.Target = {
    Label = "S'asseoir",
    Icon = "fa-solid fa-chair",
    Distance = 1.5,
    StandKey = 73
}

SeatConfig.WallTarget = {
    Label = "Se poser contre le mur",
    Icon = "fa-solid fa-person",
    Distance = 2.0
}

SeatConfig.Behaviour = {
    SitScenarios = {
        "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER",
        "PROP_HUMAN_SEAT_CHAIR",
        "PROP_HUMAN_SEAT_CHAIR_UPRIGHT"
    },
    WallScenarios = {
        "WORLD_HUMAN_LEANING",
        "WORLD_HUMAN_STAND_IMPATIENT",
        "WORLD_HUMAN_SMOKING"
    },
    DisableControls = true,
    AllowAllObjects = false
}

SeatConfig.Wall = {
    MaxDistance = 1.5,
    OffsetFromWall = 0.35
}

SeatConfig.DefaultOffset = {
    Position = vector3(0.0, -0.35, 0.0),
    HeadingOffset = 180.0
}

SeatConfig.Chairs = {
    [`prop_chair_01a`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`prop_chair_01b`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`prop_chair_02`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`prop_chair_03`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`prop_chair_04a`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`prop_chair_04b`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`prop_chair_05`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`prop_chair_06`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`prop_chair_07`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`prop_chair_08`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`prop_chair_09`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`prop_chair_10`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },

    [`v_corp_offchair`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`prop_sol_chair`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`p_soloffchair_s`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },

    [`prop_chair_patio_01`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`prop_chair_patio_02`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },

    [`prop_folding_chair_01`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`prop_folding_chair_02`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },

    [`prop_plasticchair_01`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`prop_plasticchair_02`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`prop_plastic_chair_01`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`prop_plastic_chair_02`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`prop_rock_chair_01`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },

    [`prop_yaught_chair_01`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },

    [`prop_skid_chair_03`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },

    [`prop_flipchair_01`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },

    [`p_clb_officechair_s`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`p_dinechair_01_s`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`p_folding_chair_01_s`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`p_ilev_p_easychair_s`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },

    [`prop_wheelchair_01_s`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`v_ilev_chair02_ped`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },

    [`v_ilev_m_dinechair`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },


    [`prop_wicker_chair_01`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },


    [`prop_off_chair_01`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`prop_off_chair_03`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`prop_off_chair_04`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`prop_off_chair_04_s`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },

    [`v_corp_bk_chair3`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },

    [`v_res_m_dinechair`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`v_res_tre_chair`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`v_res_fh_easychair`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },

    [`v_ilev_hd_chair`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`v_ilev_p_easychair`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`v_ilev_leath_chr`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },

    [`hei_prop_hei_skid_chair`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`hei_heist_stn_chair`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`hei_prop_heist_off_chair`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`hei_prop_yah_chair_02`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`hei_prop_yah_chair_03`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },

    [`xm_prop_lab_barrier01`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },

    [`p_yacht_chair_01_s`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`p_armchair_01_s`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },

    [`prop_skid_chair_01`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`prop_skid_chair_02`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },

    [`apa_mp_h_din_chair_04`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`apa_mp_h_din_chair_08`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`apa_mp_h_din_chair_09`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },

    [`apa_mp_h_stn_chairarm_01`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`apa_mp_h_stn_chairarm_02`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`apa_mp_h_stn_chairarm_09`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },

    [`bkr_prop_clubhouse_chair_01`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`bkr_prop_clubhouse_chair_03`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },

    [`bkr_prop_weed_chair_01a`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },

    [`gr_prop_gr_chair01a`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`gr_prop_gr_chair02`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },

    [`prop_armchair_01`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`v_res_fa_chair01`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`v_res_fa_chair02`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },

    [`v_res_d_highchair`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`apa_mp_h_stn_chairstrip_03`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },

    [`v_res_fh_barcchair`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`v_res_fh_dineeamesa`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`v_res_fh_dineeamesb`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`v_res_fh_dineeamesc`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`v_res_fh_kitnstool`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`v_res_fh_singleseat`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },

    [`v_res_jarmchair`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`v_res_j_dinechair`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`v_res_j_stool`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },

    [`v_res_mbchair`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },

    [`v_res_m_armchair`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },

    [`v_res_study_chair`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`v_res_trev_framechair`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`v_res_tre_officechair`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`v_res_tre_stool`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`v_res_tre_stool_leather`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`v_res_tre_stool_scuz`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },

    [`v_med_p_deskchair`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`v_med_p_easychair`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`v_med_whickerchair1`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },

    [`prop_direct_chair_01`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`prop_direct_chair_02`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },

    [`prop_yacht_lounger`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`prop_yacht_seat_01`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`prop_yacht_seat_02`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`prop_yacht_seat_03`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },

    [`v_ret_chair_white`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`v_ret_chair`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`v_ret_ta_stool`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },

    [`prop_cs_office_chair`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },

    [`apa_mp_h_yacht_armchair_01`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },

    [`v_club_barchair`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`v_club_stagechair`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`v_club_officechair`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },

    [`prop_bar_stool_01`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`apa_mp_h_yacht_stool_01`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },

    [`apa_mp_h_stn_chairarm_12`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`apa_mp_h_stn_chairstool_12`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },

    [`v_res_mp_stripchair`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`v_res_m_l_chair1`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },

    [`prop_ld_farm_chair01`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },
    [`v_res_d_armchair`] = { Position = vector3(0.0, -0.0, 0.45), HeadingOffset = 180.0 },

    [`prop_bench_01a`] = {
        Seats = {
            vector3(-0.40, 0.0, 0.45),
            vector3(0.0, 0.0, 0.45),
            vector3(0.40, 0.0, 0.45)
        },
        HeadingOffset = 180.0
    },

    [`prop_bench_02`] = {
        Seats = {
            vector3(-0.40, 0.0, 0.45),
            vector3(0.0, 0.0, 0.45),
            vector3(0.40, 0.0, 0.45)
        },
        HeadingOffset = 180.0
    },

    [`prop_bench_03`] = {
        Seats = {
            vector3(-0.40, 0.0, 0.45),
            vector3(0.0, 0.0, 0.45),
            vector3(0.40, 0.0, 0.45)
        },
        HeadingOffset = 180.0
    },

    [`prop_bench_04`] = {
        Seats = {
            vector3(-0.40, 0.0, 0.45),
            vector3(0.0, 0.0, 0.45),
            vector3(0.40, 0.0, 0.45)
        },
        HeadingOffset = 180.0
    },

    [`prop_bench_05`] = {
        Seats = {
            vector3(-0.40, 0.0, 0.45),
            vector3(0.0, 0.0, 0.45),
            vector3(0.40, 0.0, 0.45)
        },
        HeadingOffset = 180.0
    },

    [`prop_bench_06`] = {
        Seats = {
            vector3(-0.40, 0.0, 0.45),
            vector3(0.0, 0.0, 0.45),
            vector3(0.40, 0.0, 0.45)
        },
        HeadingOffset = 180.0
    },

    [`prop_bench_07`] = {
        Seats = {
            vector3(-0.40, 0.0, 0.45),
            vector3(0.0, 0.0, 0.45),
            vector3(0.40, 0.0, 0.45)
        },
        HeadingOffset = 180.0
    },

    [`prop_bench_08`] = {
        Seats = {
            vector3(-0.40, 0.0, 0.45),
            vector3(0.0, 0.0, 0.45),
            vector3(0.40, 0.0, 0.45)
        },
        HeadingOffset = 180.0
    },

    [`prop_bench_09`] = {
        Seats = {
            vector3(-0.40, 0.0, 0.45),
            vector3(0.0, 0.0, 0.45),
            vector3(0.40, 0.0, 0.45)
        },
        HeadingOffset = 180.0
    },

    [`prop_bench_10`] = {
        Seats = {
            vector3(-0.40, 0.0, 0.45),
            vector3(0.0, 0.0, 0.45),
            vector3(0.40, 0.0, 0.45)
        },
        HeadingOffset = 180.0
    },

    [`v_ind_lfgb_bench`] = {
        Seats = {
            vector3(-0.40, 0.0, 0.45),
            vector3(0.0, 0.0, 0.45),
            vector3(0.40, 0.0, 0.45)
        },
        HeadingOffset = 180.0
    },

    [`v_serv_bs_metalbchair`] = {
        Seats = {
            vector3(-0.40, 0.0, 0.45),
            vector3(0.0, 0.0, 0.45),
            vector3(0.40, 0.0, 0.45)
        },
        HeadingOffset = 180.0
    },

    [`prop_fib_3b_bench`] = {
        Seats = {
            vector3(-0.40, 0.0, 0.45),
            vector3(0.0, 0.0, 0.45),
            vector3(0.40, 0.0, 0.45)
        },
        HeadingOffset = 180.0
    },
    [`v_res_mp_sofa`] = {
        Seats = {
            vector3(-0.30, -0.20, 0.45),
            vector3(0.30, -0.20, 0.45)
        },
        HeadingOffset = 180.0
    },

    [`v_res_mp_stripsofa`] = {
        Seats = {
            vector3(-0.30, -0.20, 0.45),
            vector3(0.30, -0.20, 0.45)
        },
        HeadingOffset = 180.0
    },

    [`v_res_d_sofa`] = {
        Seats = {
            vector3(-0.35, -0.15, 0.45),
            vector3(0.35, -0.15, 0.45)
        },
        HeadingOffset = 180.0
    },

    [`v_res_j_sofa`] = {
        Seats = {
            vector3(-0.30, -0.15, 0.45),
            vector3(0.30, -0.15, 0.45)
        },
        HeadingOffset = 180.0
    },
    [`v_res_tre_sofa`] = {
        Seats = {
            vector3(-0.50, -0.20, 0.45),
            vector3(0.0, -0.20, 0.45),
            vector3(0.50, -0.20, 0.45)
        },
        HeadingOffset = 180.0
    },

    [`v_res_fh_sofa`] = {
        Seats = {
            vector3(-0.50, -0.20, 0.45),
            vector3(0.0, -0.20, 0.45),
            vector3(0.50, -0.20, 0.45)
        },
        HeadingOffset = 180.0
    },

    [`v_res_k_sofa`] = {
        Seats = {
            vector3(-0.50, -0.15, 0.45),
            vector3(0.0, -0.15, 0.45),
            vector3(0.50, -0.15, 0.45)
        },
        HeadingOffset = 180.0
    },
    [`apa_mp_h_stn_sofa_01`] = {
        Seats = {
            vector3(-0.55, -0.25, 0.45),
            vector3(0.0, -0.25, 0.45),
            vector3(0.55, -0.25, 0.45)
        },
        HeadingOffset = 180.0
    },

    [`apa_mp_h_stn_sofa2seat_02`] = {
        Seats = {
            vector3(-0.30, -0.25, 0.45),
            vector3(0.30, -0.25, 0.45)
        },
        HeadingOffset = 180.0
    },

    [`apa_mp_h_stn_sofa_daybed_01`] = {
        Seats = {
            vector3(-0.45, -0.10, 0.45),
            vector3(0.0, -0.10, 0.45),
            vector3(0.45, -0.10, 0.45)
        },
        HeadingOffset = 180.0
    },
    [`v_res_mp_stripta`] = {
        Seats = {
            vector3(-0.70, -0.20, 0.45),
            vector3(-0.30, -0.20, 0.45),
            vector3(0.10, -0.20, 0.45),
            vector3(0.50, -0.20, 0.45)
        },
        HeadingOffset = 180.0
    },

    [`apa_mp_h_lit_sofa_02`] = {
        Seats = {
            vector3(-0.70, -0.10, 0.45),
            vector3(-0.30, -0.10, 0.45),
            vector3(0.10, -0.10, 0.45),
            vector3(0.50, -0.10, 0.45)
        },
        HeadingOffset = 180.0
    },

    [`apa_mp_h_armchair_04`] = { Position = vector3(0.0, -0.10, 0.45), HeadingOffset = 180.0 },
    [`apa_mp_h_armchair_05`] = { Position = vector3(0.0, -0.10, 0.45), HeadingOffset = 180.0 }
}
