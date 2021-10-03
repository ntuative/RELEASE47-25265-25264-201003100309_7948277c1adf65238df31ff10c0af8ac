package com.sulake.habbo.inventory.effects
{
   import com.sulake.habbo.inventory.common.IThumbListDrawableItem;
   import com.sulake.habbo.widget.memenu.IWidgetAvatarEffect;
   import flash.display.BitmapData;
   
   public class Effect implements IWidgetAvatarEffect, IThumbListDrawableItem
   {
       
      
      private var _isSelected:Boolean = false;
      
      private var var_2172:Date;
      
      private var var_1312:Boolean = false;
      
      private var _type:int;
      
      private var var_372:BitmapData;
      
      private var var_267:Boolean = false;
      
      private var var_1218:int;
      
      private var var_606:int = 1;
      
      private var var_1064:int;
      
      public function Effect()
      {
         super();
      }
      
      public function get icon() : BitmapData
      {
         return var_372;
      }
      
      public function set type(param1:int) : void
      {
         _type = param1;
      }
      
      public function setOneEffectExpired() : void
      {
         --var_606;
         if(var_606 < 0)
         {
            var_606 = 0;
         }
         var_1064 = var_1218;
         var_267 = false;
         var_1312 = false;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         _isSelected = param1;
      }
      
      public function set secondsLeft(param1:int) : void
      {
         var_1064 = param1;
      }
      
      public function get isActive() : Boolean
      {
         return var_267;
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         var_372 = param1;
      }
      
      public function get duration() : int
      {
         return var_1218;
      }
      
      public function get isInUse() : Boolean
      {
         return var_1312;
      }
      
      public function get effectsInInventory() : int
      {
         return var_606;
      }
      
      public function get iconImage() : BitmapData
      {
         return var_372;
      }
      
      public function get isSelected() : Boolean
      {
         return _isSelected;
      }
      
      public function set isActive(param1:Boolean) : void
      {
         if(param1 && !var_267)
         {
            var_2172 = new Date();
         }
         var_267 = param1;
      }
      
      public function set effectsInInventory(param1:int) : void
      {
         var_606 = param1;
      }
      
      public function get secondsLeft() : int
      {
         var _loc1_:int = 0;
         if(var_267)
         {
            _loc1_ = var_1064 - (new Date().valueOf() - var_2172.valueOf()) / 1000;
            _loc1_ = Math.floor(_loc1_);
            if(_loc1_ < 0)
            {
               _loc1_ = 0;
            }
            return _loc1_;
         }
         return var_1064;
      }
      
      public function set isInUse(param1:Boolean) : void
      {
         var_1312 = param1;
      }
      
      public function set duration(param1:int) : void
      {
         var_1218 = param1;
      }
      
      public function get type() : int
      {
         return _type;
      }
   }
}
