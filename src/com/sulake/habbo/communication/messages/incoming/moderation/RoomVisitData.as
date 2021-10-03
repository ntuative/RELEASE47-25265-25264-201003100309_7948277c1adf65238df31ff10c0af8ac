package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class RoomVisitData
   {
       
      
      private var var_668:String;
      
      private var var_2040:int;
      
      private var var_1431:Boolean;
      
      private var _roomId:int;
      
      private var var_2039:int;
      
      public function RoomVisitData(param1:IMessageDataWrapper)
      {
         super();
         var_1431 = param1.readBoolean();
         _roomId = param1.readInteger();
         var_668 = param1.readString();
         var_2039 = param1.readInteger();
         var_2040 = param1.readInteger();
      }
      
      public function get isPublic() : Boolean
      {
         return var_1431;
      }
      
      public function get roomName() : String
      {
         return var_668;
      }
      
      public function get enterMinute() : int
      {
         return var_2040;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get enterHour() : int
      {
         return var_2039;
      }
   }
}
