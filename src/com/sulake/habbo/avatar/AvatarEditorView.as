package com.sulake.habbo.avatar
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITabSelectorWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.catalog.enum.CatalogPageName;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class AvatarEditorView
   {
      
      public static var var_1590:IWindowContainer;
      
      public static var var_1365:IWindowContainer;
      
      public static var var_2257:int = 6710886;
       
      
      private var var_1488:Boolean = true;
      
      private var var_342:Timer;
      
      private var var_1489:ITabSelectorWindow;
      
      private var _window:IWindowContainer;
      
      private var var_490:IFrameWindow;
      
      private var _catalog:IHabboCatalog;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_695:String;
      
      private var var_12:HabboAvatarEditor;
      
      private var var_1951:Number = 0;
      
      public function AvatarEditorView(param1:HabboAvatarEditor, param2:IHabboWindowManager, param3:IHabboCatalog)
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         super();
         var_12 = param1;
         _windowManager = param2;
         _catalog = param3;
         createWindow();
         if(var_1365 == null)
         {
            _loc4_ = var_12.assets.getAssetByName("AvatarEditorThumb") as XmlAsset;
            var_1365 = var_12.windowManager.buildFromXML(_loc4_.content as XML) as IWindowContainer;
         }
         if(var_1590 == null)
         {
            _loc5_ = var_12.assets.getAssetByName("color_chooser_cell") as XmlAsset;
            var_1590 = var_12.windowManager.buildFromXML(_loc5_.content as XML) as IWindowContainer;
         }
         var_342 = new Timer(1000);
         var_342.addEventListener(TimerEvent.TIMER,onUpdate);
      }
      
      public function windowEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         if(param1.type == WindowEvent.const_53)
         {
            _loc3_ = param2.name;
            Logger.log("Select tab: " + _loc3_);
            if(_loc3_ != var_695)
            {
               var_12.toggleAvatarEditorPage(_loc3_);
            }
         }
         else if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            switch(param2.name)
            {
               case "save":
                  if(var_12.hasInvalidClubItems())
                  {
                     displayStripClubDialog();
                     return;
                  }
                  if(false)
                  {
                     var_12.handler.saveCurrentSelection();
                  }
                  var_1951 = new Date().valueOf();
                  var_1488 = false;
                  var_342.start();
                  _window.findChildByName("save").disable();
                  var_12.close();
                  break;
               case "cancel":
                  var_12.close();
            }
            if(param2.name == "header_button_close")
            {
               hide();
            }
         }
      }
      
      public function hide() : void
      {
         _window.visible = false;
      }
      
      private function displayStripClubDialog() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(!var_490)
         {
            _loc1_ = var_12.assets.getAssetByName("StripClubItemsInfo");
            if(!_loc1_)
            {
               throw new Error("Failed to initialize strip club info dialog; missing asset!");
            }
            _loc2_ = _loc1_.content as XML;
            var_490 = _windowManager.buildFromXML(_loc2_,2) as IFrameWindow;
            var_490.procedure = stripClubDialogEventProc;
            var_490.center();
         }
         else
         {
            var_490.visible = true;
            var_490.center();
         }
      }
      
      private function onUpdate(param1:Event = null) : void
      {
         if(canChangeOutfit())
         {
            var_1488 = canChangeOutfit();
            var_342.stop();
            if(_window)
            {
               _window.findChildByName("save").enable();
            }
         }
      }
      
      private function canChangeOutfit() : Boolean
      {
         var _loc1_:Number = new Date().valueOf();
         return _loc1_ - var_1951 > 5000;
      }
      
      private function createWindow() : void
      {
         if(_window == null)
         {
            _window = _windowManager.buildFromXML((var_12.assets.getAssetByName("AvatarEditor") as XmlAsset).content as XML) as IWindowContainer;
         }
         _window.procedure = windowEventProc;
         var_1489 = _window.findChildByName("mainTabs") as ITabSelectorWindow;
         attachImages();
         updateAvatar();
      }
      
      public function updateAvatar() : void
      {
         var _loc1_:IWindowContainer = var_12.figureData.view.window;
         var _loc2_:IWindowContainer = _window.findChildByName("figureContainer") as IWindowContainer;
         if(_loc2_.numChildren > 0)
         {
            _loc2_.removeChildAt(0);
         }
         if(_loc2_ != null)
         {
            _loc2_.addChild(_loc1_);
         }
         if(var_695 != null)
         {
            toggleCategoryView(var_695,true);
         }
      }
      
      public function toggle() : void
      {
         _window.visible = true;
         if(false)
         {
            var_342.start();
         }
         else
         {
            var_342.stop();
         }
      }
      
      public function dispose() : void
      {
         if(var_342 != null)
         {
            var_342.stop();
            var_342.removeEventListener(TimerEvent.TIMER,onUpdate);
            var_342 = null;
         }
      }
      
      private function setViewToCategory(param1:String) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(param1 == "")
         {
            return;
         }
         var _loc2_:IWindowContainer = _window.findChildByName("contentArea") as IWindowContainer;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:IWindowContainer = _loc2_.getChildAt(0) as IWindowContainer;
         _loc2_.removeChild(_loc3_);
         _loc2_.invalidate();
         var _loc4_:IWindowContainer = var_12.getCategoryWindowContainer(param1);
         if(_loc4_ == null)
         {
            return;
         }
         _loc4_.visible = true;
         _loc2_.addChild(_loc4_);
         var_695 = param1;
         var_1489.setSelected(var_1489.getSelectableByName(param1));
         _window.invalidate();
      }
      
      private function stripClubDialogEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            switch(param2.name)
            {
               case "header_button_close":
                  var_490.visible = false;
                  break;
               case "strip_button_ok":
                  if(var_12)
                  {
                     var_12.stripClubItems();
                  }
                  var_490.visible = false;
                  break;
               case "strip_button_club_info":
                  openCatalogClubPage();
                  var_490.visible = false;
            }
         }
      }
      
      private function attachImages() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc1_:* = ["generic","head","torso","legs","wardrobe"];
         for each(_loc2_ in _loc1_)
         {
            _loc3_ = (_window as IWindowContainer).findChildByName(_loc2_) as IWindowContainer;
            _loc4_ = _loc3_.findChildByTag("BITMAP") as IBitmapWrapperWindow;
            if(_loc4_ != null)
            {
               _loc5_ = var_12.assets.getAssetByName("ae_tabs_" + _loc2_) as BitmapDataAsset;
               _loc6_ = (_loc5_.content as BitmapData).clone();
               _loc4_.bitmap = new BitmapData(_loc4_.width,_loc4_.height,true,16777215);
               _loc7_ = (_loc4_.width - _loc6_.width) / 2;
               _loc8_ = (_loc4_.height - _loc6_.height) / 2;
               _loc4_.bitmap.copyPixels(_loc6_,_loc6_.rect,new Point(_loc7_,_loc8_));
            }
         }
      }
      
      private function openCatalogClubPage() : void
      {
         if(_catalog)
         {
            _catalog.openCatalogPage(CatalogPageName.const_242,true);
         }
      }
      
      public function get window() : IWindowContainer
      {
         return _window;
      }
      
      public function toggleCategoryView(param1:String, param2:Boolean = false) : void
      {
         if(!param2)
         {
         }
         setViewToCategory(param1);
      }
      
      public function show() : void
      {
         _window.visible = true;
      }
   }
}
