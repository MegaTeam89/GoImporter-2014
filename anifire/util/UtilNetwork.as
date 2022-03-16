package anifire.util
{
   import anifire.constant.AnimeConstants;
   import anifire.constant.CcLibConstant;
   import anifire.constant.ServerConstants;
   import anifire.managers.AppConfigManager;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLVariables;
   import flash.system.Security;
   import flash.utils.ByteArray;
   import mx.core.FlexGlobals;
   import mx.utils.Base64Encoder;
   import mx.utils.URLUtil;
   
   public class UtilNetwork
   {
      
      private static var storePathPattern:RegExp;
      
      private static var clientThemePathPattern:RegExp;
       
      
      public function UtilNetwork()
      {
         super();
      }
      
      private static function getStorePathPattern() : RegExp
      {
         if(!storePathPattern)
         {
            storePathPattern = new RegExp(ServerConstants.FLASHVAR_STORE_PLACEHOLDER,"g");
         }
         return storePathPattern;
      }
      
      public static function getClientThemePathPattern() : RegExp
      {
         if(!clientThemePathPattern)
         {
            clientThemePathPattern = new RegExp(ServerConstants.FLASHVAR_CLIENT_THEME_PLACEHOLDER,"g");
         }
         return clientThemePathPattern;
      }
      
      public static function getFont(param1:String) : String
      {
         var _loc2_:String = URLUtil.getProtocol(FlexGlobals.topLevelApplication.url);
         if(_loc2_ == "file")
         {
            return "styles/font/" + param1;
         }
         var _loc3_:String = AppConfigManager.instance.getValue(ServerConstants.FLASHVAR_CLIENT_THEME_PATH);
         var _loc4_:String = "go/font/" + param1;
         if(!_loc3_)
         {
            return getHostUrl() + _loc4_;
         }
         var _loc5_:RegExp = getClientThemePathPattern();
         return _loc3_.replace(_loc5_,_loc4_);
      }
      
      public static function getCffFont(param1:String) : String
      {
         var _loc2_:String = URLUtil.getProtocol(FlexGlobals.topLevelApplication.url);
         if(_loc2_ == "file")
         {
            return "styles/cff/" + param1;
         }
         var _loc3_:String = AppConfigManager.instance.getValue(ServerConstants.FLASHVAR_CLIENT_THEME_PATH);
         var _loc4_:String = "go/font2/" + param1;
         if(!_loc3_)
         {
            return getHostUrl() + _loc4_;
         }
         var _loc5_:RegExp = getClientThemePathPattern();
         return _loc3_.replace(_loc5_,_loc4_);
      }
      
      private static function getHostUrl() : String
      {
         var _loc1_:String = AppConfigManager.instance.getValue(ServerConstants.FLASHVAR_APISERVER);
         return _loc1_ + "static/";
      }
      
      public static function isDemoHost() : Boolean
      {
         return getHostUrl().indexOf("demo.") > -1;
      }
      
      public static function loadS3crossDomainXml() : void
      {
         var _loc1_:String = AppConfigManager.instance.getValue(ServerConstants.FLASHVAR_S3_URL);
         if(_loc1_ && _loc1_.length > 0)
         {
            Security.allowDomain([_loc1_]);
            Security.allowInsecureDomain([_loc1_]);
            Security.loadPolicyFile(_loc1_ + "crossdomain.xml");
         }
      }
      
      public static function getGetThemeListRequest() : URLRequest
      {
         var _loc1_:URLRequest = new URLRequest(ServerConstants.ACTION_GET_THEMELIST);
         _loc1_.method = URLRequestMethod.POST;
         _loc1_.data = AppConfigManager.instance.createURLVariables();
         return _loc1_;
      }
      
      public static function getGetThemeRequest(param1:String, param2:Boolean) : URLRequest
      {
         var _loc3_:URLRequest = null;
         var _loc5_:String = null;
         var _loc6_:RegExp = null;
         var _loc7_:* = null;
         var _loc8_:URLVariables = null;
         var _loc4_:AppConfigManager = AppConfigManager.instance;
         if(param2)
         {
            _loc6_ = getStorePathPattern();
            _loc7_ = param1 + "/" + param1 + ".zip";
            _loc5_ = (_loc5_ = _loc4_.getValue(ServerConstants.FLASHVAR_STORE_PATH)).replace(_loc6_,_loc7_);
            _loc3_ = new URLRequest(_loc5_);
         }
         else
         {
            _loc5_ = ServerConstants.ACTION_GET_THEME;
            (_loc8_ = _loc4_.createURLVariables())[ServerConstants.PARAM_THEME_ID] = param1;
            _loc3_ = new URLRequest(_loc5_);
            _loc3_.method = URLRequestMethod.POST;
            _loc3_.data = _loc8_;
         }
         return _loc3_;
      }
      
      public static function getGetCcThemeRequest(param1:String) : URLRequest
      {
         var _loc2_:RegExp = getStorePathPattern();
         var _loc3_:* = "cc_store/" + escape(param1) + "/cc_theme.xml";
         var _loc4_:String = (_loc4_ = AppConfigManager.instance.getValue(ServerConstants.FLASHVAR_STORE_PATH)).replace(_loc2_,_loc3_);
         return new URLRequest(_loc4_);
      }
      
      public static function getGetCcThemePreMadeCharRequest(param1:String) : URLRequest
      {
         var _loc2_:String = ServerConstants.ACTION_GET_CC_PRE_MADE_CHARACTERS;
         var _loc3_:URLRequest = new URLRequest(_loc2_);
         var _loc4_:URLVariables;
         (_loc4_ = AppConfigManager.instance.createURLVariables())["theme_code"] = param1;
         _loc3_.method = URLRequestMethod.POST;
         _loc3_.data = _loc4_;
         return _loc3_;
      }
      
      public static function getGetCcComponentStateFileRequest(param1:String, param2:String, param3:String, param4:String) : URLRequest
      {
         var _loc5_:URLRequest = null;
         var _loc9_:RegExp = null;
         var _loc10_:String = null;
         var _loc6_:UtilHashArray;
         var _loc7_:String = (_loc6_ = Util.getFlashVar()).getValueByKey("v");
         var _loc8_:String;
         if((_loc8_ = _loc6_.getValueByKey(ServerConstants.FLASHVAR_STORE_PATH) as String) == "" || _loc8_ == null)
         {
            if(CcLibConstant.ALL_LIBRARY_TYPES.indexOf(param2) > -1)
            {
               _loc8_ = getHostUrl() + "cc_store/" + escape(param1) + "/" + escape(param2) + "/" + escape(param4) + "?v=" + _loc7_;
            }
            else
            {
               _loc8_ = getHostUrl() + "cc_store/" + escape(param1) + "/" + escape(param2) + "/" + escape(param3) + "/" + escape(param4) + "?v=" + _loc7_;
            }
         }
         else
         {
            _loc9_ = new RegExp(ServerConstants.FLASHVAR_STORE_PLACEHOLDER,"g");
            if(CcLibConstant.ALL_LIBRARY_TYPES.indexOf(param2) > -1)
            {
               _loc10_ = "cc_store/" + escape(param1) + "/" + escape(param2) + "/" + escape(param4);
            }
            else
            {
               _loc10_ = "cc_store/" + escape(param1) + "/" + escape(param2) + "/" + escape(param3) + "/" + escape(param4);
            }
            _loc8_ = _loc8_.replace(_loc9_,_loc10_);
         }
         return new URLRequest(_loc8_);
      }
      
      public static function getGetCcLibraryFileRequest(param1:String, param2:String, param3:String) : URLRequest
      {
         var _loc4_:URLRequest = null;
         var _loc8_:RegExp = null;
         var _loc9_:* = null;
         var _loc5_:UtilHashArray;
         var _loc6_:String = (_loc5_ = Util.getFlashVar()).getValueByKey("v");
         var _loc7_:String;
         if((_loc7_ = _loc5_.getValueByKey(ServerConstants.FLASHVAR_STORE_PATH) as String) == "" || _loc7_ == null)
         {
            _loc7_ = getHostUrl() + "store/cc_store/" + escape(param1) + "/" + escape(param2) + "/" + escape(param3) + ".swf" + "?v=" + _loc6_;
         }
         else
         {
            _loc8_ = new RegExp(ServerConstants.FLASHVAR_STORE_PLACEHOLDER,"g");
            _loc9_ = "cc_store/" + escape(param1) + "/" + escape(param2) + "/" + escape(param3) + ".swf";
            _loc7_ = _loc7_.replace(_loc8_,_loc9_);
         }
         return new URLRequest(_loc7_);
      }
      
      public static function getGetThemeAssetRequest(param1:String, param2:String, param3:String, param4:String = "", param5:int = -1, param6:String = "") : URLRequest
      {
         var _loc7_:URLRequest = null;
         var _loc8_:* = null;
         var _loc9_:String = null;
         var _loc12_:Array = null;
         var _loc13_:RegExp = null;
         var _loc14_:String = null;
         var _loc15_:URLVariables = null;
         param5 = param5 < 0 ? int(ServerConstants.STORE_VERSION) : int(param5);
         _loc8_ = param1 + "/";
         _loc9_ = param2;
         if(param3 == ServerConstants.PARAM_SOUND)
         {
            _loc8_ += "sound/" + param2;
         }
         else if(param3 == ServerConstants.PARAM_CHAR)
         {
            if(param6)
            {
               _loc9_ = param6;
            }
            _loc8_ += _loc9_ + ".zip";
         }
         else if(param3 == ServerConstants.PARAM_CHAR_ACTION)
         {
            if(param6)
            {
               _loc9_ = param6;
            }
            _loc8_ += "char/" + _loc9_ + "/" + param4;
         }
         else if(param3 == ServerConstants.PARAM_CHAR_FACIAL)
         {
            _loc9_ = param2;
            if(param6)
            {
               _loc9_ = param6;
            }
            if((_loc12_ = _loc9_.split(".")).length > 0)
            {
               _loc9_ = _loc12_[0];
            }
            _loc8_ += "char/" + _loc9_ + "/head/" + param4;
         }
         else if(param3 == ServerConstants.PARAM_PROP_EX)
         {
            _loc8_ += "prop/" + param2 + ".zip";
         }
         else if(param3 == ServerConstants.PARAM_PROP_STATE)
         {
            _loc8_ += "prop/" + param2 + "/" + param4;
         }
         else if(param3 == ServerConstants.PARAM_PROP)
         {
            if(param2 != null)
            {
               _loc8_ += "prop/" + param2;
            }
            else
            {
               _loc8_ += "prop.zip";
            }
         }
         else if(param3 == "widget")
         {
            if(param2 != null)
            {
               _loc8_ += "widget/" + param2;
            }
         }
         else if(param3 == ServerConstants.PARAM_BG)
         {
            if(param2 != null)
            {
               _loc8_ += "bg/" + param2;
            }
            else
            {
               _loc8_ += "bg.zip";
            }
         }
         else if(param3 == ServerConstants.PARAM_EFFECT)
         {
            _loc8_ += "effect/" + param2;
         }
         else if(param3 == ServerConstants.PARAM_BUBBLE)
         {
            _loc8_ += "bubble/" + param2;
         }
         var _loc11_:String;
         var _loc10_:UtilHashArray;
         if((_loc11_ = (_loc10_ = Util.getFlashVar()).getValueByKey(ServerConstants.FLASHVAR_STORE_PATH) as String) == "" || _loc11_ == null)
         {
            _loc11_ = getHostUrl() + "store/" + _loc8_ + "?v=" + param5;
         }
         else
         {
            _loc13_ = new RegExp(ServerConstants.FLASHVAR_STORE_PLACEHOLDER,"g");
            _loc14_ = _loc8_;
            _loc11_ = _loc11_.replace(_loc13_,_loc14_);
         }
         if(param1 == "ugc")
         {
            if(param3 == ServerConstants.PARAM_CHAR)
            {
               _loc15_ = new URLVariables();
               UtilPlain.addFlashVarsToURLvar(_loc10_,_loc15_);
               (_loc7_ = new URLRequest(ServerConstants.ACTION_GET_CHAR)).method = URLRequestMethod.POST;
               _loc15_[ServerConstants.PARAM_ASSET_ID] = param2;
               _loc7_.data = _loc15_;
            }
            else if(param3 == ServerConstants.PARAM_CHAR_ACTION)
            {
               _loc7_ = getGetCcActionRequest(param2,param4);
            }
            else if(param3 == ServerConstants.PARAM_CHAR_FACIAL)
            {
               _loc7_ = getGetCcActionRequest(param2,"",param4);
            }
         }
         else
         {
            _loc7_ = new URLRequest(_loc11_);
         }
         return _loc7_;
      }
      
      public static function getGetCcActionRequest(param1:String, param2:String, param3:String = "", param4:Boolean = false) : URLRequest
      {
         var _loc5_:URLRequest = new URLRequest(ServerConstants.ACTION_GET_UGC_CHAR_ACTION);
         var _loc6_:URLVariables;
         (_loc6_ = new URLVariables())["charId"] = param1;
         _loc6_["actionId"] = param2;
         _loc6_["facialId"] = param3;
         _loc6_["default"] = param4;
         _loc5_.data = _loc6_;
         _loc5_.method = URLRequestMethod.POST;
         return _loc5_;
      }
      
      public static function getGetUserUploadVideoUrl(param1:String) : String
      {
         var _loc2_:Array = param1.split(".");
         return ServerConstants.ACTION_GET_ASSET + _loc2_[_loc2_.length - 2] + "." + _loc2_[_loc2_.length - 1];
      }
      
      public static function getRebuildTTSRequest(param1:String) : URLRequest
      {
         var _loc2_:URLRequest = null;
         var _loc3_:URLVariables = new URLVariables();
         var _loc4_:UtilHashArray = Util.getFlashVar();
         UtilPlain.addFlashVarsToURLvar(_loc4_,_loc3_);
         _loc2_ = new URLRequest(ServerConstants.ACTION_REBUILD_TTS);
         _loc2_.method = URLRequestMethod.POST;
         _loc3_[ServerConstants.PARAM_ASSET_ID] = param1;
         _loc2_.data = _loc3_;
         return _loc2_;
      }
      
      public static function getGetSoundAssetRequest(param1:String, param2:String, param3:String) : URLRequest
      {
         var _loc4_:URLRequest = null;
         var _loc5_:String = null;
         var _loc6_:URLVariables = null;
         var _loc7_:UtilHashArray = null;
         if(param3 == AnimeConstants.DOWNLOAD_TYPE_PROGRESSIVE || param3 == AnimeConstants.DOWNLOAD_TYPE_STREAM)
         {
            _loc5_ = "mp3";
         }
         else
         {
            _loc5_ = "swf";
         }
         param2 = changeExtension(param2,_loc5_);
         if(param1 != "ugc")
         {
            if(param3 == AnimeConstants.DOWNLOAD_TYPE_STREAM)
            {
               _loc4_ = new URLRequest(ServerConstants.ACTION_GET_STREAM_SOUND);
            }
            else
            {
               _loc4_ = getGetThemeAssetRequest(param1,param2,ServerConstants.PARAM_SOUND);
            }
         }
         else
         {
            _loc6_ = new URLVariables();
            _loc7_ = Util.getFlashVar();
            UtilPlain.addFlashVarsToURLvar(_loc7_,_loc6_);
            (_loc4_ = new URLRequest(ServerConstants.ACTION_GET_ASSET)).method = URLRequestMethod.POST;
            _loc6_[ServerConstants.PARAM_ASSET_ID] = param2;
            _loc4_.data = _loc6_;
         }
         return _loc4_;
      }
      
      private static function changeExtension(param1:String, param2:String) : String
      {
         var _loc3_:String = ".";
         var _loc4_:Array;
         (_loc4_ = param1.split(_loc3_)).pop();
         _loc4_.push(param2);
         return _loc4_.join(_loc3_);
      }
      
      public static function getClientThemeUrl(param1:String, param2:String, param3:String) : String
      {
         var _loc7_:String = null;
         var _loc8_:* = null;
         var _loc9_:RegExp = null;
         var _loc4_:AppConfigManager = AppConfigManager.instance;
         var _loc5_:String = URLUtil.getProtocol(FlexGlobals.topLevelApplication.url);
         var _loc6_:String = _loc4_.getValue("v");
         if(!param1)
         {
            param1 = "go";
         }
         if(!param2)
         {
            param2 = "en_US";
         }
         if(_loc5_ == "file")
         {
            return "locale/" + param1 + "/" + param2 + "/" + param3 + ".swf";
         }
         if(_loc7_ = AppConfigManager.instance.getValue(ServerConstants.FLASHVAR_CLIENT_THEME_PATH))
         {
            _loc8_ = "client_theme/" + param1 + "/" + param2 + "/" + param3 + ".swf";
            _loc9_ = getClientThemePathPattern();
            return _loc7_.replace(_loc9_,_loc8_);
         }
         return ServerConstants.CLIENT_THEME_PATH + "/" + param1 + "/" + param2 + "/" + param3 + ".swf" + "?v=" + _loc6_;
      }
      
      public static function getClientLocaleUrl(param1:String, param2:String, param3:String) : String
      {
         var _loc7_:String = null;
         var _loc8_:String = null;
         var _loc9_:RegExp = null;
         var _loc10_:* = null;
         var _loc4_:String = URLUtil.getProtocol(FlexGlobals.topLevelApplication.url);
         var _loc5_:UtilHashArray;
         var _loc6_:String = (_loc5_ = Util.getFlashVar()).getValueByKey("v");
         if(_loc4_ == "file")
         {
            return (_loc7_ = "locale") + "/" + param1 + "/" + param2 + "/" + param3 + "Resources_" + param2 + ".swf" + "?v=" + _loc6_;
         }
         if((_loc8_ = _loc5_.getValueByKey(ServerConstants.FLASHVAR_CLIENT_THEME_PATH) as String) == "" || _loc8_ == null)
         {
            return ServerConstants.CLIENT_THEME_PATH + "/" + param1 + "/" + param2 + "/" + param3 + "Resources_" + param2 + ".swf" + "?v=" + _loc6_;
         }
         _loc9_ = new RegExp(ServerConstants.FLASHVAR_CLIENT_THEME_PLACEHOLDER,"g");
         _loc10_ = "client_theme/" + param1 + "/" + param2 + "/" + param3 + "Resources_" + param2 + ".swf";
         return _loc8_.replace(_loc9_,_loc10_);
      }
      
      public static function getRssRequest() : URLRequest
      {
         var _loc3_:URLRequest = null;
         var _loc1_:URLVariables = new URLVariables();
         var _loc2_:String = Util.getFlashVar().getValueByKey(ServerConstants.PARAM_RSS_MOVIENUM);
         if(_loc2_ == null)
         {
            _loc2_ = "10";
         }
         else if(Number(_loc2_) > 20)
         {
            _loc2_ = "20";
         }
         _loc1_.channel = Util.getFlashVar().getValueByKey(ServerConstants.PARAM_RSS_CHANNEL);
         _loc1_.movie_limit = _loc2_;
         _loc1_.playlist = 1;
         _loc3_ = new URLRequest(ServerConstants.ACTION_RSS_PATH + Util.getFlashVar().getValueByKey(ServerConstants.PARAM_RSS_PATH) + "?v=" + Math.random());
         _loc3_.method = "POST";
         _loc3_.data = _loc1_;
         return _loc3_;
      }
      
      public static function getGetMovieRequest(param1:UtilHashArray, param2:String) : URLRequest
      {
         var _loc3_:URLRequest = null;
         var _loc6_:String = null;
         var _loc4_:URLVariables = new URLVariables();
         var _loc5_:URLVariables;
         (_loc5_ = new URLVariables())[ServerConstants.PARAM_MOVIE_ID] = param2;
         _loc5_[ServerConstants.PARAM_USER_ID] = param1.getValueByKey(ServerConstants.PARAM_USER_ID) as String;
         _loc5_[ServerConstants.PARAM_USER_TOKEN] = param1.getValueByKey(ServerConstants.PARAM_USER_TOKEN) as String;
         Util.addFlashVarsToURLvar(_loc4_);
         _loc4_[ServerConstants.PARAM_MOVIE_ID] = param2;
         _loc6_ = ServerConstants.ACTION_GET_MOVIE + "?" + _loc5_.toString();
         _loc3_ = new URLRequest(_loc6_);
         _loc3_.method = URLRequestMethod.POST;
         _loc3_.data = _loc4_;
         return _loc3_;
      }
      
      public static function getMovieRequest(param1:String) : URLRequest
      {
         var _loc2_:AppConfigManager = AppConfigManager.instance;
         var _loc3_:URLVariables = new URLVariables();
         _loc3_[ServerConstants.PARAM_MOVIE_ID] = param1;
         _loc3_[ServerConstants.PARAM_USER_ID] = _loc2_.getValue(ServerConstants.PARAM_USER_ID);
         _loc3_[ServerConstants.PARAM_USER_TOKEN] = _loc2_.getValue(ServerConstants.PARAM_USER_TOKEN);
         var _loc4_:URLVariables;
         (_loc4_ = _loc2_.createURLVariables())[ServerConstants.PARAM_MOVIE_ID] = param1;
         var _loc5_:String = ServerConstants.ACTION_GET_MOVIE + "?" + _loc3_.toString();
         var _loc6_:URLRequest;
         (_loc6_ = new URLRequest(_loc5_)).method = URLRequestMethod.POST;
         _loc6_.data = _loc4_;
         return _loc6_;
      }
      
      public static function getGetMovieInfoRequest(param1:String) : URLRequest
      {
         var _loc2_:URLVariables = AppConfigManager.instance.createURLVariables();
         _loc2_[ServerConstants.PARAM_MOVIE_ID] = param1;
         var _loc3_:URLRequest = new URLRequest(ServerConstants.ACTION_GET_MOVIE_INFO);
         _loc3_.method = URLRequestMethod.POST;
         _loc3_.data = _loc2_;
         return _loc3_;
      }
      
      public static function getSendBugReportRequest() : URLRequest
      {
         var _loc1_:URLRequest = new URLRequest(ServerConstants.ACTION_SEND_BUG_REPORT);
         _loc1_.method = URLRequestMethod.POST;
         _loc1_.data = AppConfigManager.instance.createURLVariables();
         return _loc1_;
      }
      
      public static function getSaveJpegReuqest(param1:String, param2:ByteArray) : URLRequest
      {
         var _loc3_:URLVariables = new URLVariables();
         var _loc4_:Base64Encoder;
         (_loc4_ = new Base64Encoder()).encodeBytes(param2);
         _loc3_["imagedata"] = _loc4_.flush();
         _loc3_["filename"] = param1;
         var _loc5_:URLRequest;
         (_loc5_ = new URLRequest(ServerConstants.ACTION_SAVE_JPEG)).method = URLRequestMethod.POST;
         _loc5_.data = _loc3_;
         return _loc5_;
      }
   }
}
