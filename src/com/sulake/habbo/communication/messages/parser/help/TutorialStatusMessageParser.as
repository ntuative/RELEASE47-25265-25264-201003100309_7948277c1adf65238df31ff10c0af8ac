package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class TutorialStatusMessageParser implements IMessageParser
   {
       
      
      private var var_1080:Boolean;
      
      private var var_1079:Boolean;
      
      private var var_1081:Boolean;
      
      public function TutorialStatusMessageParser()
      {
         super();
      }
      
      public function get hasCalledGuideBot() : Boolean
      {
         return var_1080;
      }
      
      public function get hasChangedName() : Boolean
      {
         return var_1079;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1081 = param1.readBoolean();
         var_1079 = param1.readBoolean();
         var_1080 = param1.readBoolean();
         return true;
      }
      
      public function get hasChangedLooks() : Boolean
      {
         return var_1081;
      }
      
      public function flush() : Boolean
      {
         var_1081 = false;
         var_1079 = false;
         var_1080 = false;
         return true;
      }
   }
}
