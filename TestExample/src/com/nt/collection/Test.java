package com.nt.collection;

import java.util.List;

public class Test {

	List<Photo> photo;

	public List<Photo> getPhoto() {
		return photo;
	}

	public void setPhoto(List<Photo> photo) {
		this.photo = photo;
	}

	@Override
	public String toString() {
		return "Test [photo=" + photo + "]";
	}
	
}
