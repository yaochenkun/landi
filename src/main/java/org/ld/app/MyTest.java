package org.ld.app;


import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.ld.utils.ExcelCell;
import org.ld.utils.ExcelHelper;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by ken on 2017/6/6.
 */
public class MyTest {

	public static void main(String[] args) throws InterruptedException {

//		List<ExcelCell> list = new ArrayList<ExcelCell>();
//		ExcelCell ec = new ExcelCell();
//		ec.setRow(1);
//		ec.setCol(2);
//		ec.setContent("yaochenkun");
//		list.add(ec);
//
//		ExcelCell ec1 = new ExcelCell();
//		ec1.setRow(2);
//		ec1.setCol(5);
//		ec1.setContent("44");
//		list.add(ec1);
//
//		ExcelHelper.write("excel/flightpicking.xlsx", list);
	ParentThread pt = new ParentThread();
	pt.start();




//	for(int i=0;i<10;i++){
//		st.setData(4);
//
//		while(st.getData() == 4) {
////			System.out.println("等待");
//		}
//		System.out.println(i);
//	}




	}

}
