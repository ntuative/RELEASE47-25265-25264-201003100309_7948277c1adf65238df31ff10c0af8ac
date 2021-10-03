package com.sulake.habbo.room.events
{
   public class RoomEngineDimmerStateEvent extends RoomEngineEvent
   {
      
      public static const const_65:String = "REDSE_ROOM_COLOR";
       
      
      private var var_984:int;
      
      private var _color:uint;
      
      private var var_983:int;
      
      private var var_1700:int;
      
      private var var_36:int;
      
      public function RoomEngineDimmerStateEvent(param1:int, param2:int, param3:int, param4:int, param5:int, param6:uint, param7:uint, param8:Boolean = false, param9:Boolean = false)
      {
         super(const_65,param1,param2,param8,param9);
         var_36 = param3;
         var_1700 = param4;
         var_984 = param5;
         _color = param6;
         var_983 = param7;
      }
      
      public function get brightness() : uint
      {
         return var_983;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get effectId() : int
      {
         return var_984;
      }
      
      public function get state() : int
      {
         return var_36;
      }
      
      public function get presetId() : int
      {
         return var_1700;
      }
   }
}
