package com.sulake.habbo.avatar
{
   import com.sulake.habbo.avatar.actions.IActionDefinition;
   import com.sulake.habbo.avatar.structure.figure.IPartColor;
   import flash.geom.ColorTransform;
   
   public class AvatarImagePartContainer
   {
       
      
      private var _frames:Array;
      
      private var var_2223:int;
      
      private var var_2225:String;
      
      private var var_1405:IActionDefinition;
      
      private var var_2220:Boolean;
      
      private var _color:IPartColor;
      
      private var var_2224:String;
      
      private var var_2222:String;
      
      private var var_1788:Boolean;
      
      private var var_2221:ColorTransform;
      
      private var var_1923:int;
      
      public function AvatarImagePartContainer(param1:String, param2:String, param3:int, param4:IPartColor, param5:Array, param6:IActionDefinition, param7:Boolean, param8:int, param9:String = "", param10:Boolean = false, param11:Number = 1)
      {
         super();
         var_2225 = param1;
         var_2224 = param2;
         var_2223 = param3;
         _color = param4;
         _frames = param5;
         var_1405 = param6;
         var_1788 = param7;
         var_1923 = param8;
         var_2222 = param9;
         var_2220 = param10;
         var_2221 = new ColorTransform(1,1,1,param11);
      }
      
      public function get isColorable() : Boolean
      {
         return var_1788;
      }
      
      public function get partType() : String
      {
         return var_2224;
      }
      
      public function getFrameIndex(param1:int) : int
      {
         return 0;
      }
      
      public function get paletteMapId() : int
      {
         return var_1923;
      }
      
      public function get isBlendable() : Boolean
      {
         return var_2220;
      }
      
      public function get color() : IPartColor
      {
         return _color;
      }
      
      public function get partId() : int
      {
         return var_2223;
      }
      
      public function get flippedPartType() : String
      {
         return var_2222;
      }
      
      public function get bodyPartId() : String
      {
         return var_2225;
      }
      
      public function get action() : IActionDefinition
      {
         return var_1405;
      }
      
      public function get blendTransform() : ColorTransform
      {
         return var_2221;
      }
   }
}
