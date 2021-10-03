package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FlatCategory
   {
       
      
      private var var_330:Boolean;
      
      private var var_1211:int;
      
      private var var_1529:String;
      
      public function FlatCategory(param1:IMessageDataWrapper)
      {
         super();
         var_1211 = param1.readInteger();
         var_1529 = param1.readString();
         var_330 = param1.readBoolean();
      }
      
      public function get visible() : Boolean
      {
         return var_330;
      }
      
      public function get nodeName() : String
      {
         return var_1529;
      }
      
      public function get nodeId() : int
      {
         return var_1211;
      }
   }
}
