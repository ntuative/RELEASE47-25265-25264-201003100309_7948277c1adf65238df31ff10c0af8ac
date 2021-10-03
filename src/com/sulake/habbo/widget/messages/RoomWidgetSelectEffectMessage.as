package com.sulake.habbo.widget.messages
{
   public class RoomWidgetSelectEffectMessage extends RoomWidgetMessage
   {
      
      public static const const_628:String = "RWCM_MESSAGE_SELECT_EFFECT";
      
      public static const const_697:String = "RWCM_MESSAGE_UNSELECT_EFFECT";
      
      public static const const_726:String = "RWCM_MESSAGE_UNSELECT_ALL_EFFECTS";
       
      
      private var var_1857:int;
      
      public function RoomWidgetSelectEffectMessage(param1:String, param2:int = -1)
      {
         super(param1);
         var_1857 = param2;
      }
      
      public function get method_9() : int
      {
         return var_1857;
      }
   }
}
