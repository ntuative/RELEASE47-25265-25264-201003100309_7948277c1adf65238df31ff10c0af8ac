package com.sulake.habbo.communication.messages.parser.poll
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class VoteResultMessageParser implements IMessageParser
   {
       
      
      private var var_1328:int;
      
      private var var_998:String;
      
      private var var_720:Array;
      
      private var var_954:Array;
      
      public function VoteResultMessageParser()
      {
         super();
      }
      
      public function get votes() : Array
      {
         return var_720.slice();
      }
      
      public function flush() : Boolean
      {
         var_998 = "";
         var_954 = [];
         var_720 = [];
         var_1328 = 0;
         return true;
      }
      
      public function get totalVotes() : int
      {
         return var_1328;
      }
      
      public function get question() : String
      {
         return var_998;
      }
      
      public function get choices() : Array
      {
         return var_954.slice();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_998 = param1.readString();
         var_954 = [];
         var_720 = [];
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            param1.readInteger();
            var_954.push(param1.readString());
            var_720.push(param1.readInteger());
            _loc3_++;
         }
         var_1328 = param1.readInteger();
         return true;
      }
   }
}
