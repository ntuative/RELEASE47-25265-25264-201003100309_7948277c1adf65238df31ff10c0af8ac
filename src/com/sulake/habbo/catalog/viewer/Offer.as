package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageProductData;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer
   {
      
      public static const const_871:String = "price_type_none";
      
      public static const const_353:String = "pricing_model_multi";
      
      public static const const_472:String = "price_type_credits";
      
      public static const const_457:String = "price_type_credits_and_pixels";
      
      public static const const_456:String = "pricing_model_bundle";
      
      public static const const_364:String = "pricing_model_single";
      
      public static const const_711:String = "price_type_credits_or_credits_and_pixels";
      
      public static const const_1309:String = "pricing_model_unknown";
      
      public static const const_398:String = "price_type_pixels";
       
      
      private var var_825:int;
      
      private var _offerId:int;
      
      private var var_824:int;
      
      private var var_402:String;
      
      private var var_567:String;
      
      private var var_1887:int;
      
      private var var_537:ICatalogPage;
      
      private var var_1199:String;
      
      private var var_403:IProductContainer;
      
      public function Offer(param1:CatalogPageMessageOfferData, param2:ICatalogPage)
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         super();
         _offerId = param1.offerId;
         var_1199 = param1.localizationId;
         var_825 = param1.priceInCredits;
         var_824 = param1.priceInPixels;
         var_537 = param2;
         var _loc3_:Array = new Array();
         for each(_loc4_ in param1.products)
         {
            _loc5_ = param2.viewer.catalog.getProductData(param1.localizationId);
            _loc6_ = param2.viewer.catalog.getFurnitureData(_loc4_.furniClassId,_loc4_.productType);
            _loc7_ = new Product(_loc4_,_loc5_,_loc6_);
            _loc3_.push(_loc7_);
         }
         analyzePricingModel(_loc3_);
         analyzePriceType();
         createProductContainer(_loc3_);
      }
      
      public function get pricingModel() : String
      {
         return var_402;
      }
      
      public function get page() : ICatalogPage
      {
         return var_537;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         var_1887 = param1;
      }
      
      public function get productContainer() : IProductContainer
      {
         return var_403;
      }
      
      public function get localizationId() : String
      {
         return var_1199;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get priceInPixels() : int
      {
         return var_824;
      }
      
      public function dispose() : void
      {
         _offerId = 0;
         var_1199 = "";
         var_825 = 0;
         var_824 = 0;
         var_537 = null;
         if(var_403 != null)
         {
            var_403.dispose();
            var_403 = null;
         }
      }
      
      public function get priceType() : String
      {
         return var_567;
      }
      
      public function get previewCallbackId() : int
      {
         return var_1887;
      }
      
      public function get priceInCredits() : int
      {
         return var_825;
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               var_402 = const_364;
            }
            else
            {
               var_402 = const_353;
            }
         }
         else if(param1.length > 1)
         {
            var_402 = const_456;
         }
         else
         {
            var_402 = const_1309;
         }
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(var_402)
         {
            case const_364:
               var_403 = new SingleProductContainer(this,param1);
               break;
            case const_353:
               var_403 = new MultiProductContainer(this,param1);
               break;
            case const_456:
               var_403 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + var_402);
         }
      }
      
      private function analyzePriceType() : void
      {
         if(var_825 > 0 && var_824 > 0)
         {
            var_567 = const_457;
         }
         else if(var_825 > 0)
         {
            var_567 = const_472;
         }
         else if(var_824 > 0)
         {
            var_567 = const_398;
         }
         else
         {
            var_567 = const_871;
         }
      }
   }
}
