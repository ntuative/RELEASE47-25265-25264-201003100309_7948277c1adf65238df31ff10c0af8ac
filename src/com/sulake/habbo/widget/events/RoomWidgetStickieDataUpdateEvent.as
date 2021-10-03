package com.sulake.habbo.widget.events
{
   public class RoomWidgetStickieDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_636:String = "RWSDUE_STICKIE_DATA";
       
      
      private var var_192:String;
      
      private var var_709:String;
      
      private var var_1520:String;
      
      private var var_153:int = -1;
      
      private var var_12:Boolean;
      
      public function RoomWidgetStickieDataUpdateEvent(param1:String, param2:int, param3:String, param4:String, param5:String, param6:Boolean, param7:Boolean = false, param8:Boolean = false)
      {
         super(param1,param7,param8);
         var_153 = param2;
         var_1520 = param3;
         var_192 = param4;
         var_709 = param5;
         var_12 = param6;
      }
      
      public function get objectType() : String
      {
         return var_1520;
      }
      
      public function get colorHex() : String
      {
         return var_709;
      }
      
      public function get text() : String
      {
         return var_192;
      }
      
      public function get objectId() : int
      {
         return var_153;
      }
      
      public function get controller() : Boolean
      {
         return var_12;
      }
   }
}
