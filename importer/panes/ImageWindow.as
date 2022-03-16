package importer.panes
{
   import anifire.util.UtilDict;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.containers.Canvas;
   import mx.containers.VBox;
   import mx.controls.Label;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   
   use namespace mx_internal;
   
   public class ImageWindow extends Canvas implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _ImageWindow_Label1:Label;
      
      private var _22440084_vsUploadI:UploadFileWindow;
      
      private var _1400230825computerPanel:VBox;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _bottom:importer;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function ImageWindow()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":Canvas,
            "stylesFactory":function():void
            {
               this.themeColor = 6014440;
               this.borderColor = 5879285;
               this.cornerRadius = 1;
            },
            "propertiesFactory":function():Object
            {
               return {
                  "width":711,
                  "childDescriptors":[new UIComponentDescriptor({
                     "type":VBox,
                     "stylesFactory":function():void
                     {
                        this.paddingLeft = 72;
                        this.paddingRight = 72;
                     },
                     "propertiesFactory":function():Object
                     {
                        return {
                           "y":128,
                           "percentWidth":100,
                           "childDescriptors":[new UIComponentDescriptor({
                              "type":VBox,
                              "id":"computerPanel",
                              "stylesFactory":function():void
                              {
                                 this.horizontalAlign = "center";
                                 this.verticalGap = 0;
                                 this.paddingBottom = 0;
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
                                                "id":"_ImageWindow_Label1",
                                                "propertiesFactory":function():Object
                                                {
                                                   return {"styleName":"stickComputerText"};
                                                }
                                             })]
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":UploadFileWindow,
                                       "id":"_vsUploadI",
                                       "events":{
                                          "show":"___vsUploadI_show",
                                          "creationComplete":"___vsUploadI_creationComplete"
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "height":300,
                                             "upload_message":true
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
         });
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._ImageWindow_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_importer_panes_ImageWindowWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ImageWindow[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 711;
         this.horizontalScrollPolicy = "off";
         this.verticalScrollPolicy = "off";
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
         ImageWindow._watcherSetupUtil = param1;
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         var factory:IFlexModuleFactory = param1;
         super.moduleFactory = factory;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
         if(!this.styleDeclaration)
         {
            this.styleDeclaration = new CSSStyleDeclaration(null,styleManager);
         }
         this.styleDeclaration.defaultFactory = function():void
         {
            this.themeColor = 6014440;
            this.borderColor = 5879285;
            this.cornerRadius = 1;
         };
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
         }
         if(this._vsUploadI != null)
         {
            this._vsUploadI.init(this._bottom);
         }
      }
      
      public function setButtonStatus(param1:Boolean) : void
      {
         this._bottom.setButtonStatus(param1);
      }
      
      public function ___vsUploadI_show(param1:FlexEvent) : void
      {
         this._vsUploadI.init(this._bottom);
      }
      
      public function ___vsUploadI_creationComplete(param1:FlexEvent) : void
      {
         this._vsUploadI.init(this._bottom);
         this._vsUploadI.filter = "images";
      }
      
      private function _ImageWindow_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = "+ " + UtilDict.toDisplay("import","From your computer");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_ImageWindow_Label1.text");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _vsUploadI() : UploadFileWindow
      {
         return this._22440084_vsUploadI;
      }
      
      public function set _vsUploadI(param1:UploadFileWindow) : void
      {
         var _loc2_:Object = this._22440084_vsUploadI;
         if(_loc2_ !== param1)
         {
            this._22440084_vsUploadI = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_vsUploadI",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get computerPanel() : VBox
      {
         return this._1400230825computerPanel;
      }
      
      public function set computerPanel(param1:VBox) : void
      {
         var _loc2_:Object = this._1400230825computerPanel;
         if(_loc2_ !== param1)
         {
            this._1400230825computerPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"computerPanel",_loc2_,param1));
            }
         }
      }
   }
}
