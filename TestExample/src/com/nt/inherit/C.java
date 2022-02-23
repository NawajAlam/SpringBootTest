package com.nt.inherit;

public class C extends B{

	public void m3() {
		System.out.println("C.m3()");
	}
	public void mB(B b) {
		System.out.println("C.mB()");
		b.m2();
	}
}
