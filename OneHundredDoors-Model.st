!classDefinition: #Door category: 'OneHundredDoors-Model'!
Object subclass: #Door
	instanceVariableNames: 'state'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OneHundredDoors-Model'!

!Door methodsFor: 'as yet unclassified' stamp: 'las 11/20/2020 12:53:48'!
asCharacter
	
	^ state asCharacter ! !

!Door methodsFor: 'as yet unclassified' stamp: 'las 11/20/2020 12:50:06'!
isClosed
	^ state isClosed! !

!Door methodsFor: 'as yet unclassified' stamp: 'las 11/20/2020 12:50:20'!
isOpen
	^ state isOpen ! !

!Door methodsFor: 'as yet unclassified' stamp: 'las 11/20/2020 12:50:57'!
toggle
	state := state opposite! !


!Door methodsFor: 'initialization' stamp: 'las 11/20/2020 12:51:55'!
initialize
	self initializeClosed! !

!Door methodsFor: 'initialization' stamp: 'las 11/20/2020 12:51:34'!
initializeClosed
	state := Closed new.! !

!Door methodsFor: 'initialization' stamp: 'las 11/20/2020 12:51:39'!
initializeOpen
	state := Open new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Door class' category: 'OneHundredDoors-Model'!
Door class
	instanceVariableNames: ''!

!Door class methodsFor: 'instance creation' stamp: 'las 11/20/2020 12:38:03'!
closed
	^self new initializeClosed! !

!Door class methodsFor: 'instance creation' stamp: 'las 11/20/2020 12:38:33'!
open
	^self new initializeOpen! !


!classDefinition: #DoorState category: 'OneHundredDoors-Model'!
Object subclass: #DoorState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OneHundredDoors-Model'!

!DoorState methodsFor: 'as yet unclassified' stamp: 'las 11/20/2020 12:49:05'!
isClosed
	self subclassResponsibility ! !

!DoorState methodsFor: 'as yet unclassified' stamp: 'las 11/20/2020 12:48:41'!
isOpen
	^ self isClosed not! !

!DoorState methodsFor: 'as yet unclassified' stamp: 'las 11/20/2020 12:55:12'!
opposite
	self subclassResponsibility ! !


!classDefinition: #Closed category: 'OneHundredDoors-Model'!
DoorState subclass: #Closed
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OneHundredDoors-Model'!

!Closed methodsFor: 'as yet unclassified' stamp: 'las 11/20/2020 12:54:01'!
asCharacter
	^ '#'! !

!Closed methodsFor: 'as yet unclassified' stamp: 'las 11/20/2020 12:43:33'!
isClosed
	^ true! !

!Closed methodsFor: 'as yet unclassified' stamp: 'las 11/20/2020 12:54:18'!
opposite
	^ Open new! !


!classDefinition: #Open category: 'OneHundredDoors-Model'!
DoorState subclass: #Open
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OneHundredDoors-Model'!

!Open methodsFor: 'as yet unclassified' stamp: 'las 11/20/2020 12:54:46'!
asCharacter
	^'@'! !

!Open methodsFor: 'as yet unclassified' stamp: 'las 11/20/2020 12:45:09'!
isClosed
	^ false! !

!Open methodsFor: 'as yet unclassified' stamp: 'las 11/20/2020 12:54:31'!
opposite
	^ Closed new! !


!classDefinition: #Row category: 'OneHundredDoors-Model'!
Object subclass: #Row
	instanceVariableNames: 'doors'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OneHundredDoors-Model'!

!Row methodsFor: 'initialization' stamp: 'las 11/20/2020 13:50:49'!
initializeWithDoors: aQuantityOfDoors 
	doors := OrderedCollection new.
	(1 to: aQuantityOfDoors) do: [:index | doors add: Door new ]! !


!Row methodsFor: 'as yet unclassified' stamp: 'las 11/20/2020 13:50:49'!
asString
	| string |
	string := ''.
	doors do: [ :aDoor | string := string,aDoor asCharacter ].
	^ string! !

!Row methodsFor: 'as yet unclassified' stamp: 'las 11/20/2020 14:00:50'!
doAllPasses
	
	(1 to: self quantityOfDoors ) do: [ :anIndex | self toggleEvery: anIndex ]
	
	! !

!Row methodsFor: 'as yet unclassified' stamp: 'las 11/20/2020 13:51:21'!
doorAt: anIndex

	^ doors at: anIndex! !

!Row methodsFor: 'as yet unclassified' stamp: 'las 11/20/2020 14:40:09'!
isValidEveryDoorNumber: anInteger

	^ anInteger = 0! !

!Row methodsFor: 'as yet unclassified' stamp: 'las 11/20/2020 14:39:33'!
notValidEveryDoorNumberMessage: aSmallInteger 
	^ 'Cannot toggle every ', aSmallInteger asString,' doors. Use a number between 1 and ',self quantityOfDoors asString ! !

!Row methodsFor: 'as yet unclassified' stamp: 'las 11/20/2020 13:50:59'!
quantityOfDoors

	^ doors size! !

!Row methodsFor: 'as yet unclassified' stamp: 'las 11/20/2020 13:51:37'!
toggleDoorAt: anIndex

	^ (self doorAt: anIndex) toggle! !

!Row methodsFor: 'as yet unclassified' stamp: 'las 11/20/2020 14:40:26'!
toggleEvery: anInteger 
	self validateEveryDoorNumber: anInteger.
	(anInteger to: self quantityOfDoors by: anInteger) do: [ :anIndex | self toggleDoorAt: anIndex]! !

!Row methodsFor: 'as yet unclassified' stamp: 'las 11/20/2020 14:40:37'!
validateEveryDoorNumber: anInteger

	((self isValidEveryDoorNumber: anInteger)) ifTrue: [ self error: (self notValidEveryDoorNumberMessage: anInteger) ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Row class' category: 'OneHundredDoors-Model'!
Row class
	instanceVariableNames: ''!

!Row class methodsFor: 'instance creation' stamp: 'las 11/20/2020 14:28:31'!
isValidQuantityOfDoors: aQuantityOfDoors

	^ aQuantityOfDoors <= 0! !

!Row class methodsFor: 'instance creation' stamp: 'las 11/20/2020 14:28:20'!
m1: aQuantityOfDoors

	^ aQuantityOfDoors <= 0! !

!Row class methodsFor: 'instance creation' stamp: 'las 11/20/2020 14:29:02'!
validateQuantityOfDoors: aQuantityOfDoors

	^ ((self isValidQuantityOfDoors: aQuantityOfDoors)) ifTrue: [self error: (Row messageOfInvalidQuantity: aQuantityOfDoors) ]! !

!Row class methodsFor: 'instance creation' stamp: 'las 11/20/2020 14:27:36'!
withDoors: aQuantityOfDoors
	self validateQuantityOfDoors: aQuantityOfDoors.
	^self new initializeWithDoors: aQuantityOfDoors ! !


!Row class methodsFor: 'as yet unclassified' stamp: 'las 11/20/2020 14:30:17'!
messageOfInvalidQuantity: aQuantityOfDoors
	^ 'Rows with ', aQuantityOfDoors asString ,' doors are not valid'! !
