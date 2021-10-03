package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendRequestData
   {
       
      
      private var var_1960:int;
      
      private var var_1959:String;
      
      private var var_1025:int;
      
      public function FriendRequestData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1025 = param1.readInteger();
         this.var_1959 = param1.readString();
         this.var_1960 = int(param1.readString());
      }
      
      public function get requestId() : int
      {
         return this.var_1025;
      }
      
      public function get requesterUserId() : int
      {
         return this.var_1960;
      }
      
      public function get requesterName() : String
      {
         return this.var_1959;
      }
   }
}
