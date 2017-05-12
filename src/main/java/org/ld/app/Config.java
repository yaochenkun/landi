package org.ld.app;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

/**
 * 存储系统配置文件中的常量
 */
public class Config {

	public static Map<String, String> settings;
	public static Map<String, Integer> settingsInt;
	public static Map<String, Integer> auths;
	public static Set<String> item_type;
	public static Map<String, Set<String>> item_cat;
	public static Map<String, Set<String>> item_com;
	public static Map<String, Integer> charge;
	public static Map<String, Map<String, Integer>> laundry_price;

	//初始化配置文件只常量中
	static{
		
		Para tp = new Para();
		settings = tp.getParaPair("sysstr", 0, 1);
		settingsInt = tp.getParaPairInt("sysint", 0, 1);
		auths = tp.getParaPairInt("auth", 2, 0);
		item_type = tp.getPara("item_type");
		item_cat = new HashMap<String, Set<String>>();
		item_com = new HashMap<String, Set<String>>();
		charge = tp.getParaPairInt("charge", 0, 1);
		laundry_price = new HashMap<String, Map<String, Integer>>();

		Map<String, String> temp = tp.getParaPair("item_cat", 0, 1);

		for (String key : temp.keySet()) {
			String list = temp.get(key);

			String[] ans = list.split("[,]");
			Set<String> news = new HashSet<String>();

			for (int i = 0; i < ans.length; i++) {
				news.add(ans[i]);
			}

			item_cat.put(key, news);
		}

		temp = tp.getParaPair("item_com", 0, 1);

		for (String key : temp.keySet()) {
			String list = temp.get(key);

			String[] ans = list.split("[,]");
			Set<String> news = new HashSet<String>();

			for (int i = 0; i < ans.length; i++) {
				news.add(ans[i]);
			}

			item_com.put(key, news);
		}
		
		temp = tp.getParaPair("laundry_price", 0, 1);
		for (String key : temp.keySet()) {
			String list = temp.get(key);

			String[] modes = {"水洗", "干洗", "单熨"};
			String[] ans = list.split("[,]");
			Map<String, Integer> news = new HashMap<String, Integer>();
			for (int i = 0; i < ans.length; i++) {
				news.put(modes[i], Integer.parseInt(ans[i]));
			}

			laundry_price.put(key, news);
		}	
		
	};
	
	
//	public CurEnv() {
//		Para tp = new Para();
//		settings = tp.getParaPair("sysstr", 0, 1);
//		settingsInt = tp.getParaPairInt("sysint", 0, 1);
//		auths = tp.getParaPairInt("auth", 2, 0);
//		item_type = tp.getPara("item_type");
//		item_cat = new HashMap<String, Set<String>>();
//		item_com = new HashMap<String, Set<String>>();
//		charge = tp.getParaPairInt("charge", 0, 1);
//		laundry_price = new HashMap<String, Map<String, Integer>>();
//
//		Map<String, String> temp = tp.getParaPair("item_cat", 0, 1);
//
//		for (String key : temp.keySet()) {
//			String list = temp.get(key);
//
//			String[] ans = list.split("[,]");
//			Set<String> news = new HashSet<String>();
//
//			for (int i = 0; i < ans.length; i++) {
//				news.add(ans[i]);
//			}
//
//			item_cat.put(key, news);
//		}
//
//		temp = tp.getParaPair("item_com", 0, 1);
//
//		for (String key : temp.keySet()) {
//			String list = temp.get(key);
//
//			String[] ans = list.split("[,]");
//			Set<String> news = new HashSet<String>();
//
//			for (int i = 0; i < ans.length; i++) {
//				news.add(ans[i]);
//			}
//
//			item_com.put(key, news);
//		}
//		
//		temp = tp.getParaPair("laundry_price", 0, 1);
//		for (String key : temp.keySet()) {
//			String list = temp.get(key);
//
//			String[] modes = {"水洗", "干洗", "单熨"};
//			String[] ans = list.split("[,]");
//			Map<String, Integer> news = new HashMap<String, Integer>();
//			for (int i = 0; i < ans.length; i++) {
//				news.put(modes[i], Integer.parseInt(ans[i]));
//			}
//
//			laundry_price.put(key, news);
//		}	
//	}

//	public String myMD5(String md5) {
//		try {
//			MessageDigest md = MessageDigest.getInstance("MD5");
//			byte[] arr = md.digest(md5.getBytes());
//			StringBuffer sb = new StringBuffer();
//
//			for (int i = 0; i < arr.length; i++) {
//				sb.append(Integer.toHexString(arr[i] & 0xFF | 0x100).substring(1, 3));
//			}
//
//			return sb.toString();
//		} catch (NoSuchAlgorithmException e) {
//
//		}
//
//		return null;
//	}	
	
}
