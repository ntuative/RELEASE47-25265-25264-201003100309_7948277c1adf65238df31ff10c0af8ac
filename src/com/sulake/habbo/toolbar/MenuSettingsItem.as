package com.sulake.habbo.toolbar
{
   public class MenuSettingsItem
   {
       
      
      private var var_1706:Array;
      
      private var var_1707:String;
      
      private var var_1708:Boolean;
      
      public function MenuSettingsItem(param1:String, param2:Array = null, param3:Boolean = false)
      {
         super();
         var_1707 = param1;
         var_1706 = param2;
         var_1708 = param3;
      }
      
      public function get menuId() : String
      {
         return var_1707;
      }
      
      public function get yieldList() : Array
      {
         return var_1706;
      }
      
      public function get lockToIcon() : Boolean
      {
         return var_1708;
      }
   }
}
