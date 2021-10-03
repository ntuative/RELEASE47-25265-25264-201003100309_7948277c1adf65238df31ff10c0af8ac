package com.sulake.habbo.widget.messages
{
   public class RoomWidgetRoomTagSearchMessage extends RoomWidgetMessage
   {
      
      public static const const_706:String = "RWRTSM_ROOM_TAG_SEARCH";
       
      
      private var var_1616:String = "";
      
      public function RoomWidgetRoomTagSearchMessage(param1:String)
      {
         super(const_706);
         var_1616 = param1;
      }
      
      public function get tag() : String
      {
         return var_1616;
      }
   }
}
