package org.ld.utils;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.*;
import java.io.FileInputStream;
import java.util.List;

/**
 * Created by ken on 2017/6/6.
 * 对excel读取、写入的工具类
 */
public class ExcelHelper {


	//写入
	public synchronized static boolean write(String path, List<ExcelCell> excelCells){

		try {

			XSSFWorkbook workbook = read(path);
			XSSFSheet sheet = workbook.getSheetAt(0);
			if(sheet == null)
				sheet = workbook.createSheet("sheet0");

			//写入到内存
			for (ExcelCell ce : excelCells) {

				XSSFRow row = sheet.getRow(ce.getRow());
				if(row == null) row = sheet.createRow(ce.getRow());
				XSSFCell cell = row.getCell(ce.getCol());
				if(cell == null) cell = row.createCell(ce.getCol());
				cell.setCellValue(ce.getContent());
			}

			//写入到文件
			FileOutputStream out = null;
			try {
				out = new FileOutputStream(new File(path));
				//out = new FileOutputStream("c:/flightpicking.xlsx");
				workbook.write(out);
				out.close();
			} catch (FileNotFoundException e) {
				e.printStackTrace();
				return false;
			} catch (IOException e) {
				e.printStackTrace();
				return false;
			}

		} catch(Exception e){
			return false;
		}

		System.out.println("successfully wrote into an existed excel at " + path);
		return true;
	}


	//读取workbook
	public synchronized static XSSFWorkbook read(String path){

		//若在path下找到对应的excel
		XSSFWorkbook workbook = null;
		File file = new File(path);
		if(file != null && file.isFile() && file.exists()) { //已存在

			try {
				FileInputStream in = new FileInputStream(file);
				workbook = new XSSFWorkbook(in);
				in.close();
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}

			System.out.println("successfully opened an existed excel at" + path);
		}
		else { //若不存在创建新的

			//Create Blank workbook
			workbook = new XSSFWorkbook();
			//Create file system using specific name
			FileOutputStream out = null;
			try {
				out = new FileOutputStream( new File(path));
				workbook.write(out);
				out.close();
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}

			System.out.println("successfully created a new excel at" + path);
		}

		return workbook;
	}

	//复制excel
	public synchronized static void  copy(String src , String des) {
		File file1 = new File(src);
		File file2 = new File(des);

		if(!file1.exists()) return ;

		try {
			InputStream in = null;
			OutputStream out = null;
			try {
				in = new BufferedInputStream(new FileInputStream(file1), 1024);
				out = new BufferedOutputStream(new FileOutputStream(file2), 1024);
				byte[] buffer = new byte[1024];
				int len;
				while ((len = in.read(buffer)) != -1) {
					out.write(buffer, 0, len);
				}
			}finally {
				if(null !=in){
					in.close();
				}
				if(null !=out){
					out.close();
				}
			}

		}catch (Exception e){
			e.printStackTrace();

		}
	}


}
