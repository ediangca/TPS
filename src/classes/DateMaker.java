/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package classes;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Calendar;

/**
 *
 * @author wb2c0
 */
public class DateMaker {

    private static String date = new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
    private static LocalDate localDate = LocalDate.parse(date);
    private static Timestamp timestamp = java.sql.Timestamp.valueOf(localDate.atStartOfDay());

    public static Timestamp getTime() {
        return timestamp;
    }
}
