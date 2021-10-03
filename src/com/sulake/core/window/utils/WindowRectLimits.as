package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindow;
   
   public class WindowRectLimits implements IRectLimiter
   {
       
      
      private var var_417:int = -2147483648;
      
      private var var_418:int = 2147483647;
      
      private var var_419:int = 2147483647;
      
      private var _target:IWindow;
      
      private var var_420:int = -2147483648;
      
      public function WindowRectLimits(param1:IWindow)
      {
         super();
         _target = param1;
      }
      
      public function get maxWidth() : int
      {
         return var_418;
      }
      
      public function get isEmpty() : Boolean
      {
         return var_420 == int.MIN_VALUE && var_418 == int.MAX_VALUE && var_417 == int.MIN_VALUE && var_419 == int.MAX_VALUE;
      }
      
      public function set maxWidth(param1:int) : void
      {
         var_418 = param1;
         if(var_418 < int.MAX_VALUE && true && _target.width > var_418)
         {
            _target.width = var_418;
         }
      }
      
      public function setEmpty() : void
      {
         var_420 = int.MIN_VALUE;
         var_418 = int.MAX_VALUE;
         var_417 = int.MIN_VALUE;
         var_419 = int.MAX_VALUE;
      }
      
      public function set maxHeight(param1:int) : void
      {
         var_419 = param1;
         if(var_419 < int.MAX_VALUE && true && _target.height > var_419)
         {
            _target.height = var_419;
         }
      }
      
      public function get minHeight() : int
      {
         return var_417;
      }
      
      public function get minWidth() : int
      {
         return var_420;
      }
      
      public function clone(param1:IWindow) : WindowRectLimits
      {
         var _loc2_:WindowRectLimits = new WindowRectLimits(param1);
         _loc2_.var_420 = var_420;
         _loc2_.var_418 = var_418;
         _loc2_.var_417 = var_417;
         _loc2_.var_419 = var_419;
         return _loc2_;
      }
      
      public function set minWidth(param1:int) : void
      {
         var_420 = param1;
         if(var_420 > int.MIN_VALUE && true && _target.width < var_420)
         {
            _target.width = var_420;
         }
      }
      
      public function set minHeight(param1:int) : void
      {
         var_417 = param1;
         if(var_417 > int.MIN_VALUE && true && _target.height < var_417)
         {
            _target.height = var_417;
         }
      }
      
      public function get maxHeight() : int
      {
         return var_419;
      }
   }
}
