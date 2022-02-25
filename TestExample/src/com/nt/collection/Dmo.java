package com.nt.collection;

import java.util.Arrays;	

public class Dmo {

	public static void main(String[] args) {
		Test test=new Test();
		int id=10;
		String sol="1000";
		
		Camera cam=new Camera();
		cam.setId(11);
		cam.setName("FZ");
		Photo p=new Photo();
		p.setId(id);
		p.setSol(sol);
		p.setCamera(cam);
	
		test.setPhoto(Arrays.asList(p));
        System.out.println(test);
	}

}
