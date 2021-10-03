package com.sulake.habbo.room.object.visualization.room.publicroom.rasterizer
{
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import com.sulake.room.object.visualization.IRoomObjectSpriteVisualization;
   import com.sulake.room.object.visualization.utils.IGraphicAsset;
   import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
   import com.sulake.room.utils.IRoomGeometry;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.geom.Point;
   
   public class LayoutRasterizer
   {
       
      
      private var var_1050:Point = null;
      
      private var var_506:Array;
      
      private var var_1049:LayoutRasterizerData = null;
      
      private var var_1291:String = "";
      
      private var var_2104:Boolean = false;
      
      private var var_714:String;
      
      private var _adImgIndex:int = -1;
      
      private var var_508:Array;
      
      private var var_2102:Vector3d;
      
      private var var_44:Map = null;
      
      private var var_2103:String = "";
      
      private var _offsetX:int;
      
      private var var_768:int;
      
      private var var_353:Array;
      
      private var var_507:Boolean = true;
      
      private var _adBgIndex:int = -1;
      
      private var var_780:IGraphicAssetCollection;
      
      private var var_1212:XMLList;
      
      private var var_1051:int = 0;
      
      public function LayoutRasterizer()
      {
         var_353 = [];
         var_508 = [];
         var_506 = [];
         super();
         var_44 = new Map();
         var_714 = "";
         var_1050 = new Point();
      }
      
      public function exchangeElementGraphics(param1:String, param2:String) : void
      {
         var_507 = true;
         var _loc3_:int = var_353.indexOf(param1);
         if(_loc3_ < 0)
         {
            var_353.push(param1);
            var_508.push(param2);
            var_506.push(-1);
         }
         else
         {
            var_508[_loc3_] = param2;
         }
      }
      
      public function initializeAds(param1:int, param2:IRoomObjectSpriteVisualization) : void
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var_1051 = param1;
         var _loc3_:LayoutRasterizerData = var_44.getValue(var_714);
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:XMLList = _loc3_.elementList;
         if(_loc4_ == null)
         {
            return;
         }
         var _loc5_:* = null;
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_.length())
         {
            _loc7_ = _loc4_[_loc6_];
            if(_loc7_ != null)
            {
               _loc8_ = _loc7_.visualization;
               if(_loc8_.length() > 0 && _loc8_.visualizationLayer.length() > 0)
               {
                  _loc9_ = _loc8_.visualizationLayer[0];
                  if(_loc9_ != null)
                  {
                     if(_loc7_.@id.toString().length > 0)
                     {
                        _loc10_ = String(_loc7_.@id);
                        if(_loc10_ == "billboard_bg")
                        {
                           _adBgIndex = _loc6_;
                           _loc11_ = String(_loc9_.@asset);
                           if(_loc11_.indexOf("left") > -1)
                           {
                              var_1291 = RoomObjectVariableEnum.const_1004;
                           }
                           if(_loc11_.indexOf("right") > -1)
                           {
                              var_1291 = RoomObjectVariableEnum.const_948;
                           }
                           if(param2 != null)
                           {
                              _loc5_ = param2.getSprite(var_1051 + _adBgIndex);
                              if(_loc5_ != null)
                              {
                                 _loc5_.visible = false;
                                 _loc5_.alpha = 0;
                              }
                           }
                        }
                        if(_loc10_ == "billboard_img")
                        {
                           _adImgIndex = _loc6_;
                           if(param2 != null)
                           {
                              _loc5_ = param2.getSprite(var_1051 + _adImgIndex);
                              if(_loc5_ != null)
                              {
                                 _loc5_.visible = false;
                                 _loc5_.alpha = 0;
                              }
                           }
                        }
                     }
                  }
               }
            }
            _loc6_++;
         }
      }
      
      public function changeElementAlpha(param1:String, param2:Number) : void
      {
         var_507 = true;
         var _loc3_:int = var_353.indexOf(param1);
         if(_loc3_ < 0)
         {
            var_353.push(param1);
            var_508.push("");
            var_506.push(param2);
         }
         else
         {
            var_506[_loc3_] = param2;
         }
      }
      
      public function initialize(param1:XML) : void
      {
         var _loc2_:String = String(param1.@name);
         var _loc3_:LayoutRasterizerData = new LayoutRasterizerData(param1);
         var_44.add(_loc2_,_loc3_);
         var_2102 = new Vector3d(-0.5,0.5,0);
         var_507 = false;
      }
      
      public function showAd(param1:IRoomObjectSpriteVisualization, param2:String = "", param3:Boolean = false) : void
      {
         if(param2 == var_2103 && param3 == var_2104)
         {
            return;
         }
         if(_adBgIndex == -1 || _adImgIndex == -1)
         {
            Logger.log("ERROR! Billboard sprite indices not defined, cannot show room ad!");
            return;
         }
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(param1 != null)
         {
            _loc4_ = param1.getSprite(var_1051 + _adBgIndex);
            _loc5_ = param1.getSprite(var_1051 + _adImgIndex);
         }
         if(_loc4_ == null || _loc5_ == null)
         {
            Logger.log("ERROR! Billboard sprites not defined, cannot show room ad!");
            return;
         }
         if(param3)
         {
            exchangeElementGraphics("billboard_img",param2);
         }
         else
         {
            exchangeElementGraphics("billboard_img",var_1291);
         }
         setElementToSprite(_adBgIndex,_loc4_,param2,param3);
         setElementToSprite(_adImgIndex,_loc5_,param2,param3);
         if(param3)
         {
            _loc5_.capturesMouse = true;
            _loc5_.clickHandling = true;
            _loc5_.tag = RoomObjectVariableEnum.const_405;
         }
         if(param2 != "")
         {
            _loc4_.visible = true;
            _loc4_.alpha = 255;
            _loc5_.visible = true;
            _loc5_.alpha = 255;
         }
         else
         {
            _loc4_.visible = false;
            _loc4_.alpha = 0;
            _loc5_.visible = false;
            _loc5_.alpha = 0;
         }
         _loc5_.offsetX -= _loc5_.width / 2;
         _loc5_.offsetY -= _loc5_.height / 2;
         var_2103 = param2;
         var_2104 = param3;
      }
      
      public function initializeGeometry(param1:IRoomGeometry) : void
      {
         var _loc2_:Point = param1.getScreenPoint(new Vector3d(0,0,0));
         var _loc3_:Point = param1.getScreenPoint(var_2102);
         _loc3_.x -= _loc2_.x;
         _loc3_.y -= _loc2_.y;
         _loc3_.x = Math.round(_loc3_.x);
         _loc3_.y = Math.round(_loc3_.y);
         var_1050.x = _loc3_.x;
         var_1050.y = _loc3_.y;
      }
      
      public function get graphicsChanged() : Boolean
      {
         return var_507;
      }
      
      public function dispose() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         var_780 = null;
         var_1212 = null;
         var_353 = null;
         var_508 = null;
         var_506 = null;
         if(var_44 != null)
         {
            _loc1_ = 0;
            while(_loc1_ < var_44.length)
            {
               _loc2_ = var_44.getWithIndex(_loc1_) as LayoutRasterizerData;
               if(_loc2_ != null)
               {
                  _loc2_.dispose();
               }
               _loc1_++;
            }
            var_44.dispose();
            var_44 = null;
         }
         var_1049 = null;
      }
      
      public function set layout(param1:String) : void
      {
         if(param1 != var_714)
         {
            var_714 = param1;
            _adBgIndex = -1;
            _adImgIndex = -1;
            var_1049 = var_44.getValue(var_714);
         }
      }
      
      private function getBlendMode(param1:String) : String
      {
         var _loc2_:String = "null";
         switch(param1)
         {
            case "ADD":
               _loc2_ = "null";
               break;
            case "SUBTRACT":
               _loc2_ = "null";
               break;
            case "DARKEN":
               _loc2_ = "null";
         }
         return _loc2_;
      }
      
      public function elementCount() : int
      {
         var _loc1_:LayoutRasterizerData = var_44.getValue(var_714);
         if(_loc1_ == null)
         {
            return 0;
         }
         var _loc2_:XMLList = _loc1_.elementList;
         if(_loc2_ == null)
         {
            return 0;
         }
         return _loc2_.length();
      }
      
      public function setElementToSprite(param1:int, param2:IRoomObjectSprite, param3:String = "", param4:Boolean = false) : void
      {
         var _loc10_:* = null;
         if(var_1049 == null)
         {
            return;
         }
         var _loc5_:XMLList = var_1049.elementList;
         if(_loc5_ == null)
         {
            return;
         }
         if(param1 < 0 || param1 >= _loc5_.length())
         {
            return;
         }
         var _loc6_:XML = _loc5_[param1];
         if(_loc6_ == null)
         {
            return;
         }
         var _loc7_:XMLList = _loc6_.visualization;
         if(_loc7_.length() == 0 || _loc7_.visualizationLayer.length() == 0)
         {
            return;
         }
         var _loc8_:XML = _loc7_.visualizationLayer[0];
         if(_loc8_ == null)
         {
            return;
         }
         var _loc9_:IGraphicAsset = var_780.getAsset(_loc8_.@asset);
         if(_loc9_ == null || _loc9_.asset == null)
         {
            return;
         }
         param2.visible = true;
         param2.alpha = 255;
         param2.asset = _loc9_.asset.content as BitmapData;
         param2.offsetX = int(_loc8_.@x) + _loc9_.offsetX + var_1050.x;
         param2.offsetY = int(_loc8_.@y) + _loc9_.offsetY + var_1050.y;
         param2.blendMode = getBlendMode(String(_loc8_.@ink));
         param2.capturesMouse = false;
         if(parseInt(_loc8_.@capturesMouse) > 0)
         {
            param2.capturesMouse = true;
            param2.tag = String(_loc6_.@id);
         }
         if(String(_loc8_.@z) != "")
         {
            param2.relativeDepth = -Number(_loc8_.@z) / Math.sqrt(2) - 0.00001 * param1;
         }
         else
         {
            param2.relativeDepth = -(0.001 * param1);
         }
         if(_loc8_.@blend.toString().length > 0)
         {
            param2.alpha = int(Number(_loc8_.@blend) * 2.55);
         }
         if(_loc8_.@flipH.toString().length > 0)
         {
            param2.flipH = Boolean(_loc8_.@flipH);
         }
         if(_loc6_.@id.toString().length > 0)
         {
            _loc10_ = String(_loc6_.@id);
            if(var_353.indexOf(_loc10_) >= 0 && var_507)
            {
               param1 = var_353.indexOf(_loc10_);
               if(true)
               {
                  _loc9_ = var_780.getAsset(var_508[param1]);
                  if(_loc9_ != null && _loc9_.asset != null)
                  {
                     param2.asset = _loc9_.asset.content as BitmapData;
                  }
                  else
                  {
                     param2.asset = null;
                  }
               }
               if(true)
               {
                  param2.alpha = var_506[param1];
               }
               var_353.splice(param1,1);
               var_508.splice(param1,1);
               var_506.splice(param1,1);
               if(false)
               {
                  var_507 = false;
               }
            }
         }
      }
      
      public function initializeAssetCollection(param1:IGraphicAssetCollection) : void
      {
         var_780 = param1;
      }
   }
}
