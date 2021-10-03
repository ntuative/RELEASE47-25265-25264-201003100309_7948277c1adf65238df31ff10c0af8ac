package com.sulake.core.assets.loaders
{
   import flash.display.Loader;
   import flash.events.Event;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLRequest;
   import flash.system.LoaderContext;
   
   public class BitmapFileLoader extends AssetLoaderEventBroker implements IAssetLoader
   {
       
      
      protected var var_16:Loader;
      
      protected var var_928:String;
      
      protected var _type:String;
      
      protected var var_1100:LoaderContext;
      
      public function BitmapFileLoader(param1:String, param2:URLRequest = null)
      {
         super();
         var_928 = param2 == null ? "" : param2.url;
         _type = param1;
         var_16 = new Loader();
         var_1100 = new LoaderContext();
         var_1100.checkPolicyFile = true;
         var_16.contentLoaderInfo.addEventListener(Event.COMPLETE,loadEventHandler);
         var_16.contentLoaderInfo.addEventListener(Event.UNLOAD,loadEventHandler);
         var_16.contentLoaderInfo.addEventListener(HTTPStatusEvent.HTTP_STATUS,loadEventHandler);
         var_16.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,loadEventHandler);
         var_16.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
         var_16.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR,loadEventHandler);
         if(param2 != null && param2.url != null)
         {
            var_16.load(param2,var_1100);
         }
      }
      
      public function get bytesTotal() : uint
      {
         return var_16.contentLoaderInfo.bytesTotal;
      }
      
      public function load(param1:URLRequest) : void
      {
         var_928 = param1.url;
         var_16.load(param1,var_1100);
      }
      
      override public function dispose() : void
      {
         if(!_disposed)
         {
            super.dispose();
            var_16.contentLoaderInfo.removeEventListener(Event.COMPLETE,loadEventHandler);
            var_16.contentLoaderInfo.removeEventListener(Event.UNLOAD,loadEventHandler);
            var_16.contentLoaderInfo.removeEventListener(HTTPStatusEvent.HTTP_STATUS,loadEventHandler);
            var_16.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS,loadEventHandler);
            var_16.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
            var_16.contentLoaderInfo.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,loadEventHandler);
            try
            {
               var_16.close();
            }
            catch(e:*)
            {
            }
            var_16.unload();
            var_16 = null;
            _type = null;
            var_928 = null;
         }
      }
      
      public function get mimeType() : String
      {
         return _type;
      }
      
      public function get url() : String
      {
         return var_928;
      }
      
      public function get bytesLoaded() : uint
      {
         return var_16.contentLoaderInfo.bytesLoaded;
      }
      
      public function get content() : Object
      {
         return var_16.content;
      }
      
      public function get loaderContext() : LoaderContext
      {
         return var_1100;
      }
   }
}
