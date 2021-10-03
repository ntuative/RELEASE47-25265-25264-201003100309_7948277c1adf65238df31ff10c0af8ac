package com.sulake.habbo.widget.friendrequest
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetFriendRequestUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserLocationUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetFriendRequestMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetGetUserLocationMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.events.IEventDispatcher;
   
   public class FriendRequestWidget extends RoomWidgetBase implements IUpdateReceiver
   {
       
      
      private var var_237:Map;
      
      private var _isDisposed:Boolean = false;
      
      private var var_24:Component;
      
      public function FriendRequestWidget(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboLocalizationManager, param4:Component)
      {
         super(param1,param2,param3);
         var_24 = param4;
         var_237 = new Map();
      }
      
      public function acceptRequest(param1:int) : void
      {
         if(!messageListener)
         {
            return;
         }
         messageListener.processWidgetMessage(new RoomWidgetFriendRequestMessage(RoomWidgetFriendRequestMessage.const_590,param1));
         removeRequest(param1);
      }
      
      public function ignoreRequest(param1:int) : void
      {
         removeRequest(param1);
      }
      
      public function get disposed() : Boolean
      {
         return _isDisposed;
      }
      
      public function checkUpdateNeed() : void
      {
         if(!var_24)
         {
            return;
         }
         if(var_237 && false)
         {
            var_24.registerUpdateReceiver(this,10);
         }
         else
         {
            var_24.removeUpdateReceiver(this);
         }
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(!var_237)
         {
            return;
         }
         for each(_loc2_ in var_237)
         {
            if(_loc2_)
            {
               _loc3_ = messageListener.processWidgetMessage(new RoomWidgetGetUserLocationMessage(_loc2_.userId)) as RoomWidgetUserLocationUpdateEvent;
               if(_loc3_)
               {
                  _loc2_.targetRect = _loc3_.rectangle;
               }
            }
         }
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetFriendRequestUpdateEvent.const_379,eventHandler);
         param1.removeEventListener(RoomWidgetFriendRequestUpdateEvent.const_438,eventHandler);
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(_isDisposed)
         {
            return;
         }
         super.dispose();
         if(var_24)
         {
            var_24.removeUpdateReceiver(this);
            var_24 = null;
         }
         if(var_237)
         {
            for each(_loc1_ in var_237)
            {
               _loc1_.dispose();
               _loc1_ = null;
            }
            var_237.dispose();
            var_237 = null;
         }
         _isDisposed = true;
      }
      
      private function eventHandler(param1:RoomWidgetFriendRequestUpdateEvent) : void
      {
         if(!param1)
         {
            return;
         }
         switch(param1.type)
         {
            case RoomWidgetFriendRequestUpdateEvent.const_379:
               var_237.add(param1.requestId,new FriendRequestDialog(this,param1.requestId,param1.userId,param1.userName));
               break;
            case RoomWidgetFriendRequestUpdateEvent.const_438:
               removeRequest(param1.requestId);
         }
         checkUpdateNeed();
      }
      
      private function removeRequest(param1:int) : void
      {
         if(!var_237)
         {
            return;
         }
         var _loc2_:FriendRequestDialog = var_237.getValue(param1) as FriendRequestDialog;
         if(!_loc2_)
         {
            return;
         }
         _loc2_.dispose();
         var_237.remove(param1);
         checkUpdateNeed();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(!param1)
         {
            return;
         }
         param1.addEventListener(RoomWidgetFriendRequestUpdateEvent.const_379,eventHandler);
         param1.addEventListener(RoomWidgetFriendRequestUpdateEvent.const_438,eventHandler);
         super.registerUpdateEvents(param1);
      }
      
      public function declineRequest(param1:int) : void
      {
         if(!messageListener)
         {
            return;
         }
         messageListener.processWidgetMessage(new RoomWidgetFriendRequestMessage(RoomWidgetFriendRequestMessage.const_573,param1));
         removeRequest(param1);
      }
   }
}
