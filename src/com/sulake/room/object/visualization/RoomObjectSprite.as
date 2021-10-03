package com.sulake.room.object.visualization
{
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public final class RoomObjectSprite implements IRoomObjectSprite
   {
      
      private static var var_1138:int = 0;
       
      
      private var _updateID:int = 0;
      
      private var var_1618:Boolean = false;
      
      private var var_2052:String = "normal";
      
      private var var_1184:String = "";
      
      private var _instanceId:int = 0;
      
      private var var_330:Boolean = true;
      
      private var _height:int = 0;
      
      private var var_1633:int = 255;
      
      private var _color:int = 16777215;
      
      private var var_943:Boolean = false;
      
      private var var_944:Boolean = false;
      
      private var var_1617:Boolean = false;
      
      private var _offset:Point;
      
      private var var_2051:Boolean = true;
      
      private var var_1012:Number = 0;
      
      private var _width:int = 0;
      
      private var var_1616:String = "";
      
      private var var_857:BitmapData = null;
      
      public function RoomObjectSprite()
      {
         _offset = new Point(0,0);
         super();
         _instanceId = var_1138++;
      }
      
      public function set flipV(param1:Boolean) : void
      {
         var_944 = param1;
         ++_updateID;
      }
      
      public function set clickHandling(param1:Boolean) : void
      {
         var_1617 = param1;
         ++_updateID;
      }
      
      public function dispose() : void
      {
         var_857 = null;
         _width = 0;
         _height = 0;
      }
      
      public function get offsetX() : int
      {
         return _offset.x;
      }
      
      public function get offsetY() : int
      {
         return _offset.y;
      }
      
      public function get height() : int
      {
         return _height;
      }
      
      public function set blendMode(param1:String) : void
      {
         var_2052 = param1;
         ++_updateID;
      }
      
      public function set tag(param1:String) : void
      {
         var_1616 = param1;
         ++_updateID;
      }
      
      public function set assetName(param1:String) : void
      {
         var_1184 = param1;
         ++_updateID;
      }
      
      public function get varyingDepth() : Boolean
      {
         return var_1618;
      }
      
      public function set offsetX(param1:int) : void
      {
         _offset.x = param1;
         ++_updateID;
      }
      
      public function set offsetY(param1:int) : void
      {
         _offset.y = param1;
         ++_updateID;
      }
      
      public function get relativeDepth() : Number
      {
         return var_1012;
      }
      
      public function get color() : int
      {
         return _color;
      }
      
      public function get alpha() : int
      {
         return var_1633;
      }
      
      public function set capturesMouse(param1:Boolean) : void
      {
         var_2051 = param1;
         ++_updateID;
      }
      
      public function get visible() : Boolean
      {
         return var_330;
      }
      
      public function set varyingDepth(param1:Boolean) : void
      {
         var_1618 = param1;
         ++_updateID;
      }
      
      public function get flipH() : Boolean
      {
         return var_943;
      }
      
      public function get flipV() : Boolean
      {
         return var_944;
      }
      
      public function get clickHandling() : Boolean
      {
         return var_1617;
      }
      
      public function get blendMode() : String
      {
         return var_2052;
      }
      
      public function get instanceId() : int
      {
         return _instanceId;
      }
      
      public function get tag() : String
      {
         return var_1616;
      }
      
      public function get assetName() : String
      {
         return var_1184;
      }
      
      public function set relativeDepth(param1:Number) : void
      {
         var_1012 = param1;
         ++_updateID;
      }
      
      public function get capturesMouse() : Boolean
      {
         return var_2051;
      }
      
      public function set alpha(param1:int) : void
      {
         param1 &= 255;
         var_1633 = param1;
         ++_updateID;
      }
      
      public function get width() : int
      {
         return _width;
      }
      
      public function get updateId() : int
      {
         return _updateID;
      }
      
      public function set color(param1:int) : void
      {
         param1 &= 16777215;
         _color = param1;
         ++_updateID;
      }
      
      public function set asset(param1:BitmapData) : void
      {
         if(param1 != null)
         {
            _width = param1.width;
            _height = param1.height;
         }
         var_857 = param1;
         ++_updateID;
      }
      
      public function set visible(param1:Boolean) : void
      {
         var_330 = param1;
         ++_updateID;
      }
      
      public function get asset() : BitmapData
      {
         return var_857;
      }
      
      public function set flipH(param1:Boolean) : void
      {
         var_943 = param1;
         ++_updateID;
      }
   }
}
