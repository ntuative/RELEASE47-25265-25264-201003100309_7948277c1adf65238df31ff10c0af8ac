package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_576:String;
      
      private var var_1607:int;
      
      private var var_2171:String;
      
      private var var_1016:int;
      
      private var var_1111:int;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return var_1111;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1111 = param1.readInteger();
         var_2171 = param1.readString();
         var_1607 = param1.readInteger();
         var_576 = param1.readString();
         var_1016 = param1.readInteger();
         return true;
      }
      
      public function get petName() : String
      {
         return var_2171;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get figure() : String
      {
         return var_576;
      }
      
      public function get petType() : int
      {
         return var_1016;
      }
      
      public function get level() : int
      {
         return var_1607;
      }
   }
}
