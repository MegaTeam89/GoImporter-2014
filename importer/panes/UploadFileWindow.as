package importer.panes
{
   import anifire.component.UploadHelper;
   import anifire.constant.AnimeConstants;
   import anifire.constant.ServerConstants;
   import anifire.util.UtilDict;
   import anifire.util.UtilUser;
   import flash.errors.IOError;
   import flash.events.DataEvent;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.MouseEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.FileFilter;
   import flash.net.FileReference;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLVariables;
   import flash.system.Capabilities;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.containers.Canvas;
   import mx.containers.HBox;
   import mx.containers.VBox;
   import mx.controls.Button;
   import mx.controls.Label;
   import mx.controls.Text;
   import mx.controls.TextInput;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.managers.CursorManager;
   import mx.utils.StringUtil;
   
   use namespace mx_internal;
   
   public class UploadFileWindow extends Canvas implements IBindingClient
   {
      
      private static var MAX_FILE_SIZE:Number = 8 * 1024 * 1024;
      
      private static var MAX_VIDEO_SIZE:Number = 10 * 1024 * 1024;
      
      private static var MAX_IMAGE_SIZE:Number = 5 * 1024 * 1024;
      
      private static var MAX_SOUND_SIZE_BIZ:Number = 15 * 1024 * 1024;
      
      private static var MAX_FILE_SIZE_TEXT:String = "8MB";
      
      private static var MAX_VIDEO_SIZE_TEXT:String = "10MB";
      
      private static var MAX_IMAGE_SIZE_TEXT:String = "5MB";
      
      private static var MAX_SOUND_SIZE_BIZ_TEXT:String = "15MB";
      
      private static var FILTER_FLVMOVIE:FileFilter = new FileFilter(UtilDict.toDisplay("import","Video File(*.3g2;*.3gp;*.asf;*.asx;*.avi;*.flv;*.mov;*.mp4;*.mpg;*.mpeg;*.ogg;*.ogv;*.rm;*.wmv)"),"*.3g2;*.3gp;*.asf;*.asx;*.avi;*.flv;*.mov;*.mp4;*.mpg;*.mpeg;*.ogg;*.ogv;*.rm;*.wmv");
      
      private static var FILTER_FLASH:FileFilter = new FileFilter(UtilDict.toDisplay("import","import_flashfile"),"*.swf");
      
      private static var FILTER_IMAGE:FileFilter = new FileFilter(UtilDict.toDisplay("import","import_imagefile"),"*.jpg;*.jpeg;*.gif;*.png");
      
      private static var FILTER_SOUND:FileFilter = new FileFilter(UtilDict.toDisplay("import","import_soundfile"),"*.mp3;*.wav;*.m4a");
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _UploadFileWindow_HBox2:HBox;
      
      public var _UploadFileWindow_Label1:Label;
      
      private var _1383868793_btnBrowse:Button;
      
      private var _1358079692_btnCommit:Button;
      
      private var _910560372_progress:Canvas;
      
      private var _1077796736_sizeRemark:Label;
      
      private var _1479285453_txtFile:TextInput;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _file:FileReference;
      
      private var _bottom:importer;
      
      private var _selected:Boolean = false;
      
      private var _filter:FileFilter;
      
      private var _96366104_upload_message:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function UploadFileWindow()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":VBox,
                  "stylesFactory":function():void
                  {
                     this.paddingTop = 20;
                     this.paddingBottom = 0;
                     this.verticalGap = 0;
                     this.horizontalAlign = "center";
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":Label,
                           "id":"_UploadFileWindow_Label1",
                           "stylesFactory":function():void
                           {
                              this.fontWeight = "bold";
                              this.paddingBottom = 30;
                              this.textAlign = "center";
                              this.fontSize = 18;
                              this.fontAntiAliasType = "advanced";
                              this.color = 8768283;
                           },
                           "propertiesFactory":function():Object
                           {
                              return {"percentWidth":100};
                           }
                        }),new UIComponentDescriptor({
                           "type":HBox,
                           "stylesFactory":function():void
                           {
                              this.verticalAlign = "middle";
                              this.horizontalAlign = "center";
                           },
                           "propertiesFactory":function():Object
                           {
                              return {"childDescriptors":[new UIComponentDescriptor({
                                 "type":Canvas,
                                 "propertiesFactory":function():Object
                                 {
                                    return {"childDescriptors":[new UIComponentDescriptor({
                                       "type":Canvas,
                                       "id":"_progress",
                                       "propertiesFactory":function():Object
                                       {
                                          return {"height":5};
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":TextInput,
                                       "id":"_txtFile",
                                       "stylesFactory":function():void
                                       {
                                          this.fontSize = 12;
                                          this.borderColor = 8947848;
                                          this.borderThickness = 10;
                                          this.themeColor = 8947848;
                                          this.backgroundAlpha = 0;
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "width":240,
                                             "height":28,
                                             "editable":false,
                                             "styleName":"myTextInput"
                                          };
                                       }
                                    })]};
                                 }
                              }),new UIComponentDescriptor({
                                 "type":Button,
                                 "id":"_btnBrowse",
                                 "events":{"click":"___btnBrowse_click"},
                                 "stylesFactory":function():void
                                 {
                                    this.paddingLeft = 10;
                                    this.paddingRight = 10;
                                 },
                                 "propertiesFactory":function():Object
                                 {
                                    return {
                                       "maxWidth":100,
                                       "buttonMode":true,
                                       "styleName":"btnBlack"
                                    };
                                 }
                              }),new UIComponentDescriptor({
                                 "type":Button,
                                 "id":"_btnCommit",
                                 "events":{"click":"___btnCommit_click"},
                                 "stylesFactory":function():void
                                 {
                                    this.paddingLeft = 10;
                                    this.paddingRight = 10;
                                 },
                                 "propertiesFactory":function():Object
                                 {
                                    return {
                                       "maxWidth":100,
                                       "buttonMode":true,
                                       "styleName":"btnBlack"
                                    };
                                 }
                              })]};
                           }
                        }),new UIComponentDescriptor({
                           "type":Label,
                           "id":"_sizeRemark",
                           "stylesFactory":function():void
                           {
                              this.paddingBottom = 20;
                              this.paddingTop = 5;
                              this.paddingLeft = 70;
                              this.fontWeight = "bold";
                              this.textAlign = "left";
                              this.fontSize = 12;
                              this.fontAntiAliasType = "advanced";
                              this.color = 0;
                           },
                           "propertiesFactory":function():Object
                           {
                              return {"percentWidth":100};
                           }
                        }),new UIComponentDescriptor({
                           "type":HBox,
                           "id":"_UploadFileWindow_HBox2",
                           "stylesFactory":function():void
                           {
                              this.horizontalGap = 0;
                              this.verticalGap = 0;
                              this.verticalAlign = "bottom";
                           },
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "name":"upload_message",
                                 "percentWidth":100,
                                 "percentHeight":60,
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":VBox,
                                    "stylesFactory":function():void
                                    {
                                       this.fontSize = 11;
                                       this.fontWeight = "bold";
                                       this.color = 11184810;
                                       this.fontAntiAliasType = "advanced";
                                       this.borderStyle = "solid";
                                       this.borderSides = "top right";
                                       this.verticalGap = 0;
                                    },
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "percentWidth":50,
                                          "percentHeight":100,
                                          "childDescriptors":[new UIComponentDescriptor({
                                             "type":Text,
                                             "stylesFactory":function():void
                                             {
                                                this.paddingLeft = 20;
                                                this.paddingTop = 10;
                                                this.fontSize = 13;
                                                this.color = 6776679;
                                             },
                                             "propertiesFactory":function():Object
                                             {
                                                return {"text":"Uploading backgrounds:"};
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":Text,
                                             "stylesFactory":function():void
                                             {
                                                this.fontSize = 11;
                                                this.color = 11184810;
                                                this.paddingLeft = 20;
                                                this.paddingTop = 5;
                                             },
                                             "propertiesFactory":function():Object
                                             {
                                                return {"text":"Suggested sizes:"};
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":Text,
                                             "stylesFactory":function():void
                                             {
                                                this.fontSize = 11;
                                                this.color = 11184810;
                                                this.paddingLeft = 20;
                                             },
                                             "propertiesFactory":function():Object
                                             {
                                                return {"text":"- 1179 x 720px (720 quality)"};
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":Text,
                                             "stylesFactory":function():void
                                             {
                                                this.fontSize = 11;
                                                this.color = 11184810;
                                                this.paddingLeft = 20;
                                             },
                                             "propertiesFactory":function():Object
                                             {
                                                return {"text":"- 1679 x 1080px (1080p quality)"};
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":Text,
                                             "stylesFactory":function():void
                                             {
                                                this.fontSize = 11;
                                                this.color = 11184810;
                                                this.paddingLeft = 20;
                                                this.paddingTop = 5;
                                                this.paddingRight = 20;
                                             },
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "percentWidth":100,
                                                   "text":"For images with a different aspect ratio black bars will appear"
                                                };
                                             }
                                          })]
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":VBox,
                                    "stylesFactory":function():void
                                    {
                                       this.fontSize = 11;
                                       this.fontWeight = "bold";
                                       this.color = 11184810;
                                       this.fontAntiAliasType = "advanced";
                                       this.borderStyle = "solid";
                                       this.borderSides = "top";
                                       this.verticalGap = 0;
                                    },
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "percentWidth":50,
                                          "percentHeight":100,
                                          "childDescriptors":[new UIComponentDescriptor({
                                             "type":Text,
                                             "stylesFactory":function():void
                                             {
                                                this.paddingLeft = 20;
                                                this.paddingTop = 10;
                                                this.fontSize = 13;
                                                this.color = 6776679;
                                             },
                                             "propertiesFactory":function():Object
                                             {
                                                return {"text":"Uploading props:"};
                                             }
                                          }),new UIComponentDescriptor({
                                             "type":Text,
                                             "stylesFactory":function():void
                                             {
                                                this.fontSize = 11;
                                                this.color = 11184810;
                                                this.paddingLeft = 20;
                                                this.paddingTop = 10;
                                                this.paddingRight = 20;
                                             },
                                             "propertiesFactory":function():Object
                                             {
                                                return {
                                                   "percentWidth":100,
                                                   "text":"Props are not resized on upload. Import images as large as possible for best quality."
                                                };
                                             }
                                          })]
                                       };
                                    }
                                 })]
                              };
                           }
                        })]
                     };
                  }
               })]};
            }
         });
         this._filter = FILTER_IMAGE;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._UploadFileWindow_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_importer_panes_UploadFileWindowWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return UploadFileWindow[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.percentHeight = 100;
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         UploadFileWindow._watcherSetupUtil = param1;
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         super.moduleFactory = param1;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
      }
      
      override public function initialize() : void
      {
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         super.initialize();
      }
      
      public function set upload_message(param1:Boolean) : void
      {
         this._upload_message = param1;
      }
      
      public function init(param1:Object) : void
      {
         if(param1 != null)
         {
            this._bottom = param1 as importer;
         }
         FILTER_FLVMOVIE = new FileFilter(UtilDict.toDisplay("import","Video File(*.3g2;*.3gp;*.asf;*.asx;*.avi;*.flv;*.mov;*.mp4;*.mpg;*.mpeg;*.ogg;*.ogv;*.rm;*.wmv)"),"*.3g2;*.3gp;*.asf;*.asx;*.avi;*.flv;*.mov;*.mp4;*.mpg;*.mpeg;*.ogg;*.ogv;*.rm;*.wmv");
         FILTER_FLASH = new FileFilter(UtilDict.toDisplay("import","import_flashfile"),"*.swf");
         FILTER_IMAGE = new FileFilter(UtilDict.toDisplay("import","import_imagefile"),"*.jpg;*.jpeg;*.gif;*.png");
         FILTER_SOUND = new FileFilter(UtilDict.toDisplay("import","import_soundfile"),"*.mp3;*.wav;*.m4a");
      }
      
      public function set filter(param1:String) : void
      {
         var _loc2_:String = null;
         if(param1 == "images")
         {
            this._filter = FILTER_IMAGE;
            _loc2_ = "5MB";
         }
         else if(param1 == "sounds")
         {
            _loc2_ = "8MB";
            if(UtilUser.hasBizFeatures)
            {
               _loc2_ = MAX_SOUND_SIZE_BIZ_TEXT;
            }
            this._filter = FILTER_SOUND;
         }
         else if(param1 == "flash")
         {
            _loc2_ = "8MB";
            this._filter = FILTER_FLASH;
         }
         else if(param1 == "video")
         {
            this._filter = FILTER_FLVMOVIE;
            _loc2_ = "10MB";
         }
         this._sizeRemark.text = StringUtil.substitute(UtilDict.toDisplay("import","(maximum file size {0})"),_loc2_);
      }
      
      private function browse() : void
      {
         if(this._file == null)
         {
            this._file = new FileReference();
            this._file.addEventListener(Event.SELECT,this.onSelect);
         }
         try
         {
            this._file.browse([this._filter]);
         }
         catch(e:IOError)
         {
            throw new Error("IOError:" + e.getStackTrace());
         }
         catch(e:Error)
         {
            throw new Error("error: " + e.getStackTrace());
         }
      }
      
      private function getMaxFileSize() : Number
      {
         if(this._filter.extension == FILTER_FLVMOVIE.extension)
         {
            return MAX_VIDEO_SIZE;
         }
         if(this._filter.extension == FILTER_IMAGE.extension)
         {
            return MAX_IMAGE_SIZE;
         }
         if(UtilUser.hasBizFeatures)
         {
            return MAX_SOUND_SIZE_BIZ;
         }
         return MAX_FILE_SIZE;
      }
      
      private function getMaxFileSizeDisplayText() : String
      {
         if(this._filter.extension == FILTER_FLVMOVIE.extension)
         {
            return MAX_VIDEO_SIZE_TEXT;
         }
         if(this._filter.extension == FILTER_IMAGE.extension)
         {
            return MAX_IMAGE_SIZE_TEXT;
         }
         if(UtilUser.hasBizFeatures)
         {
            return MAX_SOUND_SIZE_BIZ_TEXT;
         }
         return MAX_FILE_SIZE_TEXT;
      }
      
      private function onSelect(param1:Event) : void
      {
         var _loc4_:String = null;
         var _loc2_:String = this._file.name;
         var _loc3_:String = _loc2_.substring(_loc2_.lastIndexOf(".")).toLowerCase();
         this._txtFile.text = _loc2_;
         this._selected = true;
         if(this._file.size > this.getMaxFileSize())
         {
            _loc4_ = StringUtil.substitute(UtilDict.toDisplay("import","The file exceeds the size limit of {0}, Please try again."),this.getMaxFileSizeDisplayText());
            this._bottom.show(_loc4_);
            this.clearFileReference();
         }
         else if(this._filter.extension.indexOf(_loc3_) == -1)
         {
            _loc4_ = UtilDict.toDisplay("import","The file you sent cannot be accepted.");
            switch(this._filter.description)
            {
               case FILTER_IMAGE.description:
                  _loc4_ += " " + UtilDict.toDisplay("import","Please upload .jpg .gif or .png files.  Animated gif does not work.");
                  break;
               case FILTER_SOUND.description:
                  _loc4_ += " " + UtilDict.toDisplay("import","Please upload .mp3 or .wav sound files.");
                  break;
               case FILTER_FLASH.description:
                  _loc4_ += " " + UtilDict.toDisplay("import","Please upload .swf files.");
                  break;
               case FILTER_FLVMOVIE.description:
                  _loc4_ += " " + UtilDict.toDisplay("import","Please upload .avi or supported video files.");
            }
            this._bottom.show(_loc4_);
            this.clearFileReference();
         }
      }
      
      public function clearFileReference() : void
      {
         if(this._file != null)
         {
            this._txtFile.text = "";
            this._file.cancel();
            this._file = null;
            this._selected = false;
         }
      }
      
      public function setButtonStatus(param1:Boolean) : void
      {
         this._btnCommit.enabled = param1;
         this._btnBrowse.enabled = param1;
         this._txtFile.editable = param1;
      }
      
      private function commit() : void
      {
         if(this._selected)
         {
            this._bottom.title = this._file.name.substring(0,this._file.name.lastIndexOf("."));
            this._bottom.tags = "";
            if(this._filter.description == FILTER_IMAGE.description)
            {
               this._bottom.showPopUp(this.upload,"uploadi");
            }
            else if(this._filter.description == FILTER_FLASH.description)
            {
               this._bottom.showPopUp(this.upload,"flash");
            }
            else if(this._filter.description == FILTER_FLVMOVIE.description)
            {
               this._bottom.showPopUp(this.upload,"video");
            }
            else
            {
               this._bottom.showPopUp(this.upload,"uploads");
            }
         }
      }
      
      public function upload() : void
      {
         var request:URLRequest = null;
         var variables:URLVariables = null;
         var fileUploadHelper:UploadHelper = null;
         if(!this._selected)
         {
            this._bottom.show(UtilDict.toDisplay("import","import_pleaseselect"));
         }
         else
         {
            this.setButtonStatus(false);
            CursorManager.setBusyCursor();
            variables = new URLVariables();
            this._bottom.addFlashVarsToURLvar(variables);
            variables["placeable"] = "0";
            variables["headable"] = "0";
            variables["holdable"] = "0";
            switch(this._bottom.type)
            {
               case AnimeConstants.ASSET_TYPE_BG:
                  request = new URLRequest(ServerConstants.ACTION_SAVE_BG);
                  break;
               case AnimeConstants.ASSET_TYPE_PROP_HEAD:
                  request = new URLRequest(ServerConstants.ACTION_SAVE_PROP);
                  variables["placeable"] = "1";
                  variables["headable"] = "1";
                  break;
               case AnimeConstants.ASSET_TYPE_PROP_HELD_BY_CHAR:
                  request = new URLRequest(ServerConstants.ACTION_SAVE_PROP);
                  variables["placeable"] = "1";
                  variables["holdable"] = "1";
                  break;
               case AnimeConstants.ASSET_TYPE_PROP_PLACEABLE:
                  request = new URLRequest(ServerConstants.ACTION_SAVE_PROP);
                  variables["placeable"] = "1";
                  variables["holdable"] = "0";
                  variables["headable"] = "0";
                  break;
               case AnimeConstants.ASSET_TYPE_PROP_VIDEO:
                  request = new URLRequest(ServerConstants.ACTION_SAVE_VIDEO);
                  variables["placeable"] = "1";
                  variables["holdable"] = "0";
                  variables["headable"] = "0";
                  break;
               case AnimeConstants.ASSET_TYPE_PROP:
                  request = new URLRequest(ServerConstants.ACTION_SAVE_PROP);
                  variables["placeable"] = "1";
                  variables["holdable"] = "1";
                  break;
               case AnimeConstants.ASSET_TYPE_SOUND:
                  request = new URLRequest(ServerConstants.ACTION_SAVE_SOUND);
                  break;
               case AnimeConstants.ASSET_TYPE_CHAR:
                  request = new URLRequest(ServerConstants.ACTION_SAVE_CHAR);
                  variables["placeable"] = "1";
                  break;
               case AnimeConstants.ASSET_TYPE_FX:
                  request = new URLRequest(ServerConstants.ACTION_SAVE_FX);
            }
            variables["title"] = this._bottom.title;
            variables["keywords"] = this._bottom.tags;
            variables["subtype"] = this._bottom.subtype;
            variables["type"] = this._bottom.type;
            variables["is_published"] = !!this._bottom.isPublished ? "1" : "0";
            if(this._bottom.type == AnimeConstants.ASSET_TYPE_CHAR)
            {
               if(this._bottom.oldChar)
               {
                  variables["characterId"] = this._bottom.charId;
               }
               else
               {
                  variables["characterName"] = this._bottom.char;
               }
               variables["actionName"] = this._bottom.title;
            }
            request.data = variables;
            request.method = URLRequestMethod.POST;
            try
            {
               fileUploadHelper = new UploadHelper();
               fileUploadHelper.init(this._file,request);
               fileUploadHelper.addEventListener(ProgressEvent.PROGRESS,this.onUploadProgress);
               fileUploadHelper.addEventListener(DataEvent.UPLOAD_COMPLETE_DATA,this._bottom.onUploadCustomAssetComplete);
               fileUploadHelper.addEventListener(DataEvent.UPLOAD_COMPLETE_DATA,function():void
               {
                  _progress.graphics.clear();
               });
               fileUploadHelper.addEventListener(DataEvent.UPLOAD_COMPLETE_DATA,function():void
               {
                  setButtonStatus(true);
               });
               fileUploadHelper.addEventListener(IOErrorEvent.IO_ERROR,this.error);
               fileUploadHelper.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.error);
               fileUploadHelper.upload();
            }
            catch(e:Error)
            {
               _bottom.show(UtilDict.toDisplay("import","import_errflashver") + " " + UtilDict.toDisplay("import","import_flashver") + " " + Capabilities.version,null,true);
               setButtonStatus(true);
               return;
            }
         }
      }
      
      private function error(param1:Event) : void
      {
         this._bottom.show("Error:  " + param1.type + "\nCannot proceede\n" + param1.toString(),"Error",true);
         this.setButtonStatus(true);
      }
      
      private function onUploadProgress(param1:ProgressEvent) : void
      {
         var _loc2_:Number = param1.bytesLoaded / param1.bytesTotal;
         this._progress.graphics.clear();
         this._progress.graphics.beginFill(8947848);
         this._progress.graphics.drawRect(0,0,_loc2_ * this._progress.width,this._progress.height);
         this._progress.graphics.endFill();
      }
      
      public function ___btnBrowse_click(param1:MouseEvent) : void
      {
         this.browse();
      }
      
      public function ___btnCommit_click(param1:MouseEvent) : void
      {
         this.commit();
      }
      
      private function _UploadFileWindow_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Boolean
         {
            return _upload_message;
         },null,"_UploadFileWindow_Label1.includeInLayout");
         result[1] = new Binding(this,function():Boolean
         {
            return _upload_message;
         },null,"_UploadFileWindow_Label1.visible");
         result[2] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("import","Import images as props and backgrounds");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_UploadFileWindow_Label1.text");
         result[3] = new Binding(this,function():Number
         {
            return _txtFile.x;
         },null,"_progress.x");
         result[4] = new Binding(this,function():Number
         {
            return _txtFile.y;
         },null,"_progress.y");
         result[5] = new Binding(this,function():Number
         {
            return _txtFile.width;
         },null,"_progress.width");
         result[6] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("import","Browse");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_btnBrowse.label");
         result[7] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("import","Upload");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_btnCommit.label");
         result[8] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("import","import_maxsize");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_sizeRemark.text");
         result[9] = new Binding(this,function():Boolean
         {
            return _upload_message;
         },null,"_UploadFileWindow_HBox2.includeInLayout");
         result[10] = new Binding(this,function():Boolean
         {
            return _upload_message;
         },null,"_UploadFileWindow_HBox2.visible");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _btnBrowse() : Button
      {
         return this._1383868793_btnBrowse;
      }
      
      public function set _btnBrowse(param1:Button) : void
      {
         var _loc2_:Object = this._1383868793_btnBrowse;
         if(_loc2_ !== param1)
         {
            this._1383868793_btnBrowse = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_btnBrowse",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _btnCommit() : Button
      {
         return this._1358079692_btnCommit;
      }
      
      public function set _btnCommit(param1:Button) : void
      {
         var _loc2_:Object = this._1358079692_btnCommit;
         if(_loc2_ !== param1)
         {
            this._1358079692_btnCommit = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_btnCommit",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _progress() : Canvas
      {
         return this._910560372_progress;
      }
      
      public function set _progress(param1:Canvas) : void
      {
         var _loc2_:Object = this._910560372_progress;
         if(_loc2_ !== param1)
         {
            this._910560372_progress = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_progress",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _sizeRemark() : Label
      {
         return this._1077796736_sizeRemark;
      }
      
      public function set _sizeRemark(param1:Label) : void
      {
         var _loc2_:Object = this._1077796736_sizeRemark;
         if(_loc2_ !== param1)
         {
            this._1077796736_sizeRemark = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_sizeRemark",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _txtFile() : TextInput
      {
         return this._1479285453_txtFile;
      }
      
      public function set _txtFile(param1:TextInput) : void
      {
         var _loc2_:Object = this._1479285453_txtFile;
         if(_loc2_ !== param1)
         {
            this._1479285453_txtFile = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_txtFile",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _upload_message() : Boolean
      {
         return this._96366104_upload_message;
      }
      
      private function set _upload_message(param1:Boolean) : void
      {
         var _loc2_:Object = this._96366104_upload_message;
         if(_loc2_ !== param1)
         {
            this._96366104_upload_message = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_upload_message",_loc2_,param1));
            }
         }
      }
   }
}
