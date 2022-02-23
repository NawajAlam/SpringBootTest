package com.nt.test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateTest {

	public static void main(String[] args) throws ParseException {
        Date d=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-yyyy");
		String format = sdf.format(d);
		System.out.println(format);
		
		String dt="22-02-2021";
		SimpleDateFormat sdf1=new SimpleDateFormat("dd-MM-yyyy");
		Date parse2 = sdf1.parse(dt);
		
		SimpleDateFormat sdf2=new SimpleDateFormat("dd/MMM/yy");
		
		String format2 = sdf2.format(parse2);
		
		System.out.println(format2);
	}

}
