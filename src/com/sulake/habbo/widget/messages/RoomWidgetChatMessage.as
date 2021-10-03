package com.sulake.habbo.widget.messages
{
   public class RoomWidgetChatMessage extends RoomWidgetMessage
   {
      
      public static const const_111:int = 0;
      
      public static const const_116:int = 1;
      
      public static const const_103:int = 2;
      
      public static const const_684:String = "RWCM_MESSAGE_CHAT";
       
      
      private var var_1343:int = 0;
      
      private var var_1656:String = "";
      
      private var var_192:String = "";
      
      public function RoomWidgetChatMessage(param1:String, param2:String, param3:int = 0, param4:String = "")
      {
         super(param1);
         var_192 = param2;
         var_1343 = param3;
         var_1656 = param4;
      }
      
      public function get recipientName() : String
      {
         return var_1656;
      }
      
      public function get chatType() : int
      {
         return var_1343;
      }
      
      public function get text() : String
      {
         return var_192;
      }
   }
}
