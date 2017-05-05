package org.ld.app;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import org.ld.model.User;

public class CurEnv {
	private User cur_user;
	private Map<String, String> settings;
	private Map<String, Integer> settingsInt;
	private Map<String, Integer> auths;
	private Set<String> item_type;
	private Map<String, Set<String>> item_cat;
	private Map<String, Set<String>> item_com;
	
	//add by yck
	private Map<String, Integer> charge;
	private Map<String, Map<String, Integer>> laundry_price;

	public CurEnv() {
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
		
		
		//测试
//		for(Map.Entry<String, Map<String, Integer>> entry : laundry_price.entrySet()){
//			System.out.print(entry.getKey() + ": ");
//			Map<String, Integer> map = entry.getValue();
//			System.out.print(map.get("水洗") + "," + map.get("干洗") + "," + map.get("单熨"));
//			System.out.println();
//		}
		
	}

	public String myMD5(String md5) {
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			byte[] arr = md.digest(md5.getBytes());
			StringBuffer sb = new StringBuffer();

			for (int i = 0; i < arr.length; i++) {
				sb.append(Integer.toHexString(arr[i] & 0xFF | 0x100).substring(1, 3));
			}

			return sb.toString();
		} catch (NoSuchAlgorithmException e) {

		}

		return null;
	}

	public User getCur_user() {
		return cur_user;
	}

	public void setCur_user(User cur_user) {
		this.cur_user = cur_user;
	}

	public Map<String, String> getSettings() {
		return settings;
	}

	public void setSettings(Map<String, String> settings) {
		this.settings = settings;
	}

	public Map<String, Integer> getSettingsInt() {
		return settingsInt;
	}

	public void setSettingsInt(Map<String, Integer> settingsInt) {
		this.settingsInt = settingsInt;
	}

	public Map<String, Integer> getAuths() {
		return auths;
	}

	public void setAuths(Map<String, Integer> auths) {
		this.auths = auths;
	}

	public Set<String> getItem_type() {
		return item_type;
	}

	public void setItem_type(Set<String> item_type) {
		this.item_type = item_type;
	}

	public Map<String, Set<String>> getItem_cat() {
		return item_cat;
	}

	public void setItem_cat(Map<String, Set<String>> item_cat) {
		this.item_cat = item_cat;
	}

	public Map<String, Set<String>> getItem_com() {
		return item_com;
	}

	public void setItem_com(Map<String, Set<String>> item_com) {
		this.item_com = item_com;
	}

	public Map<String, Integer> getCharge() {
		return charge;
	}

	public void setCharge(Map<String, Integer> charge) {
		this.charge = charge;
	}

	public Map<String, Map<String, Integer>> getLaundry_price() {
		return laundry_price;
	}

	public void setLaundry_price(Map<String, Map<String, Integer>> laundry_price) {
		this.laundry_price = laundry_price;
	}
	
	
}
