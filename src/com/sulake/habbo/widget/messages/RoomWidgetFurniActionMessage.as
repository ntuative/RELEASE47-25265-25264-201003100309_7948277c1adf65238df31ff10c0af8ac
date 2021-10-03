package com.sulake.habbo.widget.messages
{
   public class RoomWidgetFurniActionMessage extends RoomWidgetMessage
   {
      
      public static const const_255:String = "RWFAM_MOVE";
      
      public static const const_531:String = "RWFUAM_ROTATE";
      
      public static const const_548:String = "RWFAM_PICKUP";
       
      
      private var var_1792:int = 0;
      
      private var var_1864:int = 0;
      
      public function RoomWidgetFurniActionMessage(param1:String, param2:int, param3:int)
      {
         super(param1);
         var_1792 = param2;
         var_1864 = param3;
      }
      
      public function get furniId() : int
      {
         return var_1792;
      }
      
      public function get furniCategory() : int
      {
         return var_1864;
      }
   }
}
