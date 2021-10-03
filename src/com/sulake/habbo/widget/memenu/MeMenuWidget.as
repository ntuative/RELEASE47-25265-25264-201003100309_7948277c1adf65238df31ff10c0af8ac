package com.sulake.habbo.widget.memenu
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetAvatarActionUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetAvatarEditorUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetCreditBalanceUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetDanceUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetFrameUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetHabboClubUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomObjectUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetSettingsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetToolbarClickedUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetTutorialEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEffectsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetWaveUpdateEvent;
   import com.sulake.habbo.widget.memenu.enum.HabboMeMenuTrackingEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetRequestWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetSelectOutfitMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetToolbarMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.external.ExternalInterface;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class MeMenuWidget extends RoomWidgetBase
   {
      
      public static const const_637:String = "me_menu_settings_view";
      
      private static const const_760:int = 10;
      
      public static const const_689:String = "me_menu_effects_view";
      
      public static const const_124:String = "me_menu_top_view";
      
      public static const const_1303:String = "me_menu_rooms_view";
      
      public static const const_833:String = "me_menu_dance_moves_view";
      
      public static const const_276:String = "me_menu_my_clothes_view";
       
      
      private var var_1952:Boolean = false;
      
      private var _isAnimating:Boolean = false;
      
      private var _eventDispatcher:IEventDispatcher;
      
      private var var_1479:int = 0;
      
      private var var_1953:int = 0;
      
      private var var_1956:Boolean = false;
      
      private var var_267:Boolean = false;
      
      private var var_1955:int = 0;
      
      private var var_1951:Number = 0;
      
      private var _mainContainer:IWindowContainer;
      
      private var var_574:Boolean = false;
      
      private var var_92:ClubPromoView;
      
      private var _config:IHabboConfigurationManager;
      
      private var var_1219:int = 0;
      
      private var var_1954:Boolean = false;
      
      private var var_1011:Point;
      
      private var var_32:IMeMenuView;
      
      public function MeMenuWidget(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboLocalizationManager, param4:IEventDispatcher, param5:IHabboConfigurationManager)
      {
         super(param1,param2,param3);
         _config = param5;
         var_1011 = new Point(0,0);
         _eventDispatcher = param4;
         if(param5 != null && false)
         {
            var_1954 = param5.getKey("client.news.embed.enabled","false") == "true";
         }
         changeView(const_124);
         hide();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetWaveUpdateEvent.const_695,onWaveEvent);
         param1.addEventListener(RoomWidgetDanceUpdateEvent.const_536,onDanceEvent);
         param1.addEventListener(RoomWidgetUpdateEffectsUpdateEvent.const_559,onUpdateEffects);
         param1.addEventListener(RoomWidgetToolbarClickedUpdateEvent.const_691,onToolbarClicked);
         param1.addEventListener(RoomWidgetFrameUpdateEvent.const_315,onUpdate);
         param1.addEventListener(RoomWidgetAvatarEditorUpdateEvent.const_557,onAvatarEditorClosed);
         param1.addEventListener(RoomWidgetAvatarEditorUpdateEvent.const_373,onShowAvatarEditorClubPromo);
         param1.addEventListener(RoomWidgetAvatarEditorUpdateEvent.const_1001,onHideAvatarEditorClubPromo);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_195,onAvatarDeselected);
         param1.addEventListener(RoomWidgetHabboClubUpdateEvent.const_201,onHabboClubEvent);
         param1.addEventListener(RoomWidgetAvatarActionUpdateEvent.const_629,onAvatarActionEvent);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_213,onUserInfo);
         param1.addEventListener(RoomWidgetSettingsUpdateEvent.const_326,onSettingsUpdate);
         param1.addEventListener(RoomWidgetTutorialEvent.const_102,onTutorialEvent);
         param1.addEventListener(RoomWidgetTutorialEvent.const_365,onTutorialEvent);
         param1.addEventListener(RoomWidgetCreditBalanceUpdateEvent.const_180,onCreditBalance);
         super.registerUpdateEvents(param1);
      }
      
      private function onUpdate(param1:Event = null) : void
      {
         if(!_isAnimating)
         {
            return;
         }
      }
      
      override public function get mainWindow() : IWindow
      {
         return _mainContainer;
      }
      
      public function get hasEffectOn() : Boolean
      {
         return var_574;
      }
      
      private function onSettingsUpdate(param1:RoomWidgetSettingsUpdateEvent) : void
      {
         if(!var_267)
         {
            return;
         }
         if(var_32.window.name == const_637)
         {
            (var_32 as MeMenuSettingsView).updateSettings(param1);
         }
      }
      
      public function get isHabboClubActive() : Boolean
      {
         return var_1219 > 0;
      }
      
      private function onWaveEvent(param1:RoomWidgetWaveUpdateEvent) : void
      {
         Logger.log("[MeMenuWidget] Wave Event received");
      }
      
      private function onCreditBalance(param1:RoomWidgetCreditBalanceUpdateEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var_1479 = param1.balance;
         localizations.registerParameter("widget.memenu.credits","credits",var_1479.toString());
      }
      
      private function onUserInfo(param1:RoomWidgetUserInfoUpdateEvent) : void
      {
         var _loc2_:* = null;
         if(!(var_267 && var_32.window.name == const_276))
         {
            _loc2_ = new RoomWidgetRequestWidgetMessage(RoomWidgetRequestWidgetMessage.const_644);
            if(messageListener != null)
            {
               messageListener.processWidgetMessage(_loc2_);
            }
         }
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetWaveUpdateEvent.const_695,onWaveEvent);
         param1.removeEventListener(RoomWidgetDanceUpdateEvent.const_536,onDanceEvent);
         param1.removeEventListener(RoomWidgetUpdateEffectsUpdateEvent.const_559,onUpdateEffects);
         param1.removeEventListener(RoomWidgetToolbarClickedUpdateEvent.const_691,onToolbarClicked);
         param1.removeEventListener(RoomWidgetFrameUpdateEvent.const_315,onUpdate);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_195,onAvatarDeselected);
         param1.removeEventListener(RoomWidgetHabboClubUpdateEvent.const_201,onHabboClubEvent);
         param1.removeEventListener(RoomWidgetAvatarActionUpdateEvent.const_629,onAvatarActionEvent);
         param1.removeEventListener(RoomWidgetAvatarEditorUpdateEvent.const_557,onAvatarEditorClosed);
         param1.removeEventListener(RoomWidgetAvatarEditorUpdateEvent.const_373,onShowAvatarEditorClubPromo);
         param1.removeEventListener(RoomWidgetAvatarEditorUpdateEvent.const_1001,onHideAvatarEditorClubPromo);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_213,onUserInfo);
         param1.removeEventListener(RoomWidgetSettingsUpdateEvent.const_326,onSettingsUpdate);
         param1.removeEventListener(RoomWidgetTutorialEvent.const_365,onTutorialEvent);
         param1.removeEventListener(RoomWidgetTutorialEvent.const_102,onTutorialEvent);
         param1.removeEventListener(RoomWidgetCreditBalanceUpdateEvent.const_180,onCreditBalance);
      }
      
      override public function dispose() : void
      {
         hide();
         _eventDispatcher = null;
         if(var_32 != null)
         {
            var_32.dispose();
            var_32 = null;
         }
         super.dispose();
      }
      
      public function get allowHabboClubDances() : Boolean
      {
         return var_1952;
      }
      
      public function changeToOutfit(param1:int) : void
      {
         var_1951 = new Date().valueOf();
         this.messageListener.processWidgetMessage(new RoomWidgetSelectOutfitMessage(param1));
      }
      
      private function onHideAvatarEditorClubPromo(param1:RoomWidgetAvatarEditorUpdateEvent) : void
      {
         if(var_92 != null)
         {
            var_92.dispose();
            var_92 = null;
         }
         updateSize();
      }
      
      public function get isDancing() : Boolean
      {
         return var_1956;
      }
      
      public function get creditBalance() : int
      {
         return var_1479;
      }
      
      private function onTutorialEvent(param1:RoomWidgetTutorialEvent) : void
      {
         switch(param1.type)
         {
            case RoomWidgetTutorialEvent.const_365:
               Logger.log("* MeMenuWidget: onHighlightClothesIcon " + var_267 + " view: " + var_32.window.name);
               if(var_267 != true || var_32.window.name != const_124)
               {
                  return;
               }
               (var_32 as MeMenuMainView).setIconAssets("clothes_icon",const_124,"clothes_highlighter_blue");
               break;
            case RoomWidgetTutorialEvent.const_102:
               hide();
         }
      }
      
      public function canChangeOutfit() : Boolean
      {
         var _loc1_:Number = new Date().valueOf();
         return _loc1_ - var_1951 > 5000;
      }
      
      public function get habboClubPeriods() : int
      {
         return var_1953;
      }
      
      private function onAvatarActionEvent(param1:RoomWidgetAvatarActionUpdateEvent) : void
      {
         switch(param1.actionType)
         {
            case RoomWidgetAvatarActionUpdateEvent.EFFECT_ACTIVE:
               var_574 = true;
               break;
            case RoomWidgetAvatarActionUpdateEvent.EFFECT_INACTIVE:
               var_574 = false;
               break;
            default:
               trace("MeMenuWidget: unknown avatar action event: " + param1.actionType);
         }
      }
      
      private function onHabboClubEvent(param1:RoomWidgetHabboClubUpdateEvent) : void
      {
         var _loc2_:* = var_1219 > 0;
         var_1219 = param1.daysLeft;
         var_1953 = param1.periodsLeft;
         var_1955 = param1.pastPeriods;
         var_1952 = param1.allowClubDances;
         if(_loc2_ != param1.daysLeft > 0)
         {
            if(var_32 != null)
            {
               changeView(var_32.window.name);
            }
         }
      }
      
      public function set isDancing(param1:Boolean) : void
      {
         var_1956 = param1;
      }
      
      private function onAvatarDeselected(param1:Event) : void
      {
         if(var_32 != null && var_32.window.name != const_276)
         {
            hide();
         }
      }
      
      private function onShowAvatarEditorClubPromo(param1:RoomWidgetAvatarEditorUpdateEvent) : void
      {
         var _loc2_:* = null;
         if(var_32 != null && var_32.window.name == const_276)
         {
            if(param1.promoMode == RoomWidgetAvatarEditorUpdateEvent.const_896)
            {
               var_92 = new ClubPromoView(this,param1.promoImageUrl,ClubPromoView.const_1281);
            }
            else
            {
               var_92 = new ClubPromoView(this,param1.promoImageUrl,ClubPromoView.const_381);
            }
            _loc2_ = _mainContainer.getChildByName(var_32.window.name);
            if(_loc2_ != null)
            {
               var_92.window.x = _loc2_.width + const_760;
               _mainContainer.addChild(var_92.window);
               _mainContainer.width = var_92.window.x + var_92.window.width;
            }
         }
      }
      
      private function onUpdateEffects(param1:RoomWidgetUpdateEffectsUpdateEvent) : void
      {
         var _loc2_:* = null;
         var_574 = false;
         for each(_loc2_ in param1.effects)
         {
            if(_loc2_.isInUse)
            {
               var_574 = true;
            }
         }
         if(var_32 != null && var_32.window.name == const_689)
         {
            (var_32 as MeMenuEffectsView).updateEffects(param1.effects);
         }
      }
      
      public function get habboClubPastPeriods() : int
      {
         return var_1955;
      }
      
      public function get habboClubDays() : int
      {
         return var_1219;
      }
      
      public function get mainContainer() : IWindowContainer
      {
         if(_mainContainer == null)
         {
            _mainContainer = windowManager.createWindow("me_menu_main_container","",HabboWindowType.const_1378,HabboWindowStyle.const_809,HabboWindowParam.const_41,new Rectangle(0,0,170,260)) as IWindowContainer;
            _mainContainer.tags.push("room_widget_me_menu");
         }
         return _mainContainer;
      }
      
      private function onToolbarClicked(param1:RoomWidgetToolbarClickedUpdateEvent) : void
      {
         switch(param1.iconType)
         {
            case RoomWidgetToolbarClickedUpdateEvent.ICON_TYPE_ME_MENU:
               var_267 = !var_267;
               break;
            case RoomWidgetToolbarClickedUpdateEvent.ICON_TYPE_ROOM_INFO:
               var_267 = false;
               break;
            default:
               return;
         }
         if(var_267)
         {
            show();
         }
         else
         {
            hide();
         }
      }
      
      private function onDanceEvent(param1:RoomWidgetDanceUpdateEvent) : void
      {
         Logger.log("[MeMenuWidget] Dance Event received, style: " + param1.style);
      }
      
      public function hide(param1:RoomWidgetRoomObjectUpdateEvent = null) : void
      {
         var _loc2_:RoomWidgetToolbarMessage = new RoomWidgetToolbarMessage(RoomWidgetToolbarMessage.const_562);
         _loc2_.window = _mainContainer.parent as IWindowContainer;
         if(messageListener != null)
         {
            messageListener.processWidgetMessage(_loc2_);
         }
         if(var_32 != null)
         {
            _mainContainer.removeChild(var_32.window);
            var_32.dispose();
            var_32 = null;
         }
         var_267 = false;
         _eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_CLOSE));
      }
      
      private function onAvatarEditorClosed(param1:RoomWidgetAvatarEditorUpdateEvent) : void
      {
         if(var_32 != null && var_32.window.name == const_276)
         {
            if(var_92 != null)
            {
               var_92.dispose();
               var_92 = null;
            }
            changeView(const_124);
         }
      }
      
      public function get isNewsEnabled() : Boolean
      {
         return var_1954;
      }
      
      public function changeView(param1:String) : void
      {
         var _loc2_:* = null;
         if(var_92 != null)
         {
            var_92.dispose();
            var_92 = null;
         }
         switch(param1)
         {
            case const_124:
               _loc2_ = new MeMenuMainView();
               _eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_DEFAULT));
               break;
            case const_689:
               _loc2_ = new MeMenuEffectsView();
               _eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_EFFECTS));
               break;
            case const_833:
               _loc2_ = new MeMenuDanceView();
               _eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_DANCE));
               break;
            case const_276:
               _loc2_ = new MeMenuClothesView();
               break;
            case const_1303:
               _loc2_ = new MeMenuRoomsView();
               break;
            case const_637:
               _loc2_ = new MeMenuSettingsView();
               break;
            default:
               Logger.log("Me Menu Change view: unknown view: " + param1);
         }
         if(_loc2_ != null)
         {
            if(var_32 != null)
            {
               _mainContainer.removeChild(var_32.window);
               var_32.dispose();
               var_32 = null;
            }
            var_32 = _loc2_;
            var_32.init(this,param1);
         }
         updateSize();
      }
      
      public function updateSize() : void
      {
         if(var_32 != null)
         {
            var_1011.x = var_32.window.width + 10;
            var_1011.y = var_32.window.height;
            var_32.window.x = 5;
            var_32.window.y = 0;
            _mainContainer.width = var_1011.x;
            _mainContainer.height = var_1011.y;
            if(var_92 != null)
            {
               _mainContainer.width = var_92.window.x + var_92.window.width + const_760;
            }
         }
      }
      
      public function get config() : IHabboConfigurationManager
      {
         return _config;
      }
      
      private function show() : void
      {
         if(!_mainContainer || true)
         {
            return;
         }
         changeView(const_124);
         var _loc1_:RoomWidgetToolbarMessage = new RoomWidgetToolbarMessage(RoomWidgetToolbarMessage.const_654);
         _loc1_.window = _mainContainer.parent as IWindowContainer;
         if(messageListener != null)
         {
            messageListener.processWidgetMessage(_loc1_);
         }
         var_267 = true;
      }
   }
}
