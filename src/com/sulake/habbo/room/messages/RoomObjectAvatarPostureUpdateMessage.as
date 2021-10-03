package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarPostureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1776:String;
      
      private var var_798:String;
      
      public function RoomObjectAvatarPostureUpdateMessage(param1:String, param2:String = "")
      {
         super();
         var_1776 = param1;
         var_798 = param2;
      }
      
      public function get postureType() : String
      {
         return var_1776;
      }
      
      public function get parameter() : String
      {
         return var_798;
      }
   }
}
