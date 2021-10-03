package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_597:int = 6;
      
      public static const const_202:int = 5;
      
      public static const const_677:int = 2;
      
      public static const const_306:int = 9;
      
      public static const const_313:int = 4;
      
      public static const const_235:int = 2;
      
      public static const const_581:int = 4;
      
      public static const const_205:int = 8;
      
      public static const const_521:int = 7;
      
      public static const const_249:int = 3;
      
      public static const const_307:int = 1;
      
      public static const const_204:int = 5;
      
      public static const const_466:int = 12;
      
      public static const const_325:int = 1;
      
      public static const const_575:int = 11;
      
      public static const const_498:int = 3;
      
      public static const const_1557:int = 10;
       
      
      private var _navigator:HabboNavigator;
      
      private var var_435:Array;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_435 = new Array();
         var_435.push(new Tab(_navigator,const_307,const_466,new EventsTabPageDecorator(_navigator),MainViewCtrl.const_416));
         var_435.push(new Tab(_navigator,const_235,const_325,new RoomsTabPageDecorator(_navigator),MainViewCtrl.const_416));
         var_435.push(new Tab(_navigator,const_313,const_575,new OfficialTabPageDecorator(_navigator),MainViewCtrl.const_802));
         var_435.push(new Tab(_navigator,const_249,const_202,new MyRoomsTabPageDecorator(_navigator),MainViewCtrl.const_416));
         var_435.push(new Tab(_navigator,const_204,const_205,new SearchTabPageDecorator(_navigator),MainViewCtrl.const_528));
         setSelectedTab(const_307);
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_435)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in var_435)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_435)
         {
            _loc1_.selected = false;
         }
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_313;
      }
      
      public function get tabs() : Array
      {
         return var_435;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         getTab(param1).selected = true;
      }
   }
}
