package com.sulake.habbo.ui
{
   import com.sulake.habbo.catalog.enum.CatalogPageName;
   import com.sulake.habbo.session.events.RoomSessionQueueEvent;
   import com.sulake.habbo.widget.RoomWidgetEnum;
   import com.sulake.habbo.widget.events.RoomWidgetRoomQueueUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetRoomQueueMessage;
   import flash.events.Event;
   
   public class RoomQueueWidgetHandler implements IRoomWidgetHandler
   {
       
      
      private var _container:IRoomWidgetHandlerContainer = null;
      
      private var _isDisposed:Boolean = false;
      
      public function RoomQueueWidgetHandler()
      {
         super();
      }
      
      public function get type() : String
      {
         return RoomWidgetEnum.const_296;
      }
      
      public function get disposed() : Boolean
      {
         return _isDisposed;
      }
      
      public function set container(param1:IRoomWidgetHandlerContainer) : void
      {
         _container = param1;
      }
      
      public function processEvent(param1:Event) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:Boolean = false;
         var _loc5_:Boolean = false;
         var _loc6_:* = false;
         var _loc7_:* = null;
         var _loc8_:int = 0;
         var _loc9_:Boolean = false;
         var _loc10_:* = null;
         if(_container == null || true)
         {
            return;
         }
         switch(param1.type)
         {
            case RoomSessionQueueEvent.const_377:
               _loc2_ = param1 as RoomSessionQueueEvent;
               if(_loc2_ == null)
               {
                  return;
               }
               switch(_loc2_.queueSetTarget)
               {
                  case RoomSessionQueueEvent.const_813:
                     _loc3_ = "null";
                     break;
                  case RoomSessionQueueEvent.const_980:
                     _loc3_ = "null";
               }
               if(_loc3_ == null)
               {
                  return;
               }
               _loc4_ = _container.sessionDataManager.hasUserRight("fuse_room_queue_default");
               _loc5_ = _container.sessionDataManager.hasUserRight("fuse_room_queue_club");
               _loc6_ = true;
               if(false)
               {
                  _loc6_ = _container.inventory.clubDays > 0;
               }
               _loc7_ = _loc2_.queueTypes;
               _loc9_ = false;
               if(_loc7_.length > 1)
               {
                  if(_loc6_ && _loc2_.queueTypes.indexOf(RoomSessionQueueEvent.const_848) != -1)
                  {
                     _loc8_ = _loc2_.getQueueSize(RoomSessionQueueEvent.const_848) + 1;
                     _loc9_ = true;
                  }
                  else
                  {
                     _loc8_ = _loc2_.getQueueSize(RoomSessionQueueEvent.const_1327) + 1;
                  }
               }
               else
               {
                  _loc8_ = _loc2_.getQueueSize(_loc7_[0]) + 1;
               }
               _loc10_ = new RoomWidgetRoomQueueUpdateEvent(_loc3_,_loc8_,_loc6_,_loc2_.isActive,_loc9_);
               _container.events.dispatchEvent(_loc10_);
               break;
         }
      }
      
      public function getWidgetMessages() : Array
      {
         var _loc1_:* = [];
         _loc1_.push(RoomWidgetRoomQueueMessage.const_565);
         _loc1_.push(RoomWidgetRoomQueueMessage.CHANGE_TO_SPECTATOR_QUEUE);
         _loc1_.push(RoomWidgetRoomQueueMessage.const_513);
         _loc1_.push(RoomWidgetRoomQueueMessage.const_694);
         return _loc1_;
      }
      
      public function update() : void
      {
      }
      
      public function processWidgetMessage(param1:RoomWidgetMessage) : RoomWidgetUpdateEvent
      {
         if(_container == null || true)
         {
            return null;
         }
         var _loc2_:RoomWidgetRoomQueueMessage = param1 as RoomWidgetRoomQueueMessage;
         if(_loc2_ == null)
         {
            return null;
         }
         switch(param1.type)
         {
            case RoomWidgetRoomQueueMessage.const_565:
               _container.roomSession.quit();
               break;
            case RoomWidgetRoomQueueMessage.CHANGE_TO_SPECTATOR_QUEUE:
               _container.roomSession.changeQueue(RoomSessionQueueEvent.const_980);
               break;
            case RoomWidgetRoomQueueMessage.const_513:
               _container.roomSession.changeQueue(RoomSessionQueueEvent.const_813);
               break;
            case RoomWidgetRoomQueueMessage.const_694:
               if(false)
               {
                  _container.catalog.openCatalogPage(CatalogPageName.const_242,true);
               }
         }
         return null;
      }
      
      public function getProcessedEvents() : Array
      {
         return [RoomSessionQueueEvent.const_377];
      }
      
      public function dispose() : void
      {
         _isDisposed = true;
         _container = null;
      }
   }
}
