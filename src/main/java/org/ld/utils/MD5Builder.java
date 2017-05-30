package org.ld.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5Builder {

	public static String create(String md5) {
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
}
