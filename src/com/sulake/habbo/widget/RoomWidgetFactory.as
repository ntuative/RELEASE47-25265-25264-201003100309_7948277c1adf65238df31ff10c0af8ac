package com.sulake.habbo.widget
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.CoreComponent;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.widget.chatinput.RoomChatInputWidget;
   import com.sulake.habbo.widget.chooser.FurniChooserWidget;
   import com.sulake.habbo.widget.chooser.UserChooserWidget;
   import com.sulake.habbo.widget.doorbell.DoorbellWidget;
   import com.sulake.habbo.widget.friendrequest.FriendRequestWidget;
   import com.sulake.habbo.widget.furniture.credit.CreditFurniWidget;
   import com.sulake.habbo.widget.furniture.dimmer.DimmerFurniWidget;
   import com.sulake.habbo.widget.furniture.ecotronbox.EcotronBoxFurniWidget;
   import com.sulake.habbo.widget.furniture.placeholder.PlaceholderWidget;
   import com.sulake.habbo.widget.furniture.present.PresentFurniWidget;
   import com.sulake.habbo.widget.furniture.stickie.StickieFurniWidget;
   import com.sulake.habbo.widget.furniture.trophy.TrophyFurniWidget;
   import com.sulake.habbo.widget.infostand.InfostandWidget;
   import com.sulake.habbo.widget.loadingbar.LoadingBarWidget;
   import com.sulake.habbo.widget.memenu.MeMenuWidget;
   import com.sulake.habbo.widget.poll.PollWidget;
   import com.sulake.habbo.widget.poll.VoteWidget;
   import com.sulake.habbo.widget.roomchat.RoomChatWidget;
   import com.sulake.habbo.widget.roomqueue.RoomQueueWidget;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import iid.IIDHabboWindowManager;
   
   public class RoomWidgetFactory extends Component implements IRoomWidgetFactory
   {
       
      
      private var var_2285:IAssetLibrary;
      
      private var _windowManager:IHabboWindowManager;
      
      private var _habboConfiguration:IHabboConfigurationManager;
      
      private var _localizations:IHabboLocalizationManager;
      
      private var var_1645:int = 0;
      
      public function RoomWidgetFactory(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         super(param1,param2,param3);
         if(param1 is CoreComponent)
         {
            var_2285 = (param1 as CoreComponent).assets;
         }
         queueInterface(new IIDHabboWindowManager(),onWindowManagerReady);
         queueInterface(new IIDHabboLocalizationManager(),onLocalizationReady);
         queueInterface(new IIDHabboConfigurationManager(),onHabboConfigurationReady);
      }
      
      public function createWidget(param1:String) : IRoomWidget
      {
         var _loc2_:* = null;
         if(_windowManager == null)
         {
            return null;
         }
         switch(param1)
         {
            case RoomWidgetEnum.const_296:
               _loc2_ = new RoomChatWidget(_windowManager,_assets,_localizations,_habboConfiguration,var_1645++,this);
               break;
            case RoomWidgetEnum.CHAT_INPUT_WIDGET:
               _loc2_ = new RoomChatInputWidget(_windowManager,_assets,_localizations,this);
               break;
            case RoomWidgetEnum.const_413:
               _loc2_ = new InfostandWidget(_windowManager,_assets,_localizations,_habboConfiguration);
               break;
            case RoomWidgetEnum.const_403:
               _loc2_ = new MeMenuWidget(_windowManager,_assets,_localizations,_events,_habboConfiguration);
               break;
            case RoomWidgetEnum.const_578:
               _loc2_ = new PlaceholderWidget(_windowManager,_assets,_localizations);
               break;
            case RoomWidgetEnum.const_482:
               _loc2_ = new CreditFurniWidget(_windowManager,_assets,_localizations);
               break;
            case RoomWidgetEnum.const_454:
               _loc2_ = new StickieFurniWidget(_windowManager,_assets);
               break;
            case RoomWidgetEnum.const_479:
               _loc2_ = new PresentFurniWidget(_windowManager,_assets);
               break;
            case RoomWidgetEnum.const_397:
               _loc2_ = new TrophyFurniWidget(_windowManager,_assets);
               break;
            case RoomWidgetEnum.const_424:
               _loc2_ = new EcotronBoxFurniWidget(_windowManager,_assets);
               break;
            case RoomWidgetEnum.const_100:
               _loc2_ = new DoorbellWidget(_windowManager,_assets,_localizations);
               break;
            case RoomWidgetEnum.const_435:
               _loc2_ = new LoadingBarWidget(_windowManager,_assets,_localizations,_habboConfiguration);
               break;
            case RoomWidgetEnum.const_596:
               _loc2_ = new RoomQueueWidget(_windowManager,_assets,_localizations,_habboConfiguration);
               break;
            case RoomWidgetEnum.const_106:
               _loc2_ = new VoteWidget(_windowManager,_assets,_localizations,_habboConfiguration);
               break;
            case RoomWidgetEnum.const_330:
               _loc2_ = new PollWidget(_windowManager,_assets,_localizations);
               break;
            case RoomWidgetEnum.const_239:
               _loc2_ = new UserChooserWidget(_windowManager,_assets,_localizations);
               break;
            case RoomWidgetEnum.const_429:
               _loc2_ = new FurniChooserWidget(_windowManager,_assets,_localizations);
               break;
            case RoomWidgetEnum.const_423:
               _loc2_ = new DimmerFurniWidget(_windowManager,_assets,_localizations);
               break;
            case RoomWidgetEnum.const_109:
               _loc2_ = new FriendRequestWidget(_windowManager,_assets,_localizations,this);
         }
         return _loc2_;
      }
      
      private function onHabboConfigurationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         _habboConfiguration = param2 as IHabboConfigurationManager;
      }
      
      private function onLocalizationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         _localizations = param2 as IHabboLocalizationManager;
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         _windowManager = param2 as IHabboWindowManager;
      }
      
      override public function dispose() : void
      {
         if(_windowManager)
         {
            _windowManager.release(new IIDHabboWindowManager());
            _windowManager = null;
         }
         if(_localizations)
         {
            _localizations.release(new IIDHabboLocalizationManager());
            _localizations = null;
         }
         if(_habboConfiguration)
         {
            _habboConfiguration.release(new IIDHabboConfigurationManager());
            _habboConfiguration = null;
         }
         super.dispose();
      }
   }
}
