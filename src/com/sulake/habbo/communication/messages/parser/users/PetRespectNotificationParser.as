package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.parser.inventory.pets.PetData;
   
   public class PetRespectNotificationParser implements IMessageParser
   {
       
      
      private var var_1603:int;
      
      private var var_1129:PetData;
      
      private var var_1667:int;
      
      public function PetRespectNotificationParser()
      {
         super();
      }
      
      public function get respect() : int
      {
         return var_1603;
      }
      
      public function get petData() : PetData
      {
         return var_1129;
      }
      
      public function flush() : Boolean
      {
         var_1129 = null;
         return true;
      }
      
      public function get petOwnerId() : int
      {
         return var_1667;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1603 = param1.readInteger();
         var_1667 = param1.readInteger();
         var_1129 = new PetData(param1);
         return true;
      }
   }
}
