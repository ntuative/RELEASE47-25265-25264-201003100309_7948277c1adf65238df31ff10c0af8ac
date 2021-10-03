package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class TagAndUserCountData
   {
       
      
      private var var_1883:int;
      
      private var var_1616:String;
      
      public function TagAndUserCountData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1616 = param1.readString();
         this.var_1883 = param1.readInteger();
      }
      
      public function get userCount() : int
      {
         return this.var_1883;
      }
      
      public function get tag() : String
      {
         return this.var_1616;
      }
   }
}
