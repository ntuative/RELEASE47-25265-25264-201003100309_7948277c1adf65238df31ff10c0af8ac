package com.sulake.room.events
{
   public class RoomObjectMouseEvent extends RoomObjectEvent
   {
      
      public static const const_1508:String = "ROE_MOUSE_LEAVE";
      
      public static const const_1505:String = "ROE_MOUSE_ENTER";
      
      public static const const_427:String = "ROE_MOUSE_MOVE";
      
      public static const const_1585:String = "ROE_MOUSE_DOUBLE_CLICK";
      
      public static const const_225:String = "ROE_MOUSE_CLICK";
      
      public static const ROOM_OBJECT_MOUSE_DOWN:String = "ROE_MOUSE_DOWN";
       
      
      private var var_1916:Boolean;
      
      private var var_1919:Boolean;
      
      private var var_1921:Boolean;
      
      private var var_1915:Boolean;
      
      public function RoomObjectMouseEvent(param1:String, param2:int, param3:String, param4:Boolean = false, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false)
      {
         super(param1,param2,param3,param8,param9);
         var_1921 = param4;
         var_1915 = param5;
         var_1916 = param6;
         var_1919 = param7;
      }
      
      public function get buttonDown() : Boolean
      {
         return var_1919;
      }
      
      public function get altKey() : Boolean
      {
         return var_1921;
      }
      
      public function get ctrlKey() : Boolean
      {
         return var_1915;
      }
      
      public function get shiftKey() : Boolean
      {
         return var_1916;
      }
   }
}
