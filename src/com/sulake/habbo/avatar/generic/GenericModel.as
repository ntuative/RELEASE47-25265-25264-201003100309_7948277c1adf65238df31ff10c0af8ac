package com.sulake.habbo.avatar.generic
{
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.avatar.HabboAvatarEditor;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.common.AvatarEditorGridPartItem;
   import com.sulake.habbo.avatar.common.CategoryBaseModel;
   import com.sulake.habbo.avatar.common.CategoryData;
   import com.sulake.habbo.avatar.common.IAvatarEditorCategoryModel;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.avatar.figuredata.FigureData;
   
   public class GenericModel extends CategoryBaseModel implements IAvatarEditorCategoryModel
   {
       
      
      private var _view:GenericView;
      
      private var var_773:Boolean = false;
      
      private var var_1047:String;
      
      public function GenericModel(param1:HabboAvatarEditor, param2:String = "")
      {
         super(param1);
         var_1047 = param2;
      }
      
      public function get gender() : String
      {
         return var_1047;
      }
      
      public function getWindowContainer() : IWindowContainer
      {
         if(!var_773)
         {
            init();
         }
         if(_view)
         {
            return _view.getWindowContainer();
         }
         return null;
      }
      
      public function toggleItemSelection(param1:String, param2:int) : void
      {
         if(!var_15)
         {
            return;
         }
         var _loc3_:CategoryData = var_15[param1];
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:AvatarEditorGridPartItem = _loc3_.selectItemIndex(param2);
         var_12.figureData.savePartData(FigureData.const_58,_loc4_.id,_loc3_.getCurrentColorIds(),true);
         _view.showColorLayerTabAmount(param1,_loc4_.colorLayerCount);
      }
      
      public function toggleColorLayerSelection(param1:String, param2:int) : void
      {
         var _loc3_:CategoryData = var_15[param1];
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.selectColorLayerIndex(param2);
      }
      
      private function init() : void
      {
         var _loc1_:* = null;
         if(!var_12)
         {
            return;
         }
         if(var_15)
         {
            for each(_loc1_ in var_15)
            {
               _loc1_.dispose();
            }
            var_15 = null;
         }
         if(_view != null)
         {
            _view.dispose();
            _view = null;
         }
         var_15 = new Map();
         var_15["null"] = var_12.generateDataContent(this,FigureData.const_58);
         updateCategoryData(FigureData.const_58);
         _view = new GenericView(this,controller.windowManager,controller.assets);
         updateView();
         var_773 = true;
      }
      
      public function categorySwitch(param1:String) : void
      {
         if(var_1047 == param1)
         {
            return;
         }
         switch(param1)
         {
            case FigureData.const_77:
               var_12.gender = FigureData.const_77;
               break;
            case FigureData.FEMALE:
               var_12.gender = FigureData.FEMALE;
         }
      }
      
      public function closingEditorView() : void
      {
         reset();
      }
      
      public function get controller() : HabboAvatarEditor
      {
         return var_12;
      }
      
      public function toggleColorSelection(param1:String, param2:int) : void
      {
         if(!var_15)
         {
            return;
         }
         var _loc3_:CategoryData = var_15[param1];
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.selectColorIndex(param2);
         var_12.figureData.savePartSetColourId(FigureData.const_58,_loc3_.getCurrentColorIds(),true);
         updateView();
      }
      
      override public function reset() : void
      {
         super.reset();
         if(_view != null)
         {
            _view.dispose();
            _view = null;
         }
         var_773 = false;
      }
      
      public function getCategoryContent(param1:String) : CategoryData
      {
         if(!var_15)
         {
            return null;
         }
         return var_15[param1];
      }
      
      override public function dispose() : void
      {
         super.dispose();
         reset();
         var_12 = null;
         if(_view != null)
         {
            _view.dispose();
         }
      }
      
      public function updateView() : void
      {
         updateCategoryData(FigureData.const_58);
      }
      
      private function updateCategoryData(param1:String) : void
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         if(!var_15)
         {
            return;
         }
         var _loc2_:int = var_12.figureData.getPartSetId(FigureData.const_58);
         var _loc3_:Array = var_12.figureData.getColourIds(FigureData.const_58);
         var _loc4_:CategoryData = var_15[param1];
         if(_loc4_ == null)
         {
            return;
         }
         _loc4_.selectItemId(_loc2_);
         _loc4_.selectColorIds(_loc3_);
         for each(_loc5_ in _loc4_.data)
         {
            _loc6_ = var_12.figureData.getFigureStringWithFace(_loc5_.id);
            _loc7_ = var_12.avatarRenderManager.createAvatarImage(_loc6_,AvatarScaleType.const_52);
            _loc5_.iconImage = _loc7_.getCroppedImage(AvatarSetType.const_47).clone();
            _loc7_.dispose();
         }
      }
   }
}
