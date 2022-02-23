package com.nt.test;

public class RandomTest {

	public static void main(String[] args) {
		int min = 100000;  
        int max = 999999; 
       int number=(int)(Math.random()*(max-min+1)+min);
       System.out.println(number);

	}

}
