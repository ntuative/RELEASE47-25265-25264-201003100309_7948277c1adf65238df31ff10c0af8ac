package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ScrSendUserInfoMessageParser implements IMessageParser
   {
       
      
      private var var_2214:int;
      
      private var var_1166:String;
      
      private var var_2215:int;
      
      private var var_2218:int;
      
      private var var_2217:int;
      
      private var var_2216:Boolean;
      
      public function ScrSendUserInfoMessageParser()
      {
         super();
      }
      
      public function get productName() : String
      {
         return var_1166;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get hasEverBeenMember() : Boolean
      {
         return var_2216;
      }
      
      public function get responseType() : int
      {
         return var_2218;
      }
      
      public function get daysToPeriodEnd() : int
      {
         return var_2215;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1166 = param1.readString();
         var_2215 = param1.readInteger();
         var_2214 = param1.readInteger();
         var_2217 = param1.readInteger();
         var_2218 = param1.readInteger();
         var_2216 = param1.readBoolean();
         return true;
      }
      
      public function get memberPeriods() : int
      {
         return var_2214;
      }
      
      public function get periodsSubscribedAhead() : int
      {
         return var_2217;
      }
   }
}
