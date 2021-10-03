package com.sulake.habbo.navigator
{
   import com.sulake.core.window.components.ITextWindow;
   
   public class CutToWidth implements BinarySearchTest
   {
       
      
      private var var_418:int;
      
      private var var_178:String;
      
      private var var_192:ITextWindow;
      
      public function CutToWidth()
      {
         super();
      }
      
      public function beforeSearch(param1:String, param2:ITextWindow, param3:int) : void
      {
         var_178 = param1;
         var_192 = param2;
         var_418 = param3;
      }
      
      public function test(param1:int) : Boolean
      {
         var_192.text = var_178.substring(0,param1) + "...";
         return var_192.textWidth > var_418;
      }
   }
}
