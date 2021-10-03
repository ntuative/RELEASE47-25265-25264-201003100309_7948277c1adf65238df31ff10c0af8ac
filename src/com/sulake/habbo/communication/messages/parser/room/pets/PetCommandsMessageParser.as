package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetCommandsMessageParser implements IMessageParser
   {
       
      
      private var var_1007:Array;
      
      private var var_1111:int;
      
      public function PetCommandsMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var_1111 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         var_1007 = new Array();
         while(_loc2_-- > 0)
         {
            var_1007.push(param1.readInteger());
         }
         return true;
      }
      
      public function get enabledCommands() : Array
      {
         return var_1007;
      }
      
      public function get petId() : int
      {
         return var_1111;
      }
      
      public function flush() : Boolean
      {
         var_1111 = -1;
         var_1007 = null;
         return true;
      }
   }
}
