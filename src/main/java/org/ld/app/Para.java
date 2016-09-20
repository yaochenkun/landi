package org.ld.app;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Para {
	public String[] ReadParas(String text, String key)
	{
		String fname = "src/env/" + text + ".env";

		BufferedReader reader = null;
		try{
			reader = new BufferedReader(new FileReader(fname));
			String temp = null;
			while((temp = reader.readLine()) != null)
			{
				String [] tparas = temp.split(" ");
				if(tparas[0].equals(key))
				{
					return tparas;
				}
			}
			
			reader.close();
		} catch (IOException e){
			e.printStackTrace();
		}
		
		return null;
	}
	
	public String[] ReadParaPair(String text, String key, int first, int second)
	{
		String fname = "src/env/" + text + ".env";

		BufferedReader reader = null;
		try{
			reader = new BufferedReader(new FileReader(fname));
			String temp = null;
			while((temp = reader.readLine()) != null)
			{
				String [] tparas = temp.split(" ");
				String [] ans = new String[2]; 
				if(tparas[0].equals(key))
				{
					ans[0] = tparas[first];
					ans[1] = tparas[second];
					return ans;
				}
			}
			
			reader.close();
		} catch (IOException e){
			e.printStackTrace();
		}
		
		return null;
	}
	
	public Map<String, List<String>> getParaList(String text)
	{
		String fname = "src/env/" + text + ".env";
		
		BufferedReader reader = null;
		try{
			Map<String, List<String>> map = new HashMap<String, List<String>>();
			reader = new BufferedReader(new FileReader(fname));
			String temp = null;
			while((temp = reader.readLine()) != null)
			{
				String [] tparas = temp.split(" ");
				List<String> tl = new ArrayList<String>();
				
				for(int i = 1; i < tparas.length; i++)
				{
					tl.add(tparas[i]);
				}
				map.put(tparas[0], tl);
			}
			
			reader.close();
			return map;
		} catch (IOException e){
			e.printStackTrace();
		}
		
		return null;
	}
	
	public Map<String, String> getParaPair(String text, int first, int second)
	{
		String fname = "src/env/" + text + ".env";
		
		BufferedReader reader = null;
		try{
			Map<String, String> map = new HashMap<String, String>();
			reader = new BufferedReader(new FileReader(fname));
			String temp = null;
			while((temp = reader.readLine()) != null)
			{
				String [] tparas = temp.split(" ");

				map.put(tparas[first], tparas[second]);
			}
			
			reader.close();
			return map;
		} catch (IOException e){
			e.printStackTrace();
		}
		
		return null;
	}
}
