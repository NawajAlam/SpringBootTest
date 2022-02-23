package com.nt.exception;

public class ExceptionTest {

	public static void add() {
		int a=10;
		int b=0;

		try {
			int c=a/b;
			System.out.println(c);
		}
		catch (ArithmeticException e) {
			throw new ArithmeticException("Zero not allowed");
			//System.out.println(e.getMessage());
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}

	public static void main(String[] args)   {
		try {
			add();
		}catch(ArithmeticException ae) {
			System.out.println("Ex: "+ae.getMessage());
			try {
				Thread.sleep(2000);

			}catch(Exception e) {
				System.out.println(e.getMessage());
			}
			System.out.println("After Sleep");
			//System.exit(0);
		}
		finally {
			System.out.println("Finally Executed");
		}
	}

}
