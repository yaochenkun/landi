package org.ld.app;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import org.ld.utils.Para;

/**
 * 存储系统配置文件中的常量
 */
public class Config {

	public static Map<String, String> settings;
	public static Map<String, Integer> settingsInt;
	public static Map<String, Integer> auths;
	public static Map<String, Double> rates;
	public static Set<String> item_type;
	public static Map<String, Set<String>> item_cat;
	public static Map<String, Set<String>> item_com;
	public static Map<String, Integer> charge;
	public static Map<String, Integer> restaurant;
	public static Map<String, Map<String, Integer>> laundry_price;

	//初始化配置文件只常量中
	static{
		
		settings = readSettings();
		settingsInt = readSettingsInt();
		auths = readAuths();
		rates = readRates();
		item_type = readItem_type();
		item_cat = readItem_cat();
		item_com = readItem_com();
		charge = readCharge();
		restaurant = readRestaurant();
		laundry_price = readLaundry_price();
	}

	/**
	 * getXXX: 运行时访问配置文件。
	 * readXXX: 读取配置文件至内存。
	 *          考虑到管理员更新配置文件后用read读出刚才被改变的文件，以刷新内存中的配置数据实时保持一致
	 */
	
	public static synchronized Map<String, String> getSettings() {
		return settings;
	}
	
	public static synchronized Map<String, String> readSettings() {
		
		settings = Para.getParaPair("sysstr", 0, 1);	
		return settings;
	}

	public static synchronized Map<String, Integer> getSettingsInt() {
		return settingsInt;
	}

	public static synchronized Map<String, Integer> readSettingsInt() {
		
		settingsInt = Para.getParaPairInt("sysint", 0, 1);
		return settingsInt;
	}

	public static synchronized Map<String, Integer> getAuths() {
		return auths;
	}

	public static synchronized Map<String, Integer> readAuths() {
		
		auths = Para.getParaPairInt("auth", 2, 0);
		return auths;
	}

	public static synchronized Set<String> getItem_type() {
		return item_type;
	}

	public static synchronized Set<String> readItem_type() {

		item_type = Para.getPara("item_type");
		return item_type;
	}

	public static synchronized Map<String, Set<String>> getItem_cat() {
		return item_cat;
	}

	public static synchronized Map<String, Set<String>> readItem_cat() {

		item_cat = new HashMap<String, Set<String>>();
		Map<String, String> temp = Para.getParaPair("item_cat", 0, 1);

		for (String key : temp.keySet()) {
			String list = temp.get(key);

			String[] ans = list.split("[,]");
			Set<String> news = new HashSet<String>();

			for (int i = 0; i < ans.length; i++) {
				news.add(ans[i]);
			}

			item_cat.put(key, news);
		}
		
		return item_cat;
	}

	public static synchronized Map<String, Set<String>> getItem_com() {
		return item_com;
	}

	public static synchronized Map<String, Set<String>> readItem_com() {
		
		item_com = new HashMap<String, Set<String>>();
		Map<String, String> temp = Para.getParaPair("item_com", 0, 1);

		for (String key : temp.keySet()) {
			String list = temp.get(key);

			String[] ans = list.split("[,]");
			Set<String> news = new HashSet<String>();

			for (int i = 0; i < ans.length; i++) {
				news.add(ans[i]);
			}

			item_com.put(key, news);
		}
		
		return item_com;
	}

	public static synchronized Map<String, Integer> getCharge() {
		return charge;
	}

	public static synchronized Map<String, Integer> readCharge() {

		charge = Para.getParaPairInt("charge", 0, 1);
		return charge;
	}

	public static synchronized Map<String, Integer> getRestaurant() {
		return restaurant;
	}

	public static synchronized Map<String, Integer> readRestaurant() {

		restaurant = Para.getParaPairInt("restaurant", 0, 1);
		return restaurant;
	}

	public static synchronized Map<String, Map<String, Integer>> getLaundry_price() {
		return laundry_price;
	}

	public static synchronized Map<String, Map<String, Integer>> readLaundry_price() {
		
		laundry_price = new HashMap<String, Map<String, Integer>>();
		Map<String, String> temp = Para.getParaPair("laundry_price", 0, 1);
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
		
		return laundry_price;
	}

	public static synchronized Map<String, Double> getRates() {
		return rates;
	}

	public static synchronized Map<String, Double> readRates() {
		
		rates = Para.getParaPairDouble("rate", 0, 1);		
		return rates;
	};
	
	
	
	
}
