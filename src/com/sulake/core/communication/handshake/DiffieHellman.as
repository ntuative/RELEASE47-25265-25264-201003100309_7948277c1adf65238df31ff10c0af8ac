package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   import com.sulake.core.utils.ErrorReportStorage;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_1308:BigInteger;
      
      private var var_667:BigInteger;
      
      private var var_1547:BigInteger;
      
      private var var_1546:BigInteger;
      
      private var var_2149:BigInteger;
      
      private var var_1962:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         var_1308 = param1;
         var_1547 = param2;
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return var_2149.toRadix(param1);
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         var_1546 = new BigInteger();
         var_1546.fromRadix(param1,param2);
         var_2149 = var_1546.modPow(var_667,var_1308);
         return getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return var_1962.toRadix(param1);
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         ErrorReportStorage.addDebugData("DiffieHellman","Prime: " + var_1308.toString() + ",generator: " + var_1547.toString() + ",secret: " + param1);
         var_667 = new BigInteger();
         var_667.fromRadix(param1,param2);
         var_1962 = var_1547.modPow(var_667,var_1308);
         return true;
      }
   }
}
