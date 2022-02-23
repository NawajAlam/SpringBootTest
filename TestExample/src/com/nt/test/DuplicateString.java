package com.nt.test;

import java.util.ArrayList;
import java.util.List;

public class DuplicateString {

	public static void main(String[] args) {
		String s="ABCDEFAGHIJBKLMNO";
		List list=new ArrayList<>();
		char ch[]=s.toCharArray();
		for(int i=0;i<ch.length-1;i++) {
			for(int j=i+1;j<ch.length;j++) {
				if(ch[i]==ch[j]) {
					list.add(ch[j]);
					//s=s.replace(ch[i], 'Z');
					System.out.println(ch[i]);
				}
			}
		//System.out.println(ch[i]);
		}
		System.out.println(list);
		//System.out.println(s);
	}
}
