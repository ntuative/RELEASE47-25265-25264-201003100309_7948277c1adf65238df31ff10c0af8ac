package deng.fzip
{
   import deng.utils.ChecksumUtil;
   import flash.utils.*;
   
   public class FZipFile
   {
      
      public static const const_718:int = 8;
      
      public static const const_1590:int = 10;
      
      public static const const_1296:int = 6;
      
      private static var var_1010:Boolean = describeType(ByteArray).factory.method.(@name == "uncompress").hasComplexContent();
      
      public static const const_1147:int = 0;
      
      public static const const_1553:int = 1;
      
      public static const const_1486:int = 2;
      
      public static const const_1528:int = 3;
      
      public static const const_1547:int = 4;
      
      public static const const_1606:int = 5;
      
      public static const const_1476:int = 9;
      
      public static const const_1560:int = 7;
       
      
      private var var_171:uint = 0;
      
      private var var_1009:uint = 0;
      
      private var var_682:Date;
      
      private var var_1944:int = -1;
      
      private var parseFunc:Function;
      
      private var var_480:Boolean = false;
      
      private var var_2310:int = -1;
      
      private var var_1215:uint = 0;
      
      private var var_1943:String = "";
      
      private var _extraFields:Dictionary;
      
      private var var_835:uint;
      
      private var var_22:ByteArray;
      
      private var var_681:uint;
      
      private var var_1474:Boolean = false;
      
      private var var_2309:int = -1;
      
      private var var_1473:String = "2.0";
      
      private var var_170:Boolean = false;
      
      private var var_1945:Boolean = false;
      
      private var var_336:String;
      
      private var var_572:uint = 0;
      
      private var var_1216:int = 0;
      
      private var var_406:String = "";
      
      private var var_680:int = 8;
      
      private var var_1472:Boolean = false;
      
      public function FZipFile(param1:String = "utf-8")
      {
         parseFunc = parseFileHead;
         super();
         var_336 = param1;
         _extraFields = new Dictionary();
         var_22 = new ByteArray();
         var_22.endian = Endian.BIG_ENDIAN;
      }
      
      public function get sizeUncompressed() : uint
      {
         return var_572;
      }
      
      public function set filename(param1:String) : void
      {
         var_406 = param1;
      }
      
      protected function uncompress() : void
      {
         if(var_170 && false)
         {
            var_22.position = 0;
            if(var_1010)
            {
               var_22.uncompress.apply(var_22,["deflate"]);
            }
            else
            {
               var_22.uncompress();
            }
            var_22.position = 0;
            var_170 = false;
         }
      }
      
      public function get filename() : String
      {
         return var_406;
      }
      
      public function get date() : Date
      {
         return var_682;
      }
      
      function parse(param1:IDataInput) : Boolean
      {
         while(param1.bytesAvailable && parseFunc(param1))
         {
         }
         return parseFunc === parseFileIdle;
      }
      
      private function parseFileContent(param1:IDataInput) : Boolean
      {
         if(var_1472)
         {
            parseFunc = parseFileIdle;
            throw new Error("Data descriptors are not supported.");
         }
         if(var_171 == 0)
         {
            parseFunc = parseFileIdle;
         }
         else
         {
            if(param1.bytesAvailable < var_171)
            {
               return false;
            }
            parseContent(param1);
            parseFunc = parseFileIdle;
         }
         return true;
      }
      
      public function get versionNumber() : String
      {
         return var_1473;
      }
      
      public function getContentAsString(param1:Boolean = true, param2:String = "utf-8") : String
      {
         var _loc3_:* = null;
         if(var_170)
         {
            uncompress();
         }
         var_22.position = 0;
         if(param2 == "utf-8")
         {
            _loc3_ = var_22.readUTFBytes(var_22.bytesAvailable);
         }
         else
         {
            _loc3_ = var_22.readMultiByte(var_22.bytesAvailable,param2);
         }
         var_22.position = 0;
         if(param1)
         {
            compress();
         }
         return _loc3_;
      }
      
      private function parseFileIdle(param1:IDataInput) : Boolean
      {
         return false;
      }
      
      protected function parseContent(param1:IDataInput) : void
      {
         var _loc2_:* = 0;
         if(var_680 === const_718 && !var_1474)
         {
            if(var_1010)
            {
               param1.readBytes(var_22,0,var_171);
            }
            else
            {
               if(!var_480)
               {
                  throw new Error("Adler32 checksum not found.");
               }
               var_22.writeByte(120);
               _loc2_ = uint(~var_1944 << 6 & 192);
               _loc2_ += 31 - (30720 | _loc2_) % 31;
               var_22.writeByte(_loc2_);
               param1.readBytes(var_22,2,var_171);
               var_22.position = var_22.length;
               var_22.writeUnsignedInt(var_835);
            }
            var_170 = true;
         }
         else
         {
            if(var_680 != const_1147)
            {
               throw new Error("Compression method " + var_680 + " is not supported.");
            }
            param1.readBytes(var_22,0,var_171);
            var_170 = false;
         }
         var_22.position = 0;
      }
      
      private function parseFileHead(param1:IDataInput) : Boolean
      {
         if(param1.bytesAvailable >= 30)
         {
            parseHead(param1);
            if(var_1009 + var_1215 > 0)
            {
               parseFunc = parseFileHeadExt;
            }
            else
            {
               parseFunc = parseFileContent;
            }
            return true;
         }
         return false;
      }
      
      public function setContentAsString(param1:String, param2:String = "utf-8") : void
      {
         var_22.length = 0;
         var_22.position = 0;
         var_170 = false;
         if(param1 != null && param1.length > 0)
         {
            if(param2 == "utf-8")
            {
               var_22.writeUTFBytes(param1);
            }
            else
            {
               var_22.writeMultiByte(param1,param2);
            }
            var_681 = ChecksumUtil.CRC32(var_22);
            var_480 = false;
         }
         compress();
      }
      
      public function set date(param1:Date) : void
      {
         var_682 = param1 != null ? param1 : new Date();
      }
      
      public function serialize(param1:IDataOutput, param2:Boolean, param3:Boolean = false, param4:uint = 0) : uint
      {
         var _loc10_:* = null;
         var _loc15_:* = null;
         var _loc16_:Boolean = false;
         if(param1 == null)
         {
            return 0;
         }
         if(param3)
         {
            param1.writeUnsignedInt(33639248);
            param1.writeShort(var_1216 << 8 | 20);
         }
         else
         {
            param1.writeUnsignedInt(67324752);
         }
         param1.writeShort(var_1216 << 8 | 20);
         param1.writeShort(var_336 == "utf-8" ? 2048 : 0);
         param1.writeShort(const_718);
         var _loc5_:Date = var_682 != null ? var_682 : new Date();
         var _loc6_:uint = uint(_loc5_.getSeconds()) | uint(_loc5_.getMinutes()) << 5 | uint(_loc5_.getHours()) << 11;
         var _loc7_:uint = uint(_loc5_.getDate()) | uint(_loc5_.getMonth() + 1) << 5 | uint(_loc5_.getFullYear() - 1980) << 9;
         param1.writeShort(_loc6_);
         param1.writeShort(_loc7_);
         param1.writeUnsignedInt(var_681);
         param1.writeUnsignedInt(var_171);
         param1.writeUnsignedInt(var_572);
         var _loc8_:ByteArray = new ByteArray();
         _loc8_.endian = Endian.LITTLE_ENDIAN;
         if(var_336 == "utf-8")
         {
            _loc8_.writeUTFBytes(var_406);
         }
         else
         {
            _loc8_.writeMultiByte(var_406,var_336);
         }
         var _loc9_:uint = _loc8_.position;
         for(_loc10_ in _extraFields)
         {
            _loc15_ = _extraFields[_loc10_] as ByteArray;
            if(_loc15_ != null)
            {
               _loc8_.writeShort(uint(_loc10_));
               _loc8_.writeShort(uint(_loc15_.length));
               _loc8_.writeBytes(_loc15_);
            }
         }
         if(param2)
         {
            if(!var_480)
            {
               _loc16_ = var_170;
               if(_loc16_)
               {
                  uncompress();
               }
               var_835 = ChecksumUtil.Adler32(var_22,0,var_22.length);
               var_480 = true;
               if(_loc16_)
               {
                  compress();
               }
            }
            _loc8_.writeShort(56026);
            _loc8_.writeShort(4);
            _loc8_.writeUnsignedInt(var_835);
         }
         var _loc11_:uint = _loc8_.position - _loc9_;
         if(param3 && false)
         {
            if(var_336 == "utf-8")
            {
               _loc8_.writeUTFBytes(var_1943);
            }
            else
            {
               _loc8_.writeMultiByte(var_1943,var_336);
            }
         }
         var _loc12_:uint = _loc8_.position - _loc9_ - _loc11_;
         param1.writeShort(_loc9_);
         param1.writeShort(_loc11_);
         if(param3)
         {
            param1.writeShort(_loc12_);
            param1.writeShort(0);
            param1.writeShort(0);
            param1.writeUnsignedInt(0);
            param1.writeUnsignedInt(param4);
         }
         if(_loc9_ + _loc11_ + _loc12_ > 0)
         {
            param1.writeBytes(_loc8_);
         }
         var _loc13_:int = 0;
         if(!param3 && var_171 > 0)
         {
            if(var_1010)
            {
               _loc13_ = 0;
               param1.writeBytes(var_22,0,_loc13_);
            }
            else
            {
               _loc13_ = 4294967290;
               param1.writeBytes(var_22,2,_loc13_);
            }
         }
         var _loc14_:uint = 30 + _loc9_ + _loc11_ + _loc12_ + _loc13_;
         if(param3)
         {
            _loc14_ += 16;
         }
         return _loc14_;
      }
      
      public function get sizeCompressed() : uint
      {
         return var_171;
      }
      
      protected function compress() : void
      {
         if(!var_170)
         {
            if(false)
            {
               var_22.position = 0;
               var_572 = var_22.length;
               if(var_1010)
               {
                  var_22.compress.apply(var_22,["deflate"]);
                  var_171 = var_22.length;
               }
               else
               {
                  var_22.compress();
                  var_171 = -6;
               }
               var_22.position = 0;
               var_170 = true;
            }
            else
            {
               var_171 = 0;
               var_572 = 0;
            }
         }
      }
      
      private function parseFileHeadExt(param1:IDataInput) : Boolean
      {
         if(param1.bytesAvailable >= var_1009 + var_1215)
         {
            parseHeadExt(param1);
            parseFunc = parseFileContent;
            return true;
         }
         return false;
      }
      
      protected function parseHeadExt(param1:IDataInput) : void
      {
         var _loc3_:* = 0;
         var _loc4_:* = 0;
         var _loc5_:* = null;
         if(var_336 == "utf-8")
         {
            var_406 = param1.readUTFBytes(var_1009);
         }
         else
         {
            var_406 = param1.readMultiByte(var_1009,var_336);
         }
         var _loc2_:uint = var_1215;
         while(_loc2_ > 4)
         {
            _loc3_ = uint(param1.readUnsignedShort());
            _loc4_ = uint(param1.readUnsignedShort());
            if(_loc4_ > _loc2_)
            {
               throw new Error("Parse error in file " + var_406 + ": Extra field data size too big.");
            }
            if(_loc3_ === 56026 && _loc4_ === 4)
            {
               var_835 = param1.readUnsignedInt();
               var_480 = true;
            }
            else if(_loc4_ > 0)
            {
               _loc5_ = new ByteArray();
               param1.readBytes(_loc5_,0,_loc4_);
               _extraFields[_loc3_] = _loc5_;
            }
            _loc2_ -= _loc4_ + 4;
         }
         if(_loc2_ > 0)
         {
            param1.readBytes(new ByteArray(),0,_loc2_);
         }
      }
      
      protected function parseHead(param1:IDataInput) : void
      {
         var _loc2_:uint = param1.readUnsignedShort();
         var_1216 = _loc2_ >> 8;
         var_1473 = Math.floor((_loc2_ & 255) / 10) + "." + (_loc2_ & 255) % 10;
         var _loc3_:uint = param1.readUnsignedShort();
         var_680 = param1.readUnsignedShort();
         var_1474 = (_loc3_ & 1) !== 0;
         var_1472 = (_loc3_ & 8) !== 0;
         var_1945 = (_loc3_ & 32) !== 0;
         if((_loc3_ & 800) !== 0)
         {
            var_336 = "utf-8";
         }
         if(var_680 === const_1296)
         {
            var_2309 = (_loc3_ & 2) !== 0 ? 8192 : 4096;
            var_2310 = (_loc3_ & 4) !== 0 ? 3 : 2;
         }
         else if(var_680 === const_718)
         {
            var_1944 = (_loc3_ & 6) >> 1;
         }
         var _loc4_:uint = param1.readUnsignedShort();
         var _loc5_:uint = param1.readUnsignedShort();
         var _loc6_:* = _loc4_ & 31;
         var _loc7_:* = (_loc4_ & 2016) >> 5;
         var _loc8_:* = (_loc4_ & 63488) >> 11;
         var _loc9_:* = _loc5_ & 31;
         var _loc10_:* = (_loc5_ & 480) >> 5;
         var _loc11_:int = ((_loc5_ & 65024) >> 9) + 1980;
         var_682 = new Date(_loc11_,_loc10_ - 1,_loc9_,_loc8_,_loc7_,_loc6_,0);
         var_681 = param1.readUnsignedInt();
         var_171 = param1.readUnsignedInt();
         var_572 = param1.readUnsignedInt();
         var_1009 = param1.readUnsignedShort();
         var_1215 = param1.readUnsignedShort();
      }
      
      public function set content(param1:ByteArray) : void
      {
         if(param1 != null && param1.length > 0)
         {
            param1.position = 0;
            param1.readBytes(var_22,0,param1.length);
            var_681 = ChecksumUtil.CRC32(var_22);
            var_480 = false;
         }
         else
         {
            var_22.length = 0;
            var_22.position = 0;
            var_170 = false;
         }
         compress();
      }
      
      public function toString() : String
      {
         return "[FZipFile]\n  name:" + var_406 + "\n  date:" + var_682 + "\n  sizeCompressed:" + var_171 + "\n  sizeUncompressed:" + var_572 + "\n  versionHost:" + var_1216 + "\n  versionNumber:" + var_1473 + "\n  compressionMethod:" + var_680 + "\n  encrypted:" + var_1474 + "\n  hasDataDescriptor:" + var_1472 + "\n  hasCompressedPatchedData:" + var_1945 + "\n  filenameEncoding:" + var_336 + "\n  crc32:" + var_681.toString(16) + "\n  adler32:" + var_835.toString(16);
      }
      
      public function get content() : ByteArray
      {
         if(var_170)
         {
            uncompress();
         }
         return var_22;
      }
   }
}
