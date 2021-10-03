package com.sulake.habbo.room.object
{
   public class RoomPlaneMaskData
   {
       
      
      private var var_2098:Number = 0;
      
      private var var_2095:Number = 0;
      
      private var var_2097:Number = 0;
      
      private var var_2096:Number = 0;
      
      public function RoomPlaneMaskData(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         var_2095 = param1;
         var_2097 = param2;
         var_2098 = param3;
         var_2096 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return var_2095;
      }
      
      public function get leftSideLength() : Number
      {
         return var_2098;
      }
      
      public function get rightSideLoc() : Number
      {
         return var_2097;
      }
      
      public function get rightSideLength() : Number
      {
         return var_2096;
      }
   }
}
