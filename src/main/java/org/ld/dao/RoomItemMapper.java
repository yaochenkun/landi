package org.ld.dao;

import java.util.HashMap;
import java.util.List;

import org.ld.model.RoomItem;

public interface RoomItemMapper {
    int deleteByPrimaryKey(Integer ID);

    int insert(RoomItem record);

    int insertSelective(RoomItem record);

    RoomItem selectByPrimaryKey(Integer ID);

    int updateByPrimaryKeySelective(RoomItem record);

    int updateByPrimaryKey(RoomItem record);


    List<RoomItem> selectByTag(String tag);



    // add
 	List<RoomItem> getItems(HashMap<String, Object> map);

 	List<RoomItem> getAllItems(HashMap<String, Object> map);

 	List<RoomItem> getItemsByType(HashMap<String, Object> map);

 	List<RoomItem> getItemsByRoom(HashMap<String, Object> map);
 	
 	List<RoomItem> getItemsByItemID(HashMap<String, Object> map);

 	int getTotal(HashMap<String, Object> map);

 	int getAllTotal();

 	int getTotalByType(String TYPE);

 	int getTotalByRoom(int RID);
 	
 	int getTotalByItemID(int ITEM_ID);


 	//add by yck
	int selectTotalItemsByRoomNum_Type(HashMap<String, Object> map);
	List<RoomItem> selectItemsByRoomNum_Type(HashMap<String, Object> map);
	List<RoomItem> selectAllItemsByRoomNum_Type(HashMap<String, Object> map);
}