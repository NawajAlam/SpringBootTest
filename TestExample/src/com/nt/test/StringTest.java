package com.nt.test;

public class StringTest {

	public static void main(String[] args) {
		String s1=new String("nawaj");
		String s2=new String("nawaj");
		String s3="nawaj";
		System.out.println(s1.hashCode()+","+s2.hashCode()+","+s3.hashCode());
		System.out.println(s1==s3);
	    System.out.println("ToString " +s1.toString());
		System.out.println(s1.equals(s3));
		s1="alam";
	//	System.out.println(s2);
       // System.out.println(s1.equals(s3));
		StringBuffer sb1=new StringBuffer("nawaj1");
		StringBuffer sb2=new StringBuffer("nawaj1");
		System.out.println(sb1.hashCode()+","+sb2.hashCode());
		System.out.println(sb1.equals(sb2));
		//System.out.println("ToString "+sb1.toString());
	}

}
