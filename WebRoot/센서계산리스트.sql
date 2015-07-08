select s.SENSOR_ID, 
		       to_char(s.X_LOC,'9990') as X_LOC, 
		       to_char(s.Y_LOC,'9990') as Y_LOC, 
		       to_char(s.Z_LOC,'9990') as Z_LOC, 
		       s.LOC_NM, 
		       to_char(s.H_CRI_LMT,'9990.0000') as H_CRI_LMT, 
		       to_char(s.L_CRI_LMT,'9990.0000') as L_CRI_LMT, 
		       to_char(s.H_MAJ_LMT,'9990.0000') as H_MAJ_LMT, 
		       to_char(s.L_MAJ_LMT,'9990.0000') as L_MAJ_LMT, 
		       to_char(s.EIGEN_VALUE,'9990.0000') as EIGEN_VALUE, 
		       to_char(s.BASE_VALUE,'9990.0000') as BASE_VALUE, 
		       to_char(s.GF_VALUE,'9990') as GF_VALUE, 
		       to_char(s.GL_VALUE,'9990') as GL_VALUE, 
		       to_char(s.CONVERT_UNIT,'0.999999') as CONVERT_UNIT, 
		       to_char(s.H_INST_RANGE_LMT,'9990.0000') as H_INST_RANGE_LMT, 
		       to_char(s.L_INST_RANGE_LMT,'9990.0000') as L_INST_RANGE_LMT, 
		       s.SENSOR_X_LOC, 
		       s.SENSOR_Y_LOC, 
		       s.SENSOR_TYPE_CD, 
		       (select COMMON_DET_NM from PPP_COMMON_DET_CODE where COMMON_CD = 'SENSORTYPE' and COMMON_DET_CD = s.SENSOR_TYPE_CD) as SENSOR_TYPE_NM, 
		       s.INST_ITEM_CD, 
		       (select INST_ITEM_NM from PPP_INST_ITEM where INST_ITEM_CD = s.INST_ITEM_CD) as INST_ITEM_NM, 
		       s.STRUCT_ID, 
		       s.STRUCT_COMP_ID, 
		       (select STRUCT_COMP_NM from PPP_STRUCT_COMP where STRUCT_COMP_ID = s.STRUCT_COMP_ID) as STRUCT_COMP_NM, 
		       s.DETECTOR_ID, 
		       s.CHANNEL_ID, 
		       s.REF_SENSOR_ID,
		       ROUND((case s.SENSOR_TYPE_CD when '1' then ((s.EIGEN_VALUE - s.BASE_VALUE) * s.GF_VALUE) 
		                                    when '2' then ((s.EIGEN_VALUE - s.BASE_VALUE) / (s.GF_VALUE * 0.001)) 
		                                    when '3' then ((s.EIGEN_VALUE - s.EIGEN_VALUE) / (s.GF_VALUE * 0.001)) + BASE_TEMP_VALUE 
		        end),6) as C_EIGEN_VALUE,
		       ROUND((case s.SENSOR_TYPE_CD when '1' then ((s.BASE_VALUE - s.BASE_VALUE) * s.GF_VALUE) 
		                                    when '2' then ((s.BASE_VALUE - s.BASE_VALUE) / (s.GF_VALUE * 0.001)) 
		                                    when '3' then ((s.BASE_VALUE - s.EIGEN_VALUE) / (s.GF_VALUE * 0.001)) + BASE_TEMP_VALUE 
		        end),6) as C_BASE_VALUE,
		       ROUND((case s.SENSOR_TYPE_CD when '1' then ((s.H_CRI_LMT - s.BASE_VALUE) * s.GF_VALUE) 
		                                    when '2' then ((s.H_CRI_LMT - s.BASE_VALUE) / (s.GF_VALUE * 0.001)) 
		                                    when '3' then ((s.H_CRI_LMT - s.EIGEN_VALUE) / (s.GF_VALUE * 0.001)) + BASE_TEMP_VALUE 
		        end),6) as C_H_CRI_LMT,
		       ROUND((case s.SENSOR_TYPE_CD when '1' then ((s.L_CRI_LMT - s.BASE_VALUE) * s.GF_VALUE) 
		                                    when '2' then ((s.L_CRI_LMT - s.BASE_VALUE) / (s.GF_VALUE * 0.001)) 
		                                    when '3' then ((s.L_CRI_LMT - s.EIGEN_VALUE) / (s.GF_VALUE * 0.001)) + BASE_TEMP_VALUE 
		        end),6) as C_L_CRI_LMT,
		       ROUND((case s.SENSOR_TYPE_CD when '1' then ((s.H_MAJ_LMT - s.BASE_VALUE) * s.GF_VALUE) 
		                                    when '2' then ((s.H_MAJ_LMT - s.BASE_VALUE) / (s.GF_VALUE * 0.001)) 
		                                    when '3' then ((s.H_MAJ_LMT - s.EIGEN_VALUE) / (s.GF_VALUE * 0.001)) + BASE_TEMP_VALUE 
		        end),6) as C_H_MAJ_LMT,
		       ROUND((case s.SENSOR_TYPE_CD when '1' then ((s.L_MAJ_LMT - s.BASE_VALUE) * s.GF_VALUE) 
		                                    when '2' then ((s.L_MAJ_LMT - s.BASE_VALUE) / (s.GF_VALUE * 0.001)) 
		                                    when '3' then ((s.L_MAJ_LMT - s.EIGEN_VALUE) / (s.GF_VALUE * 0.001)) + BASE_TEMP_VALUE 
		        end),6) as C_L_MAJ_LMT,
		       ROUND((case s.SENSOR_TYPE_CD when '1' then ((s.H_INST_RANGE_LMT - s.BASE_VALUE) * s.GF_VALUE) 
		                                    when '2' then ((s.H_INST_RANGE_LMT - s.BASE_VALUE) / (s.GF_VALUE * 0.001)) 
		                                    when '3' then ((s.H_INST_RANGE_LMT - s.EIGEN_VALUE) / (s.GF_VALUE * 0.001)) + BASE_TEMP_VALUE 
		        end),6) as C_H_INST_RANGE_LMT,
		       ROUND((case s.SENSOR_TYPE_CD when '1' then ((s.L_INST_RANGE_LMT - s.BASE_VALUE) * s.GF_VALUE) 
		                                    when '2' then ((s.L_INST_RANGE_LMT - s.BASE_VALUE) / (s.GF_VALUE * 0.001)) 
		                                    when '3' then ((s.L_INST_RANGE_LMT - s.EIGEN_VALUE) / (s.GF_VALUE * 0.001)) + BASE_TEMP_VALUE 
		        end),6) as C_L_INST_RANGE_LMT,
		        decode(SENSOR_TYPE_CD, '1','§¬', '2','¡Æ', '3','¡É', '') as unit
		  from PPP_SENSOR s
		 where s.STRUCT_ID = #struct_id#
		   and s.SENSOR_ID = #sensor_id#