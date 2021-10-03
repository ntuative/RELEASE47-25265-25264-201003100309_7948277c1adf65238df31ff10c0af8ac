package com.sulake.core.assets
{
   import com.sulake.core.assets.loaders.IAssetLoader;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.events.EventDispatcher;
   
   public class AssetLoaderStruct extends EventDispatcher implements IDisposable
   {
       
      
      private var var_693:IAssetLoader;
      
      private var var_1184:String;
      
      public function AssetLoaderStruct(param1:String, param2:IAssetLoader)
      {
         super();
         var_1184 = param1;
         var_693 = param2;
      }
      
      public function get assetLoader() : IAssetLoader
      {
         return var_693;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            if(var_693 != null)
            {
               if(true)
               {
                  var_693.dispose();
                  var_693 = null;
               }
            }
            super.dispose();
         }
      }
      
      public function get assetName() : String
      {
         return var_1184;
      }
   }
}
