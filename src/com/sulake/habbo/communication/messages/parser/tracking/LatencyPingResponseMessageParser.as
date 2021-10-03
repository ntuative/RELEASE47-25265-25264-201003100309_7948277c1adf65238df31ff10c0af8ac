package com.sulake.habbo.communication.messages.parser.tracking
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class LatencyPingResponseMessageParser implements IMessageParser
   {
       
      
      private var var_1025:int;
      
      public function LatencyPingResponseMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_1025 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1025 = param1.readInteger();
         return true;
      }
      
      public function get requestId() : int
      {
         return var_1025;
      }
   }
}
