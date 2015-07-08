select s.SENSOR_ID,
		       (case s.SENSOR_TYPE_CD when '1' then ((s.H_CRI_LMT - s.BASE_VALUE) * s.GF_VALUE) 
		                              when '2' then ((s.H_CRI_LMT - s.BASE_VALUE) / (s.GF_VALUE * 0.001)) 
		                              when '3' then ((s.H_CRI_LMT - s.EIGEN_VALUE) / (s.GF_VALUE * 0.001)) + BASE_TEMP_VALUE 
		        end) as H_CRI_LMT,
		       (case s.SENSOR_TYPE_CD when '1' then ((s.L_CRI_LMT - s.BASE_VALUE) * s.GF_VALUE) 
		                              when '2' then ((s.L_CRI_LMT - s.BASE_VALUE) / (s.GF_VALUE * 0.001)) 
		                              when '3' then ((s.L_CRI_LMT - s.EIGEN_VALUE) / (s.GF_VALUE * 0.001)) + BASE_TEMP_VALUE 
		        end) as L_CRI_LMT,
		       (case s.SENSOR_TYPE_CD when '1' then ((s.H_MAJ_LMT - s.BASE_VALUE) * s.GF_VALUE) 
		                              when '2' then ((s.H_MAJ_LMT - s.BASE_VALUE) / (s.GF_VALUE * 0.001)) 
		                              when '3' then ((s.H_MAJ_LMT - s.EIGEN_VALUE) / (s.GF_VALUE * 0.001)) + BASE_TEMP_VALUE 
		        end) as H_MAJ_LMT,
		       (case s.SENSOR_TYPE_CD when '1' then ((s.L_MAJ_LMT - s.BASE_VALUE) * s.GF_VALUE) 
		                              when '2' then ((s.L_MAJ_LMT - s.BASE_VALUE) / (s.GF_VALUE * 0.001)) 
		                              when '3' then ((s.L_MAJ_LMT - s.EIGEN_VALUE) / (s.GF_VALUE * 0.001)) + BASE_TEMP_VALUE 
		        end) as L_MAJ_LMT
		  from PPP_SENSOR s
		 where s.STRUCT_ID = #struct_id#
		   and s.SENSOR_ID = #sensor_id#