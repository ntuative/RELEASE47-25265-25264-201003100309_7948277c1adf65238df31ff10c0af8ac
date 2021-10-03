package com.sulake.habbo.communication.messages.outgoing.recycler
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RecycleItemsMessageComposer implements IMessageComposer
   {
       
      
      private var var_766:Array;
      
      public function RecycleItemsMessageComposer(param1:Array)
      {
         super();
         var_766 = new Array();
         var_766.push(param1.length);
         var_766 = var_766.concat(param1);
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return var_766;
      }
   }
}
