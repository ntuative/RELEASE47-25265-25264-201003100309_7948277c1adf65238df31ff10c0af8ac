package com.sulake.habbo.navigator.inroom
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.outgoing.navigator.AddFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.CanCreateEventMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.DeleteFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RateFlatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.UpdateNavigatorSettingsMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.SimpleAlertView;
   import com.sulake.habbo.navigator.TagRenderer;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.events.HabboRoomSettingsTrackingEvent;
   import com.sulake.habbo.navigator.roomsettings.IRoomSettingsCtrlOwner;
   import com.sulake.habbo.navigator.roomsettings.RoomSettingsCtrl;
   import com.sulake.habbo.navigator.roomthumbnails.RoomThumbnailCtrl;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class RoomInfoViewCtrl implements IRoomSettingsCtrlOwner
   {
       
      
      private var var_740:IWindowContainer;
      
      private var var_1085:ITextWindow;
      
      private var var_205:RoomSettingsCtrl;
      
      private var var_1340:IContainerButtonWindow;
      
      private var _window:IWindowContainer;
      
      private var _hideInfoTimer:Timer;
      
      private var var_1338:ITextWindow;
      
      private var var_363:IWindowContainer;
      
      private var var_2228:IWindowContainer;
      
      private var var_2226:ITextWindow;
      
      private var var_912:IWindowContainer;
      
      private var var_1571:IButtonWindow;
      
      private var _ownerName:ITextWindow;
      
      private var var_668:ITextWindow;
      
      private var var_1572:IWindowContainer;
      
      private var var_1336:IWindowContainer;
      
      private var var_914:ITextWindow;
      
      private var var_1084:ITextFieldWindow;
      
      private var var_317:IWindowContainer;
      
      private var var_911:ITextWindow;
      
      private var var_1574:IButtonWindow;
      
      private var var_1083:ITextWindow;
      
      private var var_2333:int;
      
      private var var_1342:IContainerButtonWindow;
      
      private var var_913:IWindowContainer;
      
      private var var_1339:ITextWindow;
      
      private var var_1337:IContainerButtonWindow;
      
      private var var_1573:ITextWindow;
      
      private var var_1575:IButtonWindow;
      
      private var var_865:TagRenderer;
      
      private var var_2058:ITextWindow;
      
      private var var_364:RoomEventViewCtrl;
      
      private var _navigator:HabboNavigator;
      
      private var var_739:ITextWindow;
      
      private var var_285:RoomThumbnailCtrl;
      
      private var var_1341:IContainerButtonWindow;
      
      private var var_2227:IWindowContainer;
      
      private var var_284:IWindowContainer;
      
      public function RoomInfoViewCtrl(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_364 = new RoomEventViewCtrl(_navigator);
         var_205 = new RoomSettingsCtrl(_navigator,this,true);
         var_285 = new RoomThumbnailCtrl(_navigator);
         var_865 = new TagRenderer(_navigator);
         _navigator.roomSettingsCtrls.push(this.var_205);
         _hideInfoTimer = new Timer(6000,1);
         _hideInfoTimer.addEventListener(TimerEvent.TIMER,hideInfo);
      }
      
      public function backToRoomSettings() : void
      {
         this.var_205.active = true;
         this.var_364.active = false;
         this.var_285.active = false;
         this.reload();
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      private function refreshEventButtons(param1:RoomEventData) : void
      {
         if(false)
         {
            return;
         }
         var_1571.visible = param1 == null && _navigator.data.currentRoomOwner;
         var_1575.visible = param1 != null && (_navigator.data.currentRoomOwner || _navigator.data.eventMod);
         var_1572.visible = Util.hasVisibleChildren(var_1572);
      }
      
      private function refreshRoomDetails(param1:GuestRoomData, param2:Boolean) : void
      {
         if(param1 == null || false || false)
         {
            return;
         }
         var_668.text = param1.roomName;
         var_668.height = NaN;
         _ownerName.text = param1.ownerName;
         var_914.text = param1.description;
         var_865.refreshTags(var_363,param1.tags);
         var_914.visible = false;
         if(param1.description != "")
         {
            var_914.height = NaN;
            var_914.visible = true;
         }
         var _loc3_:* = _navigator.data.currentRoomRating == -1;
         _navigator.refreshButton(var_363,"thumb_up",_loc3_,onThumbUp,0);
         _navigator.refreshButton(var_363,"thumb_down",_loc3_,onThumbDown,0);
         var_2226.visible = _loc3_;
         var_911.visible = !_loc3_;
         var_1573.visible = !_loc3_;
         var_1573.text = "" + _navigator.data.currentRoomRating;
         _navigator.refreshButton(var_363,"home",param2,null,0);
         _navigator.refreshButton(var_363,"favourite",!param2 && _navigator.data.isCurrentRoomFavourite(),null,0);
         Util.moveChildrenToColumn(var_363,["room_name","owner_name_cont","tags","room_desc","rating_cont"],var_668.y,0);
         var_363.visible = true;
         var_363.height = Util.getLowestPoint(var_363);
      }
      
      private function getButtonsMinHeight() : int
      {
         return !!_navigator.data.currentRoomOwner ? 0 : 21;
      }
      
      public function dispose() : void
      {
         if(_hideInfoTimer)
         {
            _hideInfoTimer.removeEventListener(TimerEvent.TIMER,hideInfo);
            _hideInfoTimer.reset();
            _hideInfoTimer = null;
         }
      }
      
      private function onThumbUp(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         _navigator.send(new RateFlatMessageComposer(1));
      }
      
      private function hideInfo(param1:Event) : void
      {
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_382,HabboToolbarIconEnum.ROOMINFO,_window,false));
      }
      
      private function getRoomInfoMinHeight() : int
      {
         return 37;
      }
      
      public function onAddFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         if(_navigator.data.isFavouritesFull())
         {
            _loc3_ = new SimpleAlertView(_navigator,"${navigator.favouritesfull.title}","${navigator.favouritesfull.body}");
            _loc3_.show();
         }
         else
         {
            _navigator.send(new AddFavouriteRoomMessageComposer(_navigator.data.enteredGuestRoom.flatId));
         }
      }
      
      private function refreshRoomButtons(param1:Boolean) : void
      {
         if(_navigator.data.enteredGuestRoom == null || false || false)
         {
            return;
         }
         var_1574.visible = _navigator.data.canEditRoomSettings;
         var _loc2_:Boolean = _navigator.data.isCurrentRoomFavourite();
         var_1340.visible = _navigator.data.canAddFavourite && !_loc2_;
         var_1341.visible = _navigator.data.canAddFavourite && _loc2_;
         var_1342.visible = _navigator.data.canEditRoomSettings && !param1;
         var_1337.visible = _navigator.data.canEditRoomSettings && param1;
         var_1336.visible = Util.hasVisibleChildren(var_1336);
      }
      
      public function open(param1:Boolean) : void
      {
         this._hideInfoTimer.reset();
         this.var_364.active = false;
         this.var_205.active = false;
         this.var_285.active = false;
         if(param1)
         {
            this.startRoomSettingsEdit(_navigator.data.enteredGuestRoom.flatId);
         }
         refresh();
         _window.visible = true;
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_48,HabboToolbarIconEnum.ROOMINFO,_window,false));
         _window.parent.activate();
         _window.activate();
         if(!param1)
         {
            this._hideInfoTimer.start();
         }
      }
      
      public function toggle() : void
      {
         this._hideInfoTimer.reset();
         this.var_364.active = false;
         this.var_205.active = false;
         this.var_285.active = false;
         refresh();
         if(true)
         {
            _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_48,HabboToolbarIconEnum.ROOMINFO,_window,false));
            _window.parent.activate();
         }
         else
         {
            _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_382,HabboToolbarIconEnum.ROOMINFO,_window,false));
         }
      }
      
      private function refreshRoom() : void
      {
         Util.hideChildren(var_317);
         var_317.findChildByName("close").visible = true;
         var _loc1_:GuestRoomData = _navigator.data.enteredGuestRoom;
         var _loc2_:Boolean = _navigator.data.settings != null && _loc1_ != null && _loc1_.flatId == _navigator.data.settings.homeRoomId;
         refreshRoomDetails(_loc1_,_loc2_);
         refreshPublicSpaceDetails(_navigator.data.enteredPublicSpace);
         refreshRoomButtons(_loc2_);
         this.var_205.refresh(var_317);
         this.var_285.refresh(var_317);
         Util.moveChildrenToColumn(var_317,["room_details","room_buttons"],0,2);
         var_317.height = Util.getLowestPoint(var_317);
         var_317.visible = true;
         Logger.log("XORP: undefined, undefined, undefined, undefined, undefined");
      }
      
      private function onCloseButtonClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         hideInfo(null);
      }
      
      private function onEmbedSrcClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var_1084.setSelection(0,var_1084.text.length);
      }
      
      private function getEmbedData() : String
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(_navigator.data.enteredGuestRoom != null)
         {
            _loc1_ = "private";
            _loc2_ = "" + _navigator.data.enteredGuestRoom.flatId;
         }
         else
         {
            _loc1_ = "public";
            _loc2_ = "" + _navigator.data.publicSpaceNodeId;
            Logger.log("Node id is: " + _loc2_);
         }
         var _loc3_:String = _navigator.configuration.getKey("user.hash","");
         _navigator.registerParameter("navigator.embed.src","roomType",_loc1_);
         _navigator.registerParameter("navigator.embed.src","embedCode",_loc3_);
         _navigator.registerParameter("navigator.embed.src","roomId",_loc2_);
         return _navigator.getText("navigator.embed.src");
      }
      
      private function onThumbDown(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         _navigator.send(new RateFlatMessageComposer(-1));
      }
      
      private function refreshEvent() : void
      {
         Util.hideChildren(var_284);
         var _loc1_:RoomEventData = _navigator.data.roomEventData;
         refreshEventDetails(_loc1_);
         refreshEventButtons(_loc1_);
         this.var_364.refresh(var_284);
         if(Util.hasVisibleChildren(var_284) && !this.var_285.active)
         {
            Util.moveChildrenToColumn(var_284,["event_details","event_buttons"],0,2);
            var_284.height = Util.getLowestPoint(var_284);
            var_284.visible = true;
         }
         else
         {
            var_284.visible = false;
         }
         Logger.log("EVENT: undefined, undefined");
      }
      
      public function startEventEdit() : void
      {
         this._hideInfoTimer.reset();
         this.var_364.active = true;
         this.var_205.active = false;
         this.var_285.active = false;
         this.reload();
      }
      
      private function getEventInfoMinHeight() : int
      {
         return 18;
      }
      
      public function onRemoveFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         _navigator.send(new DeleteFavouriteRoomMessageComposer(_navigator.data.enteredGuestRoom.flatId));
      }
      
      private function onHover(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            return;
         }
         _hideInfoTimer.reset();
      }
      
      private function refreshPublicSpaceDetails(param1:PublicRoomShortData) : void
      {
         if(param1 == null || false || false)
         {
            return;
         }
         var_1085.text = _navigator.getPublicSpaceName(param1.unitPropertySet,param1.worldId);
         var_1085.height = NaN;
         var_1338.text = _navigator.getPublicSpaceDesc(param1.unitPropertySet,param1.worldId);
         var_1338.height = NaN;
         Util.moveChildrenToColumn(var_740,["public_space_name","public_space_desc"],var_1085.y,0);
         var_740.visible = true;
         var_740.height = Math.max(86,Util.getLowestPoint(var_740));
      }
      
      public function reload() : void
      {
         if(_window != null && false)
         {
            refresh();
         }
      }
      
      private function find(param1:String) : IWindow
      {
         var _loc2_:IWindow = _window.findChildByName(param1);
         if(_loc2_ == null)
         {
            throw new Error("Window element with name: " + param1 + " cannot be found!");
         }
         return _loc2_;
      }
      
      private function refreshEmbed() : void
      {
         var _loc1_:* = _navigator.configuration.getKey("embed.showInRoomInfo","false") == "true";
         if(_loc1_ && true && true && true)
         {
            var_913.visible = true;
            var_1084.text = this.getEmbedData();
         }
         else
         {
            var_913.visible = false;
         }
      }
      
      public function startRoomSettingsEdit(param1:int) : void
      {
         this._hideInfoTimer.reset();
         this.var_205.load(param1);
         this.var_205.active = true;
         this.var_364.active = false;
         this.var_285.active = false;
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function startThumbnailEdit() : void
      {
         this._hideInfoTimer.reset();
         this.var_205.active = false;
         this.var_364.active = false;
         this.var_285.active = true;
         this.reload();
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_THUMBS));
      }
      
      private function prepareWindow() : void
      {
         if(_window != null)
         {
            return;
         }
         _window = IWindowContainer(_navigator.getXmlWindow("iro_room_details"));
         _window.setParamFlag(HabboWindowParam.const_70,false);
         _window.setParamFlag(HabboWindowParam.const_1297,true);
         _window.visible = false;
         var_317 = IWindowContainer(find("room_info"));
         var_363 = IWindowContainer(find("room_details"));
         var_740 = IWindowContainer(find("public_space_details"));
         var_2227 = IWindowContainer(find("owner_name_cont"));
         var_2228 = IWindowContainer(find("rating_cont"));
         var_1336 = IWindowContainer(find("room_buttons"));
         var_668 = ITextWindow(find("room_name"));
         var_1085 = ITextWindow(find("public_space_name"));
         _ownerName = ITextWindow(find("owner_name"));
         var_914 = ITextWindow(find("room_desc"));
         var_1338 = ITextWindow(find("public_space_desc"));
         var_1083 = ITextWindow(find("owner_caption"));
         var_911 = ITextWindow(find("rating_caption"));
         var_2226 = ITextWindow(find("rate_caption"));
         var_1573 = ITextWindow(find("rating_txt"));
         var_284 = IWindowContainer(find("event_info"));
         var_912 = IWindowContainer(find("event_details"));
         var_1572 = IWindowContainer(find("event_buttons"));
         var_2058 = ITextWindow(find("event_name"));
         var_739 = ITextWindow(find("event_desc"));
         var_1340 = IContainerButtonWindow(find("add_favourite_button"));
         var_1341 = IContainerButtonWindow(find("rem_favourite_button"));
         var_1342 = IContainerButtonWindow(find("make_home_button"));
         var_1337 = IContainerButtonWindow(find("unmake_home_button"));
         var_1574 = IButtonWindow(find("room_settings_button"));
         var_1571 = IButtonWindow(find("create_event_button"));
         var_1575 = IButtonWindow(find("edit_event_button"));
         var_913 = IWindowContainer(find("embed_info"));
         var_1339 = ITextWindow(find("embed_info_txt"));
         var_1084 = ITextFieldWindow(find("embed_src_txt"));
         Util.setProcDirectly(var_1340,onAddFavouriteClick);
         Util.setProcDirectly(var_1341,onRemoveFavouriteClick);
         Util.setProcDirectly(var_1574,onRoomSettingsClick);
         Util.setProcDirectly(var_1342,onMakeHomeClick);
         Util.setProcDirectly(var_1337,onUnmakeHomeClick);
         Util.setProcDirectly(var_1571,onEventSettingsClick);
         Util.setProcDirectly(var_1575,onEventSettingsClick);
         Util.setProcDirectly(var_1084,onEmbedSrcClick);
         _navigator.refreshButton(var_1340,"favourite",true,null,0);
         _navigator.refreshButton(var_1341,"favourite",true,null,0);
         _navigator.refreshButton(var_1342,"home",true,null,0);
         _navigator.refreshButton(var_1337,"home",true,null,0);
         _window.findChildByName("close").procedure = onCloseButtonClick;
         Util.setProcDirectly(var_317,onHover);
         Util.setProcDirectly(var_284,onHover);
         var_1083.width = var_1083.textWidth;
         Util.moveChildrenToRow(var_2227,["owner_caption","owner_name"],var_1083.x,var_1083.y,3);
         var_911.width = var_911.textWidth;
         Util.moveChildrenToRow(var_2228,["rating_caption","rating_txt"],var_911.x,var_911.y,3);
         var_1339.height = NaN;
         Util.moveChildrenToColumn(var_913,["embed_info_txt","embed_src_txt"],var_1339.y,2);
         var_913.height = Util.getLowestPoint(var_913) + 5;
         var_2333 = NaN;
      }
      
      private function refreshEventDetails(param1:RoomEventData) : void
      {
         if(param1 == null || false)
         {
            return;
         }
         var_2058.text = param1.eventName;
         var_739.text = param1.eventDescription;
         var_865.refreshTags(var_912,[_navigator.getText("roomevent_type_" + param1.eventType),param1.tags[0],param1.tags[1]]);
         var_739.visible = false;
         if(param1.eventDescription != "")
         {
            var_739.height = NaN;
            var_739.y = Util.getLowestPoint(var_912) + 2;
            var_739.visible = true;
         }
         var_912.visible = true;
         var_912.height = Util.getLowestPoint(var_912);
      }
      
      private function refresh() : void
      {
         prepareWindow();
         refreshRoom();
         refreshEvent();
         refreshEmbed();
         Util.moveChildrenToColumn(this._window,["room_info","event_info","embed_info"],0,2);
         _window.height = Util.getLowestPoint(_window);
         _window.y = _window.desktop.height - 0 - 5;
         Logger.log("MAIN: undefined, undefined, undefined");
      }
      
      private function onRoomSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = _navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         startRoomSettingsEdit(_loc3_.flatId);
      }
      
      private function onUnmakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("CLEARING HOME ROOM:");
         _navigator.send(new UpdateNavigatorSettingsMessageComposer(0));
      }
      
      private function onEventSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.roomEventData == null)
         {
            if(_navigator.data.currentRoomOwner)
            {
               _navigator.send(new CanCreateEventMessageComposer());
            }
         }
         else
         {
            startEventEdit();
         }
      }
      
      public function roomSettingsRefreshNeeded() : void
      {
         refresh();
      }
      
      public function close() : void
      {
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_923,HabboToolbarIconEnum.ROOMINFO,_window,false));
         if(_window == null)
         {
            return;
         }
         this._window.visible = false;
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_CLOSED));
      }
      
      private function onMakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = _navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         Logger.log("SETTING HOME ROOM TO: " + _loc3_.flatId);
         _navigator.send(new UpdateNavigatorSettingsMessageComposer(_loc3_.flatId));
      }
   }
}
