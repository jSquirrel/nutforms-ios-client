# Nutforms iOS Client

Automatic aspect-oriented form generation for iOS applications

## Important Classes
- Nutforms Rich Model
  - [Model](https://github.com/jSquirrel/nutforms-ios-client/blob/master/client/Model/Model.swift)
  - [ModelLocalization](https://github.com/jSquirrel/nutforms-ios-client/blob/master/client/Model/ModelLocalization.swift)
  - [ModelRenderer](https://github.com/jSquirrel/nutforms-ios-client/blob/master/client/Model/ModelRenderer.swift)
  - [Layout](https://github.com/jSquirrel/nutforms-ios-client/blob/master/client/Model/Layout.swift)
  - [Attribute](https://github.com/jSquirrel/nutforms-ios-client/blob/master/client/Model/Attribute.swift)
  - [AttributeLocalization](https://github.com/jSquirrel/nutforms-ios-client/blob/master/client/Model/AttributeLocalization.swift)
- Nutforms Facade
  - [Nutforms](https://github.com/jSquirrel/nutforms-ios-client/blob/master/client/Nutforms.swift)
- Nutforms Rich Model Builders
  - [ModelBuilder](https://github.com/jSquirrel/nutforms-ios-client/blob/master/client/Model/ModelBuilder.swift)
  - [AttributeBuilder](https://github.com/jSquirrel/nutforms-ios-client/blob/master/client/Model/AttributeBuilder.swift)
  - [RelationBuilder](https://github.com/jSquirrel/nutforms-ios-client/blob/master/client/Model/RelationBuilder.swift)
- Aspect Parsers
  - [ModelStructureParser](https://github.com/jSquirrel/nutforms-ios-client/blob/master/client/Parser/ModelStructureParser.swift)
  - [LocalizationParser](https://github.com/jSquirrel/nutforms-ios-client/blob/master/client/Parser/LocalizationParser.swift)
  - [ValuesParser](https://github.com/jSquirrel/nutforms-ios-client/blob/master/client/Parser/ValuesParser.swift)
- Aspects Sources 
  - [AspectsSource](https://github.com/jSquirrel/nutforms-ios-client/blob/master/client/AspectsSource/AspectsSource.swift)
- iOS Application
  - [AppDelegate](https://github.com/jSquirrel/nutforms-ios-client/blob/master/client/AppDelegate.swift)
  - [ViewController](https://github.com/jSquirrel/nutforms-ios-client/blob/master/client/ViewController.swift)

## TODO
  - Load aspects from server
  - Build Model from the downloaded aspects, see (https://github.com/jSquirrel/nutforms-ios-client/blob/master/client/ModelBuilder.swift)
  - Register callback functions and change values in Rich Model
  - Build standalone library and separate client app which uses it
