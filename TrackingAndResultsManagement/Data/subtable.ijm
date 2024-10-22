Time=Table.getColumn("POSITION_T");
Time = Array.slice(Time,3,lengthOf(Time));
Mean_Intensity=Table.getColumn("MEAN_INTENSITY_CH1");
Mean_Intensity = Array.slice(Mean_Intensity,3,lengthOf(Mean_Intensity));
Array.show("Time vs Intensity", Time, Mean_Intensity);
