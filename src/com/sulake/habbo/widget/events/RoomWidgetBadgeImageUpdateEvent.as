package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetBadgeImageUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_558:String = "RWBIUE_BADGE_IMAGE";
       
      
      private var var_2233:BitmapData;
      
      private var var_1627:String;
      
      public function RoomWidgetBadgeImageUpdateEvent(param1:String, param2:BitmapData, param3:Boolean = false, param4:Boolean = false)
      {
         super(const_558,param3,param4);
         var_1627 = param1;
         var_2233 = param2;
      }
      
      public function get badgeImage() : BitmapData
      {
         return var_2233;
      }
      
      public function get badgeID() : String
      {
         return var_1627;
      }
   }
}
