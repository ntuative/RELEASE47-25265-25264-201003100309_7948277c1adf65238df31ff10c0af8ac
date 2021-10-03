package com.sulake.habbo.avatar.torso
{
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.avatar.HabboAvatarEditor;
   import com.sulake.habbo.avatar.common.AvatarEditorGridPartItem;
   import com.sulake.habbo.avatar.common.CategoryBaseModel;
   import com.sulake.habbo.avatar.common.CategoryData;
   import com.sulake.habbo.avatar.common.IAvatarEditorCategoryModel;
   import com.sulake.habbo.avatar.figuredata.FigureData;
   
   public class TorsoModel extends CategoryBaseModel implements IAvatarEditorCategoryModel
   {
       
      
      private var _view:TorsoView;
      
      private var var_773:Boolean = false;
      
      private var var_1047:String;
      
      public function TorsoModel(param1:HabboAvatarEditor, param2:String = "")
      {
         super(param1);
         var_1047 = param2;
      }
      
      public function getWindowContainer() : IWindowContainer
      {
         if(!var_773)
         {
            init();
         }
         return _view.getWindowContainer();
      }
      
      public function toggleItemSelection(param1:String, param2:int) : void
      {
         var _loc3_:CategoryData = var_15[param1];
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.selectItemIndex(param2);
         var _loc4_:AvatarEditorGridPartItem = _loc3_.getCurrentPart();
         if(!_loc4_)
         {
            return;
         }
         var _loc5_:int = _loc4_.colorLayerCount;
         _view.showColorLayerTabAmount(param1,_loc5_);
         var_12.figureData.savePartData(param1,_loc4_.id,_loc3_.getCurrentColorIds(),true);
         if(_loc5_ <= _loc3_.getColorLayerIndex())
         {
            toggleColorLayerSelection(param1,_loc5_ - 1);
            _view.selectColorLayerTab(param1,_loc5_ - 1);
         }
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
      
      public function closingEditorView() : void
      {
         reset();
      }
      
      private function init() : void
      {
         var_15 = new Map();
         _view = new TorsoView(this,controller.windowManager,controller.assets);
         updateView();
         var_773 = true;
      }
      
      public function categorySwitch(param1:String) : void
      {
         switch(param1)
         {
            case FigureData.const_145:
            case FigureData.SHIRT:
            case FigureData.CHEST_ACCESSORIES:
               initCategory(param1);
         }
      }
      
      public function toggleColorSelection(param1:String, param2:int) : void
      {
         var _loc3_:CategoryData = var_15[param1];
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.selectColorIndex(param2);
         var _loc4_:Array = _loc3_.getCurrentColorIds();
         var_12.figureData.savePartSetColourId(param1,_loc4_,true);
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
      
      public function get controller() : HabboAvatarEditor
      {
         return var_12;
      }
      
      public function getCategoryContent(param1:String) : CategoryData
      {
         return var_15[param1];
      }
      
      override public function dispose() : void
      {
         super.dispose();
         reset();
         if(_view != null)
         {
            _view.dispose();
         }
      }
      
      private function initCategory(param1:String) : void
      {
         var _loc2_:CategoryData = var_15[param1];
         if(_loc2_ == null)
         {
            var_15[param1] = var_12.generateDataContent(this,param1);
            updateCategoryData(param1);
         }
      }
      
      public function updateView() : void
      {
         updateCategoryData(FigureData.const_145);
         updateCategoryData(FigureData.SHIRT);
         updateCategoryData(FigureData.CHEST_ACCESSORIES);
      }
      
      private function updateCategoryData(param1:String) : void
      {
         var _loc2_:int = var_12.figureData.getPartSetId(param1);
         var _loc3_:Array = var_12.figureData.getColourIds(param1);
         var _loc4_:CategoryData = var_15[param1];
         if(_loc4_ == null)
         {
            return;
         }
         _loc4_.selectItemId(_loc2_);
         _loc4_.selectColorIds(_loc3_);
      }
   }
}