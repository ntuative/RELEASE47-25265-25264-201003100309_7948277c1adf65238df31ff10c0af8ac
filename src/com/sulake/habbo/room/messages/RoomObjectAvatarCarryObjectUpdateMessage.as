package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarCarryObjectUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1017:int;
      
      private var var_1231:String;
      
      public function RoomObjectAvatarCarryObjectUpdateMessage(param1:int, param2:String)
      {
         super();
         var_1017 = param1;
         var_1231 = param2;
      }
      
      public function get itemType() : int
      {
         return var_1017;
      }
      
      public function get itemName() : String
      {
         return var_1231;
      }
   }
}
