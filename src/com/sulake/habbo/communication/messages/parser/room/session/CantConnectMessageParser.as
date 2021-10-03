package com.sulake.habbo.communication.messages.parser.room.session
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class CantConnectMessageParser implements IMessageParser
   {
      
      public static const const_1538:int = 2;
      
      public static const const_299:int = 4;
      
      public static const const_1312:int = 1;
      
      public static const const_1393:int = 3;
       
      
      private var var_962:int = 0;
      
      private var var_798:String = "";
      
      public function CantConnectMessageParser()
      {
         super();
      }
      
      public function get reason() : int
      {
         return var_962;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_962 = param1.readInteger();
         if(var_962 == 3)
         {
            var_798 = param1.readString();
         }
         else
         {
            var_798 = "";
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         var_962 = 0;
         var_798 = "";
         return true;
      }
      
      public function get parameter() : String
      {
         return var_798;
      }
   }
}
