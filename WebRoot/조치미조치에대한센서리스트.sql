SELECT
	     	 COUNT(SEN.SENSOR_ID),
             SEN.SENSOR_ID,
		     SEN.BASE_VALUE,
		     SEN.CHANNEL_ID,
		     (select CHANNEL_NM from PPP_CHANNEL where STRUCT_ID = SEN.STRUCT_ID and DETECTOR_ID = SEN.DETECTOR_ID and CHANNEL_ID = SEN.CHANNEL_ID) as CHANNEL_NM,
		     SEN.CONVERT_UNIT, 
		     SEN.DETECTOR_ID,
		     (select DETECTOR_NM from PPP_DETECTOR where STRUCT_ID = SEN.STRUCT_ID and DETECTOR_ID = SEN.DETECTOR_ID) as DETECTOR_NM,
		     SEN.EIGEN_VALUE,
		     SEN.GF_VALUE, 
       		 SEN.GL_VALUE,
		     SEN.H_CRI_LMT, 
		     SEN.H_MAJ_LMT,
		     SEN.H_INST_RANGE_LMT,
		     SEN.INST_ITEM_CD,
		     (select INST_ITEM_NM from PPP_INST_ITEM where INST_ITEM_CD = SEN.INST_ITEM_CD) as INST_ITEM_NM, 
             SEN.L_CRI_LMT, 
             SEN.L_MAJ_LMT, 
             SEN.L_INST_RANGE_LMT,
             SEN.LOC_NM,
             SEN.SENSOR_TYPE_CD,
             (select COMMON_DET_NM from PPP_COMMON_DET_CODE where COMMON_CD = 'SENSORTYPE' and COMMON_DET_CD = SEN.SENSOR_TYPE_CD) as SENSOR_TYPE_NM,
             SEN.X_LOC, 
                SEN.Y_LOC, 
                SEN.Z_LOC, 
             SEN.STRUCT_ID,
             SEN.REF_SENSOR_ID,
             SEN.STRUCT_COMP_ID,
             (select STRUCT_COMP_NM from PPP_STRUCT_COMP where STRUCT_COMP_ID = SEN.STRUCT_COMP_ID) as STRUCT_COMP_NM,
             SEN.REG_DT,
             SEN.BASE_TEMP_VALUE,
             SEN.SENSOR_X_LOC,
             SEN.SENSOR_Y_LOC,
             (case when TRO.TROUBLE_CLASS_CD = '1' then '위험' else '경고' end) AS MARKING_Y
        from PPP_SENSOR SEN, PPP_TROUBLE TRO
       where SEN.SENSOR_ID = TRO.SENSOR_ID(+) 
         and SEN.STRUCT_ID = 'ST001'
         GROUP BY SEN.BASE_VALUE,  SEN.CHANNEL_ID, SEN.SENSOR_ID,
		     SEN.CONVERT_UNIT, 
		     SEN.DETECTOR_ID,
		     SEN.EIGEN_VALUE,
		     SEN.GF_VALUE, 
       		 SEN.GL_VALUE,
		     SEN.H_CRI_LMT, 
		     SEN.H_MAJ_LMT,
		     SEN.H_INST_RANGE_LMT,
		     SEN.INST_ITEM_CD,
		     SEN.L_CRI_LMT, 
             SEN.L_MAJ_LMT, 
             SEN.L_INST_RANGE_LMT,
             SEN.LOC_NM,
             SEN.SENSOR_TYPE_CD,
             SEN.X_LOC, 
             SEN.Y_LOC, 
             SEN.Z_LOC, 
             SEN.STRUCT_ID,
             SEN.REF_SENSOR_ID,
             SEN.STRUCT_COMP_ID,
             SEN.REG_DT,
             SEN.BASE_TEMP_VALUE,
             SEN.SENSOR_X_LOC,
             SEN.SENSOR_Y_LOC, (case when TRO.TROUBLE_CLASS_CD = '1' then '위험' else '경고' end)
   
