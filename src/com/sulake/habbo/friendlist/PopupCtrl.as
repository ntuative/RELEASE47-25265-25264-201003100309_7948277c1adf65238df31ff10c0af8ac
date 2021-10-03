package com.sulake.habbo.friendlist
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class PopupCtrl
   {
       
      
      private var _popupIndentLeft:int;
      
      private var var_356:Timer;
      
      private var var_1963:int;
      
      private var var_309:Timer;
      
      private var var_51:IWindowContainer;
      
      private var _friendList:HabboFriendList;
      
      private var var_1243:String;
      
      public function PopupCtrl(param1:HabboFriendList, param2:int, param3:int, param4:String)
      {
         var_356 = new Timer(500,1);
         var_309 = new Timer(100,1);
         super();
         _friendList = param1;
         var_1243 = param4;
         var_1963 = param2;
         _popupIndentLeft = param3;
         var_356.addEventListener(TimerEvent.TIMER,onDisplayTimer);
         var_309.addEventListener(TimerEvent.TIMER,onHideTimer);
      }
      
      public function refreshContent(param1:IWindowContainer) : void
      {
      }
      
      private function onDisplayTimer(param1:TimerEvent) : void
      {
         this.var_51.visible = true;
         this.var_51.activate();
      }
      
      private function refreshPopupArrows(param1:IWindowContainer, param2:Boolean) : void
      {
         refreshPopupArrow(param1,true,param2);
         refreshPopupArrow(param1,false,!param2);
      }
      
      public function showPopup(param1:IWindowContainer, param2:IWindow) : void
      {
         if(var_51 == null)
         {
            var_51 = IWindowContainer(_friendList.getXmlWindow(var_1243));
            var_51.visible = false;
            param1.addChild(var_51);
         }
         refreshContent(var_51);
         var_51.width = Util.getRightmostPoint(var_51) + 10;
         var_51.height = Util.getLowestPoint(var_51) + 10;
         var _loc3_:Point = new Point();
         var _loc4_:Point = new Point();
         param1.getGlobalPosition(_loc3_);
         param2.getGlobalPosition(_loc4_);
         var_51.x = _loc4_.x - _loc3_.x + var_1963 + param2.width;
         var_51.y = _loc4_.y - _loc3_.y - 0 + param2.height * 0.5;
         var _loc5_:Point = new Point();
         var_51.getGlobalPosition(_loc5_);
         if(_loc5_.x + var_51.width > var_51.desktop.width)
         {
            var_51.x = 0 + _loc4_.x - _loc3_.x + _popupIndentLeft;
            refreshPopupArrows(var_51,false);
         }
         else
         {
            refreshPopupArrows(var_51,true);
         }
         if(true)
         {
            var_356.reset();
            var_356.start();
         }
         var_309.reset();
      }
      
      private function onHideTimer(param1:TimerEvent) : void
      {
         if(var_51 != null)
         {
            var_51.visible = false;
         }
      }
      
      public function closePopup() : void
      {
         var_309.reset();
         var_356.reset();
         var_309.start();
      }
      
      private function refreshPopupArrow(param1:IWindowContainer, param2:Boolean, param3:Boolean) : void
      {
         var _loc4_:String = "popup_arrow_" + (!!param2 ? "left" : "right");
         var _loc5_:IBitmapWrapperWindow = IBitmapWrapperWindow(param1.findChildByName(_loc4_));
         if(!param3)
         {
            if(_loc5_ != null)
            {
               _loc5_.visible = false;
            }
         }
         else
         {
            if(_loc5_ == null)
            {
               _loc5_ = _friendList.getButton(_loc4_,_loc4_,null);
               _loc5_.setParamFlag(HabboWindowParam.const_70,false);
               param1.addChild(_loc5_);
            }
            _loc5_.visible = true;
            _loc5_.y = param1.height * 0.5 - _loc5_.height * 0.5;
            _loc5_.x = !!param2 ? int(1 - _loc5_.width) : int(param1.width - 1);
         }
      }
      
      public function get friendList() : HabboFriendList
      {
         return _friendList;
      }
   }
}
