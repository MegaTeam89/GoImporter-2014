package importer.panes
{
   import anifire.constant.ServerConstants;
   import anifire.util.UtilDict;
   import anifire.util.UtilUser;
   import flash.events.MouseEvent;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.containers.Canvas;
   import mx.containers.VBox;
   import mx.controls.Label;
   import mx.controls.LinkButton;
   import mx.controls.Text;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   
   use namespace mx_internal;
   
   public class FlashWindow extends Canvas implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _FlashWindow_Label1:Label;
      
      private var _296123136_btnGuidelines:LinkButton;
      
      private var _912939609_btnSample:LinkButton;
      
      private var _1520683834_disclaimer:Text;
      
      private var _1969980041_subtitle:Text;
      
      private var _22440087_vsUploadF:UploadFileWindow;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _bottom:importer;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function FlashWindow()
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
                     this.verticalGap = 20;
                     this.paddingLeft = 72;
                     this.paddingRight = 72;
                     this.horizontalAlign = "center";
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "y":128,
                        "percentWidth":100,
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":Text,
                           "id":"_subtitle",
                           "stylesFactory":function():void
                           {
                              this.fontSize = 15;
                              this.fontWeight = "normal";
                              this.textAlign = "center";
                           },
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "selectable":false,
                                 "percentWidth":100
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":Text,
                           "id":"_disclaimer",
                           "stylesFactory":function():void
                           {
                              this.fontSize = 15;
                              this.fontWeight = "bold";
                              this.textAlign = "center";
                              this.color = 11277569;
                           },
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "selectable":false,
                                 "percentWidth":100
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":LinkButton,
                           "id":"_btnGuidelines",
                           "events":{"click":"___btnGuidelines_click"},
                           "stylesFactory":function():void
                           {
                              this.themeColor = 16742400;
                              this.cornerRadius = 0;
                              this.color = 5799935;
                              this.fontSize = 15;
                              this.fontWeight = "bold";
                              this.fontFamily = "Arial";
                           },
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "enabled":true,
                                 "alpha":1
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":LinkButton,
                           "id":"_btnSample",
                           "events":{"click":"___btnSample_click"},
                           "stylesFactory":function():void
                           {
                              this.color = 5799935;
                              this.fontSize = 15;
                              this.fontFamily = "Arial";
                              this.fontStyle = "normal";
                              this.fontWeight = "bold";
                              this.themeColor = 16742400;
                           },
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "enabled":true,
                                 "alpha":1
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":VBox,
                           "stylesFactory":function():void
                           {
                              this.horizontalAlign = "center";
                              this.verticalGap = 10;
                              this.paddingBottom = 10;
                           },
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "percentWidth":100,
                                 "styleName":"WhiteBox",
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "styleName":"stickComputer",
                                          "percentWidth":100,
                                          "childDescriptors":[new UIComponentDescriptor({
                                             "type":Label,
                                             "id":"_FlashWindow_Label1",
                                             "propertiesFactory":function():Object
                                             {
                                                return {"styleName":"stickComputerText"};
                                             }
                                          })]
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":UploadFileWindow,
                                    "id":"_vsUploadF",
                                    "events":{
                                       "show":"___vsUploadF_show",
                                       "creationComplete":"___vsUploadF_creationComplete"
                                    },
                                    "propertiesFactory":function():Object
                                    {
                                       return {"upload_message":false};
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
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._FlashWindow_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_importer_panes_FlashWindowWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return FlashWindow[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.horizontalScrollPolicy = "off";
         this.verticalScrollPolicy = "off";
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         FlashWindow._watcherSetupUtil = param1;
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
      
      public function init(param1:Object) : void
      {
         if(param1 != null)
         {
            this._bottom = param1 as importer;
            this._vsUploadF.init(param1);
         }
         if(this.id == "_videoUI")
         {
            this._btnGuidelines.visible = false;
            this._btnSample.visible = false;
            this._subtitle.text = UtilDict.toDisplay("import","Select a video file on your computer and upload it to the GoAnimate studio.\nIt will appear in the video tab in your stuff.");
            this._disclaimer.text = UtilDict.toDisplay("import","import_flvdisclaimer");
            this._vsUploadF.filter = "video";
         }
         else
         {
            this._btnGuidelines.visible = true;
            this._btnSample.visible = true;
            this._subtitle.text = !!UtilUser.hasBetaFeatures() ? UtilDict.toDisplay("import","import_swfsubtitle") : UtilDict.toDisplay("import","Import your own Flash animations as props and backgrounds.");
            this._disclaimer.text = UtilDict.toDisplay("import","import_swfdisclaimer");
            this._vsUploadF.filter = "flash";
         }
      }
      
      public function setButtonStatus(param1:Boolean) : void
      {
         this._btnGuidelines.enabled = param1;
         this._btnSample.enabled = param1;
         this._bottom.setButtonStatus(param1);
      }
      
      private function onSample() : void
      {
         if(UtilUser.hasBetaFeatures())
         {
            navigateToURL(new URLRequest(ServerConstants.ACTION_GET_SAMPLE),"_blank");
         }
         else
         {
            navigateToURL(new URLRequest(ServerConstants.ACTION_GET_SAMPLE_PLUS),"_blank");
         }
      }
      
      private function onGetGuidelines() : void
      {
         if(UtilUser.hasBetaFeatures())
         {
            navigateToURL(new URLRequest(ServerConstants.ACTION_GET_PDF),"_blank");
         }
         else
         {
            navigateToURL(new URLRequest(ServerConstants.ACTION_GET_PDF_PLUS),"_blank");
         }
      }
      
      public function ___btnGuidelines_click(param1:MouseEvent) : void
      {
         this.onGetGuidelines();
      }
      
      public function ___btnSample_click(param1:MouseEvent) : void
      {
         this.onSample();
      }
      
      public function ___vsUploadF_show(param1:FlexEvent) : void
      {
         this._vsUploadF.init(this._bottom);
      }
      
      public function ___vsUploadF_creationComplete(param1:FlexEvent) : void
      {
         this._vsUploadF.init(this._bottom);
         this._vsUploadF.filter = "flash";
      }
      
      private function _FlashWindow_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("import","import_downloadswfpdf");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_btnGuidelines.label");
         result[1] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("import","import_downloadswffla");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_btnSample.label");
         result[2] = new Binding(this,function():String
         {
            var _loc1_:* = "+ " + UtilDict.toDisplay("import","From your computer");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_FlashWindow_Label1.text");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _btnGuidelines() : LinkButton
      {
         return this._296123136_btnGuidelines;
      }
      
      public function set _btnGuidelines(param1:LinkButton) : void
      {
         var _loc2_:Object = this._296123136_btnGuidelines;
         if(_loc2_ !== param1)
         {
            this._296123136_btnGuidelines = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_btnGuidelines",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _btnSample() : LinkButton
      {
         return this._912939609_btnSample;
      }
      
      public function set _btnSample(param1:LinkButton) : void
      {
         var _loc2_:Object = this._912939609_btnSample;
         if(_loc2_ !== param1)
         {
            this._912939609_btnSample = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_btnSample",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _disclaimer() : Text
      {
         return this._1520683834_disclaimer;
      }
      
      public function set _disclaimer(param1:Text) : void
      {
         var _loc2_:Object = this._1520683834_disclaimer;
         if(_loc2_ !== param1)
         {
            this._1520683834_disclaimer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_disclaimer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _subtitle() : Text
      {
         return this._1969980041_subtitle;
      }
      
      public function set _subtitle(param1:Text) : void
      {
         var _loc2_:Object = this._1969980041_subtitle;
         if(_loc2_ !== param1)
         {
            this._1969980041_subtitle = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_subtitle",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _vsUploadF() : UploadFileWindow
      {
         return this._22440087_vsUploadF;
      }
      
      public function set _vsUploadF(param1:UploadFileWindow) : void
      {
         var _loc2_:Object = this._22440087_vsUploadF;
         if(_loc2_ !== param1)
         {
            this._22440087_vsUploadF = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_vsUploadF",_loc2_,param1));
            }
         }
      }
   }
}
