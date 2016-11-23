package org.ld.app;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public class Para {
	private String root = Para.class.getClassLoader().getResource("env/").getPath() + "/";
	@SuppressWarnings("resource")
	public String[] ReadParas(String text, String key)
	{
		String fname = root + text + ".env";

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
	
	@SuppressWarnings("resource")
	public String[] ReadParaPair(String text, String key, int first, int second)
	{
		String fname = root + text + ".env";

		BufferedReader reader = null;
		try{
			reader = new BufferedReader(new FileReader(fname));
			String temp = null;
			while((temp = reader.readLine()) != null)
			{
				String [] tparas = temp.split(" ");
				if(tparas.length == 0 || tparas[0].equals("") || tparas[0].equals("#"))
					continue;
				
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
		String fname = root + text + ".env";
		
		BufferedReader reader = null;
		try{
			Map<String, List<String>> map = new HashMap<String, List<String>>();
			reader = new BufferedReader(new FileReader(fname));
			String temp = null;
			while((temp = reader.readLine()) != null)
			{
				String [] tparas = temp.split(" ");
				if(tparas.length == 0 || tparas[0].equals("") || tparas[0].equals("#"))
					continue;
				
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
	
	public Set<String> getPara(String text)
	{
		String fname = root + text + ".env";
		
		BufferedReader reader = null;
		try{
			Set<String> set = new HashSet<String>();
			reader = new BufferedReader(new FileReader(fname));
			String temp = null;
			while((temp = reader.readLine()) != null)
			{
				set.add(temp);
			}
			
			reader.close();
			return set;
		} catch (IOException e){
			e.printStackTrace();
		}
		
		return null;
	}
	
	public Map<String, String> getParaPair(String text, int first, int second)
	{
		String fname = root + text + ".env";
		
		BufferedReader reader = null;
		try{
			Map<String, String> map = new HashMap<String, String>();
			reader = new BufferedReader(new FileReader(fname));
			String temp = null;
			while((temp = reader.readLine()) != null)
			{
				String [] tparas = temp.split(" ");
				if(tparas.length == 0 || tparas[0].equals("") || tparas[0].equals("#"))
					continue;

				map.put(tparas[first], tparas[second]);
			}
			
			reader.close();
			return map;
		} catch (IOException e){
			e.printStackTrace();
		}
		
		return null;
	}
	
	public Map<String, Integer> getParaPairInt(String text, int first, int second)
	{
		String fname = root + text + ".env";
		
		BufferedReader reader = null;
		try{
			Map<String, Integer> map = new HashMap<String, Integer>();
			reader = new BufferedReader(new FileReader(fname));
			String temp = null;
			while((temp = reader.readLine()) != null)
			{
				String [] tparas = temp.split(" ");
				if(tparas.length == 0 || tparas[0].equals("") || tparas[0].equals("#"))
					continue;

				map.put(tparas[first], Integer.parseInt(tparas[second]));
			}
			
			reader.close();
			return map;
		} catch (IOException e){
			e.printStackTrace();
		}
		
		return null;
	}
	
	public Integer setPair(String text, Map<String, String> map)
	{
		String fname = root + text + ".env";
		
		BufferedWriter writer = null;
		
		try{
			writer = new BufferedWriter(new FileWriter(fname));
			
			Iterator<Entry<String, String>> it = map.entrySet().iterator();
			while(it.hasNext())
			{
				Map.Entry<String, String> entry = it.next();
				writer.write(entry.getKey() + " " + entry.getValue() + "\n");
			}
			
			writer.close();
			return 1;
		} catch (IOException e){
			e.printStackTrace();
		}
		
		return 0;
	}
}
