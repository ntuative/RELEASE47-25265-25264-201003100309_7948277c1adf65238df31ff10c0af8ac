package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarFigureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1914:String;
      
      private var var_576:String;
      
      public function RoomObjectAvatarFigureUpdateMessage(param1:String, param2:String = "")
      {
         super();
         var_576 = param1;
         var_1914 = param2;
      }
      
      public function get race() : String
      {
         return var_1914;
      }
      
      public function get figure() : String
      {
         return var_576;
      }
   }
}
