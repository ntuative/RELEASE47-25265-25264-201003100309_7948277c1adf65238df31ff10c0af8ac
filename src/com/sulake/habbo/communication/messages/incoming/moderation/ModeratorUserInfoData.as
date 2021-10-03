package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ModeratorUserInfoData
   {
       
      
      private var var_2024:int;
      
      private var var_2022:int;
      
      private var var_2027:int;
      
      private var _userName:String;
      
      private var var_2025:int;
      
      private var var_2023:int;
      
      private var var_2026:int;
      
      private var _userId:int;
      
      private var var_719:Boolean;
      
      public function ModeratorUserInfoData(param1:IMessageDataWrapper)
      {
         super();
         _userId = param1.readInteger();
         _userName = param1.readString();
         var_2023 = param1.readInteger();
         var_2025 = param1.readInteger();
         var_719 = param1.readBoolean();
         var_2027 = param1.readInteger();
         var_2022 = param1.readInteger();
         var_2024 = param1.readInteger();
         var_2026 = param1.readInteger();
      }
      
      public function get banCount() : int
      {
         return var_2026;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
      
      public function get online() : Boolean
      {
         return var_719;
      }
      
      public function get minutesSinceLastLogin() : int
      {
         return var_2025;
      }
      
      public function get abusiveCfhCount() : int
      {
         return var_2022;
      }
      
      public function get cautionCount() : int
      {
         return var_2024;
      }
      
      public function get cfhCount() : int
      {
         return var_2027;
      }
      
      public function get minutesSinceRegistration() : int
      {
         return var_2023;
      }
      
      public function get userName() : String
      {
         return _userName;
      }
   }
}
