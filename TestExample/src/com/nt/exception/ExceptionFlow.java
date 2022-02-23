package com.nt.exception;

import java.io.FileNotFoundException;
import java.io.PrintWriter;

public class ExceptionFlow{

	public static void m1() throws InterruptedException {
		Thread.sleep(2000);
		System.out.println("Hi");
	}
	
	public static void main(String[] args) {
		//m1();
		try {
			PrintWriter pw=new PrintWriter("a.txt");
		} catch (FileNotFoundException e1) {
			
			e1.printStackTrace();
		}
		try {
			System.out.println("Statement1");
			System.out.println("Statement2");
			System.out.println(10/0);
			System.out.println("Statement 4");
		}
		catch(ArithmeticException e) {
			System.out.println("Statement 5");
			throw e;
		}
        System.out.println("Statement 6");
	}

}
