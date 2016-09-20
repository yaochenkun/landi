package org.ld.app;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Map;

import org.ld.model.User;

public class CurEnv {
	private User cur_user;
	private Map<String, String> settings;
	
	public CurEnv()
	{
		Para tp = new Para();
		settings = tp.getParaPair("sys", 0, 1);
	}
	
	public String myMD5(String md5)
	{
		try{
			MessageDigest md = MessageDigest.getInstance("MD5");
			byte[] arr = md.digest(md5.getBytes());
			StringBuffer sb = new StringBuffer();
			
			for(int i = 0; i < arr.length; i++)
			{
				sb.append(Integer.toHexString(arr[i] & 0xFF | 0x100).substring(1,3));
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
}
