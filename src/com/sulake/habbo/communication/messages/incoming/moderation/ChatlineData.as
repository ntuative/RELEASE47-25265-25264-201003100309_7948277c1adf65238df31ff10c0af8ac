package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChatlineData
   {
       
      
      private var var_1475:String;
      
      private var var_1736:int;
      
      private var var_1738:int;
      
      private var var_1737:int;
      
      private var var_1735:String;
      
      public function ChatlineData(param1:IMessageDataWrapper)
      {
         super();
         var_1736 = param1.readInteger();
         var_1737 = param1.readInteger();
         var_1738 = param1.readInteger();
         var_1735 = param1.readString();
         var_1475 = param1.readString();
      }
      
      public function get msg() : String
      {
         return var_1475;
      }
      
      public function get hour() : int
      {
         return var_1736;
      }
      
      public function get minute() : int
      {
         return var_1737;
      }
      
      public function get chatterName() : String
      {
         return var_1735;
      }
      
      public function get chatterId() : int
      {
         return var_1738;
      }
   }
}
