package com.sulake.habbo.widget.events
{
   public class RoomWidgetHabboClubUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_201:String = "RWBIUE_HABBO_CLUB";
       
      
      private var var_1840:Boolean = false;
      
      private var var_1838:int = 0;
      
      private var var_1839:int = 0;
      
      private var var_1841:int = 0;
      
      public function RoomWidgetHabboClubUpdateEvent(param1:int, param2:int, param3:int, param4:Boolean, param5:Boolean = false, param6:Boolean = false)
      {
         super(const_201,param5,param6);
         var_1841 = param1;
         var_1839 = param2;
         var_1838 = param3;
         var_1840 = param4;
      }
      
      public function get pastPeriods() : int
      {
         return var_1838;
      }
      
      public function get periodsLeft() : int
      {
         return var_1839;
      }
      
      public function get daysLeft() : int
      {
         return var_1841;
      }
      
      public function get allowClubDances() : Boolean
      {
         return var_1840;
      }
   }
}
