package com.sulake.core.utils
{
   import deng.fzip.FZip;
   import flash.display.LoaderInfo;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.net.URLRequest;
   import flash.system.LoaderContext;
   import flash.utils.getQualifiedClassName;
   
   public class ZipLoader extends LibraryLoader
   {
       
      
      private var var_434:FZip;
      
      private var var_1317:Array;
      
      private var var_2181:uint = 0;
      
      private var var_897:int = 0;
      
      private var var_2379:Array;
      
      public function ZipLoader(param1:Boolean)
      {
         super(param1);
         var_1317 = new Array();
      }
      
      private function onIOError(param1:IOErrorEvent) : void
      {
         Logger.log(param1.text);
         dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,0));
      }
      
      public function get resources() : Array
      {
         return var_1317;
      }
      
      private function onLoaderComplete(param1:Event) : void
      {
         var _loc2_:LoaderInfo = param1.target as LoaderInfo;
         var _loc3_:String = getQualifiedClassName(var_16.content);
         var_1317.push(var_16.contentLoaderInfo.applicationDomain.getDefinition(_loc3_));
         ++var_897;
         if(var_1317.length == var_2181)
         {
            var_16.contentLoaderInfo.removeEventListener(Event.COMPLETE,onLoaderComplete);
            var_16.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,onIOError);
            dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,0));
         }
         else
         {
            var_16.loadBytes(var_434.getFileAt(var_897).content);
         }
      }
      
      override public function load(param1:URLRequest, param2:LoaderContext = null, param3:int = 1) : void
      {
         var_323 = param1;
         if(var_434)
         {
            var_434.close();
         }
         var_434 = new FZip();
         var_434.addEventListener(Event.COMPLETE,onComplete);
         var_434.addEventListener(IOErrorEvent.IO_ERROR,onIOError);
         var_434.addEventListener(ProgressEvent.PROGRESS,onProgress);
         var_434.load(var_323);
      }
      
      private function onProgress(param1:ProgressEvent) : void
      {
         dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_PROGRESS,0));
      }
      
      private function onComplete(param1:Event) : void
      {
         var_897 = 0;
         var_2181 = var_434.getFileCount();
         removeEventListeners();
         var_16.contentLoaderInfo.addEventListener(Event.COMPLETE,onLoaderComplete);
         var_16.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,onIOError);
         var_16.loadBytes(var_434.getFileAt(var_897).content);
      }
   }
}
