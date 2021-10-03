package com.sulake.core.assets.loaders
{
   import flash.events.Event;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   
   public class BinaryFileLoader extends AssetLoaderEventBroker implements IAssetLoader
   {
       
      
      protected var var_16:URLLoader;
      
      protected var var_928:String;
      
      protected var _type:String;
      
      public function BinaryFileLoader(param1:String, param2:URLRequest = null)
      {
         super();
         var_928 = param2 == null ? "" : param2.url;
         _type = param1;
         var_16 = new URLLoader();
         var_16.addEventListener(Event.COMPLETE,loadEventHandler);
         var_16.addEventListener(Event.UNLOAD,loadEventHandler);
         var_16.addEventListener(HTTPStatusEvent.HTTP_STATUS,loadEventHandler);
         var_16.addEventListener(ProgressEvent.PROGRESS,loadEventHandler);
         var_16.addEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
         var_16.addEventListener(SecurityErrorEvent.SECURITY_ERROR,loadEventHandler);
         if(param2 != null)
         {
            this.load(param2);
         }
      }
      
      public function get bytesTotal() : uint
      {
         return var_16.bytesTotal;
      }
      
      public function load(param1:URLRequest) : void
      {
         var_928 = param1.url;
         var_16.dataFormat = _type == "application/octet-stream" ? "null" : URLLoaderDataFormat.TEXT;
         var_16.load(param1);
      }
      
      override public function dispose() : void
      {
         if(!_disposed)
         {
            super.dispose();
            var_16.removeEventListener(Event.COMPLETE,loadEventHandler);
            var_16.removeEventListener(Event.UNLOAD,loadEventHandler);
            var_16.removeEventListener(HTTPStatusEvent.HTTP_STATUS,loadEventHandler);
            var_16.removeEventListener(ProgressEvent.PROGRESS,loadEventHandler);
            var_16.removeEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
            var_16.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,loadEventHandler);
            var_16.close();
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
         return var_16.bytesLoaded;
      }
      
      public function get content() : Object
      {
         return var_16.data;
      }
   }
}
