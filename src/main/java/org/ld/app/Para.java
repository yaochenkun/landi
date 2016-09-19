package org.ld.app;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Para {
	private String [] paras;
	
	public Para()
	{
		paras = null;
	}
	
	public String[] getParas() {
		return paras;
	}

	public void setParas(String[] paras) {
		this.paras = paras;
	}

	public void ReadParas(String text, String key)
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
					setParas(tparas);
					break;
				}
			}
			
			reader.close();
		} catch (IOException e){
			e.printStackTrace();
		}
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
	
	public void show()
	{
		if(paras != null){
			for(String x: paras){
				System.out.println(x);
			}
		}
		else{
			System.out.println("Not Found");
		}
	}
}
