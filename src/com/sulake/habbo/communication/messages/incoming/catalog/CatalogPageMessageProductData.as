package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_203:String = "e";
      
      public static const const_80:String = "i";
      
      public static const const_83:String = "s";
       
      
      private var var_1091:String;
      
      private var var_1360:String;
      
      private var var_1359:int;
      
      private var var_1989:int;
      
      private var var_1090:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         var_1360 = param1.readString();
         var_1989 = param1.readInteger();
         var_1091 = param1.readString();
         var_1090 = param1.readInteger();
         var_1359 = param1.readInteger();
      }
      
      public function get productCount() : int
      {
         return var_1090;
      }
      
      public function get productType() : String
      {
         return var_1360;
      }
      
      public function get expiration() : int
      {
         return var_1359;
      }
      
      public function get furniClassId() : int
      {
         return var_1989;
      }
      
      public function get extraParam() : String
      {
         return var_1091;
      }
   }
}
