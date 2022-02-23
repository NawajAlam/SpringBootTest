package com.nt.test;

public class Demo {

	public static void main(String[] args) {
		try {
			System.out.println("Hi");
			int a=10/0;
			System.out.println(a);
			System.out.println("End try");
		}catch (NumberFormatException  ne) {
			System.out.println(ne.getMessage());
		} 
		catch (Exception e) {
			System.out.println("Please "+e.getMessage());
		}
		System.out.println("End catch");

	}

}
