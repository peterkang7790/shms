package shms.common;
 
import java.util.Calendar;

public class MakeCalendar {

	public static String getDateString(Calendar day) {
            String str         = "" + day.get(Calendar.YEAR); // ³â;
            
            int thisMonth         = day.get(Calendar.MONTH) + 1; // ¿ù ( 0 ~ 11 )= 0;
            
            if ( thisMonth < 10 ) {
                    str += "0";
            }
            
            str += "" + thisMonth ;
            
            int thisDate         = day.get(Calendar.DATE) ; // ¿ù ( 0 ~ 11 )= 0;
            
            if ( thisDate < 10 ) {
                    str += "0";
            }
            
            str += "" + thisDate ;
            
            return str;
    }


    public static String getDayName(int day){
            String str = "";
            if ( day == 1 ) {
                    str = "Sun";       
            } else if ( day == 2 ) {
                    str = "Mon";
            } else if ( day == 3 ) {
                    str = "Tue"; 
            } else if ( day == 4 ) {
                    str = "Wed";
            } else if ( day == 5 ) {
                    str = "Thu";
            } else if ( day == 6 ) {
                    str = "Fri";
            } else if ( day == 7 ) {
                    str = "Sat";
            }
            return str;                        
    }


    public static int  getMonthNum(int month){
                    return month + 1 ;
    }
}





