package com.sulake.habbo.toolbar
{
   public class ToolbarIconBouncer
   {
       
      
      private var var_2201:Number;
      
      private var var_612:Number = 0;
      
      private var var_2202:Number;
      
      private var var_611:Number;
      
      public function ToolbarIconBouncer(param1:Number, param2:Number)
      {
         super();
         var_2201 = param1;
         var_2202 = param2;
      }
      
      public function update() : void
      {
         var_611 += var_2202;
         var_612 += var_611;
         if(var_612 > 0)
         {
            var_612 = 0;
            var_611 = var_2201 * -1 * var_611;
         }
      }
      
      public function reset(param1:int) : void
      {
         var_611 = param1;
         var_612 = 0;
      }
      
      public function get location() : Number
      {
         return var_612;
      }
   }
}
