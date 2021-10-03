package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendData
   {
       
      
      private var var_576:String;
      
      private var var_1299:String;
      
      private var var_1298:String;
      
      private var var_1271:int;
      
      private var var_1047:int;
      
      private var var_1297:String;
      
      private var _name:String;
      
      private var var_1135:Boolean;
      
      private var var_719:Boolean;
      
      private var _id:int;
      
      public function FriendData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this._name = param1.readString();
         this.var_1047 = param1.readInteger();
         this.var_719 = param1.readBoolean();
         this.var_1135 = param1.readBoolean();
         this.var_576 = param1.readString();
         this.var_1271 = param1.readInteger();
         this.var_1298 = param1.readString();
         this.var_1299 = param1.readString();
         this.var_1297 = param1.readString();
      }
      
      public function get gender() : int
      {
         return var_1047;
      }
      
      public function get realName() : String
      {
         return var_1297;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get motto() : String
      {
         return var_1298;
      }
      
      public function get categoryId() : int
      {
         return var_1271;
      }
      
      public function get online() : Boolean
      {
         return var_719;
      }
      
      public function get followingAllowed() : Boolean
      {
         return var_1135;
      }
      
      public function get lastAccess() : String
      {
         return var_1299;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get figure() : String
      {
         return var_576;
      }
   }
}
