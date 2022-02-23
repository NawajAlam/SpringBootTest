package com.nt.collection;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class CollectionTest {


	public static void addData() {
		List list=new ArrayList<>();
		List list1=new ArrayList<>();
		List list2=new ArrayList<>();
		list.add("A");
		list.add("B");
		list1.add("aa");
		list1.add("bb");
		list1.add(list);
		list2.add("aaa");
		list2.add("bbb");
		list2.add(list1);
		Iterator itr=list2.iterator();
		while(itr.hasNext()) {
			System.out.println(itr.next());
		}
		System.out.println(list2);
	}

	public static void main(String[] args) {
		addData();
	}
}
