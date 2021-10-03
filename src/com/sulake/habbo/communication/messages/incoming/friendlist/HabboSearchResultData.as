package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2304:Boolean;
      
      private var var_2302:int;
      
      private var var_2301:Boolean;
      
      private var var_1536:String;
      
      private var var_1297:String;
      
      private var var_1819:int;
      
      private var var_2133:String;
      
      private var var_2303:String;
      
      private var var_2134:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1819 = param1.readInteger();
         this.var_1536 = param1.readString();
         this.var_2133 = param1.readString();
         this.var_2304 = param1.readBoolean();
         this.var_2301 = param1.readBoolean();
         param1.readString();
         this.var_2302 = param1.readInteger();
         this.var_2134 = param1.readString();
         this.var_2303 = param1.readString();
         this.var_1297 = param1.readString();
      }
      
      public function get realName() : String
      {
         return this.var_1297;
      }
      
      public function get avatarName() : String
      {
         return this.var_1536;
      }
      
      public function get avatarId() : int
      {
         return this.var_1819;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2304;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2303;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_2134;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2301;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_2133;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2302;
      }
   }
}
