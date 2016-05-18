# Nutforms Web Client Architecture

## Nutforms facade

The whole form generation subsystem is covered by facade provided
by [Nutforms](https://github.com/jSquirrel/nutforms-ios-client/blob/master/src/client/Nutforms/Nutforms.swift) class.

It provides `generateForm()` function, which generates the form and the rich model behind the form
from given context parameters and binds the form to the given `UIView`.
The method is made up of these steps:

1. First, it fetches the aspects definitions
2. Second, it builds the rich model
3. Third, it renders the form, appends it to the HTML element and registers event callbacks

## Rich Model

Before the form is generated, Rich Model is built. This model is mirroring the model on the server
and supports aspects weaving and propagates user inputs into its values at runtime.

Rich Model is made up of these classes:
- [Model](https://github.com/jSquirrel/nutforms-ios-client/blob/master/client/Nutforms/Model/Model.swift) represents class from the server model.
- [Attribute](https://github.com/jSquirrel/nutforms-ios-client/blob/client/Nutforms/Model/Attribute.swift) represents field of class.
- [Relation](https://github.com/jSquirrel/nutforms-ios-client/blob/master/client/Nutforms/Model/Relation.swift) extends Attribute and represents a relation between classes.
- [ModelLocalization](https://github.com/jSquirrel/nutforms-ios-client/blob/master/client/Nutforms/Model/ModelLocalization.swift) holds localization aspect data for Model.
- [AttributeLocalization](https://github.com/jSquirrel/nutforms-ios-client/blob/master/client/Nutforms/Model/AttributeLocalization.swift) holds localization aspect data for Attribute.
- [ModelRenderer](https://github.com/jSquirrel/nutforms-ios-client/blob/master/client/Nutforms/Model/ModelRenderer.swift) is responsible for rendering the whole model.
- [AttributeRenderer](https://github.com/jSquirrel/nutforms-ios-client/blob/master/client/Nutforms/Model/AttributeRenderer.swift) is responsible for rendering widget for its attribute.
- [Layout](https://github.com/jSquirrel/nutforms-ios-client/blob/master/client/Nutforms/Model/Layout.swift) holds layout aspect data for Model.

## Rich Model Building

The model is build using these builders:
- [AttributeBuilder](https://github.com/jSquirrel/nutforms-ios-client/blob/master/client/Nutforms/Model/AttributeBuilder.swift) builts `Attribute` class.
- [ModelBuilder](https://github.com/jSquirrel/nutforms-ios-client/blob/master/src/model/ModelBuilder.swift) builds the `Model` class and contains set of `AttributeBuilder`s.

The builders are directed by the
[Nutforms](https://github.com/jSquirrel/nutforms-ios-client/blob/client/Nutforms/Nutforms.swift) class
and by the aspect definition parsers:
- [ModelStructureParser](https://github.com/jSquirrel/nutforms-ios-client/blob/master/client/Nutforms/Parser/ModelStructureParser.swift) parses model structure metadata and calls appropriate methods on the `ModelBuilder` and its `AspectBuilder`s
- [LocalizationParser](https://github.com/jSquirrel/nutforms-ios-client/blob/master/client/Nutforms/Parser/LocalizationParser.swift) parses localization aspect data and calls appropriate methods on the `ModelBuilder` and its `AspectBuilder`s
- [ValuesParser](https://github.com/jSquirrel/nutforms-ios-client/blob/master/client/Nutforms/Parser/ValuesParser.swift) parses values aspect data and calls appropriate methods on the `ModelBuilder` and its `AspectBuilder`s

## Aspects Definitions Retrieval

The aspects definitions are retrieved from `AspectsSource` protocol.

## Observers

The `Model`, `Attribute` and `Nutforms` classes all extend [Observable](https://github.com/jSquirrel/nutforms-ios-client/blob/master/client/Nutforms/Observer/Observable.js)
class, which allows them to be listened to by observers and to trigger events which notify the observers.

## Observing events

You can subscribe to events via `listen()`
function. Both objects and functions can be subscribed. The object has to implement method `update()`.
The functions are invoked.

If you wish to unsubscribe from an event, you can use `unsubscribe()` function.

Events can be triggered upon it via `trigger()` function.

You can observe all events by subscribing to `all` event. Be careful though, when an event is triggered upon Observable,
the observers registered to all events are passed the triggered event name as the first parameter.
