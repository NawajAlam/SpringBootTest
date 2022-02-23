package com.nt.test;

public class StringTest_02 {

	public static void main(String[] args) {
		String sub="a happy b happy c happy";
		String div[]=sub.split(" ");
		//int count=1;
		int count1=0;
		/*char[] ch=sub.toCharArray();
		for(int i=0;i<ch.length;i++) {
			System.out.println(ch[i]);
			if(ch[i]==' ') {
				count ++;
				
			}
			if(ch[i]=='h') {
				count1++;
			}
				
			
		}
		System.out.println("Total word "+count);
		System.out.println("TOtal H: "+count1);*/
		
		for(int i=0;i<div.length;i++) {
			if("happy".equals(div[i])) {
				System.out.println(div[i]);
				count1++;
			}
		}
		System.out.println(count1);
	}
}
