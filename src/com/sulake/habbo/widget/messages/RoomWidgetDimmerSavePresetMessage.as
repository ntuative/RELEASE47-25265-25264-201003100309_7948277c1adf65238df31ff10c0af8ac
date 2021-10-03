package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_649:String = "RWSDPM_SAVE_PRESET";
       
      
      private var _color:uint;
      
      private var var_1662:int;
      
      private var var_1664:int;
      
      private var var_1862:Boolean;
      
      private var var_983:int;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_649);
         var_1664 = param1;
         var_1662 = param2;
         _color = param3;
         var_983 = param4;
         var_1862 = param5;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get effectTypeId() : int
      {
         return var_1662;
      }
      
      public function get presetNumber() : int
      {
         return var_1664;
      }
      
      public function get brightness() : int
      {
         return var_983;
      }
      
      public function get apply() : Boolean
      {
         return var_1862;
      }
   }
}
