package org.ld.app;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 * 配置文件的读写
 *
 */

public class MyFile {
	public static ArrayList<File> getListFiles(Object obj) {
		File dir = null;

		if (obj instanceof File) {
			dir = (File) obj;
		} else {
			dir = new File(obj.toString());
		}

		ArrayList<File> files = new ArrayList<File>();

		if (dir.isFile()) {
			files.add(dir);
		} else if (dir.isDirectory()) {
			File[] fileArr = dir.listFiles();

			for (int i = 0; i < fileArr.length; i++) {
				File fileOne = fileArr[i];
				files.addAll(getListFiles(fileOne));
			}
		}

		return files;
	}

	public static Map<String, String> getFilePath(String path) {
		Map<String, String> ans = new HashMap<String, String>();
		ArrayList<File> fs = getListFiles(path);

		for (File x : fs) {
			ans.put(x.getName(), x.getPath());
		}

		return ans;
	}
}