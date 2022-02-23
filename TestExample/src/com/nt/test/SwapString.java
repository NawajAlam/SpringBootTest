package com.nt.test;

import java.util.ArrayList;
import java.util.List;

public class SwapString {
	public static void main(String[] args) {
		String comp="companyi";
		char[] ch=comp.toCharArray();
		char[] first=new char[ch.length];
		List list=new ArrayList();
		//char[] last=new char[4];
		
		for(int i=ch.length/2;i<ch.length;i++) {
			System.out.println(ch[i]);
			list.add(ch[i]);
		}
		for(int i=0;i<ch.length/2;i++) {
			System.out.println(ch[i]);
			//list.add(ch[i]);
		}
		System.out.println("--------");
		System.out.println(list);
	}
}
