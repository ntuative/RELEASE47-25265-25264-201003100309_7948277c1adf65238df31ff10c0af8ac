package com.sulake.habbo.toolbar
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.enum.WindowType;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   
   public class ToolbarIcon
   {
       
      
      private var var_474:ToolbarIconGroup;
      
      private var var_975:Boolean = false;
      
      private var var_1815:String;
      
      private var var_919:Number;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_977:String = "-1";
      
      private var _window:IBitmapWrapperWindow;
      
      private var var_36:String = "-1";
      
      private var var_97:IRegionWindow;
      
      private var _bitmapData:BitmapData;
      
      private var var_658:String;
      
      private var var_1816:int;
      
      private var var_657:Timer;
      
      private var var_1429:Array;
      
      private var var_976:ToolbarIconBouncer;
      
      private var _windowManager:IHabboWindowManager;
      
      private var _events:IEventDispatcher;
      
      private var var_2299:Array;
      
      private var var_258:ToolbarBarMenuAnimator;
      
      private var var_391:ToolbarIconAnimator;
      
      private var var_555:Array;
      
      private var var_809:Array;
      
      private var var_808:String = "-1";
      
      private var var_2363:Boolean = true;
      
      private var var_974:Array;
      
      private var var_1179:Timer;
      
      private var var_1814:int;
      
      private var var_85:Number = 0;
      
      private var _y:Number = 0;
      
      public function ToolbarIcon(param1:ToolbarIconGroup, param2:IHabboWindowManager, param3:IAssetLibrary, param4:String, param5:IEventDispatcher, param6:ToolbarBarMenuAnimator)
      {
         var_555 = new Array();
         var_809 = new Array();
         var_2299 = new Array();
         var_976 = new ToolbarIconBouncer(0.8,1);
         super();
         var_474 = param1;
         _windowManager = param2;
         _assetLibrary = param3;
         var_658 = param4;
         _events = param5;
         var_258 = param6;
         var_1179 = new Timer(40,40);
         var_1179.addEventListener(TimerEvent.TIMER,updateBouncer);
         var_97 = param2.createWindow("TOOLBAR_ICON_" + param4 + "_REGION","",WindowType.const_470,HabboWindowStyle.const_41,HabboWindowParam.const_40,new Rectangle(0,0,1,1),onMouseEvent) as IRegionWindow;
         var_97.background = true;
         var_97.alphaTreshold = 0;
         var_97.visible = false;
         _window = IBitmapWrapperWindow(param2.createWindow("TOOLBAR_ICON_" + param4,"",HabboWindowType.BITMAP_WRAPPER,HabboWindowStyle.const_41,HabboWindowParam.const_41,new Rectangle(0,0,1,1),onMouseEvent,0));
         var_97.addChild(_window);
         _window.addEventListener(WindowEvent.const_45,onWindowResized);
      }
      
      private function getStateObject(param1:String) : StateItem
      {
         return var_1429[var_974.indexOf(param1)];
      }
      
      public function get windowOffsetFromIcon() : Number
      {
         return var_1814;
      }
      
      public function get iconId() : String
      {
         return var_658;
      }
      
      private function onWindowResized(param1:WindowEvent) : void
      {
         updateRegion();
      }
      
      public function changePosition(param1:Number) : void
      {
         var_919 = param1;
         updateRegion();
      }
      
      public function setIcon(param1:Boolean = true) : void
      {
         exists = param1;
         setAnimator();
      }
      
      public function set state(param1:String) : void
      {
         var_36 = param1;
         exists = true;
         setAnimator();
         setTooltip();
      }
      
      private function updateRegion() : void
      {
         if(var_97 == null || _window == null)
         {
            return;
         }
         var_97.width = _window.width;
         var_97.height = _window.height;
         var _loc1_:Boolean = false;
         if(_loc1_)
         {
            var_85 = (0 - 0) / 2;
            _y = var_919 + (0 - 0) / 2;
         }
         else
         {
            var_85 = var_919 + (0 - 0) / 2;
            _y = (0 - 0) / 2;
         }
         var_97.x = var_85;
         var_97.y = _y;
      }
      
      public function dispose() : void
      {
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
         if(var_97 != null)
         {
            var_97.dispose();
            var_97 = null;
         }
         var_555 = null;
         var_809 = null;
         exists = false;
         _windowManager = null;
         _events = null;
         var_258 = null;
         var_391 = null;
         _bitmapData = null;
      }
      
      public function dockMenu(param1:String, param2:Array = null, param3:Boolean = false) : void
      {
         var _loc4_:* = null;
         if(var_555.indexOf(param1) < 0)
         {
            var_555.push(param1);
            _loc4_ = new MenuSettingsItem(param1,param2,param3);
            var_809.push(_loc4_);
         }
      }
      
      private function onMouseEvent(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc4_:* = null;
         if(!var_975)
         {
            return;
         }
         var _loc3_:StateItem = getCurrentStateObject();
         switch(param1.type)
         {
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK:
               if(var_258)
               {
                  var_258.repositionWindow(var_658,true);
               }
               if(_events != null)
               {
                  _loc4_ = new HabboToolbarEvent(HabboToolbarEvent.const_56);
                  _loc4_.iconId = var_658;
                  _events.dispatchEvent(_loc4_);
               }
               break;
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER:
               if(false)
               {
                  if(_loc3_.hasStateOver)
                  {
                     state = _loc3_.stateOver;
                  }
                  else
                  {
                     state = var_977;
                  }
               }
               break;
            case WindowMouseEvent.const_29:
               if(false)
               {
                  if(_loc3_.hasDefaultState)
                  {
                     state = _loc3_.defaultState;
                  }
                  else
                  {
                     state = var_808;
                  }
               }
         }
      }
      
      public function docksMenu(param1:String) : Boolean
      {
         return var_555.indexOf(param1) > -1;
      }
      
      public function menuLockedToIcon(param1:String) : Boolean
      {
         if(!docksMenu(param1))
         {
            return false;
         }
         var _loc2_:MenuSettingsItem = var_809[var_555.indexOf(param1)];
         return _loc2_.lockToIcon;
      }
      
      public function set exists(param1:Boolean) : void
      {
         var_975 = param1;
         if(var_97 != null)
         {
            var_97.visible = var_975;
         }
      }
      
      private function setTooltip() : void
      {
         if(var_97 == null)
         {
            return;
         }
         var _loc1_:StateItem = getCurrentStateObject();
         if(_loc1_ != null && _loc1_.tooltip != null)
         {
            var_97.toolTipCaption = "${toolbar.icon.tooltip." + _loc1_.tooltip + "}";
         }
         else
         {
            var_97.toolTipCaption = "${toolbar.icon.tooltip." + var_1815.toLowerCase() + "}";
         }
         var_97.toolTipDelay = 100;
      }
      
      public function animateWindowIn(param1:String, param2:IWindowContainer, param3:Number, param4:String, param5:Point) : void
      {
         if(var_258 != null)
         {
            var_258.animateWindowIn(this,param1,param2,var_658,param3,param4,getMenuYieldList(param1));
         }
      }
      
      private function updateAnimator(param1:Event) : void
      {
         if(var_391 != null && _window != null)
         {
            var_391.update(_window);
            if(var_391.hasNextState())
            {
               state = var_391.nextState;
            }
         }
      }
      
      public function defineFromXML(param1:XML) : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var_1429 = new Array();
         var_974 = new Array();
         var_1815 = param1.@id;
         var_1814 = int(param1.@window_offset_from_icon);
         var_1816 = int(param1.@window_margin);
         var _loc2_:XMLList = param1.elements("state");
         if(_loc2_.length() > 0)
         {
            if(param1.attribute("state_over").length() > 0)
            {
               var_977 = param1.@state_over;
            }
            if(param1.attribute("state_default").length() > 0)
            {
               var_808 = param1.@state_default;
            }
            _loc3_ = 0;
            while(_loc3_ < _loc2_.length())
            {
               _loc4_ = _loc2_[_loc3_];
               _loc5_ = new StateItem(_loc4_,param1.@id.toLowerCase());
               var_974.push(_loc5_.id);
               var_1429.push(_loc5_);
               if(_loc3_ == 0)
               {
                  if(var_977 == "-1")
                  {
                     var_977 = _loc5_.id;
                  }
                  if(var_808 == "-1")
                  {
                     var_808 = _loc5_.id;
                  }
               }
               _loc3_++;
            }
         }
         var_36 = var_808;
      }
      
      public function setIconBitmapData(param1:BitmapData = null) : void
      {
         exists = true;
         _bitmapData = param1;
         setAnimator();
      }
      
      public function hideWindow(param1:String, param2:IWindowContainer, param3:Number, param4:String) : void
      {
         if(var_258 != null)
         {
            var_258.hideWindow(param1,param2,var_658,param3);
         }
      }
      
      public function positionWindow(param1:String, param2:IWindowContainer, param3:Number, param4:String) : void
      {
         if(var_258 != null)
         {
            var_258.positionWindow(this,param1,param2,var_658,param3,getMenuYieldList(param1));
         }
      }
      
      public function animateWindowOut(param1:String, param2:IWindowContainer, param3:String) : void
      {
         if(var_258 != null)
         {
            var_258.animateWindowOut(this,param1,param2,param3);
         }
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get exists() : Boolean
      {
         return var_975;
      }
      
      private function updateBouncer(param1:Event) : void
      {
         if(var_976 != null && _window != null)
         {
            var_976.update();
            _window.y = var_976.location;
         }
      }
      
      private function setAnimator() : void
      {
         if(var_657 != null)
         {
            var_657.stop();
            var_657 = null;
         }
         var _loc1_:StateItem = getCurrentStateObject();
         if(_loc1_ != null && var_975)
         {
            if(_loc1_.frames == null)
            {
               return;
            }
            var_391 = new ToolbarIconAnimator(_loc1_,_assetLibrary,_window,var_85,_y,_bitmapData);
            if(false)
            {
               var_657 = new Timer(_loc1_.timer);
               var_657.addEventListener(TimerEvent.TIMER,updateAnimator);
               var_657.start();
            }
            if(_loc1_.bounce)
            {
               var_976.reset(-7);
               var_1179.reset();
               var_1179.start();
            }
         }
         else
         {
            var_391 = null;
            _window.bitmap = null;
         }
      }
      
      public function get windowMargin() : Number
      {
         return var_1816 + var_474.windowMargin;
      }
      
      private function getCurrentStateObject() : StateItem
      {
         return getStateObject(var_36);
      }
      
      public function get window() : IWindow
      {
         return var_97;
      }
      
      public function get x() : Number
      {
         return var_85;
      }
      
      private function getMenuYieldList(param1:String) : Array
      {
         if(!docksMenu(param1))
         {
            return null;
         }
         var _loc2_:MenuSettingsItem = var_809[var_555.indexOf(param1)];
         return _loc2_.yieldList;
      }
      
      public function get group() : ToolbarIconGroup
      {
         return var_474;
      }
   }
}
