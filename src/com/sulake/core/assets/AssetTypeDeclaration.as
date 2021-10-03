package com.sulake.core.assets
{
   public class AssetTypeDeclaration
   {
       
      
      private var var_1748:Class;
      
      private var var_1750:Class;
      
      private var var_1749:String;
      
      private var var_1159:Array;
      
      public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class, ... rest)
      {
         super();
         var_1749 = param1;
         var_1750 = param2;
         var_1748 = param3;
         if(rest == null)
         {
            var_1159 = new Array();
         }
         else
         {
            var_1159 = rest;
         }
      }
      
      public function get loaderClass() : Class
      {
         return var_1748;
      }
      
      public function get assetClass() : Class
      {
         return var_1750;
      }
      
      public function get mimeType() : String
      {
         return var_1749;
      }
      
      public function get fileTypes() : Array
      {
         return var_1159;
      }
   }
}
