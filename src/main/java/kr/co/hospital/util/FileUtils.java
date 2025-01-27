package kr.co.hospital.util;

import java.io.File;
import java.io.FileNotFoundException;

import org.springframework.util.ResourceUtils;

// 자주 사용하는 메소드를 정의
public class FileUtils {
    
	// 경로와 파일명이 전달되면 파일명 중복체크를 하여
	// 중복되지 않는 파일명을 리턴해주는 메소드    파일명   ,  경로
	public static String getFileName(String fname,String str) throws Exception
	{
		File ff=new File(str);
		while(ff.exists())  // a1.jpg
		{
			String code=""; 
			for(int i=1;i<=4;i++)
			{
				int num=(int)(Math.random()*62);
				
				if(num>=0 && num<=9)
					num=num+48;  // num 48~57
				else if(num>=10 && num<=35)
					     num=num+55; //num 65~90
				     else
				    	 num=num+61; //num 97~122
				
				code=code+(char)num;	
			}                                   // code = abcd
			String[] imsi=fname.split("[.]");   // a.jpg  =>  [a] [jpg]
			String newFname=imsi[0]+code+"."+imsi[1];       // aabcd.jpg
			if(str.substring(0,str.lastIndexOf("/")).equals("C:\\springboot\\hospital\\target\\classes\\static\\admin\\programfile")) {
				str=ResourceUtils.getFile("classpath:static/admin/programfile").toPath().toString()+"/"+newFname;
			}else if(str.substring(0,str.lastIndexOf("/")).equals("C:\\springboot\\hospital\\target\\classes\\static\\client\\inquiryfile")) {
				str=ResourceUtils.getFile("classpath:static/client/inquiryfile").toPath().toString()+"/"+newFname;
			}
			ff=new File(str);
		}

		return str;
	}
}
