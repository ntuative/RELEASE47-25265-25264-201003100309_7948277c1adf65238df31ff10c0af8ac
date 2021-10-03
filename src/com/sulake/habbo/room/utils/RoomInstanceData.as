package com.sulake.habbo.room.utils
{
   public class RoomInstanceData
   {
       
      
      private var var_831:LegacyWallGeometry = null;
      
      private var var_568:SelectedRoomObjectData = null;
      
      private var _roomCategory:int = 0;
      
      private var var_569:TileHeightMap = null;
      
      private var var_1907:String = null;
      
      private var _roomId:int = 0;
      
      private var var_570:SelectedRoomObjectData = null;
      
      private var var_832:RoomCamera = null;
      
      public function RoomInstanceData(param1:int, param2:int)
      {
         super();
         _roomId = param1;
         _roomCategory = param2;
         var_831 = new LegacyWallGeometry();
         var_832 = new RoomCamera();
      }
      
      public function set selectedObject(param1:SelectedRoomObjectData) : void
      {
         if(var_568 != null)
         {
            var_568.dispose();
         }
         var_568 = param1;
      }
      
      public function set tileHeightMap(param1:TileHeightMap) : void
      {
         if(var_569 != null)
         {
            var_569.dispose();
         }
         var_569 = param1;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function set worldType(param1:String) : void
      {
         var_1907 = param1;
      }
      
      public function get legacyGeometry() : LegacyWallGeometry
      {
         return var_831;
      }
      
      public function get placedObject() : SelectedRoomObjectData
      {
         return var_570;
      }
      
      public function get roomCamera() : RoomCamera
      {
         return var_832;
      }
      
      public function dispose() : void
      {
         if(var_569 != null)
         {
            var_569.dispose();
            var_569 = null;
         }
         if(var_831 != null)
         {
            var_831.dispose();
            var_831 = null;
         }
         if(var_832 != null)
         {
            var_832.dispose();
            var_832 = null;
         }
         if(var_568 != null)
         {
            var_568.dispose();
            var_568 = null;
         }
         if(var_570 != null)
         {
            var_570.dispose();
            var_570 = null;
         }
      }
      
      public function get tileHeightMap() : TileHeightMap
      {
         return var_569;
      }
      
      public function get worldType() : String
      {
         return var_1907;
      }
      
      public function set placedObject(param1:SelectedRoomObjectData) : void
      {
         if(var_570 != null)
         {
            var_570.dispose();
         }
         var_570 = param1;
      }
      
      public function get roomCategory() : int
      {
         return _roomCategory;
      }
      
      public function get selectedObject() : SelectedRoomObjectData
      {
         return var_568;
      }
   }
}
