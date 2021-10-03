package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.catalog.NodeData;
   
   public class CatalogIndexMessageParser implements IMessageParser
   {
       
      
      private var var_120:NodeData;
      
      public function CatalogIndexMessageParser()
      {
         super();
      }
      
      public function get root() : NodeData
      {
         return var_120;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_120 = new NodeData(param1);
         return true;
      }
      
      public function flush() : Boolean
      {
         var_120 = null;
         return true;
      }
   }
}
