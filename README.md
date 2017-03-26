# iOS-ObjC-DesignPattern

tutotial follow :https://www.raywenderlich.com/46988/ios-design-patterns

### Design Patterns
- reusable solutions to common problems in software design
- templates - to help you write code that’s easy to understand and reuse


Creational : Singleton and Abstract Factory

Structural : MVC, Decorator, Adapter, Facade and Composite

Behavioural : Observer , Memento, Chain of Responsibility and Command

## MVC - most-used designed pattern
—classifies objects according to their general role 
— encourages clean separation of code base on role 

Model - The object holes your application data and define how to manipulate it (e.g. Object classes)
View - visual representation of the Model, controls the interaction with user. (e.g. UIView subclasses)
Controller - mediator and coordinates all the work. Access the data from Model and Display it with the View. Listen to event and manipulates the data ad necessary. (e.g. ViewController)

￼

## Singleton
- only one instance exists for a given class and there’s a global access point to that instance.
Usually use lazy loading when first creation.


## Facade
— provides a single interface to a complex subsystem.
— e.g. exposing the user to only one simple unified API rather than multiple classes and API

￼


## Decorator
— add behaviour and responsibilities to an object without modifying its code.
— e.g. Category and Delegation

#Category — adde methods to existing classes without subclassing (extension ?? )
— Help keep the method organised and separated into sections.

#Delegation — is a mechanism in which one object acts on behalf of another object

##Adaptor — allows classes with incompatible interface to work together. 
eg. Using protocol to create uiview , UITableView


##Observer - one object notifies other objects of any state changes
Often used to notify interested objects when a property has changed
— usual implementation, requires an observer registers interest int he state of another object
e.g. Apple’s Push Notification service
— MVC,need to allow Model to communicate with View without direct reference between them, using Observer
E.g. Notifications and Key-Value Observing

#Notification
Notifications are base on a subscribe-and-publish model
Publisher send message to subscribers/listeners

#KVO (key-value observing)
— an object can ask to be notified of any changes to a specific property


##Memento
— captures and externalise an object’s internal state.
— save the data somewhere
e.g. User default 

#One of the Memento pattern
Archiving — coverts an object into a stream that can be saved and later restored without exposing private properties to external classes.
i.e. conforming to NSCoding protocol


##Command
— encapsulates a request or action as an object.
— the encapsulated request can be passed between object, stored for later, modified dynamically, or placed into a queue.
e.g. Target-Action mechanism and Invocation










