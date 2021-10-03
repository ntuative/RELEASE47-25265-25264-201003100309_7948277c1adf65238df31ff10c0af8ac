package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_1630:int;
      
      private var var_1018:int;
      
      private var var_1631:int;
      
      private var var_1389:int;
      
      private var var_119:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         var_1389 = param1.readInteger();
         var_1631 = param1.readInteger();
         var_1018 = param1.readInteger();
         var_1630 = param1.readInteger();
         var_119 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + var_1389);
      }
      
      public function get chatRecordId() : int
      {
         return var_1630;
      }
      
      public function get reportedUserId() : int
      {
         return var_1018;
      }
      
      public function get callerUserId() : int
      {
         return var_1631;
      }
      
      public function get callId() : int
      {
         return var_1389;
      }
      
      public function get room() : RoomChatlogData
      {
         return var_119;
      }
   }
}
