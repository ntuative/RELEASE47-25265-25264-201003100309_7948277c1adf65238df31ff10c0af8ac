package com.sulake.habbo.widget.messages
{
   public class RoomWidgetGetBadgeDetailsMessage extends RoomWidgetMessage
   {
      
      public static const const_530:String = "RWGOI_MESSAGE_GET_BADGE_DETAILS";
       
      
      private var var_1032:int = 0;
      
      public function RoomWidgetGetBadgeDetailsMessage(param1:int)
      {
         super(const_530);
         var_1032 = param1;
      }
      
      public function get groupId() : int
      {
         return var_1032;
      }
   }
}
