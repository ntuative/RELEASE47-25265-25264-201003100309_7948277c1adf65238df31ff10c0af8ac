package com.sulake.habbo.room.utils
{
   import com.sulake.habbo.room.ISelectedRoomObjectData;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class SelectedRoomObjectData implements ISelectedRoomObjectData
   {
       
      
      private var var_70:Vector3d = null;
      
      private var _id:int = 0;
      
      private var var_224:Vector3d = null;
      
      private var var_2111:int = 0;
      
      private var var_2183:String = null;
      
      private var _category:int = 0;
      
      private var var_2182:String = "";
      
      public function SelectedRoomObjectData(param1:int, param2:int, param3:String, param4:IVector3d, param5:IVector3d, param6:int = 0, param7:String = null)
      {
         super();
         _id = param1;
         _category = param2;
         var_2182 = param3;
         var_70 = new Vector3d();
         var_70.assign(param4);
         var_224 = new Vector3d();
         var_224.assign(param5);
         var_2111 = param6;
         var_2183 = param7;
      }
      
      public function get loc() : Vector3d
      {
         return var_70;
      }
      
      public function get typeId() : int
      {
         return var_2111;
      }
      
      public function get dir() : Vector3d
      {
         return var_224;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get instanceData() : String
      {
         return var_2183;
      }
      
      public function get operation() : String
      {
         return var_2182;
      }
      
      public function dispose() : void
      {
         var_70 = null;
         var_224 = null;
      }
      
      public function get category() : int
      {
         return _category;
      }
   }
}
