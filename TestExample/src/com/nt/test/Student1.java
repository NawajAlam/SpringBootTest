package com.nt.test;

class Student1 implements Comparable<Student1>{  
	int rollno;  
	String name;  
	int age;  
	Student1(int rollno,String name,int age){  
		this.rollno=rollno;  
		this.name=name;  
		this.age=age;  
	}

		public int compareTo(Student1 st){  
			if(rollno==st.rollno)  
				return 0;  
			else if(rollno>st.rollno)  
				return 1;  
			else  
				return -1;  

		}  

	}
