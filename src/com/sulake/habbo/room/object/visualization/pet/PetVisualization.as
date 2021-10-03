package com.sulake.habbo.room.object.visualization.pet
{
   import com.sulake.core.assets.AssetLibrary;
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.animation.IAnimationLayerData;
   import com.sulake.habbo.avatar.animation.IAvatarDataContainer;
   import com.sulake.habbo.avatar.animation.ISpriteDataContainer;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
   import com.sulake.room.utils.IRoomGeometry;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.geom.Matrix;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import flash.utils.getTimer;
   
   public class PetVisualization extends RoomObjectSpriteVisualization
   {
       
      
      private var var_576:String;
      
      private var var_627:int = 0;
      
      private const const_1623:int = 1;
      
      private const const_1422:int = 0;
      
      private var _assetLibrary:AssetLibrary = null;
      
      private var _isAnimating:Boolean;
      
      private const const_1053:int = 3;
      
      private var var_963:int = 0;
      
      private var var_497:int = 0;
      
      private const const_1099:int = 3;
      
      private const const_1624:int = 2;
      
      private var var_799:PetVisualizationData = null;
      
      private var var_385:Map;
      
      private var var_800:Array;
      
      public function PetVisualization()
      {
         var_800 = new Array();
         super();
         var_385 = new Map();
         _assetLibrary = new AssetLibrary("pet visualization");
         _isAnimating = false;
      }
      
      override public function update(param1:IRoomGeometry = null, param2:int = 0) : void
      {
         var _loc11_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc21_:* = null;
         var _loc22_:* = null;
         var _loc23_:Boolean = false;
         var _loc24_:* = null;
         var _loc25_:* = false;
         var _loc26_:* = null;
         var _loc27_:* = null;
         var _loc28_:* = null;
         var _loc29_:* = null;
         var _loc30_:int = 0;
         var _loc31_:* = null;
         var _loc32_:* = null;
         var _loc33_:int = 0;
         var _loc34_:int = 0;
         var _loc35_:* = null;
         var _loc36_:* = null;
         var _loc37_:Number = NaN;
         var _loc38_:Number = NaN;
         var _loc39_:* = NaN;
         var _loc40_:Number = NaN;
         var _loc41_:* = null;
         var _loc42_:* = null;
         var _loc43_:int = 0;
         var _loc44_:int = 0;
         var _loc45_:int = 0;
         var _loc46_:int = 0;
         var _loc47_:int = 0;
         var _loc48_:* = null;
         var _loc49_:* = null;
         var _loc50_:int = 0;
         var _loc51_:int = 0;
         var _loc52_:* = null;
         var _loc53_:* = null;
         var _loc54_:* = null;
         var _loc55_:* = null;
         var _loc56_:int = 0;
         var _loc57_:* = null;
         var _loc58_:int = 0;
         var _loc3_:IRoomObject = object;
         if(_loc3_ == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(var_799 == null)
         {
            return;
         }
         var _loc4_:IRoomObjectModel = _loc3_.getModel();
         var _loc5_:String = "avatar" + param1.scale.toString();
         var _loc6_:* = var_385.getValue(_loc5_) as IAvatarImage;
         var _loc7_:String = _loc4_.getString(RoomObjectVariableEnum.const_159);
         var _loc8_:Number = new Date().valueOf();
         var _loc10_:* = 0;
         var _loc12_:Number = _loc4_.getNumber(RoomObjectVariableEnum.const_811);
         if(_loc12_ > 0)
         {
            _loc17_ = getTimer() - _loc12_;
            if(_loc17_ < AvatarAction.const_839)
            {
               _loc10_ = uint(int(Math.sin(Number(_loc17_) / 0 * 0) * 255));
               _loc11_ = _loc4_.getNumber(RoomObjectVariableEnum.const_843);
               var_497 = const_1099;
            }
         }
         var _loc13_:Boolean = false;
         var _loc14_:String = _loc4_.getString(RoomObjectVariableEnum.const_270);
         switch(_loc14_)
         {
            case AvatarAction.const_975:
            case AvatarAction.const_881:
            case AvatarAction.const_953:
            case AvatarAction.const_885:
            case AvatarAction.const_994:
            case AvatarAction.const_937:
            case AvatarAction.const_832:
            case AvatarAction.const_463:
            case AvatarAction.const_469:
               _loc13_ = true;
         }
         var _loc15_:Boolean = var_286 != _loc3_.getUpdateID() || var_207 != param1.scale || var_163 != _loc4_.getUpdateID();
         var _loc16_:Boolean = _isAnimating || var_497 > 0 || _loc13_;
         if(_loc15_ || _loc16_)
         {
            increaseUpdateId();
            _loc18_ = getTimer();
            --var_497;
            if(var_576 != _loc7_)
            {
               for each(_loc36_ in var_385.getKeys())
               {
                  var_385.remove(_loc36_);
               }
               _loc6_ = null;
            }
            if(_loc6_ == null)
            {
               _loc6_ = var_799.getAvatar(_loc7_,param1.scale);
               if(_loc6_ == null)
               {
                  return;
               }
               var_385.remove(_loc5_);
               var_385.add(_loc5_,_loc6_);
               var_576 = _loc7_;
            }
            _loc19_ = _loc3_.getDirection().x - (param1.direction.x + 135 - 22.5);
            _loc19_ = (_loc19_ % 360 + 360) % 360;
            _loc6_.setDirectionAngle(AvatarSetType.const_39,_loc19_);
            _loc20_ = _loc4_.getNumber(RoomObjectVariableEnum.const_319);
            if(isNaN(_loc20_))
            {
               _loc20_ = _loc19_;
            }
            else
            {
               _loc20_ -= param1.direction.x + 135 - 22.5;
            }
            _loc20_ = (_loc20_ % 360 + 360) % 360;
            _loc6_.setDirectionAngle(AvatarSetType.const_47,_loc20_);
            _loc6_.method_4();
            _loc21_ = _loc4_.getString(RoomObjectVariableEnum.const_270);
            _loc22_ = _loc4_.getString(RoomObjectVariableEnum.const_617);
            _loc6_.appendAction(AvatarAction.const_519,_loc21_,_loc22_);
            _loc23_ = false;
            if(_loc21_ == "lay")
            {
               _loc37_ = Number(_loc22_);
               if(_loc37_ < 0)
               {
                  _loc23_ = true;
               }
            }
            _loc24_ = _loc4_.getString(RoomObjectVariableEnum.const_480);
            if(_loc24_ != null && _loc24_ != "")
            {
               _loc38_ = _loc4_.getNumber(RoomObjectVariableEnum.const_450);
               _loc39_ = 3;
               _loc40_ = _loc8_ - _loc38_;
               if(_loc40_ < _loc39_ * 1000)
               {
                  _loc6_.appendAction(AvatarAction.const_290,_loc24_);
               }
            }
            _loc25_ = _loc4_.getNumber(RoomObjectVariableEnum.const_420) > 0;
            if(_loc25_)
            {
               _loc6_.appendAction(AvatarAction.const_639);
            }
            _loc6_.endActionAppends();
            ++var_627;
            ++var_963;
            if(var_963 > 1)
            {
               _loc6_.updateAnimationByFrames(1);
               var_963 = 0;
            }
            _loc26_ = _loc6_.getImage(AvatarSetType.const_39);
            if(_loc26_ == null)
            {
               return;
            }
            _isAnimating = _loc6_.isAnimating();
            _loc27_ = _loc6_.avatarSpriteData;
            if(_loc27_ != null)
            {
            }
            _loc28_ = "avatar " + param1.scale;
            _loc29_ = _assetLibrary.getAssetByName(_loc28_) as BitmapDataAsset;
            if(_loc29_ == null)
            {
               _loc29_ = new BitmapDataAsset(_assetLibrary.getAssetTypeDeclarationByClass(BitmapDataAsset));
               _assetLibrary.setAsset(_loc28_,_loc29_);
            }
            if(_loc29_.content != null)
            {
               _loc41_ = _loc29_.content as BitmapData;
               if(_loc41_ != null && _loc41_ != _loc26_)
               {
                  _loc41_.dispose();
               }
            }
            _loc29_.setUnknownContent(_loc26_.clone());
            _loc30_ = _loc6_.getSprites().length + const_1053;
            if(_loc30_ != spriteCount)
            {
               createSprites(_loc30_);
            }
            _loc32_ = _loc6_.getCanvasOffsets();
            if(_loc32_ == null || _loc32_.length < 3)
            {
               _loc32_ = new Array(0,0,0);
            }
            _loc33_ = 0;
            if(object.getLocation().z > 0)
            {
               _loc33_ = Math.min(param1.scale / 2.75,0);
            }
            _loc31_ = getSprite(const_1422);
            if(_loc31_ != null)
            {
               _loc31_.asset = _loc29_.content as BitmapData;
               _loc31_.offsetX = -1 * param1.scale / 2 + _loc32_[0];
               _loc31_.offsetY = -_loc26_.height + param1.scale / 4 + _loc32_[1] + _loc33_;
               if(!_loc23_)
               {
               }
            }
            _loc34_ = const_1053;
            for each(_loc35_ in _loc6_.getSprites())
            {
               _loc31_ = getSprite(_loc34_);
               if(_loc31_ != null)
               {
                  _loc42_ = _loc6_.getLayerData(_loc35_);
                  _loc43_ = 0;
                  _loc44_ = _loc35_.getDirectionOffsetX(_loc6_.getDirection());
                  _loc45_ = _loc35_.getDirectionOffsetY(_loc6_.getDirection());
                  _loc46_ = _loc35_.getDirectionOffsetZ(_loc6_.getDirection());
                  _loc47_ = 0;
                  if(_loc35_.hasDirections)
                  {
                     _loc47_ = _loc6_.getDirection();
                  }
                  if(_loc42_ != null)
                  {
                     _loc43_ = _loc42_.animationFrame;
                     _loc44_ += _loc42_.dx;
                     _loc45_ += _loc42_.dy;
                     _loc47_ += _loc42_.directionOffset;
                  }
                  if(param1.scale < 48)
                  {
                     _loc44_ /= 2;
                     _loc45_ /= 2;
                  }
                  if(_loc47_ < 0)
                  {
                     _loc47_ += 8;
                  }
                  if(_loc47_ > 7)
                  {
                     _loc47_ -= 8;
                  }
                  _loc48_ = _loc6_.getScale() + "_" + _loc35_.member + "_" + _loc47_ + "_" + _loc43_;
                  _loc49_ = _loc6_.getAsset(_loc48_);
                  if(_loc49_ != null)
                  {
                     _loc31_.asset = _loc49_.content as BitmapData;
                     _loc31_.offsetX = -1 * _loc49_.offset.x - param1.scale / 2 + _loc44_;
                     _loc31_.offsetY = -1 * _loc49_.offset.y + _loc45_;
                     _loc31_.relativeDepth = -0.01 - 0.1 * _loc34_ * _loc46_;
                     if(_loc35_.ink == 33)
                     {
                        _loc31_.blendMode = BlendMode.ADD;
                     }
                     else
                     {
                        _loc31_.blendMode = BlendMode.NORMAL;
                     }
                     _loc34_++;
                  }
               }
            }
            if(_loc21_ == "mv" || _loc21_ == "std")
            {
               _loc30_ = _loc6_.getSprites().length + const_1053;
               if(_loc30_ != spriteCount)
               {
                  createSprites(_loc30_);
               }
               _loc31_ = getSprite(const_1623);
               _loc29_ = null;
               _loc28_ = null;
               _loc50_ = 0;
               _loc51_ = 0;
               switch(param1.scale)
               {
                  case 32:
                     _loc28_ = "sh_std_sd_1_0_0";
                     _loc50_ = -8;
                     _loc51_ = -3;
                     break;
                  case 64:
                     _loc28_ = "h_std_sd_1_0_0";
                     _loc50_ = -17;
                     _loc51_ = -7;
               }
               if(_loc28_ != null)
               {
                  _loc29_ = _loc6_.getAsset(_loc28_);
               }
               if(_loc29_ != null)
               {
                  _loc31_.asset = _loc29_.content as BitmapData;
                  _loc31_.offsetX = _loc50_;
                  _loc31_.offsetY = _loc51_;
                  _loc31_.alpha = 50;
                  _loc31_.relativeDepth = 1;
               }
            }
            _loc31_ = getSprite(const_1624);
            if(_loc10_ > 0)
            {
               _loc29_ = null;
               _loc29_ = var_799.getAvatarRendererAsset("pet_experience_bubble_png") as BitmapDataAsset;
               if(_loc29_ != null)
               {
                  _loc52_ = _loc29_.content as BitmapData;
                  _loc53_ = new TextFormat();
                  _loc53_.font = "Volter";
                  _loc53_.color = 16777215;
                  _loc53_.size = 9;
                  _loc54_ = new TextField();
                  _loc54_.embedFonts = true;
                  _loc54_.width = 30;
                  _loc54_.height = 12;
                  _loc54_.background = true;
                  _loc54_.backgroundColor = 3871388928;
                  _loc54_.defaultTextFormat = _loc53_;
                  _loc54_.text = "+" + _loc11_;
                  _loc55_ = new Matrix();
                  _loc55_.translate(15,19);
                  _loc52_.draw(_loc54_,_loc55_);
                  _loc31_.asset = _loc29_.content as BitmapData;
                  _loc31_.offsetX = -20;
                  _loc31_.offsetY = -80;
                  _loc31_.alpha = _loc10_;
                  _loc31_.visible = true;
               }
            }
            else
            {
               _loc31_.visible = false;
            }
            var_286 = _loc3_.getUpdateID();
            var_163 = _loc4_.getUpdateID();
            var_207 = param1.scale;
            var_800.push(getTimer() - _loc18_);
            if(false)
            {
               _loc56_ = 0;
               _loc57_ = "[";
               for each(_loc58_ in var_800)
               {
                  _loc56_ += _loc58_;
                  _loc57_ += "," + _loc58_;
               }
               _loc57_ += "]";
               var_800 = new Array();
            }
         }
      }
      
      override public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         var_799 = param1 as PetVisualizationData;
         createSprites(4);
         return true;
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         super.dispose();
         if(var_385 != null)
         {
            _loc1_ = var_385.getKeys();
            for each(_loc2_ in _loc1_)
            {
               _loc3_ = var_385.getValue(_loc2_) as IAvatarImage;
               _loc3_.dispose();
            }
         }
         var_385.dispose();
         if(_assetLibrary != null)
         {
            _assetLibrary.dispose();
            _assetLibrary = null;
         }
         var_799 = null;
      }
   }
}
