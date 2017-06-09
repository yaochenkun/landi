package org.ld.utils;

/**
 * Created by ken on 2017/6/6.
 *
 * excel单元格
 */
public class ExcelCell {

	private int row;
	private int col;
	private String content;

	public int getRow() {
		return row;
	}

	public void setRow(int row) {
		this.row = row;
	}

	public int getCol() {
		return col;
	}

	public void setCol(int col) {
		this.col = col;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
}
