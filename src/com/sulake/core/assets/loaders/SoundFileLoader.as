package com.sulake.core.assets.loaders
{
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.media.Sound;
   import flash.net.URLRequest;
   
   public class SoundFileLoader extends AssetLoaderEventBroker implements IAssetLoader
   {
       
      
      protected var var_16:Sound;
      
      protected var var_928:String;
      
      protected var _type:String;
      
      public function SoundFileLoader(param1:String, param2:URLRequest = null)
      {
         super();
         var_928 = param2 == null ? "" : param2.url;
         _type = param1;
         var_16 = new Sound(null,null);
         var_16.addEventListener(Event.ID3,loadEventHandler);
         var_16.addEventListener(Event.OPEN,loadEventHandler);
         var_16.addEventListener(Event.COMPLETE,loadEventHandler);
         var_16.addEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
         var_16.addEventListener(ProgressEvent.PROGRESS,loadEventHandler);
         if(param2 != null)
         {
            this.load(param2);
         }
      }
      
      public function get bytesTotal() : uint
      {
         return var_16.bytesTotal;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            var_16.removeEventListener(Event.ID3,loadEventHandler);
            var_16.removeEventListener(Event.OPEN,loadEventHandler);
            var_16.removeEventListener(Event.COMPLETE,loadEventHandler);
            var_16.removeEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
            var_16.removeEventListener(ProgressEvent.PROGRESS,loadEventHandler);
            var_16 = null;
            _type = null;
            var_928 = null;
            super.dispose();
         }
      }
      
      public function load(param1:URLRequest) : void
      {
         var_928 = param1.url;
         var_16.load(param1,null);
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
         return var_16;
      }
   }
}
