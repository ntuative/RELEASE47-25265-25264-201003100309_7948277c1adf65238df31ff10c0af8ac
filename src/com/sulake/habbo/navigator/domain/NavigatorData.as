package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.communication.messages.incoming.navigator.FlatCategory;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomSearchResultData;
   import com.sulake.habbo.communication.messages.incoming.navigator.MsgWithRequestId;
   import com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PopularRoomTagsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.parser.navigator.FavouritesMessageParser;
   import com.sulake.habbo.communication.messages.parser.navigator.NavigatorSettingsMessageParser;
   import com.sulake.habbo.communication.messages.parser.room.engine.RoomEntryInfoMessageParser;
   import com.sulake.habbo.navigator.HabboNavigator;
   import flash.utils.Dictionary;
   
   public class NavigatorData
   {
      
      private static const const_1410:int = 10;
       
      
      private var var_1430:NavigatorSettingsMessageParser;
      
      private var var_1182:int;
      
      private var var_1817:int;
      
      private var var_1820:Boolean;
      
      private var var_982:Array;
      
      private var var_810:Dictionary;
      
      private var var_981:Array;
      
      private var var_2300:int;
      
      private var var_1822:int;
      
      private var var_1819:int;
      
      private var var_1821:int;
      
      private var var_556:PublicRoomShortData;
      
      private var var_393:RoomEventData;
      
      private var var_127:MsgWithRequestId;
      
      private var var_1676:Boolean;
      
      private var _navigator:HabboNavigator;
      
      private var var_1818:Boolean;
      
      private var var_191:GuestRoomData;
      
      private var var_659:Boolean;
      
      private var _currentRoomOwner:Boolean;
      
      public function NavigatorData(param1:HabboNavigator)
      {
         var_982 = new Array();
         var_981 = new Array();
         var_810 = new Dictionary();
         super();
         _navigator = param1;
      }
      
      public function get createdFlatId() : int
      {
         return var_1817;
      }
      
      public function get eventMod() : Boolean
      {
         return var_1818;
      }
      
      public function startLoading() : void
      {
         this.var_659 = true;
      }
      
      public function isRoomFavourite(param1:int) : Boolean
      {
         return false;
      }
      
      public function set eventMod(param1:Boolean) : void
      {
         var_1818 = param1;
      }
      
      public function set roomEventData(param1:RoomEventData) : void
      {
         if(var_393 != null)
         {
            var_393.dispose();
         }
         var_393 = param1;
      }
      
      public function get popularTagsArrived() : Boolean
      {
         return var_127 != null && var_127 as PopularRoomTagsData != null;
      }
      
      public function get guestRoomSearchArrived() : Boolean
      {
         return var_127 != null && var_127 as GuestRoomSearchResultData != null;
      }
      
      public function get guestRoomSearchResults() : GuestRoomSearchResultData
      {
         return var_127 as GuestRoomSearchResultData;
      }
      
      public function get enteredGuestRoom() : GuestRoomData
      {
         return var_191;
      }
      
      public function get allCategories() : Array
      {
         return var_982;
      }
      
      public function onRoomExit() : void
      {
         if(var_393 != null)
         {
            var_393.dispose();
            var_393 = null;
         }
         if(var_556 != null)
         {
            var_556.dispose();
            var_556 = null;
         }
         if(var_191 != null)
         {
            var_191.dispose();
            var_191 = null;
         }
         _currentRoomOwner = false;
      }
      
      public function set officialRooms(param1:OfficialRoomsData) : void
      {
         disposeCurrentMsg();
         var_127 = param1;
         var_659 = false;
      }
      
      public function get settings() : NavigatorSettingsMessageParser
      {
         return var_1430;
      }
      
      public function set popularTags(param1:PopularRoomTagsData) : void
      {
         disposeCurrentMsg();
         var_127 = param1;
         var_659 = false;
      }
      
      public function onRoomEnter(param1:RoomEntryInfoMessageParser) : void
      {
         var_556 = null;
         var_191 = null;
         _currentRoomOwner = false;
         if(param1.guestRoom)
         {
            _currentRoomOwner = param1.owner;
         }
         else
         {
            var_556 = param1.publicSpace;
            var_393 = null;
         }
      }
      
      public function get currentRoomOwner() : Boolean
      {
         return _currentRoomOwner;
      }
      
      public function onFavourites(param1:FavouritesMessageParser) : void
      {
         var _loc2_:int = 0;
         this.var_2300 = param1.limit;
         this.var_1182 = param1.favouriteRoomIds.length;
         this.var_810 = new Dictionary();
         for each(_loc2_ in param1.favouriteRoomIds)
         {
            this.var_810[_loc2_] = "yes";
         }
      }
      
      public function get popularTags() : PopularRoomTagsData
      {
         return var_127 as PopularRoomTagsData;
      }
      
      public function get enteredPublicSpace() : PublicRoomShortData
      {
         return var_556;
      }
      
      public function get hotRoomPopupOpen() : Boolean
      {
         return var_1820;
      }
      
      public function set guestRoomSearchResults(param1:GuestRoomSearchResultData) : void
      {
         disposeCurrentMsg();
         var_127 = param1;
         var_659 = false;
      }
      
      public function set avatarId(param1:int) : void
      {
         var_1819 = param1;
      }
      
      public function get canEditRoomSettings() : Boolean
      {
         return var_191 != null && _currentRoomOwner;
      }
      
      public function isLoading() : Boolean
      {
         return this.var_659;
      }
      
      public function get visibleCategories() : Array
      {
         return var_981;
      }
      
      public function set categories(param1:Array) : void
      {
         var _loc2_:* = null;
         var_982 = param1;
         var_981 = new Array();
         for each(_loc2_ in var_982)
         {
            if(_loc2_.visible)
            {
               var_981.push(_loc2_);
            }
         }
      }
      
      public function get currentRoomRating() : int
      {
         return var_1822;
      }
      
      public function get publicSpaceNodeId() : int
      {
         return var_1821;
      }
      
      public function set settings(param1:NavigatorSettingsMessageParser) : void
      {
         var_1430 = param1;
      }
      
      private function disposeCurrentMsg() : void
      {
         if(var_127 == null)
         {
            return;
         }
         var_127.dispose();
         var_127 = null;
      }
      
      public function get roomEventData() : RoomEventData
      {
         return var_393;
      }
      
      public function favouriteChanged(param1:int, param2:Boolean) : void
      {
         var_810[param1] = !!param2 ? "yes" : null;
         var_1182 += !!param2 ? 1 : -1;
      }
      
      public function get officialRooms() : OfficialRoomsData
      {
         return var_127 as OfficialRoomsData;
      }
      
      public function get avatarId() : int
      {
         return var_1819;
      }
      
      public function isCurrentRoomFavourite() : Boolean
      {
         var _loc1_:int = 0;
         return false;
      }
      
      public function get officialRoomsArrived() : Boolean
      {
         return var_127 != null && var_127 as OfficialRoomsData != null;
      }
      
      public function set hotRoomPopupOpen(param1:Boolean) : void
      {
         var_1820 = param1;
      }
      
      public function set currentRoomRating(param1:int) : void
      {
         var_1822 = param1;
      }
      
      public function set hcMember(param1:Boolean) : void
      {
         var_1676 = param1;
      }
      
      public function set enteredRoom(param1:GuestRoomData) : void
      {
         if(var_191 != null)
         {
            var_191.dispose();
         }
         var_191 = param1;
      }
      
      public function isCurrentRoomHome() : Boolean
      {
         if(var_191 == null)
         {
            return false;
         }
         var _loc1_:int = 0;
         return this.var_1430.homeRoomId == _loc1_;
      }
      
      public function isFavouritesFull() : Boolean
      {
         return var_1182 >= var_2300;
      }
      
      public function set publicSpaceNodeId(param1:int) : void
      {
         var_1821 = param1;
      }
      
      public function get hcMember() : Boolean
      {
         return var_1676;
      }
      
      public function get canAddFavourite() : Boolean
      {
         return var_191 != null && !_currentRoomOwner;
      }
      
      public function set createdFlatId(param1:int) : void
      {
         var_1817 = param1;
      }
   }
}
