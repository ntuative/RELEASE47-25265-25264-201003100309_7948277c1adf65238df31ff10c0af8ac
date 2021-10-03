package com.sulake.core.window.components
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.WindowContext;
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.enum.WindowType;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.events.WindowNotifyEvent;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   
   public class DropMenuController extends InteractiveController implements IDropMenuWindow
   {
      
      protected static const ITEMLIST_NAME:String = "_DROPMENU_ITEMLIST";
      
      protected static const const_339:String = "_DROPMENU_TITLETEXT";
       
      
      private var var_124:DropMenuController;
      
      private var var_467:int = -1;
      
      private var var_468:Array;
      
      private var var_553:Boolean = false;
      
      public function DropMenuController(param1:String, param2:uint, param3:uint, param4:uint, param5:WindowContext, param6:Rectangle, param7:IWindow, param8:Function, param9:Array = null, param10:Array = null, param11:uint = 0)
      {
         var_468 = new Array();
         super(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
      }
      
      private function getSubMenu() : DropMenuController
      {
         var _loc1_:Rectangle = new Rectangle();
         getGlobalRectangle(_loc1_);
         if(var_124 == null || false)
         {
            var_124 = context.create(name + "::submenu","",WindowType.const_372,var_81,0 | 0,_loc1_,subMenuEventProc,null,0,null,[WindowController.EXCLUDE_CHILD_TAG]) as DropMenuController;
         }
         else
         {
            var_124.setGlobalRectangle(_loc1_);
         }
         var_124.activate();
         return var_124;
      }
      
      private function fitToDesktop(param1:IWindow) : void
      {
         var _loc2_:Rectangle = new Rectangle();
         param1.getGlobalRectangle(_loc2_);
         if(_loc2_.bottom > desktop.rectangle.bottom)
         {
            param1.offset(0,desktop.rectangle.bottom - _loc2_.bottom);
         }
         else if(_loc2_.top < desktop.rectangle.top)
         {
            param1.offset(0,_loc2_.top - desktop.rectangle.top);
         }
         if(_loc2_.left < desktop.rectangle.left)
         {
            param1.offset(_loc2_.left - desktop.rectangle.left,0);
         }
         else if(_loc2_.right > desktop.rectangle.right)
         {
            param1.offset(desktop.rectangle.right - _loc2_.right,0);
         }
      }
      
      private function subMenuEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.const_96)
         {
            if(param2 is IDropMenuItemWindow)
            {
               if(param2.testStateFlag(WindowState.const_78))
               {
                  selection = getMenuItemIndex(param2 as IDropMenuItemWindow);
               }
            }
         }
         else if(param1.type == WindowMouseEvent.const_51)
         {
            if(param2 is IDropMenuItemWindow)
            {
               selection = getMenuItemIndex(param2 as IDropMenuItemWindow);
            }
         }
         else if(param1.type == WindowEvent.const_792)
         {
            if(param2 == var_124)
            {
               closeMenuView();
            }
         }
      }
      
      protected function populateMenuItemContainer(param1:Array, param2:DropMenuController, param3:Function) : void
      {
         var _loc6_:* = null;
         var _loc4_:IItemListWindow = param2.getChildByName(DropMenuController.ITEMLIST_NAME) as IItemListWindow;
         _loc4_.autoArrangeItems = false;
         var _loc5_:uint = param1.length;
         var _loc7_:int = _loc4_.width;
         var _loc8_:int = _loc7_;
         var _loc9_:int = 0;
         while(_loc9_ < _loc5_)
         {
            _loc6_ = context.create(name + "::menu_item_" + _loc9_,param1[_loc9_],WindowType.const_425,var_81,0 | 0 | 0 | 0 | 0,null,param3,null,_loc9_,null,["_EXCLUDE"]) as DropMenuItemController;
            _loc8_ = Math.max(_loc8_,_loc6_.width);
            _loc6_.width = _loc7_;
            _loc4_.addListItem(_loc6_);
            _loc9_++;
         }
         if(_loc8_ > _loc7_)
         {
            param2.width += _loc8_ - _loc4_.width;
            _loc9_ = 0;
            while(_loc9_ < _loc5_)
            {
               _loc4_.getListItemAt(_loc9_).width = _loc8_;
               _loc9_++;
            }
         }
         var _loc10_:IWindow = context.create(name + "::padding","",WindowType.const_310,var_81,0 | 0 | 0 | 0,new Rectangle(0,0,1,2),null,null,0,null,["_EXCLUDE"]);
         _loc4_.addListItem(_loc10_);
         _loc4_.autoArrangeItems = true;
         fitToDesktop(param2);
         param2.activate();
         if(var_467 > -1 && _loc5_)
         {
            _loc4_.getListItemAt(var_467).setStateFlag(WindowState.const_46,true);
         }
      }
      
      protected function openMenuView() : void
      {
         if(!var_553)
         {
            if(open())
            {
               if(false)
               {
                  populateMenuItemContainer(var_468,getSubMenu(),subMenuEventProc);
                  var_553 = true;
               }
            }
         }
      }
      
      public function set selection(param1:int) : void
      {
         if(param1 > -1)
         {
            throw new Error("Menu selection index out of range!");
         }
         var _loc2_:WindowNotifyEvent = new WindowNotifyEvent(WindowNotifyEvent.const_476,this,null,true);
         update(this,_loc2_);
         if(!_loc2_.isWindowOperationPrevented())
         {
            var_467 = param1;
            closeMenuView();
            update(this,new WindowNotifyEvent(WindowNotifyEvent.const_320,this,null));
         }
      }
      
      override public function set caption(param1:String) : void
      {
         super.caption = param1;
         getTitleText().text = param1;
      }
      
      private function menuItemEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = 0;
         if(param1.type == WindowMouseEvent.const_51)
         {
            if(param2 is IDropMenuItemWindow)
            {
               _loc3_ = uint(getMenuItemIndex(param2 as IDropMenuItemWindow));
               selection = _loc3_;
            }
         }
      }
      
      override public function dispose() : void
      {
         if(var_124 != null && true)
         {
            var_124.destroy();
            var_124 = null;
         }
         super.dispose();
      }
      
      override public function update(param1:WindowController, param2:Event) : Boolean
      {
         switch(param2.type)
         {
            case MouseEvent.MOUSE_DOWN:
               if(!var_553)
               {
                  openMenuView();
               }
         }
         return super.update(param1,param2);
      }
      
      public function getMenuItemIndex(param1:IDropMenuItemWindow) : int
      {
         var _loc2_:int = -1;
         var _loc3_:IItemListWindow = getChildByName(DropMenuController.ITEMLIST_NAME) as IItemListWindow;
         if(_loc3_ != null)
         {
            _loc2_ = _loc3_.getListItemIndex(param1);
         }
         if(_loc2_ == -1)
         {
            if(var_124 != null)
            {
               _loc2_ = var_124.getMenuItemIndex(param1);
            }
         }
         return _loc2_;
      }
      
      public function get selection() : int
      {
         return var_467;
      }
      
      private function getTitleText() : ITextWindow
      {
         return getChildByName(DropMenuController.const_339) as ITextWindow;
      }
      
      public function populate(param1:Array) : void
      {
         var_467 = -1;
         while(false)
         {
            var_468.pop();
         }
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            var_468.push(param1[_loc2_]);
            _loc2_++;
         }
         var_553 = true;
         closeMenuView();
      }
      
      override public function activate() : Boolean
      {
         if(var_553)
         {
            return true;
         }
         return super.activate();
      }
      
      protected function closeMenuView() : void
      {
         if(close())
         {
            if(var_124 != null)
            {
               var_124.destroy();
               var_124 = null;
            }
            var_553 = false;
            getTitleText().text = var_467 < var_468.length && var_467 > -1 ? "null" : caption;
         }
      }
   }
}
