package com.sulake.habbo.inventory
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.ICoreWindowManager;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITabContextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.inventory.enum.InventoryCategory;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   
   public class InventoryMainView
   {
       
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_694:String;
      
      private var var_2315:IWindowContainer;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_14:IFrameWindow;
      
      private var var_695:String;
      
      private var var_850:Boolean = true;
      
      private var var_1237:IWindowContainer;
      
      private var var_12:HabboInventory;
      
      private var var_194:IHabboToolbar;
      
      public function InventoryMainView(param1:HabboInventory, param2:IHabboWindowManager, param3:IAssetLibrary)
      {
         super();
         var_12 = param1;
         _assetLibrary = param3;
         _windowManager = param2;
         var _loc4_:IAsset = _assetLibrary.getAssetByName("inventory_xml");
         var _loc5_:XmlAsset = XmlAsset(_loc4_);
         var _loc6_:ICoreWindowManager = ICoreWindowManager(_windowManager);
         var_14 = _loc6_.buildFromXML(XML(_loc5_.content)) as IFrameWindow;
         if(var_14 != null)
         {
            var_14.visible = false;
            var_14.procedure = windowEventProc;
            setCreditBalance(0);
            setPixelBalance(0);
            setClubStatus(0,0);
         }
      }
      
      public function windowEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         if(param1.type == WindowEvent.const_53)
         {
            _loc3_ = ITabContextWindow(param2).selector.getSelected().name;
            if(_loc3_ != var_695)
            {
               var_12.toggleInventoryPage(_loc3_);
            }
         }
         else if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            if(param2.name == "header_button_close")
            {
               hideInventory();
            }
         }
      }
      
      public function hideInventory() : void
      {
         var_12.closingInventoryView();
         var _loc1_:IWindow = getWindow();
         if(_loc1_ == null)
         {
            return;
         }
         _loc1_.visible = false;
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
         var_12.checkCategoryInitilization(param1);
         var _loc2_:ITabContextWindow = var_14.findChildByName("contentArea") as ITabContextWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.container.removeChild(var_1237);
         _loc2_.invalidate();
         var _loc3_:IWindowContainer = var_12.getCategoryWindowContainer(param1);
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.visible = true;
         _loc2_.container.addChild(_loc3_);
         var_1237 = _loc3_;
         var_695 = param1;
         _loc2_.selector.setSelected(_loc2_.selector.getSelectableByName(param1));
      }
      
      private function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(param1.type == HabboToolbarEvent.const_87)
         {
         }
         if(param1.iconId != HabboToolbarIconEnum.INVENTORY)
         {
            return;
         }
         if(param1.type == HabboToolbarEvent.const_56)
         {
            if(var_695 == InventoryCategory.const_140)
            {
               toggleCategoryView(InventoryCategory.const_140);
            }
            else if(var_695 == InventoryCategory.const_74)
            {
               toggleCategoryView(InventoryCategory.const_74);
            }
            else if(var_12 != null)
            {
               var_12.toggleInventoryPage(InventoryCategory.const_74);
            }
         }
      }
      
      public function toggleSubCategoryView(param1:String, param2:Boolean = true) : void
      {
         var _loc3_:IWindow = getWindow();
         if(_loc3_ == null)
         {
            return;
         }
         if(_loc3_.visible)
         {
            if(var_694 == param1)
            {
               if(param2)
               {
                  _loc3_.visible = false;
               }
            }
            else
            {
               setSubViewToCategory(param1);
            }
         }
         else
         {
            _loc3_.visible = true;
            if(param1 != var_694)
            {
               setSubViewToCategory(param1);
            }
            if(var_194 != null && var_850)
            {
               var_194.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_48,HabboToolbarIconEnum.INVENTORY,_loc3_ as IWindowContainer));
            }
         }
      }
      
      public function setClubStatus(param1:int, param2:int) : void
      {
         _windowManager.registerLocalizationParameter("inventory.purse.clubdays","months",String(param1));
         _windowManager.registerLocalizationParameter("inventory.purse.clubdays","days",String(param2));
      }
      
      public function updateSubCategoryView() : void
      {
         if(var_694 == null)
         {
            return;
         }
         setSubViewToCategory(var_694);
      }
      
      public function dispose() : void
      {
         var_12 = null;
         var_14 = null;
         var_1237 = null;
         var_194 = null;
         _windowManager = null;
      }
      
      public function setCreditBalance(param1:int) : void
      {
         _windowManager.registerLocalizationParameter("inventory.purse.creditbalance","balance",String(param1));
      }
      
      public function getWindow() : IFrameWindow
      {
         return var_14;
      }
      
      public function setHabboToolbarIcon() : void
      {
         if(var_194 != null)
         {
            var_194.events.dispatchEvent(new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_115,HabboToolbarIconEnum.INVENTORY));
         }
      }
      
      private function setSubViewToCategory(param1:String) : void
      {
         if(param1 == null || param1 == "")
         {
            return;
         }
         var_12.checkCategoryInitilization(param1);
         var _loc2_:IWindowContainer = var_14.findChildByName("subContentArea") as IWindowContainer;
         while(_loc2_.numChildren > 0)
         {
            _loc2_.removeChildAt(0);
         }
         var _loc3_:IWindowContainer = var_12.getCategorySubWindowContainer(param1);
         if(_loc3_ != null)
         {
            _loc2_.visible = true;
            _loc3_.visible = true;
            _loc2_.height = _loc3_.height;
            _loc2_.addChild(_loc3_);
         }
         else
         {
            _loc2_.visible = false;
            _loc2_.height = 0;
         }
         var_14.resizeToFitContent();
         var_2315 = _loc3_;
         var_694 = param1;
         if(var_194 != null)
         {
            var_194.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_499,HabboToolbarIconEnum.INVENTORY,var_14 as IWindowContainer));
         }
      }
      
      public function showInventory() : void
      {
         var _loc1_:IWindow = getWindow();
         if(_loc1_ == null)
         {
            return;
         }
         _loc1_.visible = true;
         if(var_194 != null && var_850)
         {
            var_194.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_48,HabboToolbarIconEnum.INVENTORY,_loc1_ as IWindowContainer));
            var_850 = false;
         }
         var_12.inventoryViewOpened(var_694);
      }
      
      public function get isVisible() : Boolean
      {
         return !!var_14 ? false : false;
      }
      
      public function getCategoryViewId() : String
      {
         return var_695;
      }
      
      public function getSubCategoryViewId() : String
      {
         return var_694;
      }
      
      public function setToolbar(param1:IHabboToolbar) : void
      {
         var_194 = param1;
         var_194.events.addEventListener(HabboToolbarEvent.const_87,onHabboToolbarEvent);
         var_194.events.addEventListener(HabboToolbarEvent.const_56,onHabboToolbarEvent);
      }
      
      public function toggleCategoryView(param1:String, param2:Boolean = true) : void
      {
         var _loc3_:IWindow = getWindow();
         if(_loc3_ == null)
         {
            return;
         }
         if(_loc3_.visible)
         {
            if(var_695 == param1)
            {
               if(param2)
               {
                  _loc3_.visible = false;
               }
            }
            else
            {
               setViewToCategory(param1);
            }
         }
         else
         {
            _loc3_.visible = true;
            _loc3_.activate();
            if(param1 != var_695 || !var_12.isInventoryCategoryInit(param1))
            {
               setViewToCategory(param1);
            }
            if(var_194 != null && var_850)
            {
               var_194.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_48,HabboToolbarIconEnum.INVENTORY,_loc3_ as IWindowContainer));
               var_850 = false;
            }
            var_12.inventoryViewOpened(param1);
         }
      }
      
      public function setPixelBalance(param1:int) : void
      {
         _windowManager.registerLocalizationParameter("inventory.purse.pixelbalance","balance",String(param1));
      }
   }
}
