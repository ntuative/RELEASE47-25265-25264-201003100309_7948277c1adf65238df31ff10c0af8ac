package com.sulake.habbo.room
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.advertisement.IAdManager;
   import com.sulake.habbo.advertisement.events.AdEvent;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.configuration.enum.HabboConfigurationEvent;
   import com.sulake.habbo.room.events.RoomEngineEvent;
   import com.sulake.habbo.room.events.RoomEngineObjectEvent;
   import com.sulake.habbo.room.events.RoomEngineRoomColorEvent;
   import com.sulake.habbo.room.events.RoomObjectDimmerStateUpdateEvent;
   import com.sulake.habbo.room.events.RoomObjectFurnitureActionEvent;
   import com.sulake.habbo.room.events.RoomObjectMoveEvent;
   import com.sulake.habbo.room.events.RoomObjectRoomActionEvent;
   import com.sulake.habbo.room.events.RoomObjectRoomAdEvent;
   import com.sulake.habbo.room.events.RoomObjectStateChangeEvent;
   import com.sulake.habbo.room.events.RoomObjectWidgetRequestEvent;
   import com.sulake.habbo.room.events.warnings.AvatarWalkWarpingWarningEvent;
   import com.sulake.habbo.room.messages.RoomObjectAvatarFigureUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectDataUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectItemDataUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectRoomAdUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectRoomColorUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectRoomMaskUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectRoomUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectUpdateStateMessage;
   import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.habbo.room.object.RoomPlaneData;
   import com.sulake.habbo.room.object.RoomPlaneParser;
   import com.sulake.habbo.room.utils.LegacyWallGeometry;
   import com.sulake.habbo.room.utils.RoomCamera;
   import com.sulake.habbo.room.utils.RoomData;
   import com.sulake.habbo.room.utils.RoomInstanceData;
   import com.sulake.habbo.room.utils.SelectedRoomObjectData;
   import com.sulake.habbo.room.utils.TileHeightMap;
   import com.sulake.iid.IIDHabboAdManager;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDRoomManager;
   import com.sulake.iid.IIDRoomObjectFactory;
   import com.sulake.iid.IIDRoomObjectVisualizationFactory;
   import com.sulake.iid.IIDRoomRendererFactory;
   import com.sulake.room.IRoomInstance;
   import com.sulake.room.IRoomManager;
   import com.sulake.room.IRoomManagerListener;
   import com.sulake.room.IRoomObjectFactory;
   import com.sulake.room.events.RoomObjectEvent;
   import com.sulake.room.events.RoomObjectMouseEvent;
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectController;
   import com.sulake.room.object.IRoomObjectVisualizationFactory;
   import com.sulake.room.object.visualization.IRoomObjectSpriteVisualization;
   import com.sulake.room.object.visualization.IRoomObjectVisualization;
   import com.sulake.room.renderer.IRoomRenderer;
   import com.sulake.room.renderer.IRoomRendererFactory;
   import com.sulake.room.renderer.IRoomRenderingCanvas;
   import com.sulake.room.utils.IRoomGeometry;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.NumberBank;
   import com.sulake.room.utils.RoomGeometry;
   import com.sulake.room.utils.Vector3d;
   import com.sulake.room.utils.XMLValidator;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getTimer;
   
   public class RoomEngine extends Component implements IRoomEngine, IRoomManagerListener, IRoomCreator, IRoomEngineServices, IUpdateReceiver
   {
      
      private static const const_495:String = "room";
      
      private static const const_777:int = -2;
      
      private static const const_494:String = "temporary_room";
      
      private static const const_280:String = "object_icon_sprite";
      
      private static const const_776:int = -3;
      
      private static const const_775:String = "overlay";
      
      private static const OBJECT_TYPE_SELECTION_ARROW:String = "selection_arrow";
      
      private static const const_1106:String = "tile_cursor";
      
      private static const const_279:int = -1;
       
      
      private var var_387:IRoomObjectVisualizationFactory = null;
      
      private var var_518:Boolean = false;
      
      private var var_11:RoomContentLoader = null;
      
      private var var_311:Map = null;
      
      private var _connection:IConnection = null;
      
      private var var_263:IAdManager = null;
      
      private var var_605:NumberBank;
      
      private var var_42:IRoomManager = null;
      
      private var _habboConfiguration:IHabboConfigurationManager;
      
      private var var_1553:int = 0;
      
      private var var_1554:int = 0;
      
      private var var_1311:int = -1;
      
      private var var_312:Map = null;
      
      private var var_29:IRoomObjectFactory = null;
      
      private var var_66:RoomObjectEventHandler = null;
      
      private var var_726:RoomMessageHandler = null;
      
      private var var_725:IRoomRendererFactory = null;
      
      private var var_2166:Boolean = false;
      
      private var var_117:int = 0;
      
      private var var_1062:Map;
      
      private var _communication:IHabboCommunicationManager = null;
      
      private var var_118:int = 0;
      
      public function RoomEngine(param1:IContext, param2:uint = 0)
      {
         super(param1,param2);
         var_312 = new Map();
         var_605 = new NumberBank(1000);
         var_1062 = new Map();
         var_311 = new Map();
         var_66 = new RoomObjectEventHandler(this);
         var_726 = new RoomMessageHandler(this);
         var_11 = new RoomContentLoader();
         queueInterface(new IIDRoomObjectFactory(),onObjectFactoryReady);
         queueInterface(new IIDRoomObjectVisualizationFactory(),onVisualizationFactoryReady);
         queueInterface(new IIDRoomManager(),onRoomManagerReady);
         queueInterface(new IIDRoomRendererFactory(),onRendererFactoryReady);
         queueInterface(new IIDHabboCommunicationManager(),onCommunicationReady);
         queueInterface(new IIDHabboConfigurationManager(),onHabboConfigurationReady);
         queueInterface(new IIDHabboAdManager(),onAdManagerReady);
         initialize();
         registerUpdateReceiver(this,1);
      }
      
      public function getTileHeightMap(param1:int, param2:int) : TileHeightMap
      {
         var _loc3_:RoomInstanceData = getRoomInstanceData(param1,param2);
         if(_loc3_ != null)
         {
            return _loc3_.tileHeightMap;
         }
         return null;
      }
      
      public function get activeRoomId() : int
      {
         return var_118;
      }
      
      public function deleteRoomObject(param1:int, param2:int) : Boolean
      {
         if(var_66 != null)
         {
            if(param2 == RoomObjectCategoryEnum.const_30)
            {
               return var_66.deleteWallItem(var_118,var_117,param1);
            }
         }
         return false;
      }
      
      private function getRoomCanvas(param1:int, param2:int, param3:int) : IRoomRenderingCanvas
      {
         var _loc4_:String = getRoomIdentifier(param1,param2);
         var _loc5_:IRoomInstance = var_42.getRoom(_loc4_);
         if(_loc5_ == null)
         {
            return null;
         }
         var _loc6_:IRoomRenderer = _loc5_.getRenderer() as IRoomRenderer;
         if(_loc6_ == null)
         {
            return null;
         }
         return _loc6_.getCanvas(param3);
      }
      
      private function updateRoomCameras(param1:uint) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:* = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = NaN;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc22_:* = NaN;
         var _loc23_:* = null;
         var _loc24_:Number = NaN;
         var _loc25_:Number = NaN;
         var _loc26_:* = null;
         var _loc27_:Number = NaN;
         var _loc28_:Number = NaN;
         var _loc29_:* = NaN;
         var _loc30_:* = NaN;
         var _loc31_:* = NaN;
         var _loc32_:* = NaN;
         var _loc33_:* = null;
         var _loc34_:* = null;
         var _loc35_:Boolean = false;
         var _loc36_:Boolean = false;
         var _loc37_:Boolean = false;
         var _loc38_:Boolean = false;
         var _loc39_:Number = NaN;
         var _loc40_:Number = NaN;
         var _loc41_:* = NaN;
         var _loc42_:* = NaN;
         var _loc43_:* = NaN;
         var _loc44_:int = 0;
         var _loc45_:int = 0;
         var _loc46_:int = 0;
         var _loc47_:int = 0;
         var _loc48_:* = null;
         var _loc49_:* = null;
         var _loc2_:int = 0;
         for(; _loc2_ < var_312.length; _loc2_++)
         {
            _loc3_ = var_312.getWithIndex(_loc2_) as RoomInstanceData;
            _loc4_ = null;
            _loc5_ = 0;
            _loc6_ = 0;
            if(_loc3_ != null)
            {
               _loc4_ = _loc3_.roomCamera;
               _loc5_ = _loc3_.roomId;
               _loc6_ = _loc3_.roomCategory;
            }
            if(_loc4_ != null)
            {
               _loc7_ = 1;
               _loc8_ = getRoomCanvasGeometry(_loc5_,_loc6_,_loc7_) as RoomGeometry;
               if(_loc8_ != null)
               {
                  _loc9_ = _loc4_.targetId;
                  _loc10_ = _loc4_.targetCategory;
                  _loc11_ = getRoomObject(_loc5_,_loc6_,_loc9_,_loc10_);
                  if(_loc11_ != null)
                  {
                     _loc12_ = new Vector3d();
                     _loc12_.assign(_loc11_.getLocation());
                     _loc12_.x = Math.round(_loc12_.x);
                     _loc12_.y = Math.round(_loc12_.y);
                     _loc13_ = Number(Math.floor(_loc12_.z) + 1);
                     _loc14_ = getRoomCanvasRectangle(_loc5_,_loc6_,_loc7_);
                     if(_loc14_ != null)
                     {
                        _loc15_ = getRoom(_loc5_,_loc6_);
                        if(_loc15_ != null)
                        {
                           _loc16_ = _loc15_.getNumber(RoomVariableEnum.const_667) - 0.5;
                           _loc17_ = _loc15_.getNumber(RoomVariableEnum.const_703) - 0.5;
                           _loc18_ = _loc15_.getNumber(RoomVariableEnum.const_696) + 0.5;
                           _loc19_ = _loc15_.getNumber(RoomVariableEnum.const_707) + 0.5;
                           _loc20_ = Math.round((_loc16_ + _loc18_) / 2);
                           _loc21_ = Math.round((_loc17_ + _loc19_) / 2);
                           _loc22_ = 2;
                           _loc23_ = new Point(_loc12_.x - _loc20_,_loc12_.y - _loc21_);
                           _loc24_ = _loc8_.scale / Math.sqrt(2);
                           _loc25_ = _loc24_ / 2;
                           _loc26_ = new Matrix();
                           _loc26_.rotate(-(_loc8_.direction.x + 90) / 180 * 0);
                           _loc23_ = _loc26_.transformPoint(_loc23_);
                           _loc23_.y *= _loc25_ / _loc24_;
                           _loc27_ = _loc14_.width / 2 / _loc24_ - 1;
                           _loc28_ = _loc14_.height / 2 / _loc25_ - 1;
                           _loc29_ = 0;
                           _loc30_ = 0;
                           _loc31_ = 0;
                           _loc32_ = 0;
                           _loc33_ = _loc8_.getScreenPoint(new Vector3d(_loc20_,_loc21_,_loc22_));
                           _loc33_.x += Math.round(_loc14_.width / 2);
                           _loc33_.y += Math.round(_loc14_.height / 2);
                           _loc34_ = getActiveRoomBoundingRectangle(_loc7_);
                           if(_loc34_ != null)
                           {
                              if(!(_loc34_.width > 1 && _loc34_.height > 1))
                              {
                                 _loc8_.adjustLocation(new Vector3d(-30,-30),25);
                              }
                              _loc29_ = Number((_loc34_.left - _loc33_.x - _loc8_.scale * 0.25) / _loc24_);
                              _loc31_ = Number((_loc34_.right - _loc33_.x + _loc8_.scale * 0.25) / _loc24_);
                              _loc30_ = Number((_loc34_.top - _loc33_.y - _loc8_.scale * 0.5) / _loc25_);
                              _loc32_ = Number((_loc34_.bottom - _loc33_.y + _loc8_.scale * 0.5) / _loc25_);
                              _loc35_ = false;
                              _loc36_ = false;
                              _loc37_ = false;
                              _loc38_ = false;
                              _loc39_ = Math.round((_loc31_ - _loc29_) * _loc24_);
                              if(_loc39_ < _loc14_.width)
                              {
                                 _loc13_ = 2;
                                 _loc23_.x = (_loc31_ + _loc29_) / 2;
                                 _loc37_ = true;
                              }
                              else
                              {
                                 if(_loc23_.x > _loc31_ - _loc27_)
                                 {
                                    _loc23_.x = _loc31_ - _loc27_;
                                    _loc35_ = true;
                                 }
                                 if(_loc23_.x < _loc29_ + _loc27_)
                                 {
                                    _loc23_.x = _loc29_ + _loc27_;
                                    _loc35_ = true;
                                 }
                              }
                              _loc40_ = Math.round((_loc32_ - _loc30_) * _loc25_);
                              if(_loc40_ < _loc14_.height)
                              {
                                 _loc13_ = 2;
                                 _loc23_.y = (_loc32_ + _loc30_) / 2;
                                 _loc38_ = true;
                              }
                              else
                              {
                                 if(_loc23_.y > _loc32_ - _loc28_)
                                 {
                                    _loc23_.y = _loc32_ - _loc28_;
                                    _loc36_ = true;
                                 }
                                 if(_loc23_.y < _loc30_ + _loc28_)
                                 {
                                    _loc23_.y = _loc30_ + _loc28_;
                                    _loc36_ = true;
                                 }
                                 _loc23_.y /= _loc25_ / _loc24_;
                              }
                              _loc26_.invert();
                              _loc23_ = _loc26_.transformPoint(_loc23_);
                              _loc23_.x += _loc20_;
                              _loc23_.y += _loc21_;
                              _loc41_ = 0.35;
                              _loc42_ = 0.1;
                              _loc43_ = 0.2;
                              _loc44_ = 10;
                              _loc45_ = 10;
                              _loc46_ = Math.round(_loc14_.width);
                              _loc47_ = Math.round(_loc14_.height);
                              if(_loc4_.limitedLocationX && _loc4_.screenWd == _loc46_ && _loc4_.screenHt == _loc47_)
                              {
                                 _loc43_ = 0;
                              }
                              if(_loc4_.limitedLocationY && _loc4_.screenWd == _loc46_ && _loc4_.screenHt == _loc47_)
                              {
                                 _loc41_ = 0;
                                 _loc42_ = 0;
                              }
                              _loc14_.right *= 1 - _loc43_ * 2;
                              _loc14_.bottom *= 1 - (_loc41_ + _loc42_);
                              if(_loc14_.right < _loc44_)
                              {
                                 _loc14_.right = _loc44_;
                              }
                              if(_loc14_.bottom < _loc45_)
                              {
                                 _loc14_.bottom = _loc45_;
                              }
                              if(_loc41_ + _loc42_ > 0)
                              {
                                 _loc14_.offset(-_loc14_.width / 2,-_loc14_.height * (_loc42_ / (_loc41_ + _loc42_)));
                              }
                              else
                              {
                                 _loc14_.offset(-_loc14_.width / 2,-_loc14_.height / 2);
                              }
                              _loc48_ = getLegacyGeometry(_loc5_,_loc6_);
                              _loc49_ = getTileHeightMap(_loc5_,_loc6_);
                              if(_loc48_ != null && _loc49_ != null)
                              {
                                 if(!_loc49_.isRoomTile(_loc12_.x,_loc12_.y))
                                 {
                                 }
                              }
                              _loc33_ = _loc8_.getScreenPoint(_loc12_);
                              if(_loc33_ != null)
                              {
                                 _loc12_.z = _loc13_;
                                 _loc12_.x = Math.round(_loc23_.x * 2) / 2;
                                 _loc12_.y = Math.round(_loc23_.y * 2) / 2;
                                 _loc4_.initializeLocation(_loc12_);
                                 if((_loc33_.x < _loc14_.left || _loc33_.x > _loc14_.right) && !_loc37_ || (_loc33_.y < _loc14_.top || _loc33_.y > _loc14_.bottom) && !_loc38_ || _loc37_ && !_loc4_.centeredLocX || _loc38_ && !_loc4_.centeredLocY || (_loc4_.roomWd != _loc34_.width || _loc4_.roomHt != _loc34_.height))
                                 {
                                    _loc4_.limitedLocationX = _loc35_;
                                    _loc4_.limitedLocationY = _loc36_;
                                    _loc4_.target = _loc12_;
                                 }
                                 else
                                 {
                                    if(!_loc35_)
                                    {
                                       _loc4_.limitedLocationX = false;
                                    }
                                    if(!_loc36_)
                                    {
                                       _loc4_.limitedLocationY = false;
                                    }
                                 }
                                 _loc4_.update(param1);
                                 _loc8_.adjustLocation(_loc4_.location,25);
                                 _loc4_.centeredLocX = _loc37_;
                                 _loc4_.centeredLocY = _loc38_;
                                 _loc4_.screenWd = _loc46_;
                                 _loc4_.screenHt = _loc47_;
                                 _loc4_.roomWd = _loc34_.width;
                                 _loc4_.roomHt = _loc34_.height;
                              }
                              continue;
                              return;
                           }
                           _loc8_.adjustLocation(new Vector3d(0,0),25);
                           return;
                        }
                     }
                  }
               }
            }
         }
      }
      
      public function objectInitialized(param1:String, param2:int, param3:int) : void
      {
         var _loc7_:* = null;
         var _loc8_:int = 0;
         var _loc9_:* = null;
         var _loc4_:int = getRoomId(param1);
         var _loc5_:int = getRoomCategory(param1);
         if(param3 == RoomObjectCategoryEnum.const_30)
         {
            updateObjectRoomWindow(_loc4_,_loc5_,param2);
         }
         var _loc6_:IRoomObjectController = getRoomObject(_loc4_,_loc5_,param2,param3) as IRoomObjectController;
         if(_loc6_ != null && _loc6_.getModel() != null && _loc6_.getEventHandler() != null)
         {
            _loc7_ = _loc6_.getModel().getString(RoomObjectVariableEnum.const_135);
            if(_loc7_ != null)
            {
               _loc8_ = _loc6_.getState(0);
               _loc9_ = new RoomObjectDataUpdateMessage(_loc8_,_loc7_);
               _loc6_.getEventHandler().processUpdateMessage(_loc9_);
            }
         }
      }
      
      public function getRoomObjectBoundingRectangle(param1:int, param2:int, param3:int, param4:int, param5:int) : Rectangle
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc6_:IRoomGeometry = getRoomCanvasGeometry(param1,param2,param5);
         if(_loc6_ != null)
         {
            _loc7_ = getRoomObject(param1,param2,param3,param4);
            if(_loc7_ != null)
            {
               _loc8_ = _loc7_.getVisualization();
               if(_loc8_ != null)
               {
                  _loc9_ = _loc8_.boundingRectangle;
                  _loc10_ = _loc6_.getScreenPoint(_loc7_.getLocation());
                  if(_loc10_ != null)
                  {
                     _loc9_.offset(_loc10_.x,_loc10_.y);
                     _loc11_ = getRoomCanvasRectangle(param1,param2,param5);
                     if(_loc11_ != null)
                     {
                        _loc9_.offset(_loc11_.width / 2,_loc11_.height / 2);
                        return _loc9_;
                     }
                  }
               }
            }
         }
         return null;
      }
      
      public function selectRoomObject(param1:int, param2:int, param3:int, param4:int) : void
      {
         if(var_66 == null)
         {
            return;
         }
         var_66.setSelectedObject(param1,param2,param3,param4);
      }
      
      public function modifyRoomObjectData(param1:int, param2:int, param3:String) : Boolean
      {
         if(var_66 != null)
         {
            if(param2 == RoomObjectCategoryEnum.const_30)
            {
               return var_66.modifyWallItemData(var_118,var_117,param1,param3);
            }
         }
         return false;
      }
      
      override public function dispose() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         removeUpdateReceiver(this);
         if(var_29 != null)
         {
            var_29.release(new IIDRoomObjectFactory());
            var_29 = null;
         }
         if(var_387 != null)
         {
            var_387.release(new IIDRoomObjectVisualizationFactory());
            var_387 = null;
         }
         if(var_42 != null)
         {
            var_42.release(new IIDRoomManager());
            var_42 = null;
         }
         if(var_725 != null)
         {
            var_725.release(new IIDRoomRendererFactory());
            var_725 = null;
         }
         if(_communication != null)
         {
            _communication.release(new IIDHabboCommunicationManager());
            _communication = null;
         }
         if(_habboConfiguration != null)
         {
            _habboConfiguration.release(new IIDHabboConfigurationManager());
            _habboConfiguration = null;
         }
         if(var_263)
         {
            var_263.release(new IIDHabboAdManager());
            var_263 = null;
         }
         _connection = null;
         if(var_605 != null)
         {
            var_605.dispose();
            var_605 = null;
         }
         if(var_1062 != null)
         {
            var_1062.dispose();
         }
         if(var_66 != null)
         {
            var_66.dispose();
            var_66 = null;
         }
         if(var_726 != null)
         {
            var_726.dispose();
            var_726 = null;
         }
         if(var_11 != null)
         {
            var_11.dispose();
            var_11 = null;
         }
         if(var_311 != null)
         {
            var_311.dispose();
            var_311 = null;
         }
         if(var_312 != null)
         {
            _loc1_ = 0;
            while(_loc1_ < var_312.length)
            {
               _loc2_ = var_312.getWithIndex(_loc1_) as RoomInstanceData;
               if(_loc2_ != null)
               {
                  _loc2_.dispose();
               }
               _loc1_++;
            }
            var_312.dispose();
            var_312 = null;
         }
         super.dispose();
      }
      
      public function setPlacedObjectData(param1:int, param2:int, param3:SelectedRoomObjectData) : void
      {
         var _loc4_:RoomInstanceData = getRoomInstanceData(param1,param2);
         if(_loc4_ != null)
         {
            _loc4_.placedObject = param3;
         }
      }
      
      private function getObject(param1:String, param2:int, param3:int) : IRoomObjectController
      {
         var _loc4_:IRoomInstance = var_42.getRoom(param1);
         if(_loc4_ == null)
         {
            return null;
         }
         var _loc5_:* = null;
         return _loc4_.getObject(param2,param3) as IRoomObjectController;
      }
      
      public function createRoomCanvas(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int) : DisplayObject
      {
         var _loc12_:* = null;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc19_:* = null;
         var _loc7_:String = getRoomIdentifier(param1,param2);
         var _loc8_:IRoomInstance = var_42.getRoom(_loc7_);
         if(_loc8_ == null)
         {
            return null;
         }
         var _loc9_:IRoomRenderer = _loc8_.getRenderer() as IRoomRenderer;
         if(_loc9_ == null)
         {
            _loc9_ = var_725.createRenderer();
         }
         if(_loc9_ == null)
         {
            return null;
         }
         _loc9_.roomObjectVariableAccurateZ = RoomObjectVariableEnum.const_961;
         _loc8_.setRenderer(_loc9_);
         var _loc10_:IRoomRenderingCanvas = _loc9_.createCanvas(param3,param4,param5,param6);
         if(_loc10_ == null)
         {
            return null;
         }
         _loc10_.mouseListener = var_66;
         if(_loc10_.geometry != null)
         {
            _loc12_ = getWorldType(param1,param2);
            if(isPublicRoomWorldType(_loc12_))
            {
               if(var_11 != null)
               {
                  if(var_11.getPublicRoomWorldSize(_loc12_) != 64)
                  {
                     _loc10_.geometry.performZoomOut();
                  }
               }
            }
            _loc10_.geometry.z_scale = _loc8_.getNumber(RoomVariableEnum.const_641);
         }
         if(_loc10_.geometry != null)
         {
            _loc13_ = _loc8_.getNumber(RoomObjectVariableEnum.const_657);
            _loc14_ = _loc8_.getNumber(RoomObjectVariableEnum.const_604);
            _loc15_ = _loc8_.getNumber(RoomObjectVariableEnum.const_1002);
            _loc16_ = _loc8_.getNumber(RoomObjectVariableEnum.const_818);
            _loc17_ = new Vector3d(_loc13_,_loc14_,_loc15_);
            _loc18_ = null;
            if(_loc16_ == 90)
            {
               _loc18_ = new Vector3d(-1000,0,0);
            }
            if(_loc16_ == 180)
            {
               _loc18_ = new Vector3d(0,-1000,0);
            }
            _loc10_.geometry.setDisplacement(_loc17_,_loc18_);
         }
         var _loc11_:Sprite = _loc10_.displayObject as Sprite;
         if(_loc11_ != null)
         {
            _loc19_ = new Sprite();
            _loc19_.name = const_775;
            _loc19_.mouseEnabled = false;
            _loc11_.addChild(_loc19_);
         }
         return _loc11_;
      }
      
      public function updateObjectRoomWindow(param1:int, param2:int, param3:int, param4:Boolean = true) : void
      {
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc5_:String = "undefined_" + param3;
         var _loc6_:* = null;
         var _loc7_:IRoomObjectController = getObjectWallItem(param1,param2,param3);
         if(_loc7_ != null)
         {
            if(_loc7_.getModel() != null)
            {
               if(_loc7_.getModel().getNumber(RoomObjectVariableEnum.const_860) > 0)
               {
                  _loc9_ = _loc7_.getModel().getString(RoomObjectVariableEnum.const_863);
                  _loc10_ = _loc7_.getLocation();
                  if(param4)
                  {
                     _loc6_ = new RoomObjectRoomMaskUpdateMessage(RoomObjectRoomMaskUpdateMessage.const_393,_loc5_,_loc9_,_loc10_);
                  }
                  else
                  {
                     _loc6_ = new RoomObjectRoomMaskUpdateMessage(RoomObjectRoomMaskUpdateMessage.const_610,_loc5_);
                  }
               }
            }
         }
         else
         {
            _loc6_ = new RoomObjectRoomMaskUpdateMessage(RoomObjectRoomMaskUpdateMessage.const_610,_loc5_);
         }
         var _loc8_:IRoomObjectController = getObjectRoom(param1,param2);
         if(_loc8_ != null && _loc8_.getEventHandler() != null && _loc6_ != null)
         {
            _loc8_.getEventHandler().processUpdateMessage(_loc6_);
         }
      }
      
      private function getRoomObjectAdURL(param1:String) : String
      {
         if(var_11 != null)
         {
            return var_11.getRoomObjectAdURL(param1);
         }
         return "";
      }
      
      public function loadRoomResources(param1:String) : Array
      {
         if(var_11 != null)
         {
            return var_11.loadLegacyContent(param1,_events);
         }
         return new Array();
      }
      
      private function disposeObject(param1:String, param2:int, param3:int) : void
      {
         var _loc4_:IRoomInstance = var_42.getRoom(param1);
         if(_loc4_ == null)
         {
            return;
         }
         if(_loc4_.disposeObject(param2,param3))
         {
            if(events != null)
            {
               events.dispatchEvent(new RoomEngineObjectEvent(RoomEngineObjectEvent.const_646,var_118,var_117,param2,param3));
            }
         }
      }
      
      private function getRoomId(param1:String) : int
      {
         return 1;
      }
      
      public function modifyRoomObject(param1:int, param2:int, param3:String) : Boolean
      {
         if(var_66 != null)
         {
            return var_66.modifyRoomObject(var_118,var_117,param1,param2,param3);
         }
         return false;
      }
      
      public function getLegacyGeometry(param1:int, param2:int) : LegacyWallGeometry
      {
         var _loc3_:RoomInstanceData = getRoomInstanceData(param1,param2);
         if(_loc3_ != null)
         {
            return _loc3_.legacyGeometry;
         }
         return null;
      }
      
      public function get roomManager() : IRoomManager
      {
         return var_42;
      }
      
      private function getOverlayIconSprite(param1:Sprite, param2:String) : Sprite
      {
         var _loc4_:* = null;
         if(param1 == null)
         {
            return null;
         }
         var _loc3_:int = param1.numChildren - 1;
         while(_loc3_ >= 0)
         {
            _loc4_ = param1.getChildAt(_loc3_) as Sprite;
            if(_loc4_ != null)
            {
               if(_loc4_.name == param2)
               {
                  return _loc4_;
               }
            }
            _loc3_--;
         }
         return null;
      }
      
      public function updateObjectRoom(param1:int, param2:int, param3:String = null, param4:String = null, param5:String = null) : Boolean
      {
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc6_:IRoomObjectController = getObjectRoom(param1,param2);
         if(_loc6_ == null)
         {
            _loc8_ = getRoomIdentifier(param1,param2);
            _loc9_ = var_311.getValue(_loc8_);
            if(_loc9_ == null)
            {
               _loc9_ = new RoomData(param1,param2,null);
               var_311.add(_loc8_,_loc9_);
            }
            if(param3 != null)
            {
               _loc9_.floorType = param3;
            }
            if(param4 != null)
            {
               _loc9_.wallType = param4;
            }
            if(param5 != null)
            {
               _loc9_.landscapeType = param5;
            }
            return true;
         }
         if(_loc6_.getEventHandler() == null)
         {
            return false;
         }
         var _loc7_:* = null;
         if(param3 != null)
         {
            _loc7_ = new RoomObjectRoomUpdateMessage(RoomObjectRoomUpdateMessage.const_593,param3);
            _loc6_.getEventHandler().processUpdateMessage(_loc7_);
         }
         if(param4 != null)
         {
            _loc7_ = new RoomObjectRoomUpdateMessage(RoomObjectRoomUpdateMessage.const_698,param4);
            _loc6_.getEventHandler().processUpdateMessage(_loc7_);
         }
         if(param5 != null)
         {
            _loc7_ = new RoomObjectRoomUpdateMessage(RoomObjectRoomUpdateMessage.const_569,param5);
            _loc6_.getEventHandler().processUpdateMessage(_loc7_);
         }
         return true;
      }
      
      public function setTileHeightMap(param1:int, param2:int, param3:TileHeightMap) : void
      {
         var _loc4_:RoomInstanceData = getRoomInstanceData(param1,param2);
         if(_loc4_ != null)
         {
            _loc4_.tileHeightMap = param3;
         }
      }
      
      public function modifyRoomCanvas(param1:int, param2:int, param3:int, param4:int, param5:int) : Boolean
      {
         var _loc6_:IRoomRenderingCanvas = getRoomCanvas(param1,param2,param3);
         if(_loc6_ == null)
         {
            return false;
         }
         _loc6_.initialize(param4,param5);
         return true;
      }
      
      private function onRoomManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_42 = param2 as IRoomManager;
         if(var_42 != null)
         {
            var_42.addObjectUpdateCategory(RoomObjectCategoryEnum.const_31);
            var_42.addObjectUpdateCategory(RoomObjectCategoryEnum.const_30);
            var_42.addObjectUpdateCategory(RoomObjectCategoryEnum.const_36);
            var_42.addObjectUpdateCategory(RoomObjectCategoryEnum.OBJECT_CATEGORY_CURSOR);
            var_42.addObjectUpdateCategory(RoomObjectCategoryEnum.const_62);
            var_42.setContentLoader(var_11);
         }
         initializeRoomManager();
      }
      
      private function roomObjectEventHandler(param1:RoomObjectEvent) : void
      {
         if(var_66 != null)
         {
            var_66.handleRoomObjectEvent(param1,var_118,var_117);
         }
      }
      
      public function disposeObjectWallItem(param1:int, param2:int, param3:int) : void
      {
         disposeObject(getRoomIdentifier(param1,param2),param3,RoomObjectCategoryEnum.const_30);
         updateObjectRoomWindow(param1,param2,param3,false);
      }
      
      private function createObjectWallItem(param1:int, param2:int, param3:int, param4:String) : IRoomObjectController
      {
         var _loc5_:int = 0;
         return createObject(getRoomIdentifier(param1,param2),param3,param4,_loc5_);
      }
      
      public function getSelectedObjectData(param1:int, param2:int) : ISelectedRoomObjectData
      {
         var _loc3_:RoomInstanceData = getRoomInstanceData(param1,param2);
         if(_loc3_ != null)
         {
            return _loc3_.selectedObject;
         }
         return null;
      }
      
      private function addOverlayIconSprite(param1:Sprite, param2:String, param3:BitmapData) : Sprite
      {
         if(param1 == null || param3 == null)
         {
            return null;
         }
         var _loc4_:Sprite = getOverlayIconSprite(param1,param2);
         if(_loc4_ != null)
         {
            return null;
         }
         _loc4_ = new Sprite();
         _loc4_.name = param2;
         _loc4_.mouseEnabled = false;
         var _loc5_:Bitmap = new Bitmap(param3);
         _loc4_.addChild(_loc5_);
         param1.addChild(_loc4_);
         return _loc4_;
      }
      
      public function setSelectedObjectData(param1:int, param2:int, param3:SelectedRoomObjectData) : void
      {
         var _loc4_:RoomInstanceData = getRoomInstanceData(param1,param2);
         if(_loc4_ != null)
         {
            _loc4_.selectedObject = param3;
            if(param3 != null)
            {
               _loc4_.placedObject = null;
            }
         }
      }
      
      public function getRoomImage(param1:String, param2:String, param3:String, param4:int, param5:IGetImageListener, param6:String = null) : ImageResult
      {
         if(param1 == null)
         {
            param1 = "";
         }
         if(param2 == null)
         {
            param2 = "";
         }
         if(param3 == null)
         {
            param3 = "";
         }
         var _loc7_:String = const_495;
         var _loc8_:String = param1 + "\n" + param2 + "\n" + param3;
         return getGenericRoomObjectImage(_loc7_,_loc8_,new Vector3d(),param4,param5,param6);
      }
      
      public function getWallItemIcon(param1:int, param2:IGetImageListener, param3:String = null) : ImageResult
      {
         return getWallItemImage(param1,new Vector3d(),1,param2,param3);
      }
      
      private function getFurnitureType(param1:int) : String
      {
         if(var_11 != null)
         {
            return var_11.getActiveObjectType(param1);
         }
         return "";
      }
      
      public function addObjectFurniture(param1:int, param2:int, param3:int, param4:int, param5:IVector3d, param6:IVector3d, param7:int, param8:String, param9:Number = NaN, param10:int = -1) : Boolean
      {
         var _loc11_:String = getFurnitureType(param4);
         var _loc12_:int = getFurnitureColorIndex(param4);
         var _loc13_:String = getRoomObjectAdURL(_loc11_);
         if(_loc11_ == null)
         {
            _loc11_ = "";
         }
         var _loc14_:IRoomObjectController = createObjectFurniture(param1,param2,param3,_loc11_);
         if(_loc14_ == null)
         {
            return false;
         }
         if(_loc14_ != null && _loc14_.getModelController() != null)
         {
            _loc14_.getModelController().setNumber(RoomObjectVariableEnum.const_210,_loc12_,true);
            _loc14_.getModelController().setNumber(RoomObjectVariableEnum.const_331,param4,true);
            _loc14_.getModelController().setString(RoomObjectVariableEnum.const_281,_loc13_,true);
            _loc14_.getModelController().setNumber(RoomObjectVariableEnum.const_842,1,true);
            _loc14_.getModelController().setNumber(RoomObjectVariableEnum.const_940,param10);
            _loc14_.getModelController().setNumber(RoomObjectVariableEnum.const_946,getTimer());
         }
         if(!updateObjectFurniture(param1,param2,param3,param5,param6,param7,param8,param9))
         {
            return false;
         }
         if(events != null)
         {
            events.dispatchEvent(new RoomEngineObjectEvent(RoomEngineObjectEvent.const_268,param1,param2,param3,RoomObjectCategoryEnum.const_31));
         }
         var _loc15_:ISelectedRoomObjectData = getPlacedObjectData(param1,param2);
         if(_loc15_ && Math.abs(_loc15_.id) == param3 && _loc15_.category == RoomObjectCategoryEnum.const_31)
         {
            selectRoomObject(param1,param2,param3,RoomObjectCategoryEnum.const_31);
         }
         return true;
      }
      
      public function initializeRoom(param1:int, param2:int, param3:XML) : void
      {
         var _loc4_:String = getRoomIdentifier(param1,param2);
         var _loc5_:* = null;
         var _loc6_:String = "111";
         var _loc7_:String = "201";
         var _loc8_:String = "1";
         if(!var_518)
         {
            _loc5_ = var_311.remove(_loc4_);
            if(_loc5_ != null)
            {
               _loc6_ = _loc5_.floorType;
               _loc7_ = _loc5_.wallType;
               _loc8_ = _loc5_.landscapeType;
            }
            _loc5_ = new RoomData(param1,param2,param3);
            _loc5_.floorType = _loc6_;
            _loc5_.wallType = _loc7_;
            _loc5_.landscapeType = _loc8_;
            var_311.add(_loc4_,_loc5_);
            Logger.log("Room Engine not initilized yet, can not create room. Room data stored for later initialization.");
            return;
         }
         if(param3 == null)
         {
            Logger.log("Room property messages received before floor height map, will initialize when floor height map received.");
            return;
         }
         _loc5_ = var_311.remove(_loc4_);
         if(_loc5_ != null)
         {
            if(_loc5_.floorType != null && _loc5_.floorType.length > 0)
            {
               _loc6_ = _loc5_.floorType;
            }
            if(_loc5_.wallType != null && _loc5_.wallType.length > 0)
            {
               _loc7_ = _loc5_.wallType;
            }
            if(_loc5_.landscapeType != null && _loc5_.landscapeType.length > 0)
            {
               _loc8_ = _loc5_.landscapeType;
            }
         }
         var _loc9_:IRoomInstance = createRoom(_loc4_,param3,_loc6_,_loc7_,_loc8_,getWorldType(param1,param2));
         if(_loc9_ == null)
         {
            return;
         }
         events.dispatchEvent(new RoomEngineEvent(RoomEngineEvent.const_601,param1,param2));
      }
      
      private function initializeRoomManager() : void
      {
         if(var_29 == null || var_387 == null || var_42 == null || var_725 == null || _communication == null || _habboConfiguration == null || !var_2166)
         {
            return;
         }
         var_42.initialize(<nothing/>,this);
      }
      
      private function onHabboConfigurationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         _habboConfiguration = param2 as IHabboConfigurationManager;
         (_habboConfiguration as Component).events.addEventListener(HabboConfigurationEvent.INIT,onHabboConfigurationInit);
      }
      
      public function getObjectRoom(param1:int, param2:int) : IRoomObjectController
      {
         return getObject(getRoomIdentifier(param1,param2),const_279,RoomObjectCategoryEnum.const_62);
      }
      
      public function addObjectFurnitureByName(param1:int, param2:int, param3:int, param4:String, param5:IVector3d, param6:IVector3d, param7:int, param8:String, param9:Number = NaN) : Boolean
      {
         var _loc13_:* = null;
         var _loc10_:String = getWorldType(param1,param2);
         if(isPublicRoomWorldType(_loc10_) && var_11 != null)
         {
            _loc13_ = var_11.getPublicRoomContentType(_loc10_) + "_";
            param4 = _loc13_ + param4;
         }
         var _loc11_:IRoomObjectController = createObjectFurniture(param1,param2,param3,param4);
         if(_loc11_ == null)
         {
            return false;
         }
         if(!updateObjectFurniture(param1,param2,param3,param5,param6,param7,param8,param9))
         {
            return false;
         }
         if(events != null)
         {
            events.dispatchEvent(new RoomEngineObjectEvent(RoomEngineObjectEvent.const_268,param1,param2,param3,RoomObjectCategoryEnum.const_31));
         }
         var _loc12_:ISelectedRoomObjectData = getPlacedObjectData(param1,param2);
         if(_loc12_ && Math.abs(_loc12_.id) == param3 && _loc12_.category == RoomObjectCategoryEnum.const_31)
         {
            selectRoomObject(param1,param2,param3,RoomObjectCategoryEnum.const_31);
         }
         return true;
      }
      
      public function updateObjectRoomColor(param1:int, param2:int, param3:uint, param4:int, param5:Boolean) : Boolean
      {
         var _loc6_:IRoomObjectController = getObjectRoom(param1,param2);
         if(_loc6_ == null || _loc6_.getEventHandler() == null)
         {
            return false;
         }
         var _loc7_:* = null;
         _loc7_ = new RoomObjectRoomColorUpdateMessage(RoomObjectRoomColorUpdateMessage.const_1308,param3,param4,param5);
         _loc6_.getEventHandler().processUpdateMessage(_loc7_);
         events.dispatchEvent(new RoomEngineRoomColorEvent(param1,param2,param3,param4,param5));
         return true;
      }
      
      public function update(param1:uint) : void
      {
         if(var_42 != null)
         {
            var_42.update(param1);
         }
         updateRoomCameras(param1);
         var _loc2_:IRoomInstance = var_42.getRoom(getRoomIdentifier(var_118,var_117));
         if(_loc2_ != null && _loc2_.getRenderer() != null)
         {
            _loc2_.getRenderer().update(param1);
         }
      }
      
      public function updateObjectWallItemData(param1:int, param2:int, param3:int, param4:String) : Boolean
      {
         var _loc5_:IRoomObjectController = getObjectWallItem(param1,param2,param3);
         if(_loc5_ == null)
         {
            return false;
         }
         var _loc6_:RoomObjectItemDataUpdateMessage = new RoomObjectItemDataUpdateMessage(param4);
         if(_loc5_ != null && _loc5_.getEventHandler() != null)
         {
            _loc5_.getEventHandler().processUpdateMessage(_loc6_);
         }
         return true;
      }
      
      public function getSelectionArrow(param1:int, param2:int) : IRoomObjectController
      {
         return getObject(getRoomIdentifier(param1,param2),const_776,RoomObjectCategoryEnum.OBJECT_CATEGORY_CURSOR);
      }
      
      public function setObjectMoverIconSpriteVisible(param1:Boolean) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc2_:IRoomRenderingCanvas = getRoomCanvas(var_118,var_117,var_1311);
         if(_loc2_ != null)
         {
            _loc3_ = getOverlaySprite(_loc2_);
            _loc4_ = getOverlayIconSprite(_loc3_,const_280);
            if(_loc4_ != null)
            {
               _loc4_.visible = param1;
            }
         }
      }
      
      private function createObjectFurniture(param1:int, param2:int, param3:int, param4:String) : IRoomObjectController
      {
         var _loc5_:int = 0;
         return createObject(getRoomIdentifier(param1,param2),param3,param4,_loc5_);
      }
      
      public function removeObjectMoverIconSprite() : void
      {
         var _loc2_:* = null;
         var _loc1_:IRoomRenderingCanvas = getRoomCanvas(var_118,var_117,var_1311);
         if(_loc1_ != null)
         {
            _loc2_ = getOverlaySprite(_loc1_);
            removeOverlayIconSprite(_loc2_,const_280);
         }
      }
      
      public function getRoomIdentifier(param1:int, param2:int) : String
      {
         return "hard_coded_room_id";
      }
      
      private function onVisualizationFactoryReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_387 = param2 as IRoomObjectVisualizationFactory;
         if(var_11 != null)
         {
            var_11.visualizationFactory = var_387;
         }
         initializeRoomManager();
      }
      
      private function initializeObjectEvents() : void
      {
         if(var_29 != null)
         {
            if(false)
            {
               var_29.events.addEventListener(RoomObjectMouseEvent.const_225,roomObjectEventHandler);
               var_29.events.addEventListener(RoomObjectMouseEvent.const_427,roomObjectEventHandler);
               var_29.events.addEventListener(RoomObjectMouseEvent.ROOM_OBJECT_MOUSE_DOWN,roomObjectEventHandler);
               var_29.events.addEventListener(RoomObjectStateChangeEvent.const_243,roomObjectEventHandler);
               var_29.events.addEventListener(RoomObjectStateChangeEvent.const_515,roomObjectEventHandler);
               var_29.events.addEventListener(RoomObjectWidgetRequestEvent.const_129,roomObjectEventHandler);
               var_29.events.addEventListener(RoomObjectWidgetRequestEvent.ROOM_OBJECT_WIDGET_REQUEST_CREDITFURNI,roomObjectEventHandler);
               var_29.events.addEventListener(RoomObjectWidgetRequestEvent.const_118,roomObjectEventHandler);
               var_29.events.addEventListener(RoomObjectWidgetRequestEvent.const_126,roomObjectEventHandler);
               var_29.events.addEventListener(RoomObjectWidgetRequestEvent.const_123,roomObjectEventHandler);
               var_29.events.addEventListener(RoomObjectWidgetRequestEvent.const_131,roomObjectEventHandler);
               var_29.events.addEventListener(RoomObjectWidgetRequestEvent.const_130,roomObjectEventHandler);
               var_29.events.addEventListener(RoomObjectWidgetRequestEvent.const_97,roomObjectEventHandler);
               var_29.events.addEventListener(RoomObjectFurnitureActionEvent.const_375,roomObjectEventHandler);
               var_29.events.addEventListener(RoomObjectFurnitureActionEvent.const_401,roomObjectEventHandler);
               var_29.events.addEventListener(RoomObjectFurnitureActionEvent.const_380,roomObjectEventHandler);
               var_29.events.addEventListener(RoomObjectFurnitureActionEvent.ROOM_OBJECT_STICKIE,roomObjectEventHandler);
               var_29.events.addEventListener(RoomObjectFurnitureActionEvent.const_411,roomObjectEventHandler);
               var_29.events.addEventListener(RoomObjectFurnitureActionEvent.const_409,roomObjectEventHandler);
               var_29.events.addEventListener(RoomObjectFurnitureActionEvent.const_366,roomObjectEventHandler);
               var_29.events.addEventListener(RoomObjectFurnitureActionEvent.const_356,roomObjectEventHandler);
               var_29.events.addEventListener(RoomObjectFurnitureActionEvent.const_359,roomObjectEventHandler);
               var_29.events.addEventListener(RoomObjectFurnitureActionEvent.ROOM_OBJECT_JUKEBOX_DISPOSE,roomObjectEventHandler);
               var_29.events.addEventListener(RoomObjectDimmerStateUpdateEvent.const_65,roomObjectEventHandler);
               var_29.events.addEventListener(RoomObjectMoveEvent.const_459,roomObjectEventHandler);
               var_29.events.addEventListener(RoomObjectMoveEvent.const_394,roomObjectEventHandler);
               var_29.events.addEventListener(RoomObjectRoomAdEvent.const_262,roomObjectEventHandler);
               var_29.events.addEventListener(RoomObjectRoomAdEvent.const_354,roomObjectEventHandler);
               var_29.events.addEventListener(RoomObjectRoomAdEvent.const_314,roomObjectEventHandler);
               var_29.events.addEventListener(RoomObjectRoomAdEvent.const_291,roomObjectEventHandler);
               var_29.events.addEventListener(RoomObjectRoomActionEvent.const_390,roomObjectEventHandler);
               var_29.events.addEventListener(RoomObjectRoomActionEvent.const_906,roomObjectEventHandler);
               var_29.events.addEventListener(RoomObjectRoomActionEvent.const_451,roomObjectEventHandler);
               var_29.events.addEventListener(AvatarWalkWarpingWarningEvent.const_355,warningEventHandler);
            }
         }
      }
      
      private function removeOverlayIconSprite(param1:Sprite, param2:String) : Boolean
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(param1 == null)
         {
            return false;
         }
         var _loc3_:int = param1.numChildren - 1;
         while(_loc3_ >= 0)
         {
            _loc4_ = param1.getChildAt(_loc3_) as Sprite;
            if(_loc4_ != null)
            {
               if(_loc4_.name == param2)
               {
                  param1.removeChildAt(_loc3_);
                  _loc5_ = _loc4_.getChildAt(0) as Bitmap;
                  if(_loc5_ != null && _loc5_.bitmapData != null)
                  {
                     _loc5_.bitmapData.dispose();
                     _loc5_.bitmapData = null;
                  }
                  return true;
               }
            }
            _loc3_--;
         }
         return false;
      }
      
      public function get connection() : IConnection
      {
         return _connection;
      }
      
      public function updateObjectUserState(param1:int, param2:int, param3:int, param4:RoomObjectUpdateStateMessage) : Boolean
      {
         var _loc5_:IRoomObjectController = getObjectUser(param1,param2,param3);
         if(_loc5_ == null || _loc5_.getEventHandler() == null)
         {
            return false;
         }
         _loc5_.getEventHandler().processUpdateMessage(param4);
         return true;
      }
      
      private function getWallItemColorIndex(param1:int) : int
      {
         if(var_11 != null)
         {
            return var_11.getWallItemColorIndex(param1);
         }
         return 0;
      }
      
      public function setActiveRoom(param1:int, param2:int) : void
      {
         var_118 = param1;
         var_117 = param2;
      }
      
      public function getRoomObjectCount(param1:int, param2:int, param3:int) : int
      {
         if(!var_518)
         {
            return 0;
         }
         var _loc4_:String = getRoomIdentifier(param1,param2);
         var _loc5_:IRoomInstance = var_42.getRoom(_loc4_);
         if(_loc5_ == null)
         {
            return 0;
         }
         return _loc5_.getObjectCount(param3);
      }
      
      private function warningEventHandler(param1:Event) : void
      {
         events.dispatchEvent(param1);
      }
      
      public function getRoomObjectCategory(param1:String) : int
      {
         if(var_11 != null)
         {
            return var_11.getObjectCategory(param1);
         }
         return RoomObjectCategoryEnum.const_199;
      }
      
      public function initializeRoomObjectInsert(param1:int, param2:int, param3:int, param4:String = null) : Boolean
      {
         var _loc5_:IRoomInstance = getRoom(var_118,var_117);
         if(_loc5_ == null || _loc5_.getNumber(RoomVariableEnum.const_660) != 0)
         {
            return false;
         }
         if(var_66 != null)
         {
            return var_66.initializeRoomObjectInsert(var_118,var_117,param1,param2,param3,param4);
         }
         return false;
      }
      
      public function getPlacedObjectData(param1:int, param2:int) : ISelectedRoomObjectData
      {
         var _loc3_:RoomInstanceData = getRoomInstanceData(param1,param2);
         if(_loc3_ != null)
         {
            return _loc3_.placedObject;
         }
         return null;
      }
      
      public function get activeRoomCategory() : int
      {
         return var_117;
      }
      
      public function roomManagerInitialized(param1:Boolean = true) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         if(param1)
         {
            var_518 = true;
            events.dispatchEvent(new RoomEngineEvent(RoomEngineEvent.const_587,0,0));
            _loc2_ = 0;
            while(_loc2_ < var_311.length)
            {
               _loc3_ = var_311.getWithIndex(_loc2_) as RoomData;
               if(_loc3_ != null)
               {
                  initializeRoom(_loc3_.roomId,_loc3_.roomCategory,_loc3_.data);
               }
               _loc2_++;
            }
         }
      }
      
      public function setOwnUserId(param1:int, param2:int, param3:int) : void
      {
         var _loc4_:RoomCamera = getRoomCamera(param1,param2);
         if(_loc4_ != null)
         {
            _loc4_.targetId = param3;
            _loc4_.targetCategory = RoomObjectCategoryEnum.const_36;
         }
      }
      
      public function addObjectUser(param1:int, param2:int, param3:int, param4:IVector3d, param5:IVector3d, param6:Number, param7:int, param8:String = null) : Boolean
      {
         var _loc11_:* = null;
         var _loc12_:* = null;
         if(getObjectUser(param1,param2,param3) != null)
         {
            return false;
         }
         var _loc9_:String = getUserType(param7);
         var _loc10_:IRoomObjectController = createObjectUser(param1,param2,param3,_loc9_);
         if(_loc10_ == null)
         {
            return false;
         }
         if(_loc10_ != null && _loc10_.getEventHandler() != null)
         {
            _loc11_ = new RoomObjectUpdateMessage(param4,param5);
            _loc10_.getEventHandler().processUpdateMessage(_loc11_);
            if(param8 != null)
            {
               _loc12_ = new RoomObjectAvatarFigureUpdateMessage(param8);
               _loc10_.getEventHandler().processUpdateMessage(_loc12_);
            }
         }
         if(events != null)
         {
            events.dispatchEvent(new RoomEngineObjectEvent(RoomEngineObjectEvent.const_268,param1,param2,param3,RoomObjectCategoryEnum.const_36));
         }
         return true;
      }
      
      public function disposeObjectUser(param1:int, param2:int, param3:int) : void
      {
         disposeObject(getRoomIdentifier(param1,param2),param3,RoomObjectCategoryEnum.const_36);
      }
      
      private function getUserType(param1:int) : String
      {
         switch(param1)
         {
            case 1:
               return "user";
            case 2:
               return "pet";
            case 3:
               return "bot";
            default:
               return null;
         }
      }
      
      public function isRoomObjectContentAvailable(param1:String) : Boolean
      {
         return var_42.isContentAvailable(param1);
      }
      
      public function getWorldType(param1:int, param2:int) : String
      {
         var _loc3_:RoomInstanceData = getRoomInstanceData(param1,param2);
         if(_loc3_ != null)
         {
            return _loc3_.worldType;
         }
         return null;
      }
      
      public function updateObjectFurnitureLocation(param1:int, param2:int, param3:int, param4:RoomObjectUpdateMessage) : Boolean
      {
         var _loc5_:IRoomObjectController = getObjectFurniture(param1,param2,param3);
         if(_loc5_ == null)
         {
            return false;
         }
         if(_loc5_ != null && _loc5_.getEventHandler() != null)
         {
            _loc5_.getEventHandler().processUpdateMessage(param4);
         }
         return true;
      }
      
      private function getObjectFurniture(param1:int, param2:int, param3:int) : IRoomObjectController
      {
         return getObject(getRoomIdentifier(param1,param2),param3,RoomObjectCategoryEnum.const_31);
      }
      
      public function insertContentLibrary(param1:int, param2:int, param3:IAssetLibrary) : Boolean
      {
         return var_11.insertObjectContent(param1,param2,param3);
      }
      
      public function getRoomObjectImage(param1:int, param2:int, param3:int, param4:int, param5:IVector3d, param6:int, param7:IGetImageListener, param8:uint = 0) : ImageResult
      {
         var _loc11_:* = null;
         var _loc14_:* = null;
         var _loc9_:* = null;
         var _loc10_:String = "";
         var _loc12_:String = getRoomIdentifier(param1,param2);
         var _loc13_:IRoomInstance = var_42.getRoom(_loc12_);
         if(_loc13_ != null)
         {
            _loc14_ = _loc13_.getObject(param3,param4);
            if(_loc14_ != null && _loc14_.getModel() != null)
            {
               _loc9_ = _loc14_.getType();
               switch(param4)
               {
                  case RoomObjectCategoryEnum.const_31:
                  case RoomObjectCategoryEnum.const_30:
                     _loc10_ = String(_loc14_.getModel().getNumber(RoomObjectVariableEnum.const_210));
                     _loc11_ = _loc14_.getModel().getString(RoomObjectVariableEnum.const_448);
                     break;
                  case RoomObjectCategoryEnum.const_36:
                     _loc10_ = _loc14_.getModel().getString(RoomObjectVariableEnum.const_159);
               }
            }
         }
         return getGenericRoomObjectImage(_loc9_,_loc10_,param5,param6,param7,null,param8,_loc11_);
      }
      
      private function getWallItemType(param1:int, param2:String = null) : String
      {
         if(var_11 != null)
         {
            return var_11.getWallItemType(param1,param2);
         }
         return "";
      }
      
      public function get isInitialized() : Boolean
      {
         return var_518;
      }
      
      private function getObjectWallItem(param1:int, param2:int, param3:int) : IRoomObjectController
      {
         return getObject(getRoomIdentifier(param1,param2),param3,RoomObjectCategoryEnum.const_30);
      }
      
      public function updateObjectUser(param1:int, param2:int, param3:int, param4:IVector3d, param5:IVector3d, param6:IVector3d = null, param7:Number = NaN) : Boolean
      {
         var _loc8_:IRoomObjectController = getObjectUser(param1,param2,param3);
         if(_loc8_ == null || _loc8_.getEventHandler() == null || _loc8_.getModel() == null)
         {
            return false;
         }
         if(param4 == null)
         {
            param4 = _loc8_.getLocation();
         }
         if(param6 == null)
         {
            param6 = _loc8_.getDirection();
         }
         if(isNaN(param7))
         {
            param7 = _loc8_.getModel().getNumber(RoomObjectVariableEnum.const_319);
         }
         var _loc9_:RoomObjectUpdateMessage = new RoomObjectAvatarUpdateMessage(param4,param5,param6,param7);
         _loc8_.getEventHandler().processUpdateMessage(_loc9_);
         return true;
      }
      
      public function disposeObjectFurniture(param1:int, param2:int, param3:int) : void
      {
         disposeObject(getRoomIdentifier(param1,param2),param3,RoomObjectCategoryEnum.const_31);
      }
      
      private function onContentLoaderReady(param1:Event) : void
      {
         if(param1 != null && param1.type == RoomContentLoader.const_720)
         {
            var_2166 = true;
            initializeRoomManager();
         }
      }
      
      public function getRoom(param1:int, param2:int) : IRoomInstance
      {
         if(!var_518)
         {
            return null;
         }
         var _loc3_:String = getRoomIdentifier(param1,param2);
         return var_42.getRoom(_loc3_);
      }
      
      public function addObjectWallItem(param1:int, param2:int, param3:int, param4:int, param5:IVector3d, param6:IVector3d, param7:int, param8:String) : Boolean
      {
         var _loc9_:String = getWallItemType(param4,param8);
         var _loc10_:int = getWallItemColorIndex(param4);
         var _loc11_:String = getRoomObjectAdURL(_loc9_);
         if(_loc9_ == null)
         {
            _loc9_ = "";
         }
         var _loc12_:IRoomObjectController = createObjectWallItem(param1,param2,param3,_loc9_);
         if(_loc12_ == null)
         {
            return false;
         }
         if(_loc12_ != null && _loc12_.getModelController() != null)
         {
            _loc12_.getModelController().setNumber(RoomObjectVariableEnum.const_210,_loc10_,false);
            _loc12_.getModelController().setNumber(RoomObjectVariableEnum.const_331,param4,true);
            _loc12_.getModelController().setString(RoomObjectVariableEnum.const_281,_loc11_,true);
            _loc12_.getModelController().setNumber(RoomObjectVariableEnum.const_961,1,true);
         }
         if(!updateObjectWallItem(param1,param2,param3,param5,param6,param7,param8))
         {
            return false;
         }
         if(events != null)
         {
            events.dispatchEvent(new RoomEngineObjectEvent(RoomEngineObjectEvent.const_268,param1,param2,param3,RoomObjectCategoryEnum.const_30));
         }
         var _loc13_:ISelectedRoomObjectData = getPlacedObjectData(param1,param2);
         if(_loc13_ && _loc13_.id == param3 && _loc13_.category == RoomObjectCategoryEnum.const_30)
         {
            selectRoomObject(param1,param2,param3,RoomObjectCategoryEnum.const_30);
         }
         return true;
      }
      
      private function getRoomCanvasRectangle(param1:int, param2:int, param3:int) : Rectangle
      {
         var _loc4_:IRoomRenderingCanvas = getRoomCanvas(param1,param2,param3);
         if(_loc4_ == null)
         {
            return null;
         }
         return new Rectangle(0,0,_loc4_.width,_loc4_.height);
      }
      
      public function updateObjectFurniture(param1:int, param2:int, param3:int, param4:IVector3d, param5:IVector3d, param6:int, param7:String, param8:Number = NaN) : Boolean
      {
         var _loc9_:IRoomObjectController = getObjectFurniture(param1,param2,param3);
         if(_loc9_ == null)
         {
            return false;
         }
         var _loc10_:RoomObjectUpdateMessage = new RoomObjectUpdateMessage(param4,param5);
         var _loc11_:RoomObjectDataUpdateMessage = new RoomObjectDataUpdateMessage(param6,param7,param8);
         if(_loc9_ != null && _loc9_.getEventHandler() != null)
         {
            _loc9_.getEventHandler().processUpdateMessage(_loc10_);
            _loc9_.getEventHandler().processUpdateMessage(_loc11_);
         }
         return true;
      }
      
      private function getRoomCategory(param1:String) : int
      {
         return 1;
      }
      
      private function createObject(param1:String, param2:int, param3:String, param4:int) : IRoomObjectController
      {
         var _loc5_:IRoomInstance = var_42.getRoom(param1);
         if(_loc5_ == null)
         {
            return null;
         }
         var _loc6_:* = null;
         return _loc5_.createRoomObject(param2,param3,param4) as IRoomObjectController;
      }
      
      private function onAdManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_263 = param2 as IAdManager;
         var_263.events.addEventListener(AdEvent.const_384,showRoomAd);
      }
      
      private function getOverlaySprite(param1:IRoomRenderingCanvas) : Sprite
      {
         if(param1 == null)
         {
            return null;
         }
         var _loc2_:Sprite = param1.displayObject as Sprite;
         if(_loc2_ == null)
         {
            return null;
         }
         return _loc2_.getChildByName(const_775) as Sprite;
      }
      
      public function selectAvatar(param1:int, param2:int, param3:int, param4:Boolean) : void
      {
         if(var_66 != null)
         {
            var_66.setSelectedAvatar(param1,param2,param3,param4);
         }
      }
      
      public function updateObjectWallItem(param1:int, param2:int, param3:int, param4:IVector3d, param5:IVector3d, param6:int, param7:String) : Boolean
      {
         var _loc8_:IRoomObjectController = getObjectWallItem(param1,param2,param3);
         if(_loc8_ == null)
         {
            return false;
         }
         var _loc9_:RoomObjectUpdateMessage = new RoomObjectUpdateMessage(param4,param5);
         var _loc10_:RoomObjectDataUpdateMessage = new RoomObjectDataUpdateMessage(param6,param7);
         if(_loc8_ != null && _loc8_.getEventHandler() != null)
         {
            _loc8_.getEventHandler().processUpdateMessage(_loc9_);
            _loc8_.getEventHandler().processUpdateMessage(_loc10_);
         }
         updateObjectRoomWindow(param1,param2,param3);
         return true;
      }
      
      private function onConnectionReady(param1:IConnection) : void
      {
         if(disposed)
         {
            return;
         }
         if(param1 != null)
         {
            _connection = param1;
            if(var_726 != null)
            {
               var_726.connection = param1;
            }
         }
      }
      
      private function getFurnitureColorIndex(param1:int) : int
      {
         if(var_11 != null)
         {
            return var_11.getActiveObjectColorIndex(param1);
         }
         return 0;
      }
      
      public function getFurnitureImage(param1:int, param2:IVector3d, param3:int, param4:IGetImageListener, param5:String = null, param6:uint = 0) : ImageResult
      {
         var _loc7_:* = null;
         var _loc8_:String = "";
         if(var_11 != null)
         {
            _loc7_ = var_11.getActiveObjectType(param1);
            _loc8_ = String(var_11.getActiveObjectColorIndex(param1));
         }
         return getGenericRoomObjectImage(_loc7_,_loc8_,param2,param3,param4,null,param6,param5);
      }
      
      private function initialize() : void
      {
      }
      
      public function getSelectedAvatarId() : int
      {
         if(var_66 != null)
         {
            return var_66.getSelectedAvatarId();
         }
         return -1;
      }
      
      public function getRoomNumberValue(param1:int, param2:int, param3:String) : Number
      {
         var _loc4_:IRoomInstance = getRoom(param1,param2);
         if(_loc4_ != null)
         {
            return _loc4_.getNumber(param3);
         }
         return NaN;
      }
      
      public function disposeRoom(param1:int, param2:int) : void
      {
         var _loc3_:String = getRoomIdentifier(param1,param2);
         var_42.disposeRoom(_loc3_);
         var _loc4_:RoomInstanceData = var_312.remove(_loc3_);
         if(_loc4_ != null)
         {
            _loc4_.dispose();
         }
         events.dispatchEvent(new RoomEngineEvent(RoomEngineEvent.const_514,param1,param2));
      }
      
      private function onRendererFactoryReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_725 = param2 as IRoomRendererFactory;
         initializeRoomManager();
      }
      
      private function getObjectUser(param1:int, param2:int, param3:int) : IRoomObjectController
      {
         return getObject(getRoomIdentifier(param1,param2),param3,RoomObjectCategoryEnum.const_36);
      }
      
      public function getRoomCanvasGeometry(param1:int, param2:int, param3:int) : IRoomGeometry
      {
         var _loc4_:IRoomRenderingCanvas = getRoomCanvas(param1,param2,param3);
         if(_loc4_ == null)
         {
            return null;
         }
         return _loc4_.geometry;
      }
      
      public function getRoomObjectWithIndex(param1:int, param2:int, param3:int, param4:int) : IRoomObject
      {
         if(!var_518)
         {
            return null;
         }
         var _loc5_:String = getRoomIdentifier(param1,param2);
         var _loc6_:IRoomInstance = var_42.getRoom(_loc5_);
         if(_loc6_ == null)
         {
            return null;
         }
         return _loc6_.getObjectWithIndex(param3,param4);
      }
      
      public function getGenericRoomObjectImage(param1:String, param2:String, param3:IVector3d, param4:int, param5:IGetImageListener, param6:String = null, param7:uint = 0, param8:String = null) : ImageResult
      {
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc19_:* = null;
         var _loc20_:* = null;
         var _loc21_:* = null;
         var _loc22_:* = null;
         var _loc23_:* = null;
         var _loc24_:* = null;
         var _loc9_:ImageResult = new ImageResult();
         _loc9_.id = -1;
         if(!var_518 || param1 == null)
         {
            return _loc9_;
         }
         var _loc10_:IRoomInstance = var_42.getRoom(const_494);
         if(_loc10_ == null)
         {
            _loc10_ = var_42.createRoom(const_494,null);
            if(_loc10_ == null)
            {
               return _loc9_;
            }
         }
         var _loc11_:int = var_605.reserveNumber();
         var _loc12_:int = getRoomObjectCategory(param1);
         if(_loc11_ < 0)
         {
            return _loc9_;
         }
         _loc11_ += 1;
         var _loc13_:IRoomObjectController = _loc10_.createRoomObject(_loc11_,param1,_loc12_) as IRoomObjectController;
         if(_loc13_ == null || _loc13_.getModelController() == null || _loc13_.getEventHandler() == null)
         {
            return _loc9_;
         }
         switch(_loc12_)
         {
            case RoomObjectCategoryEnum.const_31:
            case RoomObjectCategoryEnum.const_30:
               _loc13_.getModelController().setNumber(RoomObjectVariableEnum.const_210,int(param2));
               _loc13_.getModelController().setString(RoomObjectVariableEnum.const_448,param8);
               break;
            case RoomObjectCategoryEnum.const_36:
               _loc13_.getModelController().setString(RoomObjectVariableEnum.const_159,param2);
               break;
            case RoomObjectCategoryEnum.const_62:
               if(param2 != null)
               {
                  _loc17_ = param2.split("\n");
                  if(_loc17_.length >= 3)
                  {
                     _loc18_ = _loc17_[0];
                     _loc19_ = _loc17_[1];
                     _loc20_ = _loc17_[2];
                     _loc21_ = new RoomPlaneParser();
                     _loc21_.addPlane(RoomPlaneData.const_152,new Vector3d(0,0,0),new Vector3d(10,0,0),new Vector3d(0,10,0));
                     _loc21_.addPlane(RoomPlaneData.const_149,new Vector3d(0,0,0),new Vector3d(0,10,0),new Vector3d(0,0,10));
                     _loc21_.addPlane(RoomPlaneData.const_149,new Vector3d(10,0,0),new Vector3d(-10,0,0),new Vector3d(0,0,10));
                     _loc21_.addPlane(RoomPlaneData.const_251,new Vector3d(10,0,0),new Vector3d(-10,0,0),new Vector3d(0,0,10));
                     _loc22_ = _loc21_.getXML();
                     _loc13_.getEventHandler().initialize(_loc22_);
                     _loc13_.getModelController().setString(RoomObjectVariableEnum.const_692,_loc18_);
                     _loc13_.getModelController().setString(RoomObjectVariableEnum.const_683,_loc19_);
                     _loc13_.getModelController().setString(RoomObjectVariableEnum.const_549,_loc20_);
                     if(param6 != null)
                     {
                        _loc23_ = null;
                        _loc24_ = "undefined_" + _loc11_;
                        _loc23_ = new RoomObjectRoomMaskUpdateMessage(RoomObjectRoomMaskUpdateMessage.const_393,_loc24_,param6,new Vector3d(2,0,1.75));
                        _loc13_.getEventHandler().processUpdateMessage(_loc23_);
                     }
                  }
               }
         }
         _loc13_.setDirection(param3);
         var _loc14_:* = null;
         _loc14_ = _loc13_.getVisualization() as IRoomObjectSpriteVisualization;
         if(_loc14_ == null)
         {
            _loc10_.disposeObject(_loc11_,_loc12_);
            return _loc9_;
         }
         var _loc15_:RoomGeometry = new RoomGeometry(param4,new Vector3d(-135,30,0),new Vector3d(11,11,5));
         _loc14_.update(_loc15_);
         var _loc16_:BitmapData = _loc14_.getImage(param7);
         _loc9_.data = _loc16_;
         _loc9_.id = _loc11_;
         if(!isRoomObjectContentAvailable(param1) && param5 != null)
         {
            var_1062.add(String(_loc11_),param5);
            _loc13_.getModelController().setNumber(RoomObjectVariableEnum.const_840,param4,true);
         }
         else
         {
            _loc10_.disposeObject(_loc11_,_loc12_);
            var_605.freeNumber(_loc11_ - 1);
            _loc9_.id = 0;
         }
         _loc15_.dispose();
         return _loc9_;
      }
      
      public function getWallItemImage(param1:int, param2:IVector3d, param3:int, param4:IGetImageListener, param5:String = null, param6:uint = 0) : ImageResult
      {
         var _loc7_:* = null;
         var _loc8_:String = "";
         if(var_11 != null)
         {
            _loc7_ = var_11.getWallItemType(param1,param5);
            _loc8_ = String(var_11.getWallItemColorIndex(param1));
         }
         return getGenericRoomObjectImage(_loc7_,_loc8_,param2,param3,param4);
      }
      
      public function getTileCursor(param1:int, param2:int) : IRoomObjectController
      {
         return getObject(getRoomIdentifier(param1,param2),const_777,RoomObjectCategoryEnum.OBJECT_CATEGORY_CURSOR);
      }
      
      public function setWorldType(param1:int, param2:int, param3:String) : void
      {
         var _loc4_:RoomInstanceData = getRoomInstanceData(param1,param2);
         if(_loc4_ != null)
         {
            _loc4_.worldType = param3;
         }
      }
      
      private function onCommunicationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         _communication = param2 as IHabboCommunicationManager;
         if(_communication != null)
         {
            _connection = _communication.getHabboMainConnection(onConnectionReady);
            if(_connection != null)
            {
               onConnectionReady(_connection);
            }
         }
         initializeRoomManager();
      }
      
      public function handleRoomCanvasMouseEvent(param1:int, param2:int, param3:int, param4:String, param5:Boolean, param6:Boolean, param7:Boolean, param8:Boolean) : void
      {
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc9_:IRoomRenderingCanvas = getRoomCanvas(var_118,var_117,param1);
         if(_loc9_ != null)
         {
            var_1311 = param1;
            var_1553 = param2;
            var_1554 = param3;
            _loc10_ = getOverlaySprite(_loc9_);
            _loc11_ = getOverlayIconSprite(_loc10_,const_280);
            if(_loc11_ != null)
            {
               _loc12_ = _loc11_.getRect(_loc11_);
               _loc11_.x = var_1553 - _loc12_.width / 2;
               _loc11_.y = var_1554 - _loc12_.height / 2;
            }
            if(!_loc9_.handleMouseEvent(param2,param3,param4,param5,param6,param7,param8))
            {
               _loc13_ = "";
               if(param4 == MouseEvent.CLICK)
               {
                  if(events != null)
                  {
                     events.dispatchEvent(new RoomEngineObjectEvent(RoomEngineObjectEvent.const_477,var_118,var_117,-1,RoomObjectCategoryEnum.const_199));
                  }
                  _loc13_ = "null";
               }
               else if(param4 == MouseEvent.MOUSE_MOVE)
               {
                  _loc13_ = "null";
               }
               else if(param4 == MouseEvent.MOUSE_DOWN)
               {
                  _loc13_ = "null";
               }
               if(var_66 != null)
               {
                  _loc14_ = new RoomObjectMouseEvent(_loc13_,const_279,const_495);
                  var_66.handleRoomObjectEvent(_loc14_,var_118,var_117);
               }
            }
         }
      }
      
      public function isPublicRoom(param1:int, param2:int) : Boolean
      {
         return isPublicRoomWorldType(getWorldType(param1,param2));
      }
      
      public function setRoomObjectAlias(param1:String, param2:String) : void
      {
         if(var_11 != null)
         {
            var_11.setRoomObjectAlias(param1,param2);
         }
      }
      
      public function setObjectMoverIconSprite(param1:int, param2:int, param3:Boolean, param4:String = null) : void
      {
         var _loc8_:* = null;
         var _loc9_:int = 0;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc6_:* = null;
         if(param3)
         {
            _loc6_ = getRoomObjectImage(var_118,var_117,param1,param2,new Vector3d(),1,null);
         }
         else if(var_11 != null)
         {
            _loc8_ = null;
            _loc9_ = 0;
            if(param2 == RoomObjectCategoryEnum.const_31)
            {
               _loc8_ = var_11.getActiveObjectType(param1);
               _loc9_ = var_11.getActiveObjectColorIndex(param1);
            }
            else if(param2 == RoomObjectCategoryEnum.const_30)
            {
               _loc8_ = var_11.getWallItemType(param1,param4);
               _loc9_ = var_11.getWallItemColorIndex(param1);
            }
            if(param2 == RoomObjectCategoryEnum.const_36)
            {
               _loc6_ = getGenericRoomObjectImage(getUserType(param1),param4,new Vector3d(180),1,null);
            }
            else
            {
               _loc6_ = getGenericRoomObjectImage(_loc8_,String(_loc9_),new Vector3d(),1,null,null,0,param4);
            }
         }
         if(_loc6_ == null || _loc6_.data == null)
         {
            return;
         }
         var _loc7_:IRoomRenderingCanvas = getRoomCanvas(var_118,var_117,var_1311);
         if(_loc7_ != null)
         {
            _loc10_ = getOverlaySprite(_loc7_);
            removeOverlayIconSprite(_loc10_,const_280);
            _loc11_ = addOverlayIconSprite(_loc10_,const_280,_loc6_.data);
            if(_loc11_ != null)
            {
               _loc11_.x = var_1553 - _loc6_.data.width / 2;
               _loc11_.y = var_1554 - _loc6_.data.height / 2;
            }
         }
      }
      
      private function showRoomAd(param1:AdEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(var_11 != null)
         {
            _loc2_ = getWorldType(param1.roomId,param1.roomCategory);
            var_11.addGraphicAsset(var_11.getPublicRoomContentType(_loc2_),RoomObjectVariableEnum.const_308,param1.image,true);
            var_11.addGraphicAsset(var_11.getPublicRoomContentType(_loc2_),RoomObjectVariableEnum.const_1004,param1.adWarningL,true);
            var_11.addGraphicAsset(var_11.getPublicRoomContentType(_loc2_),RoomObjectVariableEnum.const_948,param1.adWarningR,true);
            _loc3_ = getObjectRoom(param1.roomId,param1.roomCategory);
            if(_loc3_ == null)
            {
               return;
            }
            _loc4_ = null;
            _loc4_ = new RoomObjectRoomAdUpdateMessage(RoomObjectRoomAdUpdateMessage.const_812,RoomObjectVariableEnum.const_308,param1.clickUrl);
            _loc3_.getEventHandler().processUpdateMessage(_loc4_);
         }
      }
      
      private function getRoomInstanceData(param1:int, param2:int) : RoomInstanceData
      {
         var _loc3_:String = getRoomIdentifier(param1,param2);
         var _loc4_:RoomInstanceData = var_312.getValue(_loc3_) as RoomInstanceData;
         if(_loc4_ == null)
         {
            _loc4_ = new RoomInstanceData(param1,param2);
            var_312.add(_loc3_,_loc4_);
         }
         return _loc4_;
      }
      
      private function createObjectUser(param1:int, param2:int, param3:int, param4:String) : IRoomObjectController
      {
         var _loc5_:int = 0;
         return createObject(getRoomIdentifier(param1,param2),param3,param4,_loc5_);
      }
      
      public function getRoomStringValue(param1:int, param2:int, param3:String) : String
      {
         var _loc4_:IRoomInstance = getRoom(param1,param2);
         if(_loc4_ != null)
         {
            return _loc4_.getString(param3);
         }
         return null;
      }
      
      public function getFurnitureIcon(param1:int, param2:IGetImageListener, param3:String = null) : ImageResult
      {
         return getFurnitureImage(param1,new Vector3d(),1,param2,param3);
      }
      
      private function getRoomCamera(param1:int, param2:int) : RoomCamera
      {
         var _loc3_:RoomInstanceData = getRoomInstanceData(param1,param2);
         if(_loc3_ != null)
         {
            return _loc3_.roomCamera;
         }
         return null;
      }
      
      public function isPublicRoomWorldType(param1:String) : Boolean
      {
         if(var_11 != null)
         {
            return var_11.isPublicRoomWorldType(param1);
         }
         return false;
      }
      
      private function onObjectFactoryReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_29 = param2 as IRoomObjectFactory;
         initializeObjectEvents();
         initializeRoomManager();
      }
      
      private function onHabboConfigurationInit(param1:Event) : void
      {
         if(var_11 != null)
         {
            _events.addEventListener(RoomContentLoader.const_720,onContentLoaderReady);
            var_11.initialize(_events,_habboConfiguration);
         }
         initializeRoomManager();
      }
      
      public function cancelRoomObjectInsert() : void
      {
         if(var_66 != null)
         {
            var_66.cancelRoomObjectInsert(var_118,var_117);
         }
      }
      
      public function contentLoaded(param1:String, param2:Boolean = false) : void
      {
         var _loc9_:* = null;
         var _loc10_:int = 0;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:Number = NaN;
         var _loc3_:IRoomInstance = var_42.getRoom(const_494);
         if(_loc3_ == null)
         {
            return;
         }
         if(var_11 == null)
         {
            return;
         }
         var _loc4_:* = null;
         var _loc5_:* = 0;
         var _loc6_:int = var_11.getObjectCategory(param1);
         var _loc7_:int = _loc3_.getObjectCount(_loc6_);
         var _loc8_:int = _loc7_ - 1;
         while(_loc8_ >= 0)
         {
            _loc9_ = _loc3_.getObjectWithIndex(_loc8_,_loc6_);
            if(_loc9_ != null && _loc9_.getModel() != null && _loc9_.getType() == param1)
            {
               _loc10_ = _loc9_.getId();
               _loc11_ = null;
               _loc12_ = null;
               _loc12_ = _loc9_.getVisualization() as IRoomObjectSpriteVisualization;
               if(_loc12_ != null)
               {
                  _loc14_ = _loc9_.getModel().getNumber(RoomObjectVariableEnum.const_840);
                  if(_loc4_ != null && _loc5_ != _loc14_)
                  {
                     _loc4_.dispose();
                     _loc4_ = null;
                  }
                  if(_loc4_ == null)
                  {
                     _loc5_ = Number(_loc14_);
                     _loc4_ = new RoomGeometry(_loc14_,new Vector3d(-135,30,0),new Vector3d(11,11,5));
                  }
                  _loc12_.update(_loc4_);
                  _loc11_ = _loc12_.image;
               }
               _loc3_.disposeObject(_loc10_,_loc6_);
               var_605.freeNumber(_loc10_ - 1);
               _loc13_ = var_1062.remove(String(_loc10_)) as IGetImageListener;
               if(_loc13_ != null && _loc11_ != null)
               {
                  _loc13_.imageReady(_loc10_,_loc11_);
               }
               else if(_loc11_ != null)
               {
                  _loc11_.dispose();
               }
            }
            _loc8_--;
         }
         if(_loc4_ != null)
         {
            _loc4_.dispose();
         }
      }
      
      public function getActiveRoomBoundingRectangle(param1:int) : Rectangle
      {
         return getRoomObjectBoundingRectangle(var_118,var_117,const_279,RoomObjectCategoryEnum.const_62,param1);
      }
      
      private function createRoom(param1:String, param2:XML, param3:String, param4:String, param5:String, param6:String) : IRoomInstance
      {
         var _loc12_:* = null;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:* = null;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:* = null;
         var _loc21_:* = null;
         var _loc22_:* = null;
         var _loc23_:int = 0;
         var _loc24_:* = null;
         var _loc25_:Number = NaN;
         var _loc26_:Number = NaN;
         var _loc27_:Number = NaN;
         var _loc28_:Number = NaN;
         var _loc29_:* = null;
         var _loc30_:* = null;
         var _loc31_:* = null;
         if(!var_518)
         {
            return null;
         }
         var _loc7_:IRoomInstance = var_42.createRoom(param1,param2);
         if(_loc7_ == null)
         {
            return null;
         }
         var _loc8_:int = 0;
         var _loc9_:* = null;
         var _loc10_:* = 1;
         if(isPublicRoomWorldType(param6))
         {
            _loc12_ = var_11.getPublicRoomContentType(param6);
            _loc9_ = _loc7_.createRoomObject(const_279,_loc12_,_loc8_) as IRoomObjectController;
            _loc9_.getModelController().setString(RoomObjectVariableEnum.const_995,param6,true);
            _loc7_.setNumber(RoomVariableEnum.const_660,1,true);
            _loc13_ = parseInt(_habboConfiguration.getKey("ads.billboard.displayDelayMillis","1000"));
            _loc9_.getModelController().setNumber(RoomVariableEnum.const_874,_loc13_,true);
            if(var_11 != null)
            {
               _loc10_ = Number(var_11.getPublicRoomWorldHeightScale(param6));
            }
         }
         else
         {
            _loc9_ = _loc7_.createRoomObject(const_279,const_495,_loc8_) as IRoomObjectController;
            _loc7_.setNumber(RoomVariableEnum.const_660,0,true);
         }
         _loc7_.setNumber(RoomVariableEnum.const_641,_loc10_,true);
         if(param2 != null)
         {
            _loc14_ = 0;
            if(param2.dimensions.length() == 1)
            {
               _loc15_ = param2.dimensions[0];
               _loc16_ = Number(_loc15_.@minX);
               _loc17_ = Number(_loc15_.@maxX);
               _loc18_ = Number(_loc15_.@minY);
               _loc19_ = Number(_loc15_.@maxY);
               _loc7_.setNumber(RoomVariableEnum.const_667,_loc16_);
               _loc7_.setNumber(RoomVariableEnum.const_696,_loc17_);
               _loc7_.setNumber(RoomVariableEnum.const_703,_loc18_);
               _loc7_.setNumber(RoomVariableEnum.const_707,_loc19_);
               _loc14_ += _loc16_ * 423 + _loc17_ * 671 + _loc18_ * 913 + _loc19_ * 7509;
               if(_loc9_ != null && _loc9_.getModelController() != null)
               {
                  _loc9_.getModelController().setNumber(RoomObjectVariableEnum.const_856,_loc14_,true);
               }
            }
         }
         if(_loc9_ != null && _loc9_.getEventHandler() != null)
         {
            _loc9_.getEventHandler().initialize(param2);
         }
         var _loc11_:* = null;
         if(param3 != null)
         {
            _loc11_ = new RoomObjectRoomUpdateMessage(RoomObjectRoomUpdateMessage.const_593,param3);
            _loc9_.getEventHandler().processUpdateMessage(_loc11_);
         }
         if(param4 != null)
         {
            _loc11_ = new RoomObjectRoomUpdateMessage(RoomObjectRoomUpdateMessage.const_698,param4);
            _loc9_.getEventHandler().processUpdateMessage(_loc11_);
         }
         if(param5 != null)
         {
            _loc11_ = new RoomObjectRoomUpdateMessage(RoomObjectRoomUpdateMessage.const_569,param5);
            _loc9_.getEventHandler().processUpdateMessage(_loc11_);
         }
         if(param2 != null)
         {
            if(param2.doors.door.length() > 0)
            {
               _loc20_ = param2.doors.door;
               _loc21_ = ["x","y","z","dir"];
               _loc22_ = null;
               _loc23_ = 0;
               while(_loc23_ < _loc20_.length())
               {
                  _loc24_ = _loc20_[_loc23_];
                  if(XMLValidator.checkRequiredAttributes(_loc24_,_loc21_))
                  {
                     _loc25_ = Number(_loc24_.@x);
                     _loc26_ = Number(_loc24_.@y);
                     _loc27_ = Number(_loc24_.@z);
                     _loc28_ = Number(_loc24_.@dir);
                     _loc29_ = "null";
                     _loc30_ = "door_" + _loc23_;
                     _loc31_ = new Vector3d(_loc25_,_loc26_,_loc27_);
                     _loc22_ = new RoomObjectRoomMaskUpdateMessage(RoomObjectRoomMaskUpdateMessage.const_393,_loc30_,_loc29_,_loc31_,RoomObjectRoomMaskUpdateMessage.const_215);
                     _loc9_.getEventHandler().processUpdateMessage(_loc22_);
                     if(_loc28_ == 90 || _loc28_ == 180)
                     {
                        if(_loc28_ == 90)
                        {
                           _loc7_.setNumber(RoomObjectVariableEnum.const_657,_loc25_ - 0.5,true);
                           _loc7_.setNumber(RoomObjectVariableEnum.const_604,_loc26_,true);
                        }
                        if(_loc28_ == 180)
                        {
                           _loc7_.setNumber(RoomObjectVariableEnum.const_657,_loc25_,true);
                           _loc7_.setNumber(RoomObjectVariableEnum.const_604,_loc26_ - 0.5,true);
                        }
                        _loc7_.setNumber(RoomObjectVariableEnum.const_1002,_loc27_,true);
                        _loc7_.setNumber(RoomObjectVariableEnum.const_818,_loc28_,true);
                     }
                  }
                  _loc23_++;
               }
            }
         }
         _loc7_.createRoomObject(const_777,const_1106,RoomObjectCategoryEnum.OBJECT_CATEGORY_CURSOR);
         _loc7_.createRoomObject(const_776,OBJECT_TYPE_SELECTION_ARROW,RoomObjectCategoryEnum.OBJECT_CATEGORY_CURSOR);
         return _loc7_;
      }
      
      public function getRoomObject(param1:int, param2:int, param3:int, param4:int) : IRoomObject
      {
         if(!var_518)
         {
            return null;
         }
         var _loc5_:String = getRoomIdentifier(param1,param2);
         var _loc6_:IRoomInstance = var_42.getRoom(_loc5_);
         if(_loc6_ == null)
         {
            return null;
         }
         return _loc6_.getObject(param3,param4);
      }
   }
}
